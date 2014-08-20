App.FromSaNewController = Ember.ObjectController.extend({
  actions: {
    create: function(profile) {
      var email = profile.get('email');
      var name = profile.get('name');
      var valid = true;
      if( email == null || name == "" ) {
        $('input.newEmail').notify("Invalid Email", "warn");
        valid = false;
      }
      if( name == null || name == "" ) {
        $('input.newName').notify("Invalid Name", "warn");
        valid = false;
      }

      if( valid == true) {
        profile.save();
        $.notify("Successfully created profile", "success");
        $('#newProfile').modal('hide');
        this.transitionToRoute('from_sa.index');        
      }

    },
    cancel: function(profile) {
      profile.clearRelationships();
      profile.transitionTo('deleted.saved');
      $('#newProfile').modal('hide');
      this.transitionToRoute('from_sa.index');
    }
  }
});