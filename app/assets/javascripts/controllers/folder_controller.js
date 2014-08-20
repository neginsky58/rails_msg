App.FolderController = Ember.ObjectController.extend({
  actions: {
    open: function(folder) {
      if ( folder.get('opened') == true) {
        folder.setProperties({ opened: false }); 
      } else {
        folder.setProperties({ opened: true });         
      }
    },
    
    deleteCannedMessageFolder: function(){
      var cannedMessagefolder = this.get('model'); 
      cannedMessagefolder.deleteRecord();
      cannedMessagefolder.save();
    },
  },
  isAdminFalse: function() {
    return !(this.get('admin'));
  }.property('admin')
});