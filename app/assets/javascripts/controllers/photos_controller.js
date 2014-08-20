App.PhotosController = Ember.ObjectController.extend({
  nextProfile: function() {
    var profile_id = this.get('content').get('id');
    var prev_profile = this.store.find('profile', profile_id + '/next_profile' );
    return prev_profile;
  }.property('content'),

  prevProfile: function() {
    var profile_id = this.get('content').get('id');
    return this.store.find('profile', profile_id + '/prev_profile' );
  }.property('content')
});