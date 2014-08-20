class Api::V1::CannedMessagesController < ApplicationController
  respond_to :json

  def index
    respond_with CannedMessage.where(hexamail_status: params[:hexamail_status].to_i)
  end
  
  def create
    canned_message = CannedMessage.create(canned_message_params)
    if canned_message.valid?
     render json: canned_message, status: :created
    end 
  end
  
  def update
    canned_msg = CannedMessage.find(params[:id])
    set_default_canned_message(canned_message_params[:hexamail_status], canned_msg.folder_id)# if canned_message_params[:default]
    canned = CannedMessage.update(params[:id], canned_message_params)
    render json: canned
  end

  def save_defaults

    CannedMessage.where({ hexamail_status: 0 }).each do |c|
      c.update_attributes({ default: false })
    end
    canned = CannedMessage.find(params[:id])
    canned.default = params[:status] == 'false' ? true : false
    canned.save
    respond_with canned
  end

  def destroy
    render json: CannedMessage.find(params[:id]).delete
  end


  private
    def set_default_canned_message(hexamail_status, folder_id)
      CannedMessage.where({ hexamail_status: hexamail_status, folder_id: folder_id }).each do |c|
        c.update_attributes({ default: false })
      end
    end

    def canned_message_params
      params.require(:canned_message).permit(:message, :hexamail_status, :default, :folder_id, :subject)
    end
end