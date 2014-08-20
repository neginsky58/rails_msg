 // App.IndexRoute = Ember.Route.extend({
//   beforeModel: function() {
//     this.transitionTo('from_sa');
//   } 
// })

App.ApplicationRoute = Ember.Route.extend({
  model: function(params) {
	this.store.find('profile');
	return Em.RSVP.hash({
  	folders: this.store.find('folder'),
  	});
  },
  setupController: function(controller, model) {
    controller.set('folders', model.folders);
  }
});