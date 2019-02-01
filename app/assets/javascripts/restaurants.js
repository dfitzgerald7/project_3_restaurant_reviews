
class Restaurant {
  constructor(restaurantObject){
    this.name = restaurantObject.name
    this.reviews = restaurantObject.reviews
    this.avg_rating = restaurantObject.avg_rating
  }
  addOrdered() {
    Restaurant.orderedRestaurants.push(this)
    Restaurant.orderedRestaurants.sort(function(a, b){
      return b.avg_rating - a.avg_rating
    })
  }

  htmlTemplate() {
    return `<div class="row">` +
      `<div class="col s12 m7">` +
    `  <div class="card blue-grey darken-1">` +
        `<div class="card-content white-text">` +
          `<span class="card-title">${this.name}: ${this.avg_rating} stars.</span>` +
        `</div>` +
          `<p class="white-text"> "${this.reviews[Math.floor(Math.random() * this.reviews.length)].content}"</p>` +
        `</div>` +
      `</div>` +
    `</div>`
  }

  static all() {
    return this.orderedRestaurants.map(rest => rest.htmlTemplate()).slice(0, 5)
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
