$(document).ready(function() {
  $(".username").on("click", function(el) {
    el.preventDefault();
    id = $(this).data("id");
    $.get("/users/" + id + ".json", function(data) {
        const descriptionText = "<div> Average rating:" + sumRatings(data.rating) + "<div>";
        data.reviews.forEach(review => {
          descriptionText += "<div>" + review.restaurant.name + ":" + review.rating + "</div>";
        })
        $("#product-" + id).html(descriptionText);
    });
  });
});

function sumRatings(reviewsArray){
  let sum = 0, length = reviewsArray.length
  reviewsArray.forEach(rating => sum += reviews.rating)
  return sum/length
}
