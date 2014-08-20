App.ProfileRoute = Ember.Route.extend({
  model: function(params) {
    return Em.RSVP.hash({
      profile: this.store.find('profile', params.profile_id),
      folders: this.store.find('folder'),
      default_messages: this.store.find('default_message'),
      gmail_accounts: this.store.find('gmail_account') 
    });
  },
  setupController: function(controller, model) {
    controller.set('content', model.profile);
    controller.set('default_messages', model.default_messages);
    controller.set('folders', model.folders);
    controller.set('gmail_accounts', model.gmail_accounts);
  }
});