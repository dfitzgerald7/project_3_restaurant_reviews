
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
    return `<h4> ${restaurant.name}: ${restaurant.avg_rating} </h4> `
  }

  static all() {
    return this.orderedRestaurants.map(rest => Restaurant.prototype.htmlTemplate(rest)).slice(0, 5)
  }
}
Restaurant.orderedRestaurants = []


$(()=> {
  $(".top_restaurants").on("click", () => {
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
    })
  })

})
