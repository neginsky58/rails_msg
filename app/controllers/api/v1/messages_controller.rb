class Api::V1::MessagesController < ApplicationController
  respond_to :json

  def create
    message = Message.create(message_params) 
    message.send_to_email(get_gmail_account_id)
    render json: message
  end

  private
    def message_params
      params.require(:message).permit(:subject, :profile_id, :body, :received, :sent_to)
    end

    def get_gmail_account_id
      params.require(:message).permit(:gmail_account_id)[:gmail_account_id]
    end
end