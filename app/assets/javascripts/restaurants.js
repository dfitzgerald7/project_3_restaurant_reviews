
class Restaurant {
  constructor(restaurantObject){
    this.name = restaurant.name
  }
  addOrdered() {
    Restaurant.orderedRestaurants.push(this)
    Restaurant.orderedRestaurants.sort(function(a, b){
      return a.rating - b.rating
    })
  }

  static all() {
    return this.orderedRestaurants
    //might have to do Restaurant.
  }
}
Restaurant.orderedRestaurants = []


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
