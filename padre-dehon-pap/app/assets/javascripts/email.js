$(document).ready(function(){

    $('.get-template').on('click', function (e) {
        e.preventDefault();
        var id = $(this).attr('href');

        $.get('/templates/' + id, function (data) {
            $('.email-template').html(data);
        })
    })
})