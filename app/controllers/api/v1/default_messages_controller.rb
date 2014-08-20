class Api::V1::DefaultMessagesController < ApplicationController
  respond_to :json

  def index
    if params[:language]
      respond_with DefaultMessage.where({ language: params[:language].to_i, user_id: current_user.id })
    else
      respond_with DefaultMessage.where({ language: 0, user_id: current_user.id })
    end
  end

  def default_serializer_options
    {root: 'defaultMessage'}
  end

  def update
    respond_with DefaultMessage.update(params[:id], default_message_params)
  end

  private
    def default_message_params
      params.require(:default_message).permit(:message, :hexamail_status, :language, :subject, :folder_id)
    end
end