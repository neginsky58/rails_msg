App.ApplicationController = Ember.Controller.extend({
  needs: ['currentUser'],
  resetForm: function(){
    $('#DraftCannedMessage').find('input.draft-subject').val('');
    $('#DraftCannedMessage').find('textarea.draft-body').val('');
    $('input.draft-subject').parent().removeClass('has-error');
    $('textarea.draft-body').parent().removeClass('has-error');
  },
  actions: {
    logout: function() {
      $.ajax({
        url: "/users/sign_out",
        type: "DELETE"
      }).done(function() {
        window.location = "/"
      });
    },
    newDrafts: function() {
      $('#DraftCannedMessage').modal('show');
      this.resetForm();
    },
    saveNewDraft: function() {
      var subject = $('input.draft-subject').val(),
       body = $('textarea.draft-body').val(),
       folder_id = $('select#new-draft-canned-folder').val(),
       valid = true;
      if( subject == "" ) {
        $('input.draft-subject').parent().addClass('has-error');
        valid = false;
        $('#DraftCannedMessage').modal('show');
      }
      if( body == "" ) {
        $('textarea.draft-body').parent().addClass('has-error');
        valid = false;
        $('#DraftCannedMessage').modal('show');
      }
      if( valid == true) {
      folder = this.store.getById('folder', folder_id)
      console.log(this.store);
      var canned_message = this.store.createRecord('canned_message', {
            message: body,
            folder: folder,
            hexamail_status: 0,
            default: false
          });
      result = canned_message.save();
      folder.get('canned_messages').pushObject(canned_message);
      $('#DraftCannedMessage').modal('hide');
    }
  }
}
});