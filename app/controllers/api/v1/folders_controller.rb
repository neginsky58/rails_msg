class Api::V1::FoldersController < ApplicationController
  respond_to :json

  def index
    if current_user.admin?
      folders = Folder.all
    else
      folders = Folder.where('admin IS NOT TRUE')
    end
    respond_with folders
  end

  def create
    folder = Folder.create(folder_params)
    if folder.valid?
      render json: folder, status: :created
    end 
  end

  def destroy
    respond_with Folder.find(params[:id]).delete
  end

  private
    def folder_params
      params.require(:folder).permit(:name, :hexamail_status)
    end
end