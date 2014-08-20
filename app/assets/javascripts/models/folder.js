var attr = DS.attr;
App.Folder = DS.Model.extend({
  name: attr('string'),
  canned_messages: DS.hasMany('canned_message', { async: true }),
  collapse_href: attr('string'),
  collapse_id: attr('string'),
  collapse_href_one: attr('string'),
  collapse_href_full: attr('string'),
  collapse_id_one: attr('string'),
  collapse_id_full: attr('string'),
  opened: attr('boolean', { defaultValue: false }),
  subject: attr('boolean'),
  have_plus: attr('boolean'),
  hexamail_status: attr('string'),
  admin: attr('boolean')
});
