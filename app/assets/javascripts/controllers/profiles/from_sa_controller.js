App.FromSaController = Ember.ArrayController.extend({
  sortProperties: ['rating','last_sent'],
  sortAscending: false
});