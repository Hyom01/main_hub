document.write('<script src="https://code.jquery.com/jquery-3.6.4.min.js"><\/script>');
document.write('<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"><\/script>');
document.write('<script src="js/ie10-viewport-bug-workaround.js"><\/script>');
document.write('<script src="js/oppear_1.1.2.min.js"><\/script>');

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


//로그인-로그아웃,마이페이지
window.onload=()=>{
    document.querySelector('.dropbtn_click').onclick = ()=>{
      dropdown();
    }
    document.getElementsByClassName('fastfood').onclick = ()=>{
      showMenu(value);
    };
    dropdown = () => {
      var v = document.querySelector('.dropdown-content');
      var dropbtn = document.querySelector('.dropbtn')
      v.classList.toggle('show');
      dropbtn.style.borderColor = 'rgb(94, 94, 94)';
    }

    showMenu=(value)=>{
      var dropbtn_icon = document.querySelector('.dropbtn_icon');
      var dropbtn_content = document.querySelector('.dropbtn_content');
      var dropbtn_click = document.querySelector('.dropbtn_click');
      var dropbtn = document.querySelector('.dropbtn');

      dropbtn_icon.innerText = '';
      dropbtn_content.innerText = value;
      dropbtn_content.style.color = '#252525';
      dropbtn.style.borderColor = '#3992a8';
    }
  }
  window.onclick= (e)=>{
    if(!e.target.matches('.dropbtn_click')){
      var dropdowns = document.getElementsByClassName("dropdown-content");

      var dropbtn_icon = document.querySelector('.dropbtn_icon');
      var dropbtn_content = document.querySelector('.dropbtn_content');
      var dropbtn_click = document.querySelector('.dropbtn_click');
      var dropbtn = document.querySelector('.dropbtn');

      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }


/*로그아웃*/

