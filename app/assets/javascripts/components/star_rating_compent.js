App.StarRatingComponent = Ember.Component.extend({
    maxStars: 0,
    starRating: 0,
    stars: [],
    actions: {
        click: function(star){
            this.set('starRating', star.index);
            this.sendAction('action', star.index);
        }
    },
    setRating: function() {
        var stars = [];
        var starRating = this.get('starRating');
        for(var i = 0; i < this.get('maxStars'); i++){
            stars.pushObject(Em.Object.create({empty:i >= starRating, index:i+1}));
        }
        this.set('stars', stars);
    }.observes('starRating').on('didInsertElement')
});