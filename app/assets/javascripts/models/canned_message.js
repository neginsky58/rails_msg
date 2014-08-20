var attr = DS.attr;
App.CannedMessage = DS.Model.extend({
  folder: DS.belongsTo('folder'),
  message: attr('string'),
  hexamail_status: attr('number'),
  subject: attr('string'),
  default: attr('boolean')
});