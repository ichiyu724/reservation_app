document.addEventListener("turbolinks:load", function() {
    $(function() {
        $(".dropdown").on({
            'click': function() {
        $(".header-nav-menu").slideToggle(100);
        }
        });
    });
});

document.addEventListener("turbolinks:load", function() {
    $(function() {
        $(".account-setting li a").each(function() {
            let target = $(this).attr("href");
            if(location.href.match(target)) {
                $(this).addClass("active");    
            } else {
                $(this).removeClass("active");
            }
        });
    });
});