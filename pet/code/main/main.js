document.write('<script src="https://code.jquery.com/jquery-3.6.4.min.js"><\/script>');
document.write('<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"><\/script>');
document.write('<script src="js/ie10-viewport-bug-workaround.js"><\/script>');
document.write('<script src="js/oppear_1.1.2.min.js"><\/script>');


// 검색바 클릭 시 라디오 버튼이나 체크박스를 보여주는 함수
function showOptions() {
    var optionsContainer = document.querySelector('.options-container');
    optionsContainer.classList.toggle('show');
}

$(window).scroll(function () {
    var sticky = $('.navbar-brand'),
        scroll = $(window).scrollTop();
        
        if (scroll >= 250) sticky.addClass('dark');
        else sticky.removeClass('dark');
        
});

$('.service-box').Oppear({
    delay : 500,
    });
$('.main-text').Oppear({
    direction:'right',
});
$('.points').Oppear({
    direction:'left',
});
$('.up-effect').Oppear({
    direction:'up',
});
$('.down-effect').Oppear({
    direction:'down',
});
$('.left-effect').Oppear({
    direction:'right',
});
$('.right-effect').Oppear({
    direction:'left',
});


    
$('a[href^="#"]').on('click', function(event) {

var target = $( $(this).attr('href') );

if( target.length ) {
    event.preventDefault();
    $('html, body').animate({
        scrollTop: target.offset().top
    }, 1000);
}

});


