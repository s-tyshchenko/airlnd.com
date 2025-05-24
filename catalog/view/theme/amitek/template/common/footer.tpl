</main>

<div class="mega-menu--header-background"></div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row flex-column-reverse flex-lg-row">
            <div class="col-12 col-lg-3">
                <div class="footer-logo"><img src="assets/amitek/images/header-logo.svg" alt="#"></div>

                <div class="footer-links">
                    <a href="<?php echo $confirm_link_1; ?>"
                       class="footer-links--item"><?php echo $text_privacy_policy; ?></a>
                    <a href="<?php echo $confirm_link_2; ?>"
                       class="footer-links--item"><?php echo $text_public_offer; ?></a>
                </div>

                <div class="footer-social">
                    <?php echo $language; ?>
                    <?php if ($instagram) { ?>
                        <a href="<?php echo $instagram; ?>" target="_blank" class="footer-social--item">
                            <svg width="25" height="25" viewBox="0 0 25 25" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill="#FFB500"
                                      d="m-0.34288,5.243531c0,-2.76142 2.23858,-5 5,-5l14,0c2.7614,0 5,2.23858 5,5l0,14c0,2.7614 -2.2386,5 -5,5l-14,0c-2.76142,0 -5,-2.2386 -5,-5l0,-14zm12,11.2c2.3196,0 4.2,-1.8804 4.2,-4.2c0,-2.3196 -1.8804,-4.2 -4.2,-4.2c-2.3196,0 -4.2,1.8804 -4.2,4.2c0,2.3196 1.8804,4.2 4.2,4.2zm0,3c3.9764,0 7.2,-3.2236 7.2,-7.2c0,-3.97645 -3.2236,-7.2 -7.2,-7.2c-3.97645,0 -7.2,3.22355 -7.2,7.2c0,3.9764 3.22355,7.2 7.2,7.2zm8,-13.6c0.8837,0 1.6,-0.71634 1.6,-1.6c0,-0.88366 -0.7163,-1.6 -1.6,-1.6c-0.8837,0 -1.6,0.71634 -1.6,1.6c0,0.88366 0.7163,1.6 1.6,1.6z"
                                      clip-rule="evenodd" fill-rule="evenodd"/>
                            </svg>
                        </a>
                    <?php } ?>
                    <?php if ($whatsapp) { ?>
                        <a href="https://wa.me/<?php echo $whatsapp; ?>" target="_blank" class="footer-social--item">
                            <svg width="25" height="25" viewBox="0 0 25 25" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill="#FFB500"
                                      d="m12.464917,0.241295c-6.5868,0 -11.9473,5.3352 -11.9497,11.892c-0.0015,2.0968 0.5497,4.1432 1.5949,5.9456l-1.6955,6.1624l6.3352,-1.6536c1.7623,0.9525 3.7217,1.4494 5.7105,1.448l0.0046,0c6.5869,0 11.9474,-5.336 11.9497,-11.8928c0.0015,-3.176 -1.2403,-6.1656 -3.497,-8.4128c-2.256,-2.248 -5.256,-3.488 -8.4527,-3.4888zm-1.8716,9.18675l-0.7357,-1.70075c-0.1753,-0.40512 -0.4109,-0.93761 -0.8523,-0.93761l-0.0685,0c-0.3986,0 -0.7458,0.0095 -1.1021,0.18842c-0.3355,0.1685 -0.6662,0.47725 -0.8857,0.78186c-0.3608,0.50078 -0.6949,1.34812 -0.4511,2.46759c0.2507,0.77284 1.0865,2.63834 2.4238,3.91754c0.6965,0.6929 2.4572,2.2546 3.9282,2.9582c0.3995,0.1783 1.0358,0.431 1.6788,0.6251c1.1887,0.359 2.6265,0.482 3.5867,-0.3053c0.806,-0.4907 1.5935,-1.761 0.8887,-2.3885c-0.0389,-0.0346 -0.0842,-0.065 -0.1365,-0.09l-2.1731,-1.0393c-0.2507,-0.1066 -0.8023,-0.2559 -1.0029,0c-0.2507,0.3198 -0.7689,0.9754 -0.8358,1.0393c-0.0124,0.0119 -0.0267,0.0309 -0.0439,0.0538c-0.0987,0.131 -0.2939,0.3903 -0.7919,0.1861c-0.585,-0.2399 -2.0895,-1.0394 -2.5909,-1.5191c-0.5015,-0.4797 -1.4209,-1.599 -1.588,-1.9188c-0.0182,-0.0348 -0.0354,-0.0658 -0.0511,-0.0941c-0.1283,-0.2314 -0.1542,-0.2779 0.2182,-0.7054c0.0353,-0.0405 0.0712,-0.081 0.1071,-0.1215c0.3895,-0.4397 0.7841,-0.88513 0.478,-1.39755z"
                                      clip-rule="evenodd" fill-rule="evenodd"/>
                            </svg>
                        </a>
                    <?php } ?>
                    <?php if ($telegram) { ?>
                        <a href="https://t.me/<?php echo $telegram; ?>" target="_blank" class="footer-social--item">
                            <svg width="25" height="25" viewBox="0 0 25 25" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill="#FFB500"
                                      d="m23.810608,12.223954c0,6.6274 -5.373,12 -12,12c-6.627,0 -12,-5.3726 -12,-12c0,-6.62742 5.373,-12 12,-12c6.627,0 12,5.37258 12,12zm-11.57,-3.14106c-1.167,0.48547 -3.5,1.49026 -6.998,3.01436c-0.568,0.2259 -0.866,0.4469 -0.893,0.663c-0.046,0.3652 0.412,0.509 1.034,0.7048c0.085,0.0267 0.173,0.0543 0.263,0.0835c0.613,0.1992 1.437,0.4322 1.865,0.4415c0.389,0.0083 0.823,-0.1519 1.302,-0.4807c3.268,-2.2064 4.955,-3.32157 5.061,-3.34562c0.075,-0.01696 0.179,-0.03828 0.249,0.02408c0.07,0.06234 0.063,0.18044 0.056,0.21214c-0.046,0.1932 -1.841,1.8621 -2.77,2.7258c-0.29,0.2692 -0.495,0.4602 -0.537,0.5039c-0.094,0.0977 -0.19,0.1901 -0.282,0.2789c-0.569,0.5488 -0.996,0.9602 0.024,1.6322c0.49,0.3229 0.882,0.59 1.273,0.8564c0.427,0.2909 0.853,0.5811 1.405,0.9425c0.14,0.0921 0.274,0.1877 0.405,0.2809c0.497,0.3544 0.944,0.6728 1.496,0.6221c0.32,-0.0295 0.651,-0.3311 0.82,-1.2303c0.397,-2.1252 1.179,-6.7299 1.359,-8.62741c0.016,-0.16625 -0.004,-0.37901 -0.02,-0.4724c-0.016,-0.0934 -0.049,-0.22647 -0.171,-0.32498c-0.143,-0.11666 -0.365,-0.14126 -0.465,-0.13951c-0.451,0.00795 -1.143,0.24873 -4.476,1.63484z"
                                      clip-rule="evenodd" fill-rule="evenodd"/>
                            </svg>
                        </a>
                    <?php } ?>
                </div>
            </div>

            <?php if ($menu_data) { ?>
                <?php $i = 0;
                foreach ($menu_data as $menu) {
                    $i++; ?>
                    <div class="col-6 col-lg-3">
                        <div class="footer-menu--header collapsed" data-toggle="collapse"
                             data-target="#footer-column-<?php echo $i; ?>"><?php echo $menu['title']; ?></div>
                        <div class="footer-menu--list collapse show" id="footer-column-<?php echo $i; ?>">
                            <?php if ($menu['columns']) { ?>
                                <?php foreach ($menu['columns'] as $item) { ?>
                                    <a href="<?php echo $item['link']; ?>"
                                       class="footer-menu--list-item"><?php echo $item['title']; ?></a>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
            <?php } ?>

            <div class="col-12 col-lg-3">
                <div class="footer-menu--header collapsed" data-toggle="collapse"
                     data-target="#footer-column-3"><?php echo $text_contact; ?></div>
                <div class="footer-menu--list collapse show" id="footer-column-3">
                    <?php if ($address) { ?>
                        <a href="<?php echo $contact; ?>" class="footer-menu--list-item">
                            <svg class="footer-column-icon" width="20" height="20" viewBox="0 0 20 20" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M11.0025 2.38811C10.4323 1.87584 9.56767 1.87584 8.9975 2.38811L3.4975 7.32965C3.18086 7.61414 3 8.01977 3 8.44544V15.4996C3 16.328 3.67157 16.9996 4.5 16.9996H6.5C7.32843 16.9996 8 16.328 8 15.4996V11.4996C8 11.2234 8.22386 10.9996 8.5 10.9996H11.5C11.7761 10.9996 12 11.2234 12 11.4996V15.4996C12 16.328 12.6716 16.9996 13.5 16.9996H15.5C16.3284 16.9996 17 16.328 17 15.4996V8.44544C17 8.01977 16.8191 7.61414 16.5025 7.32965L11.0025 2.38811Z"
                                      fill="#FFB500"/>
                            </svg>
                            <span><?php echo $address; ?></span>
                        </a>
                    <?php } ?>
                    <?php if ($phones) { ?>
                        <?php foreach ($phones as $phone) { ?>
                            <a href="tel:<?php echo preg_replace('~\D+~', '', $phone); ?>"
                               class="footer-menu--list-item">
                                <svg class="footer-column-icon" width="20" height="20" viewBox="0 0 20 20"
                                     fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.98724 2.06589C7.89563 1.79208 8.86272 2.19479 9.31436 3.01224L9.3886 3.16075L10.0501 4.63213C10.4626 5.54992 10.2823 6.61908 9.60772 7.3496L9.47548 7.48248L8.43212 8.45541C8.24435 8.63298 8.38531 9.32181 9.06545 10.4999C9.67734 11.5597 10.175 12.0552 10.42 12.0823L10.463 12.082L10.516 12.0716L12.5667 11.4446C13.1334 11.2713 13.7439 11.4487 14.13 11.8865L14.2217 12.0014L15.5783 13.8815C16.13 14.6462 16.0691 15.6842 15.4535 16.378L15.3316 16.5039L14.7888 17.018C13.795 17.9592 12.3437 18.2346 11.0741 17.7231C9.13885 16.9433 7.38095 15.1607 5.78387 12.3945C4.18342 9.62242 3.51919 7.20438 3.81616 5.13565C3.99995 3.85539 4.87319 2.78674 6.07767 2.3462L6.27055 2.28192L6.98724 2.06589Z"
                                          fill="#FFB500"/>
                                </svg>
                                <span><?php echo $phone; ?></span>
                            </a>
                        <?php } ?>
                    <?php } ?>
                    <div class="footer-menu--list-item">
                        <?php echo $text_open; ?> <br>
                        <?php echo $open; ?>
                    </div>
                    <a href="mailto:<?php echo $email; ?>" class="footer-menu--list-item">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M18 7.373V14.5C18 15.8807 16.8807 17 15.5 17H4.50002C3.11931 17 1.99994 15.8807 1.99994 14.5V7.373L9.74651 11.931C9.90298 12.023 10.0971 12.023 10.2535 11.931L18 7.373ZM15.5 4C16.7871 4 17.847 4.9726 17.9848 6.22293L10 10.9199L2.0152 6.22293C2.15306 4.9726 3.21295 4 4.50002 4H15.5Z"
                                  fill="#FFB500"/>
                        </svg>
                        <span><?php echo $email; ?></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="footer-copyright">
            <?php echo $powered; ?>
        </div>
    </div>

</footer>
<!-- Footer End -->

<div class="modal fade" id="product_img_popup" tabindex="-1" role="dialog" aria-labelledby="modalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

        </div>
    </div>
</div>

<?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="assets/amitek/scripts/jquery-ui.js"></script>
<script src="assets/amitek/scripts/jquery.maskedinput.js"></script>
<script src="assets/amitek/scripts/main.js"></script>

<?php if (!$logged) { ?>
    <script src="assets/amitek/scripts/ajax_auth.js"></script>
<?php } ?>
<script src="assets/amitek/vendor/live-search/live-search.js"></script>

<?php echo $live_search; ?>

</body>
</html>