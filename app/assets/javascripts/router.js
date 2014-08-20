// For more information see: http://emberjs.com/guides/routing/
App.Router.map(function() {

  // Gmail Accounts
  this.resource('gmail_accounts', { path: '/gmail_accounts' }, function() {
    this.route('new');
  });

  // Hexamail Tabs  
  this.resource('from_sa', { path: '/profiles/from_sa' }); 
  this.resource('new_profile', { path: '/profiles/new' });
  this.resource('conve_sent', { path: '/profiles/conve_sent' });
  this.resource('conve_pending', { path: '/profiles/conve_pending' });

  // Specific Profile
  this.resource('profile', {path: 'profile/:profile_id'}, function() {
    this.resource('canned_message', { path: 'canned_message/:canned_message_id'})
  });
  this.resource('photos',  { path: 'photos/:profile_id' });
});