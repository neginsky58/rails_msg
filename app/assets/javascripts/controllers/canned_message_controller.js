App.CannedMessageController = Ember.ObjectController.extend({
  needs: "profile",
  actions: {
    closeEdit: function() {
      history.go(-1);
    },
    saveCannedMessage: function(model) {
      model.save();
      canned_messages.pushObject(model);
      history.go(-1);
      $('.close-canned-message').click();
    },
    cancelCannedMessage: function() {
      this.get('model').rollback();
      history.go(-1);
      $('#editCannedMessage').modal('hide');
    },
    
    deleteCannedMessage: function() {
      var cannedMessage = this.get('model'); 
      cannedMessage.deleteRecord();
      cannedMessage.save();
      // this.get('model').destroyRecord().then(function(){
      //   this.transitionToRoute('folders');
      // });

      this.transitionToRoute('canned_message');
    },

    setDefault: function(canned_message) {
      // Get current tab default message
      var default_messages = this.get('controllers.profile.default_messages');
      var default_message = $(default_messages.content).filter(function() {
                              return this.get('hexamail_status') == profile.get('hexamail_status');
                            })[0];

      var default_canned_message = $(canned_message.get('folder').get('canned_messages').get('content').get('content')).filter(function() {
        return this.get('default') == true;
      })[0];

      if(default_canned_message != null) {
        default_canned_message.set('default', false);
      }
      default_message.set('message', canned_message.get('message'));
      default_message.set('folder_id', canned_message.get('folder_id'));
      console.log(canned_message.get('folder_id'));
      canned_message.set('default', true);
      default_message.save();
      canned_message.save();
    },
    selectTab: function(selected) {
      var msg = this.get('content');
      msg.set('hexamail_status', selected);
      msg.save();
    },
    setMessageToCanned: function(msg) {
      var old_val = $('textarea.message-body').val();
      var canned_message = msg.get('message').replace('[name]', this.get('controllers.profile').get('name'));
      $('textarea.message-body').val(old_val + ' ' + canned_message);
    },
    setSubjectToCanned: function(msg) {
      var old_val = $('input.message-subject').val();
      var canned_subject = msg.get('subject').replace('[name]', this.get('controllers.profile').get('name'));
      $('input.message-subject').val(old_val + ' ' + canned_subject);
    },
    setDefaultMessageToCanned: function(msg) {
      //var canned_message = msg.get('message').replace('[name]', this.get('controllers.profile').get('name'));
      //$('textarea.message-body').val(canned_message);

      var defaultVal = this.get('content').get('default');
      if (defaultVal == false){
        msg.set('default', true);
      }
      else {
        msg.set('default', false);
      }
      msg.save();

      default_messages = this.get('controllers.profile.default_messages')
      dm = $(default_messages.content).filter(function() {
              return this.get('hexamail_status') == msg.get('hexamail_status');
            })[0];
      if(dm){
        dm.set('message', msg.get('message'));
        dm.set('folder_id', msg.get('folder_id'));
        dm.save();
      }
  
      //this.store.find('canned_message', this.get('content').id + '/save_defaults?status='+defaultVal )
      console.log(this.get('content').id);
    },
    
    setDefaultSubjectToCanned: function(msg) {
      msg = this.get('content');
      default_messages = this.get('controllers.profile.default_messages')
      dm = $(default_messages.content).filter(function() {
              return this.get('hexamail_status') == msg.get('hexamail_status');
            })[0];
      if(dm){
        dm.set('subject', msg.get('subject'));
        dm.set('folder_id', msg.get('folder_id'));
        dm.save();
      }

      //var canned_subject = msg.get('subject').replace('[name]', this.get('controllers.profile').get('name'));
      //$('input.message-subject').val(canned_subject);
      //this.store.find('canned_message', this.get('content').id + '/save_defaults' )
      var defaultVal = this.get('content').get('default');
      if (defaultVal == false){
        msg.set('default', true);
      }
      else {
        msg.set('default', false);
      }
      msg.save();
    }
  },


  showCannedMsg: function() {
    var msg = this.get('content');
    if( this.get('controllers.profile').get('hexamail_status') == msg.get('hexamail_status')) {
      return true;
    } else {
      return false;
    }
  }.property('hexamail_status'),

  tabOptions: [
    {tabName: 'All', tab: 0 },
    {tabName: '1', tab: 1 },
    {tabName: '2', tab: 2 },    
    {tabName: '3', tab: 3 },
    {tabName: '4', tab: 4 },
    {tabName: '5', tab: 5 },
  ],

  currentTab: function() {
    return this.get('hexamail_status');
  }.property('hexamail_status')

});