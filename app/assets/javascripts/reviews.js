
// $() {

  /////add jqeury
$(() => {
  $(".username").on("click", function(el) {
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
    $.get("/restaurants/" + id + ".json", function(data) {
      //put average rating here
        let descriptionText = "" //"<div> Average rating:" + sumRatings(data.ratings) + "<div>";
        data.reviews.forEach(review => {
          descriptionText += "<div>" + review.rating + ":" + review.content+ "</div>";
        })
        $("#restaurant" + id).html(descriptionText);
    });
  });

  $(".review").on("click", () => {
    $(".review").hide();
    $("#new_review_form").html(
      `<div>
        <%= form_tag("/reviews", method: "post") do%>
          Restaurant: <%= text_field_tag "restauarant_name" %>
          Rating: <%= text_field_tag "rating" %>
          Content: <%= text_field_tag "content" %>
          <%= submit_tag "Submit Review" %>
        <% end %>
        </div>
      `
    )
  })

 });

// function sumRatings(reviewsArray){
//   // debugger;
//   let sum = 0, length = reviewsArray.length
//   reviewsArray.forEach(rating => sum += reviews.rating)
//   return sum/length
// }
