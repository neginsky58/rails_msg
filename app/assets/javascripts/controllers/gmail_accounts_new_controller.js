App.GmailAccountsNewController = Ember.ObjectController.extend({
  actions: {
    create: function(gmailAccount) {
      var email = this.get('model').get('email');
      var password = this.get('model').get('password');
      var confirm_password = this.get('model').get('confirm_password');
      var valid = true;
      var route = this;

      if( email == null ) {
        $('#new-gmail-email').parent().addClass('has-error');
        valid = false;
      }

      if(password != confirm_password)  {
        $('#new-gmail-password').parent().addClass('has-error');
        $('#new-gmail-cpassword').parent().addClass('has-error');
        valid = false;
      }

      $('.connect-account').notify("Connecting Account", 
                                  { arrowShow: false,
                                    className: 'warn',
                                    elementPosition: 'top center' });
      $('button.close-new-folder').attr("disabled", "disabled");
      $('button.connect-btn').attr("disabled", "disabled");
      gmailAccount.save().then(function(response) {
        $('#newGmailAccount').modal('hide');
        route.transitionToRoute('gmail_accounts.index');
        $.notify("Successfully Connected Account", 
                                    { arrowShow: false,
                                      className: 'success',
                                      elementPosition: 'top center' });

      }, function(response) {
        $('.connect-account').notify(response.errors['gmail'][0], 
                                    { arrowShow: false,
                                      className: 'error',
                                      elementPosition: 'top center' });
        $('button.close-new-folder').removeAttr("disabled");
        $('button.connect-btn').removeAttr("disabled");
        success = false;
      });

    },
    cancel: function(account) {
      account.clearRelationships();
      account.transitionTo('deleted.saved');
      $('#newGmailAccount').modal('hide');
      this.transitionToRoute('gmail_accounts.index');
    }
  }
});