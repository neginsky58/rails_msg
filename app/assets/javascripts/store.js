// http://emberjs.com/guides/models/using-the-store/

App.Store = DS.Store.extend({
  // Override the default adapter with the `DS.ActiveModelAdapter` which
  // is built to work nicely with the ActiveModel::Serializers gem.
  // adapter: '_ams'
  adapter: 'DS.ActiveModelAdapter'
});

App.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api/v1'
});