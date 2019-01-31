
class Restaurant {
  constructor(restaurantObject){
    console.log(restaurantObject)
    this.name = restaurantObject.name
    this.avg_rating = restaurantObject.avg_rating
  }
  addOrdered() {
    Restaurant.orderedRestaurants.push(this)
    Restaurant.orderedRestaurants.sort(function(a, b){
      return b.avg_rating - a.avg_rating
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
        const rest = new Restaurant(restaurant)
        rest.addOrdered()
      })
      const allRests = Restaurant.all()
      console.log(allRests.map(rest => rest.avg_rating))
    })
  })

})
