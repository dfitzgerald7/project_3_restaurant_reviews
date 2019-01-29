
// $() {

  /////add jqeury
$(() => {
  $(".username").on("click", function(el) {
    console.log(`clicked ${$(this).data("id")}`)
    // el.preventDefault();
    id = $(this).data("id");
    $.get("/users/" + id + ".json", function(data) {
      // debugger;
        let descriptionText = "" //"<div> Average rating:" + sumRatings(data.ratings) + "<div>";
        data.reviews.forEach(review => {
          descriptionText += "<div>" + review.restaurant.name + ":" + review.rating + "</div>";
        })
        $("#user" + id).html(descriptionText);
    });
  });

  $(".restaurant").on("click", function(el) {
    // el.preventDefault();
    id = $(this).data("id");
    $.get("/users/" + id + ".json", function(data) {
      // debugger;
        let descriptionText = "" //"<div> Average rating:" + sumRatings(data.ratings) + "<div>";
        data.reviews.forEach(review => {
          descriptionText += "<div>" + review.restaurant.name + ":" + review.rating + "</div>";
        })
        $("#user" + id).html(descriptionText);
    });
  });

 });

// function sumRatings(reviewsArray){
//   // debugger;
//   let sum = 0, length = reviewsArray.length
//   reviewsArray.forEach(rating => sum += reviews.rating)
//   return sum/length
// }
