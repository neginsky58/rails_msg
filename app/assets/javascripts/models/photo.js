var attr = DS.attr;
App.Photo = DS.Model.extend({
  profile: DS.belongsTo('profile'),
  url: attr('string')
});