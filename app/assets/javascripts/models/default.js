var attr = DS.attr;
App.DefaultMessage = DS.Model.extend({
  hexamail_status: attr('string'),
  message: attr('string'),
  language: attr('string'),
  subject: attr('string'),
  folder_id: attr('string'),
  hexamail_title: function() {
    switch(this.get('hexamail_status'))
    {
      case '0':
        var title = 'From SA';
        break;
      case '2':
        var title = 'Convo Pending';
        break;
    }
    return title;
  }.property()
});