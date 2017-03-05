$('document').ready(function(){
    $('.get-template').on('click', function (e) {
        $('body').addClass('is-modal-open');
        var id = $(this).data('temp-id');
        $.get('/templates/' + id, function (data) {
            $('.email-template').html(data);
            var modal = document.getElementById('myModal');
            modal.style.display = "block";
            var span = document.getElementsByClassName("close")[0];
            span.onclick = function() {
                modal.style.display = "none";
            }
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                    $('body').removeClass('is-modal-open');
                }
            }
        })
    })
})

var $modal = $('#myModal')
  , $modalMask = $('.modal-backdrop');

$modal.addClass('in').show();
$modalMask.addClass('in').show();

$('.close-modal').on('click', function() {
    $modal.hide();
    $modalMask.hide();
});

window.onclick = function(event) {
  if ($(event.target).attr('id') == $modal.attr('id')) {
      $modal.hide();
      $modalMask.hide();
  }
}


// // Get the modal
//     var modal = document.getElementById('myModal');

// // Get the button that opens the modal
//     var btn = document.getElementById("myBtn");

// // Get the <span> element that closes the modal
//     var span = document.getElementsByClassName("close")[0];

// // When the user clicks on the button, open the modal
//     btn.onclick = function() {
//         modal.style.display = "block";
//     }

// // When the user clicks on <span> (x), close the modal
//     span.onclick = function() {
//         modal.style.display = "none";
//     }

// // When the user clicks anywhere outside of the modal, close it
//     window.onclick = function(event) {
//         if (event.target == modal) {
//             modal.style.display = "none";
//             $('body').removeClass('is-modal-open');
//         }
//     }
