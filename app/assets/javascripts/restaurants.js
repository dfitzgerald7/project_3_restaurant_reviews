
class Restaurant(restaurantObject){
  const orderedRestaurants = []
  constructor(){
    
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
