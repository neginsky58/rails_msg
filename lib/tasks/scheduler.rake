desc "Get Updates on new profiles"
task :sync_sa => :environment do
  puts '--------- Sync SA ---------'
  profiles = JSON.parse RestClient.get 'http://staging-scraper.herokuapp.com/autoexport_profile_data'
  # profiles = JSON.parse RestClient.get 'http://localhost:5000/autoexport_profile_data'
  profiles.each do |profile|
    profile['rating'] = 0 if profile['rating'] == "" or profile['rating'] == nil
    pr = Profile.create({
                    seeking_id: profile['s_id'],
                    name: profile['name'],
                    real_name: profile['real_name'],
                    city: profile['city'],
                    country: profile['country'],
                    email: profile['email'],
                    phone: profile['phone'],
                    skype: profile['skype'],
                    notes: profile['notes'],
                    age: profile['age'],
                    height_in_ft: profile['height'].delete("("),
                    height_in_cm: profile['height_cm'],
                    body_type: profile['body_type'],
                    language: profile['language'],
                    education: profile['education'],
                    occupation: profile['occupation'],
                    seeking: profile['seeking'],
                    expect: profile['expect'],
                    facebook: profile['facebook'],
                    twitter: profile['twitter'],
                    tumblr: profile['tumblr'],
                    blog: profile['blog'],
                    watsapp: profile['watsapp'],
                    wechat: profile['wechat'],
                    viber: profile['viber'],
                    kik: profile['kik'],
                    description: profile['description'],
                    seeking_url: profile['seeking_url'],
                    wink_url: profile['wink_url'],
                    message_link: profile['message_link'],
                    last_login: profile['last_login'],
                    search_type: profile['search_type'],
                    wink_sent: profile['wink_sent'],
                    eye_color: profile['eye_color'],
                    hair_color: profile['hair_color'],
                    ethnicity: profile['ethnicity'],
                    marital_status: profile['marital_status'],
                    smoking_habit: profile['smoking_habit'],
                    drinking_habit: profile['drinking_habit'],
                    summary: profile['summary'],
                    i_expect: profile['i_expect'],
                    arrangement_description: profile['arrangement_description'],
                    created_at: profile['created_at'],
                    updated_at: profile['updated_at'],
                    rating: profile['rating'],
                    hexamail_status: 0
                  }) 
    
    if pr.valid?
      puts "#{pr.name} #{profile['rating']}"
      pr.photos.create({ url: profile['image_url'], main: true })
      profile['pictures'].each do |pic|
        pr.photos.create({ url: pic['url'], main: false })
      end 

      profile['tags'].each do |t|
        tag = Tag.find_or_create_by({ name: t['tagkey']})
        pr.tags << tag
        pr.save
      end

      profile['messages'].each do |m|
        message = Message.create({ profile_id: pr.id,
                         subject: m['subject'],
                         body: m['body'],
                         sent_date: m['sent_date'],
                         received: m['received']
                      })
        message.profile.update_attributes({ hexamail_status: 0 })
      end
    end
  end
end

desc "Get Updates on new gmail messages"
task :sync_gmail => :environment do
  User.all.each do |user|
    user.gmail_accounts.each do |account|
      puts '----------------------------------'
      puts account.inspect
      account.sync_gmail
      puts '---------------------------------'
    end
  end
end