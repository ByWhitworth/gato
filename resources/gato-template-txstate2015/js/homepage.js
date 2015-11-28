jQuery(function($) {

  // top banner
  $('.homepage-banner-nav').scrollToFixed();
  
  var menutimeout = null;
  function resetMenuTimeout() {
    if (menutimeout) {
      clearTimeout(menutimeout);
      menutimeout = null;
    }
  }

  // FIXME: dropdowns need to be touch screen and keyboard and ARIA friendly
  $('.audience-link-tabs li a[role=menuitem]').on('mouseover', function(e) {  
    resetMenuTimeout();

    var $menu = $('#'+$(this).attr('aria-controls'));
    $menu.fadeIn(150);
    $menu.siblings(':visible').fadeOut(150);
  }).on('mouseleave', function(e) {  
    resetMenuTimeout();
    menutimeout = setTimeout(function() {
      $('.audience-link-section[role=menu]:visible').fadeOut(150);
    }, 150);
  });
  $('.audience-link-section[role=menu]').on('mouseenter', resetMenuTimeout)
  .on('mouseleave', function(e) {  
    resetMenuTimeout();
    $(this).fadeOut(150);
  });

  // feature paragraphs
  function activate($cur, $next) {
    $cur.fadeOut(100, function(){
        $next.fadeIn(100);
    });
    
    var $dots = $cur.parent().siblings('.slide-nav-dots').find('a');
    $dots.eq($cur.index()).removeClass('active-dot');
    $dots.eq($next.index()).addClass('active-dot');
  }

  $('.slide-nav a').blurclick(function(e) {
    var $next, $cur = $(this).parent().siblings('.slides').find('.slide:visible');

    if ($(this).hasClass('slide-nav-left')) {
      $next = $cur.prev();
      if (!$next.length) {
        $next = $cur.siblings().last();
      }
    } else {
      $next = $cur.next();
      if (!$next.length) {
        $next = $cur.siblings().first();
      }
    }

    activate($cur, $next);

  });
  
  $('.slide-nav-dots a').blurclick(function(e) {
    var $slides = $(this).parent().siblings('.slides');
    var $cur = $slides.find('.slide:visible');
    var $next = $slides.find('.slide').eq($(this).index());
    activate($cur, $next);
  });

  // videos
  var vmodal = {
    isOpen: false,
    $slides: null,
    $cur: null,

    loadSlide: function($slide) {
      var $container = $('<div class="gatoEmbedContainer"></div>');
      $('#video-modal .video-container').empty().append($container);
      createPlayer($container, $slide.find('.feature-play-button a').attr('href'), { autoplay: true });    
      this.$cur = $slide;
    },

    open: function($slide, $slides) {
      this.isOpen = true;
      this.$slides = $slides;
      this.loadSlide($slide); 
      $('#video-modal').fadeIn(150);
    },

    close: function() {
      $('#video-modal').fadeOut(150);
      $('#video-modal .video-container').empty();
      this.isOpen = false;
    }
  };

  $('.feature-play-button a').blurclick(function(e) {
    var $slide = $(this).closest('.slide');
    var $slides = $slide.parent();
    vmodal.open($slide, $slides);
  });

  $('.video-nav a').blurclick(function(e) {
    e.stopPropagation();
    
    var $next, $cur = vmodal.$cur;

    if ($(this).hasClass('video-nav-left')) {
      $next = $cur.prev();
      if (!$next.length) {
        $next = $cur.siblings().last();
      }
    } else {
      $next = $cur.next();
      if (!$next.length) {
        $next = $cur.siblings().first();
      }
    }

    vmodal.loadSlide($next);
  });

  $('#video-modal .video-modal-close').blurclick(vmodal.close);
  $('#video-modal').on('click', vmodal.close);
  $(window).on('keydown', function(e) {
    if (vmodal.isOpen && e.keyCode == 27) {
      vmodal.close();
    }
  });

});