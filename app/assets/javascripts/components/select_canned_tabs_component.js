App.SelectCannedTabsComponent = Ember.Component.extend({
  change: function(e) {
    console.log(e.target.value);
    this.sendAction('action', e.target.value);
  }
});