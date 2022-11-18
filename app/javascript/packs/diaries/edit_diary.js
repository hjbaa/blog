$(document).on('turbolinks:load', function () {
    $('#edit-diary-button').on('click', function(e) {
        e.preventDefault();

        $('.diary-content').hide();
        $('.update-diary').show();
    })
})