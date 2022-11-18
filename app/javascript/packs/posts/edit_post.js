$(document).on('turbolinks:load', function (){
    $('.post-links').on('click', '.icon-edit', function (e) {
        e.preventDefault();
        let postId = $(this).data('post-id');

        $('#edit-post-' + postId).show();
        $('#post-' + postId + '-content').hide()
    })
})