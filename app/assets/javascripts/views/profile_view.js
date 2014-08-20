App.ProfileView = Ember.View.extend({
  didInsertElement: function() {
    if( true == this.get('context').get('local_option')) {
      $('a.local').click();
    }
  }
});