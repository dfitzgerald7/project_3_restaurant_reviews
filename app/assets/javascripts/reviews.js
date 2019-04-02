
$(document).ready(()=> {
  $(".review_form").hide();
});


$(() => {
  $(".username").on("click", function(el) {
    // el.preventDefault();
    id = $(this).data("id");
    buttonId = $(this).data("button_id");
    $.get("/users/" + id + ".json", function(data) {
        const userDiv = $(`#user_div-${buttonId}`)
        data.reviews.slice(0,10).forEach(review => {
          userDiv.append(
            '<nobr><div class="col s12 offset-s1"> <h5>' + review.restaurant.name + ":</h5> <h6>" + review.rating + ' stars</h6></div></nobr> <br>' +
            '<div class="col s6 offset-s2"> "' + review.content + '" </div>')
        })
    });
  });

  $(".restaurant").on("click", function(el) {
    // el.preventDefault();
    id = $(this).data("id");
    buttonId = $(this).data("button_id");
    $.get("/restaurants/" + id + ".json", function(data) {
      //put average rating here
        let descriptionText = "" //"<div> Average rating:" + sumRatings(data.ratings) + "<div>";
        data.reviews.slice(0,5).forEach(review => {
          descriptionText += '<div class="col s11 offset-s1">' + review.rating + " stars: " + review.content+ "</div>";
        })
        $("#restaurant_div-" + buttonId).html(descriptionText);

    });
  });

  $(".review").on("click", () => {
    $(".review").hide();
    $("form").show();
    $("form input").last().prop('disabled', false);

  })

  $(".review_form").submit((el) => {
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
