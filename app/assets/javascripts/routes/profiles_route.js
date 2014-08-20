App.FromSaRoute = Ember.Route.extend({
  model: function() {
    var profiles = this.store.filter('profile', function(profile) {
      if (profile.get('hexamail_status') == 0) { return true; }
    });
    return profiles;
  }
});

App.ConveSentRoute = Ember.Route.extend({
  model: function() {
    var profiles = this.store.filter('profile', function(profile) {
      if (profile.get('hexamail_status') == 1) { return true; }
    });
    return profiles;    
  }
});


App.ConvePendingRoute = Ember.Route.extend({
  model: function() {
    var profiles = this.store.filter('profile', function(profile) {
      if (profile.get('hexamail_status') == 2) { return true; }
    });
    return profiles;    
  }
});

App.NewProfileRoute = Ember.Route.extend({
  model: function() {
    return this.store.createRecord('profile', { hexamail_status: 0, rating: 0 });
  }
});