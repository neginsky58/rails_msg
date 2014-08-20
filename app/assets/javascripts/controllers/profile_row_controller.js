App.ProfileRowController = Ember.ObjectController.extend({
  needs: ['currentUser'],
  actions: {
    goToPhotos: function(profile) {
      console.log(profile.get('id'));
      this.transitionToRoute('profile', profile.get('id')).then( function() {
        $('a.showPhotos').click();
        alert('click photos');
      });
    },
    delete: function(profile) {
      profile.deleteRecord();
      profile.save();
    }
  },
  mood: function() {
    return ( this.get('content').get('messages_received') - this.get('content').get('messages_sent') );
  }.property('mood')
});