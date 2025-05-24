<?php echo $header; ?>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <?php $i=0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
            <?php if($i < count($breadcrumbs)){ ?>
            <li class="breadcrumb-item"><a
                        href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } else { ?>
            <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
            <?php } ?>
            <?php } ?>
        </ol>
    </nav>

    <div class="contact-page_content-form">
        <div class="contact-page_left">
            <div class="contact-page_contacts">
                <div class="contact-page_contacts-heading">
                    <h1 class="information-heading"><?php echo $heading_title; ?></h1>
                    <p><?php echo $text_contacts; ?></p>
                </div>
                <ul class="contact-page_contacts-list">
                    <li>
                        <a href="mailto:<?php echo $config_email; ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48">
                                <path d="M43.0002 16.976V33.75C43.0002 36.6495 40.6497 39 37.7502 39H10.2502C7.35074 39 5 36.6495 5 33.75V16.976L23.3978 27.0953C23.7729 27.3016 24.2275 27.3016 24.6026 27.0953L43.0002 16.976ZM37.7502 9C40.6076 9 42.9319 11.2828 42.9988 14.1241L24.0002 24.5734L5.002 14.124L5.00461 14.0336C5.1181 11.2344 7.42323 9 10.2502 9H37.7502Z"/>
                            </svg>
                            <div class="contact-list_item-content">
                                <small><?php echo $text_email; ?></small>
                                <?php echo $config_email; ?>
                            </div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path d="M320 0c-17.7 0-32 14.3-32 32s14.3 32 32 32h82.7L201.4 265.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L448 109.3V192c0 17.7 14.3 32 32 32s32-14.3 32-32V32c0-17.7-14.3-32-32-32H320zM80 32C35.8 32 0 67.8 0 112V432c0 44.2 35.8 80 80 80H400c44.2 0 80-35.8 80-80V320c0-17.7-14.3-32-32-32s-32 14.3-32 32V432c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16H192c17.7 0 32-14.3 32-32s-14.3-32-32-32H80z"/>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="tel:<?php echo $telephone; ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48">
                                <path d="M22.0946 6.89433C21.3154 5.33604 19.6859 4.07543 17.6833 4.29777C15.892 4.49667 13.2323 5.16291 11.4203 7.34637C9.55886 9.58935 8.86485 13.0882 10.2943 18.3286C11.8196 23.9201 14.0861 29.4313 16.9028 33.8791C19.6988 38.2942 23.143 41.8273 27.094 43.1824C30.5884 44.3808 33.2596 43.8808 35.2093 42.5645C37.0881 41.2961 38.1215 39.3872 38.6554 38.0647C39.2533 36.584 38.8592 35.0433 38.0787 33.9082L35.2017 29.7238C33.8969 27.8261 31.5078 27.0003 29.3096 27.6872L25.3345 28.9295C25.047 29.0193 24.769 28.9283 24.6108 28.743C22.8418 26.6702 20.8583 23.7785 20.3188 20.8527C20.3009 20.7555 20.3204 20.676 20.3522 20.6224C20.9367 19.6397 21.9435 18.5258 22.9446 17.5511C24.642 15.8984 25.2844 13.2731 24.1652 11.0351L22.0946 6.89433Z"/>
                            </svg>
                            <div class="contact-list_item-content">
                                <small><?php echo $text_telephone; ?></small>
                                <?php echo $config_telephone; ?>
                            </div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path d="M320 0c-17.7 0-32 14.3-32 32s14.3 32 32 32h82.7L201.4 265.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L448 109.3V192c0 17.7 14.3 32 32 32s32-14.3 32-32V32c0-17.7-14.3-32-32-32H320zM80 32C35.8 32 0 67.8 0 112V432c0 44.2 35.8 80 80 80H400c44.2 0 80-35.8 80-80V320c0-17.7-14.3-32-32-32s-32 14.3-32 32V432c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16H192c17.7 0 32-14.3 32-32s-14.3-32-32-32H80z"/>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo ''; ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="15.5" viewBox="0 0 496 512">
                                <path d="M248 8C111 8 0 119 0 256S111 504 248 504 496 393 496 256 385 8 248 8zM363 176.7c-3.7 39.2-19.9 134.4-28.1 178.3-3.5 18.6-10.3 24.8-16.9 25.4-14.4 1.3-25.3-9.5-39.3-18.7-21.8-14.3-34.2-23.2-55.3-37.2-24.5-16.1-8.6-25 5.3-39.5 3.7-3.8 67.1-61.5 68.3-66.7 .2-.7 .3-3.1-1.2-4.4s-3.6-.8-5.1-.5q-3.3 .7-104.6 69.1-14.8 10.2-26.9 9.9c-8.9-.2-25.9-5-38.6-9.1-15.5-5-27.9-7.7-26.8-16.3q.8-6.7 18.5-13.7 108.4-47.2 144.6-62.3c68.9-28.6 83.2-33.6 92.5-33.8 2.1 0 6.6 .5 9.6 2.9a10.5 10.5 0 0 1 3.5 6.7A43.8 43.8 0 0 1 363 176.7z"/>
                            </svg>
                            <div class="contact-list_item-content">
                                <small>Telegram</small>
                                <?php echo $config_telegram; ?>
                            </div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path d="M320 0c-17.7 0-32 14.3-32 32s14.3 32 32 32h82.7L201.4 265.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L448 109.3V192c0 17.7 14.3 32 32 32s32-14.3 32-32V32c0-17.7-14.3-32-32-32H320zM80 32C35.8 32 0 67.8 0 112V432c0 44.2 35.8 80 80 80H400c44.2 0 80-35.8 80-80V320c0-17.7-14.3-32-32-32s-32 14.3-32 32V432c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16H192c17.7 0 32-14.3 32-32s-14.3-32-32-32H80z"/>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="https://wa.me/<?php echo $config_whatsapp; ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512">
                                <path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7 .9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/>
                            </svg>
                            <div class="contact-list_item-content">
                                <small>WhatsApp</small>
                                <?php echo $config_whatsapp; ?>
                            </div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path d="M320 0c-17.7 0-32 14.3-32 32s14.3 32 32 32h82.7L201.4 265.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L448 109.3V192c0 17.7 14.3 32 32 32s32-14.3 32-32V32c0-17.7-14.3-32-32-32H320zM80 32C35.8 32 0 67.8 0 112V432c0 44.2 35.8 80 80 80H400c44.2 0 80-35.8 80-80V320c0-17.7-14.3-32-32-32s-32 14.3-32 32V432c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16H192c17.7 0 32-14.3 32-32s-14.3-32-32-32H80z"/>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="viber://contact?number=<?php echo $config_viber; ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path d="M444 49.9C431.3 38.2 379.9 .9 265.3 .4c0 0-135.1-8.1-200.9 52.3C27.8 89.3 14.9 143 13.5 209.5c-1.4 66.5-3.1 191.1 117 224.9h.1l-.1 51.6s-.8 20.9 13 25.1c16.6 5.2 26.4-10.7 42.3-27.8 8.7-9.4 20.7-23.2 29.8-33.7 82.2 6.9 145.3-8.9 152.5-11.2 16.6-5.4 110.5-17.4 125.7-142 15.8-128.6-7.6-209.8-49.8-246.5zM457.9 287c-12.9 104-89 110.6-103 115.1-6 1.9-61.5 15.7-131.2 11.2 0 0-52 62.7-68.2 79-5.3 5.3-11.1 4.8-11-5.7 0-6.9 .4-85.7 .4-85.7-.1 0-.1 0 0 0-101.8-28.2-95.8-134.3-94.7-189.8 1.1-55.5 11.6-101 42.6-131.6 55.7-50.5 170.4-43 170.4-43 96.9 .4 143.3 29.6 154.1 39.4 35.7 30.6 53.9 103.8 40.6 211.1zm-139-80.8c.4 8.6-12.5 9.2-12.9 .6-1.1-22-11.4-32.7-32.6-33.9-8.6-.5-7.8-13.4 .7-12.9 27.9 1.5 43.4 17.5 44.8 46.2zm20.3 11.3c1-42.4-25.5-75.6-75.8-79.3-8.5-.6-7.6-13.5 .9-12.9 58 4.2 88.9 44.1 87.8 92.5-.1 8.6-13.1 8.2-12.9-.3zm47 13.4c.1 8.6-12.9 8.7-12.9 .1-.6-81.5-54.9-125.9-120.8-126.4-8.5-.1-8.5-12.9 0-12.9 73.7 .5 133 51.4 133.7 139.2zM374.9 329v.2c-10.8 19-31 40-51.8 33.3l-.2-.3c-21.1-5.9-70.8-31.5-102.2-56.5-16.2-12.8-31-27.9-42.4-42.4-10.3-12.9-20.7-28.2-30.8-46.6-21.3-38.5-26-55.7-26-55.7-6.7-20.8 14.2-41 33.3-51.8h.2c9.2-4.8 18-3.2 23.9 3.9 0 0 12.4 14.8 17.7 22.1 5 6.8 11.7 17.7 15.2 23.8 6.1 10.9 2.3 22-3.7 26.6l-12 9.6c-6.1 4.9-5.3 14-5.3 14s17.8 67.3 84.3 84.3c0 0 9.1 .8 14-5.3l9.6-12c4.6-6 15.7-9.8 26.6-3.7 14.7 8.3 33.4 21.2 45.8 32.9 7 5.7 8.6 14.4 3.8 23.6z"/>
                            </svg>
                            <div class="contact-list_item-content">
                                <small>Viber</small>
                                <?php echo $config_viber; ?>
                            </div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path d="M320 0c-17.7 0-32 14.3-32 32s14.3 32 32 32h82.7L201.4 265.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L448 109.3V192c0 17.7 14.3 32 32 32s32-14.3 32-32V32c0-17.7-14.3-32-32-32H320zM80 32C35.8 32 0 67.8 0 112V432c0 44.2 35.8 80 80 80H400c44.2 0 80-35.8 80-80V320c0-17.7-14.3-32-32-32s-32 14.3-32 32V432c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16H192c17.7 0 32-14.3 32-32s-14.3-32-32-32H80z"/>
                            </svg>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
        <div class="contact-page_right">
            <form class="contact-page_form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="contact-page_form-title">
                    <?php echo $text_contact; ?>
                </div>
                <div class="contact-page_form-subtitle">
                    <?php echo $text_store; ?>
                </div>

                <div class="form-group">
                    <textarea name="enquiry" rows="10" id="input-enquiry"
                              class="form-control <?php echo ($error_enquiry ? 'has-error' : ''); ?> input-lg"
                              placeholder="<?php echo $entry_enquiry; ?>"><?php echo $enquiry; ?></textarea>
                    <?php if ($error_enquiry) { ?>
                    <div class="text-danger"><?php echo $error_enquiry; ?></div>
                    <?php } ?>
                </div>

                <div class="content-page_form-footer">
                    <div class="form-group">
                        <input type="text" name="name" value="<?php echo $name; ?>" id="input-name"
                               class="form-control <?php echo ($error_name ? 'has-error' : ''); ?> input-lg"
                               placeholder="<?php echo $entry_name; ?>"/>
                        <?php if ($error_name) { ?>
                        <div class="text-danger"><?php echo $error_name; ?></div>
                        <?php } ?>
                    </div>
                    <div class="form-group">
                        <input type="text" name="email" value="<?php echo $email; ?>" id="input-email"
                               class="form-control <?php echo ($error_email ? 'has-error' : ''); ?> input-lg"
                               placeholder="<?php echo $entry_email; ?>"/>
                        <?php if ($error_email) { ?>
                        <div class="text-danger"><?php echo $error_email; ?></div>
                        <?php } ?>
                    </div>
                    <button class="btn btn-primary" type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">
                            <path d="M16.1 260.2c-22.6 12.9-20.5 47.3 3.6 57.3L160 376V479.3c0 18.1 14.6 32.7 32.7 32.7c9.7 0 18.9-4.3 25.1-11.8l62-74.3 123.9 51.6c18.9 7.9 40.8-4.5 43.9-24.7l64-416c1.9-12.1-3.4-24.3-13.5-31.2s-23.3-7.5-34-1.4l-448 256zm52.1 25.5L409.7 90.6 190.1 336l1.2 1L68.2 285.7zM403.3 425.4L236.7 355.9 450.8 116.6 403.3 425.4z"/>
                        </svg>
                    </button>
                </div>

            </form>
        </div>
    </div>

    <div class="contact-page_content-map">
        <div class="contact-page_left">
            <div id="branch-map" class="branch-map"></div>
        </div>
        <div class="contact-page_right">
            <div class="branch-list-container">
                <div class="branch-list-container_heading">
                    <h2><?php echo $text_locations; ?></h2>
                    <p><?php echo $text_locations_description; ?></p>
                </div>
                <ul id="branch-list" class="branch-list"></ul>
            </div>
        </div>
    </div>
</div>

<script>
    const branches = <?php echo json_encode($locations, true); ?>;

    let map;

    const centerLatLng = {lat: 48.3794, lng: 31.1656}

    function initMap() {
        map = new google.maps.Map(document.getElementById('branch-map'), {
                    center: centerLatLng,
                    mapTypeControl: false,
                    fullscreenControl: false,
                    streetViewControl: false,
                    zoom: 6,
                    restriction: {
                        latLngBounds: {
                            north: 52.3794,
                            south: 44.1107,
                            west: 22.1256,
                            east: 40.2281
                        },
                        strictBounds: false
                    },
                    /*styles: [
                        {
                            "featureType": "administrative",
                            "elementType": "labels.text.fill",
                            "stylers": [{"color": "#0f172a"}]
                        },
                        {
                            "featureType": "administrative",
                            "elementType": "labels.text.stroke",
                            "stylers": [{"color": "#cbd5e1"}]
                        },
                        {
                            "featureType": "administrative.country",
                            "elementType": "geometry.stroke",
                            "stylers": [{"color": "#020617"}]
                        },
                        {
                            "featureType": "landscape",
                            "elementType": "all",
                            "stylers": [{"color": "#f1f5f9"}]
                        },
                        {
                            "featureType": "poi",
                            "elementType": "all",
                            "stylers": [{"visibility": "off"}]
                        },
                        {
                            "featureType": "road",
                            "elementType": "all",
                            "stylers": [{"color": "#64748b"}]
                        },
                        {
                            "featureType": "road.highway",
                            "elementType": "all",
                            "stylers": [{"visibility": "simplified"}]
                        },
                        {
                            "featureType": "road.arterial",
                            "elementType": "labels.icon",
                            "stylers": [{"visibility": "off"}]
                        },
                        {
                            "featureType": "transit",
                            "elementType": "all",
                            "stylers": [{"visibility": "off"}]
                        },
                        {
                            "featureType": "water",
                            "elementType": "all",
                            "stylers": [{"color": "#dbeafe"}, {"visibility": "on"}]
                        }
                    ]*/
                });

                branches.forEach((branch) => {
                    addListItem(branch);
                    addMarker(branch);
                });
            }

        function addMarker(branch) {
            const latLng = branch.geocode.split(', ')

        const marker = new google.maps.Marker({
            position:{
                lat: parseFloat(latLng[0]),
                lng:parseFloat(latLng[1])
            },
            map: map,
            title: branch.name,
            icon:{
                url: 'image/logo/icon-yellow.svg',
                scaledSize:new google.maps.Size(30, 30),
            }
        });

        marker.addListener('click', () => toggleBranchDetails(branch));
    }

    function addListItem(branch) {
        const listItem = $(`<li class="branch-list_item" data-branch-id="${branch.location_id}">
            <strong>${branch.name}</strong>
            <div class="branch-list_item-details">
                <p><strong><?php echo $text_address; ?>:</strong> ${branch.address}</p>
                <p><strong><?php echo $text_telephone; ?>:</strong> ${branch.telephone}</p>
                <p><strong><?php echo $text_open; ?>:</strong> ${branch.open}</p>
            </div>
        </li>`);

        listItem.on('click', () => toggleBranchDetails(branch));

        $('#branch-list').append(listItem);
    }

    function toggleBranchDetails(branch) {
        const branchItem = $(`.branch-list_item[data-branch-id="${branch.location_id}"]`);
        const isActive = branchItem.hasClass('active')
        $('.branch-list_item').removeClass('active');
        if (!isActive) {
            branchItem.addClass('active');
            const latLng = branch.geocode.split(', ')
            map.setZoom(13);
            map.panTo({
                lat: parseFloat(latLng[0]),
                lng: parseFloat(latLng[1])
            });
        } else {
            map.setZoom(6);
            map.panTo(centerLatLng);
        }
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAljDI5BIdwInJLZ1NCVkEAhP9JfNwLDFc&amp;callback=initMap&language=uk"></script>
<?php echo $footer; ?>
