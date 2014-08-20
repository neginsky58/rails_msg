var attr = DS.attr;
App.GmailAccount = DS.Model.extend({
  email: attr('string'),
  password: attr('string'),
  authenticated: attr('boolean')
});