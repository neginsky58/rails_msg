var attr = DS.attr;
App.Message = DS.Model.extend({
  profile: DS.belongsTo('profile'),
  subject: attr('string'),
  body: attr('string'),
  sent_date: attr('date'),
  received: attr('boolean'),
  sent_to: attr('number'),
  gmail_account_id: attr('string')
});