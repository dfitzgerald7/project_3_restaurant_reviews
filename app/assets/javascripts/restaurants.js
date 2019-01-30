
class Restaurant {
  // const orderedRestaurants = []
  constructor(restaurantObject){
    this.name = restaurant.name
    Restaurant.all.push(this)
  }
  static all() {
    orderedRestaurants.push(this)
    orderedRestaurants.sort(function(a, b){
      return a.rating - b.rating
    })
  }

  static all() {
    return orderedRestaurants
  }
}


$(()=> {
  $(".top_restaurants").on("click", () => {
    $.get("/restaurants.json", data => {
      data.forEach(restaurant => {
        const rest = Restaurant(restaurant)
        rest.addOrdered()
      })
    })
  })

})
