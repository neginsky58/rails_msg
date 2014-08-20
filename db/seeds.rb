# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Folder.delete_all
Folder.create(id: 1, name: 'from sa subject', admin: true, subject: true, hexamail_status: 0);
Folder.create(id: 2, name: 'from sa body', admin: true, hexamail_status: 0);
Folder.create(id: 3, name: 'subject', have_plus: true, subject: true, hexamail_status: 0);
Folder.create(id: 4, name: 'body', have_plus: true, hexamail_status: 0);
Folder.create(id: 5, name: 'convo pending subject', admin: true, subject: true, hexamail_status: 0);
Folder.create(id: 6, name: 'apologies', hexamail_status: 0);
Folder.create(id: 7, name: 'local', hexamail_status: 0);


user = User.create({ email: 'danhalper@gmail.com', password: 'asdfasdfasdf', password_confirmation: 'asdfasdfasdf', admin: true })
admin = User.create({ email: 'admin@admin.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true })
demo = User.create({ email: 'demo@demo.com', password: 'demodemo', password_confirmation: 'demodemo', admin: false })
# (0..7).each do |lang|
#   DefaultMessage.create({ language: lang,
#                           hexamail_status: 0, 
#                           message: '',
#                           user_id: user.id
#                         })

#   DefaultMessage.create({ language: lang,
#                           hexamail_status: 1, 
#                           message: '',
#                           user_id: user.id
#                         })

#   DefaultMessage.create({ language: lang,
#                           hexamail_status: 2, 
#                           message: '',
#                           user_id: user.id
#                         })
# end

# (0..4).each do |status|
#   CannedMessage.create({ message: "Default message for #{status}",
#                          hexamail_status: status,
#                          default: false,
#                          folder_id: d_folder.id
#                       })
# end


GmailAccount.create({ user_id: user.id, email: 'dandvno1@gmail.com', password: 'asdfasdfasdf' })
GmailAccount.create({ user_id: user.id, email: 'theapptimist@gmail.com', password: 'beapptimistic26'})