
class Restaurant {
  constructor(restaurantObject){
    this.name = restaurantObject.name
    this.avg_rating = restaurantObject.avg_rating
  }
  addOrdered() {
    Restaurant.orderedRestaurants.push(this)
    Restaurant.orderedRestaurants.sort(function(a, b){
      return b.avg_rating - a.avg_rating
    })
  }

  htmlTemplate(restaurant) {
    return `<h5> ${restaurant.name}: ${restaurant.avg_rating} stars.</h5> `
  }

  static all() {
    return this.orderedRestaurants.map(rest => Restaurant.prototype.htmlTemplate(rest)).slice(0, 10)
  }
}
Restaurant.orderedRestaurants = []


$(()=> {
  $("#top_restaurants_button").on("click", () => {
    $.get("/restaurants.json", data => {
      data.forEach(restaurant => {
        const rest = new Restaurant(restaurant)
        rest.addOrdered()
      })
      const allRests = Restaurant.all()
      console.log(allRests)
      allRests.forEach(restHtml => {
        $("#restaurants").append(restHtml)
      })
      $("#top_restaurants_button").hide()
    })
  })

})
