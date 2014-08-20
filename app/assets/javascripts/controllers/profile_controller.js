App.ProfileController = Ember.ObjectController.extend({
  actions: {
    setLocalOption: function() {
      var profile = this.get('content');
      profile.toggleProperty('local_option');
      profile.save();
    },
    showMessageTab: function() {
      $('div.profile-tabs').hide();
      $('div#profile-messages').show();
    },
    showProfileTab: function() {
      $('div.profile-tabs').hide();
      $('div#profile-full').show();
    },
    showDefaultsTab: function() {
      $('div.profile-tabs').hide();
      $('div#profile-defaults').show();
    },
    showLanguageTab: function() {
      $('div.profile-tabs').hide();
      $('div#profile-language').show();
    },
    showPhotos: function() {
      $('div.profile-details').hide();
      $('div.photo-details').fadeIn('slow');
    },
    hidePhotos: function() {
      $('div.photo-details').hide();
      $('div.profile-details').fadeIn('slow');      
    },
    setLanguage: function(lang) {
      this.set('language', lang);
      $('li.lang').removeClass('active');
      $('li.lang-'+ lang).addClass('active');
      this.set('default_messages', this.store.find('default_message', { language: lang })); 
    },
    showOneLine: function() {
      $('.profile-details').hide();
      $('.full-canned-messages').hide();
      $('.one-line-canned-messages').fadeIn('slow');
    },
    showFullMsg: function() {
      $('.profile-details').hide();
      $('div.one-line-canned-messages').hide();
      $('.full-canned-messages').fadeIn('slow');
    },
    hideCannedMsg: function() {
      $('div.full-canned-messages').hide();
      $('div.one-line-canned-messages').hide();
      $('div.profile-details').fadeIn('slow');   
    },
    
    setDefaultCannedMsg: function(msg) {
      var profile = this.get('content');
      var default_messages = this.get('default_messages');
      var default_message = $(default_messages.content).filter(function () {
                              return this.get('hexamail_status') == profile.get('hexamail_status');
                            })[0];
      default_message.set('message', msg.get('message'));
      default_message.set('folder_id', msg.get('folder_id'))
      msg.set('default', true);
      default_messages.save();
      msg.save();
    },
    saveDefaults: function(models) {
      models.save();
      $.notify("Successfully Saved Default Messages", 
                                  { arrowShow: false,
                                    className: 'success',
                                    elementPosition: 'top center' });
    },
    selectFolderForMessage: function() {
      //var subject = $('input.message-subject').val();
      var body = $('textarea.message-body').val();
      var valid = true;
     
      // if( subject == "" ) {
      //   $('input.message-subject').parent().addClass('has-error');
      //   valid = false;
      // }
      if( body == "" ) {
        $('textarea.message-body').parent().addClass('has-error');
        valid = false;
      }

      if( valid == true) {
        $('input.message-subject').parent().removeClass('has-error');
        $('textarea.message-body').parent().removeClass('has-error');
        $('#newCannedMessage').modal('show');
        $('#message_status').val('body');
      }
    },

    selectFolderForSub: function() {
      var subject = $('input.message-subject').val();
      //var body = $('textarea.message-body').val();
      var valid = true;
    
      if( subject == "" ) {
        $('input.message-subject').parent().addClass('has-error');
        valid = false;
      }
      // if( body == "" ) {
      //   $('textarea.message-body').parent().addClass('has-error');
      //   valid = false;
      // }
      if( valid == true) {
        $('input.message-subject').parent().removeClass('has-error');
        $('textarea.message-body').parent().removeClass('has-error');
        $('#newCannedMessage').modal('show');
        $('#message_status').val('sub');
      }
    },

    createFolder: function() {
      var profile = this.get('content');
      var name = $('input#new-todo').val();
      if (!name.trim()) { return; } else {
        var folder = this.store.createRecord('folder', {
            name: name, 
            hexamail_status: profile.get('hexamail_status'),
            });
      }
      new_folder = folder.save();
      $('button.close-new-folder').click();
    }, 
   
    saveNewCannedMessage: function() {
      var body = '', subject = '';
      if ($('#message_status').val() == 'sub'){
        subject = $('input.message-subject').val();
      } else if ($('#message_status').val() == 'body'){
        body = $('textarea.message-body').val();
      } else {
        subject = $('input.message-subject').val();
        body = $('textarea.message-body').val();
      }
      var folder_id = $('select#new-canned-folder').val();
      folder = this.store.getById('folder', folder_id)
      var profile = this.get('content');
      var canned_message = this.store.createRecord('canned_message', {
        message: body,
        subject: subject,
        folder: folder,
        hexamail_status: profile.get('hexamail_status'),
        default: false

      });
      result = canned_message.save();
      folder.get('canned_messages').pushObject(canned_message);
      $('#newCannedMessage').modal('hide');
      $.notify("Successfully Saved Canned Message", 
                                  { arrowShow: false,
                                    className: 'success',
                                    elementPosition: 'top center' });
    },
    sendMessage: function() {
      var subject = $('input.message-subject').val();
      var body = $('textarea.message-body').val();
      var profile = this.get('content');
      var gmail_account_id = $('select#currently-synced').val();
      var valid = true;

      if( subject == "" ) {
        $('input.message-subject').parent().addClass('has-error');
        $('input.message-subject').notify("Subject can't be blank.");
        valid = false;
      }
      if( body == "" ) {
        $('textarea.message-body').parent().addClass('has-error');
        $('input.message-body').notify("Message can't be blank.");
        valid = false;
      }

      if( valid == true) {
        $.notify("Sending Message",
                { arrowShow: false,
                  className: 'warn',
                  elementPosition: 'top center',
                  autoHide: false,
                  clickToHide: false
                });
        $('input.message-subject').parent().removeClass('has-error');
        $('textarea.message-body').parent().removeClass('has-error');

        // Send default to gmail for now
        var message = this.store.createRecord('message', {
          profile: profile,
          subject: subject,
          body: body, 
          received: false,
          sent_to: 0,
          gmail_account_id: gmail_account_id
        }); 
        message.save().then(function() {
          if(profile.get('hexamail_status') == 2) {
            profile.set('hexamail_status', 1);
          }
          $('span.next-profile').click();
          $.notify("Successfully Sent Message", 
                                      { arrowShow: false,
                                        className: 'success',
                                        elementPosition: 'top center' });
        });
      }
    },
    rateProfile: function(rating) {
      console.log('---- do nothing ----');
    },
    selectSenderOption: function() {
      var subject = $('input.message-subject').val();
      var body = $('textarea.message-body').val();
      var profile = this.get('content');
      var valid = true;

      if( subject == "" ) {
        $('input.message-subject').parent().addClass('has-error');
        $('input.message-subject').notify("Subject can't be blank.");
        valid = false;
      }
      if( body == "" ) {
        $('textarea.message-body').parent().addClass('has-error');
        $('input.message-body').notify("Message can't be blank.");
        valid = false;
      }

      if( valid == true) {
        $('input.message-subject').parent().removeClass('has-error');
        $('textarea.message-body').parent().removeClass('has-error');
        $('#selectSenderEmail').modal('show');
      }
    },
    
    sendWithSelectedOption: function() {
      var gmail_account_id = $('select#select-gmail').val();
      var subject = $('input.message-subject').val();
      var body = $('textarea.message-body').val();
      var profile = this.get('content');

      // Send default to gmail for now
      var message = this.store.createRecord('message', {
        profile: profile,
        subject: subject,
        body: body, 
        received: false,
        sent_to: 0,
        gmail_account_id: gmail_account_id
      }); 
      message.save().then(function() {
        profile.set('hexamail_status', 1);
        $('#selectSenderEmail').modal('hide');
        $('span.next-profile').click();
      });
    },
    resetMessage: function() {
      $('textarea.message-body').val('');
    },
    resetSubject: function() {
      $('input.message-subject').val('');
    },
    addSmiley: function() {
      var old_val = $('textarea.message-body').val();
      $('textarea.message-body').val(old_val + ' :-)' );
    }

  },

  editDefault: function(model) {
    model.save();
  },

  default_title: function(hexamail_status) {
    if( hexamail_status == '0') {
      return "From SA";
    } else if(hexamail_status == '2') {
      return "Conve Pending";
    }
  }.property('default_title'),

  isActive: function(key, value) {
    alert(value);
  }.property('isActive'),

  defaultMessage: function() {
    var profile = this.get('content');
    var default_messages = this.get('default_messages');
    var default_message = $(default_messages.content).filter(function () {
                            return this.get('hexamail_status') == profile.get('hexamail_status');
                          })[0];
  //  return default_message.get('message');
  return true;
  }.property('defaultMessage'),

  nextProfile: function() {
    var profile_id = this.get('content').get('id');
    var prev_profile = this.store.find('profile', profile_id + '/next_profile' );
    return prev_profile;
  }.property('content'),

  prevProfile: function() {
    var profile_id = this.get('content').get('id');
    return this.store.find('profile', profile_id + '/prev_profile' );
  }.property('content'),

  getSenderOption: function() {
    if(this.get('content').get('hexamail_status') == 0) {
      return true;
    } else {
      return false;
    }
  }.property('hexamail_status'),

  defaultSubject: function() {
    var profile = this.get('content');
    var default_messages = this.get('default_messages');
    var default_message = $(default_messages.content).filter(function () {
                            return this.get('hexamail_status') == profile.get('hexamail_status');
                          })[0];
  //  return default_message.get('subject');
   return true;
  }.property('defaultSubject'),

  language: 0
});