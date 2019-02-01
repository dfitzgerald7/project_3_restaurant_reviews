
$(document).ready(()=> {
  $("form").hide();
});


$(() => {
  $(".username").on("click", function(el) {
    // el.preventDefault();
    id = $(this).data("id");
    $.get("/users/" + id + ".json", function(data) {
      // debugger;
        const userDiv = $("#user" + id)
        data.reviews.forEach(review => {
          userDiv.append( '<div class="col s2 offset-s6">' + review.restaurant.name + ":" + review.rating + '</div>')
        })
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
    $("form").show();
    $("form input").last().prop('disabled', false);

  })

  $("form").submit((el) => {
    el.preventDefault();
    const review = $("form").serialize();
    $.post('/reviews', review).done(review => {
      let html =
      `<button class="username" data-id="${review.user.id }"> ${review.user.username}: </button>` +
        `  <div id="user${ review.user.id}"> </div>` +
        `  <div class="row">` +
          `<li class="col s9 push-s1"> Restaurant: ` +
          `<button class="restaurant" data-id="${ review.restaurant.id }"> ${review.restaurant.name} </button> <br>` +
          `<div id="restaurant${ review.restaurant.id }"> </div> <br>` +
          `Rating: ${ review.rating } stars <br>` +
          `Review: ${ review.content } </li>`
      $("#new_review").prepend(html)
      $("form")[0].reset()
      $("form").hide()
      $(".review").show()
    }).fail(review=> {
      let alertString = ""
      review.responseJSON.errors.forEach(error => alertString += `${error}\n`)
      alert(alertString)
      $("form input").last().prop('disabled', false);
    })
  })

 });

// function sumRatings(reviewsArray){
//   // debugger;
//   let sum = 0, length = reviewsArray.length
//   reviewsArray.forEach(rating => sum += reviews.rating)
//   return sum/length
// }
