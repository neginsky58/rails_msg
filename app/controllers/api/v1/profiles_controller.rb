class Api::V1::ProfilesController < ApplicationController
  respond_to :json

  def index
    profiles = Profile.all.order(rating: :desc, last_sent: :desc)
    respond_with profiles
  end

  def create
    profile = Profile.create(new_profile_params)
    if profile.valid?
      render json: profile, status: :created
    else
      render :json => { "errors" => { "Profile" => [profile.errors.first] } }, :status => 422
    end
  end

  def update
    profile = Profile.find(params[:id])
    respond_with profile.update_attributes(new_profile_params)
  end

  def show
    respond_with Profile.find(params[:id])
  end

  def next_profile
    profile = Profile.find(params[:id])
    profiles = Profile.where({ hexamail_status: profile.hexamail_status}).order(:rating => :desc, last_sent: :desc)
    profile_index = profiles.find_index(profile)
    respond_with profiles[profile_index + 1]
  end

  def prev_profile
    profile = Profile.find(params[:id])
    profiles = Profile.where({ hexamail_status: profile.hexamail_status}).order(:rating => :desc, last_sent: :desc)
    profile_index = profiles.find_index(profile)
    if profile_index == 0
      prev_profile = nil
    else
      prev_profile = profiles[profile_index - 1]
    end
    respond_with prev_profile
  end

  def destroy
    respond_with Profile.find(params[:id]).delete
  end

  private
    def new_profile_params
      new_params = params.require(:profile).permit(:name, :real_name, :city, :country, :email,
                                      :phone, :skype, :notes, :age, :height_in_ft,
                                      :height_in_cm, :body_type, :language, :education,
                                      :occupation, :seeking, :expect, :facebook, :twitter,
                                      :tumblr, :blog, :watsapp, :wechat, :viber, :kik,
                                      :description, :seeking_url, :message_link, :last_login,
                                      :search_type, :wink_sent, :eye_color, :hair_color, :ethnicity,
                                      :marital_status, :smoking_habit, :drinking_habit, :summary, :local_option,
                                      :i_expect, :arrange_description, :rating, :message_data, :info_data
                                      )
      new_params[:hexamail_status] = 0
      new_params
    end
    def profile_params
      params.require(:customer).permit(:id)
    end
end