let mix = require('laravel-mix');
require('laravel-mix-compress');

// Main
mix.sass('catalog/view/theme/amitek/styles/_app.scss', 'assets/amitek/styles/main.css');
mix.js('catalog/view/theme/amitek/scripts/main.js', 'assets/amitek/scripts/main.js');

// Live Search
mix.copyDirectory('catalog/view/theme/amitek/vendor/live-search', 'assets/amitek/vendor/live-search')

// Owl Carousel
mix.sass('catalog/view/theme/amitek/vendor/owl/owl-carousel.scss', 'assets/amitek/vendor/owl/owl-carousel.css')
    .sass('catalog/view/theme/amitek/vendor/owl/owl-theme.scss', 'assets/amitek/vendor/owl/owl-theme.css')
    .sass('catalog/view/theme/amitek/vendor/owl/owl-transitions.scss', 'assets/amitek/vendor/owl/owl-transitions.css')
    .js('catalog/view/theme/amitek/vendor/owl/owl-carousel.min.js', 'assets/amitek/vendor/owl/owl-carousel.js', 'footer');

// Fontawesome
mix.css('catalog/view/theme/amitek/vendor/fontawesome/css/fontawesome.min.css', 'assets/amitek/vendor/fontawesome/fontawesome.css');

// Ocfilter
mix.sass('catalog/view/theme/amitek/vendor/ocfilter/nouislider.scss', 'assets/amitek/vendor/ocfilter/nouislider.css')
    .sass('catalog/view/theme/amitek/vendor/ocfilter/ocfilter.scss', 'assets/amitek/vendor/ocfilter/ocfilter.css')
    .js('catalog/view/theme/amitek/vendor/ocfilter/ocfilter.js', 'assets/amitek/vendor/ocfilter/ocfilter.js');
mix.copy('catalog/view/theme/amitek/vendor/ocfilter/nouislider.js', 'assets/amitek/vendor/ocfilter/nouislider.js');


// Separate Pages Styles
mix.sass('catalog/view/theme/amitek/styles/pages/search.scss', 'assets/amitek/styles/search.css');
mix.sass('catalog/view/theme/amitek/styles/pages/product.scss', 'assets/amitek/styles/product.css');
mix.sass('catalog/view/theme/amitek/styles/pages/account.scss', 'assets/amitek/styles/account.css');
mix.sass('catalog/view/theme/amitek/styles/pages/home.scss', 'assets/amitek/styles/home.css');
mix.sass('catalog/view/theme/amitek/styles/pages/about.scss', 'assets/amitek/styles/about.css');
mix.sass('catalog/view/theme/amitek/styles/pages/contact.scss', 'assets/amitek/styles/contact.css');
mix.sass('catalog/view/theme/amitek/styles/pages/payment-and-delivery.scss', 'assets/amitek/styles/payment-and-delivery.css');
mix.sass('catalog/view/theme/amitek/styles/pages/error.scss', 'assets/amitek/styles/error.css');
mix.sass('catalog/view/theme/amitek/styles/pages/checkout.scss', 'assets/amitek/styles/checkout.css');

// Scripts
mix.js('catalog/view/theme/amitek/scripts/ajax_auth.js', 'assets/amitek/scripts/ajax_auth.js');
// mix.js('catalog/view/theme/amitek/scripts/live_search.js', 'assets/amitek/scripts/live_search.js');
mix.js('catalog/view/theme/amitek/scripts/quickcheckout.js', 'assets/amitek/scripts/quick_checkout.js');
mix.js('catalog/view/theme/amitek/scripts/jquery.maskedinput.js', 'assets/amitek/scripts/jquery.maskedinput.js');
mix.copy('catalog/view/theme/amitek/scripts/jquery-ui.min.js', 'assets/amitek/scripts/jquery-ui.js');

// Images
mix.copyDirectory('catalog/view/theme/amitek/images', 'assets/amitek/images');

// Compress
mix.compress({productionOnly: false});
