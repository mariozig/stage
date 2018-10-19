//= require rails-ujs
//= require jquery
//= require bootstrap
//= require data-confirm-modal
//= require local-time
//= require activestorage
//= require turbolinks
//= require isotope.pkgd
//= require_tree .

(($) => {
    $.fn.decozIsotope = function (opts) {
        const $self = $(this);

        const defaults = {
            filter: "*",
            itemSelector: ".project-item",
            percentPosition: true,
            masonry: {
                columnWidth: ".project-item-sizer"
            }
        };

        const options = $.extend(defaults, $self.data(), opts);
        const $images = $("img", $self);
        let count = 0;
        const total = $images.length;

        if (total) {
            $.each($images, function () {
                const image = new Image();

                image.src = $(this).attr("src");

                image.onload = () => {
                    count++;

                    if (count === total) {
                        $self.isotope(options);
                        $self.data("isIsotope", true);
                    }
                };
            });
        } else {
            $self.isotope(options);
            $self.data("isIsotope", true);
        }

        //   $self.prev(".controls").on("click", "a", function(e) {
        //       e.preventDefault();
        //       const filterValue = $(this).attr("data-filter");
        //       $self.isotope({
        //           filter: filterValue
        //       });
        //   });
    };

    $(document).on("turbolinks:load", () => {
        /* Menu - Mobile */
        const $btnMenu = $(".menu-mobile");
        const $boxLeft = $(".box-left");
        const $menuMobile = $(".main-menu", $boxLeft);
        const $bodyCover = $(".body-overlay");

        $("a", $menuMobile).on("click", function (event) {
            const $li = $(this).closest("li");
            const $subMenu = $("> .sub-menu", $li);

            if ($subMenu.length) {
                event.preventDefault();
                $subMenu.slideToggle(300);
            }
        });

        $btnMenu.on("click", () => {
            $boxLeft.toggleClass("active");
        });

        $bodyCover.on("click", () => {
            $boxLeft.removeClass("active");
        });

        $(document).on("keydown", (event) => {
            if ($boxLeft.hasClass("active") && event.keyCode === 27) {
                $bodyCover.trigger("click");
            }
        });

        /* Portfolio (aka Galleries) */
        const $portfolio = $(".grids-layout");

        if ($portfolio.length) {
            $portfolio.each(function () {
                $(this).decozIsotope();
            });
        }

    });
})(jQuery);