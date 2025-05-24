<div id="manufacturer-carousel" class="module-container">
    <div class="container">
        <h3 class="module-container--heading"><?php echo $heading_title; ?></h3>
        <div class="module-container_content manufacturer-carousel--content">
            <div class="manufacturer-carousel--prev">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 320 512">
                    <path d="M206.668 464.592L22.688 272.594C18.219 267.969 16 261.969 16 256.001S18.219 244.032 22.688 239.407L206.668 47.409C215.82 37.815 231.008 37.503 240.57 46.69C250.195 55.815 250.508 71.065 241.289 80.596L73.242 256.001L241.289 431.405C250.508 440.905 250.195 456.186 240.57 465.311C231.008 474.499 215.82 474.186 206.668 464.592Z"/>
                </svg>
            </div>

            <div class="manufacturer-carousel owl-carousel owl-theme">
                <?php
                foreach ($banners as $key => $banner) {
                    if ($key % 2 === 0) {
                        echo '<div class="manufacturer-carousel--item">';
                    }
                    ?>
                    <div class="manufacturer-carousel--href">
                        <?php if ($banner['link']) { ?>
                            <a href="<?php echo $banner['link']; ?>">
                                <img loading="lazy" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
                            </a>
                        <?php } else { ?>
                            <img loading="lazy" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
                        <?php } ?>
                    </div>
                    <?php
                    if ($key % 2 === 1 || $key === count($banners) - 1) {
                        echo '</div>';
                    }
                }
                ?>
            </div>

            <div class="manufacturer-carousel--next">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 320 512">
                    <path d="M113.333 47.409L297.314 239.407C301.783 244.032 304.001 250.032 304.001 256.001S301.783 267.969 297.314 272.594L113.333 464.592C104.181 474.186 88.994 474.499 79.431 465.311C69.806 456.186 69.494 440.936 78.712 431.405L246.759 256.001L78.712 80.596C69.494 71.096 69.806 55.815 79.431 46.69C88.994 37.503 104.181 37.815 113.333 47.409Z"/>
                </svg>
            </div>
        </div>
    </div>
</div>