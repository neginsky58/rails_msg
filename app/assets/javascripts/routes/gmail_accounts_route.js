App.GmailAccountsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('gmail_account');
  }
});

App.GmailAccountsNewRoute = Ember.Route.extend({
  beforeModel: function(transition) {
    if(transition.sequence == 0) {
      this.transitionTo('gmail_accounts.index');
    }
  },
  model: function() {
    return this.store.createRecord('gmail_account');
  },
  afterModel: function() {
    $('#newGmailAccount').modal('show');
  }
});