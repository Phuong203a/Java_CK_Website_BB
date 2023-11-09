
(function ($) {
    /*--
     Variables
     ------------------------*/
    var $window = $(window);
    var $preQty = $('.pro-qty, .cart-plus-minus-2');
    var $preQty2 = $('.pro-qty-2');

    /*-----
     Cart Plus Minus
     --------------------------------*/
    $preQty.prepend('<span class="dec qtybtn"><i class="zmdi zmdi-minus"></i></span>');
    $preQty.append('<span class="inc qtybtn"><i class="zmdi zmdi-plus"></i></span>');
    $('.qtybtn').on('click', function() {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });
    $preQty2.append('<span class="inc qtybtn-2"><i class="zmdi zmdi-chevron-up"></i></span>');
    $preQty2.append('<span class="dec qtybtn-2"><i class="zmdi zmdi-chevron-down"></i></span>');
    $('.qtybtn-2').on('click', function() {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });
})(jQuery);