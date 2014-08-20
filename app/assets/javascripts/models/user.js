var attr = DS.attr;
App.User = DS.Model.extend({
  email: attr('string'),
  admin: attr('boolean')
});