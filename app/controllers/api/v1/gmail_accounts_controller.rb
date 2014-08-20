class Api::V1::GmailAccountsController < ApplicationController
  respond_to :json

  def index
    respond_with GmailAccount.where({ user_id: current_user.id })
  end

  def create
    gmail_account = GmailAccount.create(gmail_account_params)
    if gmail_account.valid?
      render json: gmail_account, status: :created
    else
      render :json => { "errors" => { "Gmail" => ["Invalid email account"] } }, :status => 422
    end
  end

  private
    def gmail_account_params
      account = params.require(:gmail_account).permit(:email, :password)
      account[:user_id] = current_user.id
      account[:authenticated] = true
      account
    end
end