$(document).on('turbolinks:load', function () {
    $('#new-diary-button-area').on('click', '.btn', function(e) {
        e.preventDefault();
        $(this).parent().remove();

        $('#new-diary-form').show();
    })
})