$(document).ready(function() {

    var doNotEmail = $('#user_do_not_email');
    var marketing = $('#user_marketing');
    var articles = $('#user_articles');
    var digest = $('#user_digest');

    doNotEmail.change(function(){
        if (this.checked) {
            marketing.attr('checked', false);
            articles.attr('checked', false);
            digest.attr('checked', false);
        }
    });

    marketing.change(function(){
        if (this.checked) {
            doNotEmail.attr('checked', false);
        }
    });

    articles.change(function(){
        if (this.checked) {
            doNotEmail.attr('checked', false);
        }
    });

    digest.change(function(){
        if (this.checked) {
            doNotEmail.attr('checked', false);
        }
    });

});
