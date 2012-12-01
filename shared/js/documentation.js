(function($){
  
  $(function() { // DOM ready
    
    // Mark as active #side-menu links when on page
    if($('body.api') && window.location){
      var reg = /\/\/[^\/]+(\/.+)/g,
          docUrl = reg.exec(window.location.toString());
      if(docUrl){
        $('#side-menu a').each(function(){
          var url = $(this).attr('href').toString();
          if(url.indexOf(docUrl[1]) >= 0 && url.length == docUrl[1].length){
            $(this).parent('li').addClass('active');
          }
        });
      }
    }
 
 
    $('.help-search .search-box').focus(function(){
      $(this).css('background-position','0px -25px')
    })

    $('.help-search .search-box').focusout(function(){
      if($(this).val() == ''){
        $(this).css('background-position','0px 0px')
      }
    })

    // Expands the code examples to a nice width within the page.
    // 898 is a nice looking width within the container
    // 678 is the original width of the code container (not counting border/padding/margin)
    // 700 is the displayed width of the code container
    $('pre.highlight').hover(function(){ // mouseover
      var $this = $(this);
      var $code = $this.find('code');

      if($code.width() > 700 && $code.width() <= 898){
        $this.animate({width: $code.width()});
      } else if($code.width() > 898) {
        $this.animate({width: 898});
      }

      $this.css('overflow-y', 'auto');

    }, function(){ // mouseout
      $(this).stop().animate({width: 678}).css('overflow-y', 'auto');
    });

    // Dynamic year for footer copyright
    var currentYear = (new Date).getFullYear();
    $("#year").text( (new Date).getFullYear() );
  
  });

})(jQuery);
