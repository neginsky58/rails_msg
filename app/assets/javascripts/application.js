//= require jquery
//= require_tree ./lib
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require app

App = Ember.Application.create({
  LOG_TRANSITIONS: true
});

Ember.Application.initializer({
  name: 'currentUser',
  initialize: function(container) {
    var attributes, controller, store, user;
    store = container.lookup('store:main');
    attributes = $('meta[name="current-user"]').attr('content');
    if (attributes) {
      user = store.push('user', store.serializerFor(App.User).normalize(App.User, JSON.parse(attributes)));
      controller = container.lookup('controller:currentUser').set('content', user);
      return container.typeInjection('controller', 'currentUser', 'controller:currentUser');
    }
  }
});


$(function() {
  var token;
  token = $('meta[name="csrf-token"]').attr('content');
  return $.ajaxPrefilter(function(options, originalOptions, xhr) {
    return xhr.setRequestHeader('X-CSRF-Token', token);
  });
});
