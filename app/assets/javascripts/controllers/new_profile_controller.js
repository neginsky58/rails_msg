App.NewProfileController = Ember.ObjectController.extend({
  actions: {
    create: function() {
      var profile = this.get('model');
      var route = this;
      profile.save().then(function(response) {
        route.transitionToRoute('profile', response);
      });
    },
    rateProfile: function(rating) {
      var profile = this.get('model');
      profile.set('rating', rating);
    },
    cancel: function(profile) {
      profile.clearRelationships();
      profile.transitionTo('deleted.saved');
      this.transitionToRoute('from_sa');
    }
  }
});