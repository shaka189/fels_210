//= require jquery
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    $(".alert").delay(2000).slideUp(500, function(){
        $(".alert").alert('close');
    });
});
