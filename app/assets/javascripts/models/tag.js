var attr = DS.attr;
App.Tag = DS.Model.extend({
  profile: DS.belongsTo('profile'),
  name: attr('string')
});