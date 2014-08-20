App.CannedMessageRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.getById('canned_message', params.canned_message_id)
 	  return this.store.getById('default_message', params.canned_message_id)    	
  },
  afterModel: function() {
    $('#editCannedMessage').modal('show');
  },
  setupController: function(controller, model) {
    controller.set('default_messages', model.default_messages);
    controller.set('canned_message', model.canned_message);
  }
});