class CreateProfiles < ActiveRecord::Migration
  def change
    # create table from sascraper
    create_table :profiles do |t|
      t.text :seeking_id
      t.text :name
      t.text :real_name
      t.text :city
      t.text :country
      t.string :email
      t.string :phone
      t.string :skype
      t.text :notes
      t.string :age
      t.string :height_in_ft
      t.string :height_in_cm
      t.string :body_type
      t.text :language
      t.text :education
      t.text :occupation
      t.text :seeking
      t.text :expect
      t.text :facebook
      t.text :twitter
      t.text :tumblr
      t.text :blog
      t.text :watsapp
      t.text :wechat
      t.text :viber
      t.text :kik
      t.text :description
      t.text :seeking_url
      t.text :wink_url
      t.text :message_link
      t.string :last_login
      t.string :search_type
      t.string :wink_sent
      t.string :eye_color
      t.string :hair_color
      t.string :ethnicity
      t.string :marital_status
      t.string :smoking_habit
      t.string :drinking_habit
      t.text :summary
      t.text :i_expect
      t.text :arrangement_description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :hexamail_status
      # Todo:
      # - create photos model
      # - message thread model
      t.timestamps
    end
  end
end
