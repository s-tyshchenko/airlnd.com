<?php echo $header; ?>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <?php $i = 0;
            foreach ($breadcrumbs as $breadcrumb) {
                $i++; ?>
                <?php if ($i < count($breadcrumbs)) { ?>
                    <li class="breadcrumb-item"><a
                                href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } else { ?>
                    <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
                <?php } ?>
            <?php } ?>
        </ol>
    </nav>

    <h1><?php echo $heading_title; ?></h1>

    <div class="account-layout">
        <?php echo $column_left; ?>

        <div class="content">
            <?php echo $content_top; ?>

            <?php if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
            <?php } ?>

            <?php if ($addresses) { ?>

                <div class="address-list">

                    <?php foreach ($addresses as $result) { ?>
                        <div class="address-list--item">
                            <div class="text-start">
                                <?php echo $result['address']; ?>
                            </div>
                            <div class="d-flex flex-column gap-2">
                                <a href="<?php echo $result['update']; ?>" class="btn btn-sm btn-outline-secondary">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <path d="M493.21 56.262L455.703 18.748C443.208 6.252 426.83 0 410.451 0C394.07 0 377.695 6.25 365.195 18.75L31.037 352.955C28.802 355.189 27.281 358.033 26.66 361.131L0.32 492.854C-1.704 502.967 6.156 512 15.945 512C16.994 512 18.062 511.896 19.144 511.68L150.855 485.336C153.953 484.717 156.796 483.195 159.031 480.963C159.031 480.963 489.292 150.684 493.3 146.676C518.292 121.684 518.201 81.256 493.21 56.262ZM131.945 440.168L56.8 455.197L71.828 380.047L96 355.875V416H156.115L131.945 440.168ZM144 368V307.871L320.949 130.916L381.064 191.035L204.115 368H144Z"/>
                                    </svg>
                                </a>
                                <a href="<?php echo $result['delete']; ?>" class="btn btn-sm btn-outline-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                        <path d="M424 80H349.625L315.625 23.25C306.875 8.875 291.25 0 274.375 0H173.625C156.75 0 141.125 8.875 132.375 23.25L98.375 80H24C10.745 80 0 90.745 0 104V104C0 117.255 10.745 128 24 128H32L53.25 467C54.75 492.25 75.75 512 101.125 512H346.875C372.25 512 393.25 492.25 394.75 467L416 128H424C437.255 128 448 117.255 448 104V104C448 90.745 437.255 80 424 80ZM173.625 48H274.375L293.625 80H154.375L173.625 48ZM346.875 464H101.125L80.125 128H367.875L346.875 464Z"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    <?php } ?>
                    <a href="<?php echo $add; ?>" class="btn btn-outline-secondary">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                            <path d="M432 256C432 269.25 421.25 280 408 280H248V440C248 453.25 237.25 464 224 464S200 453.25 200 440V280H40C26.75 280 16 269.25 16 256S26.75 232 40 232H200V72C200 58.75 210.75 48 224 48S248 58.75 248 72V232H408C421.25 232 432 242.75 432 256Z"/>
                        </svg>
                        <?php echo $button_new_address; ?>
                    </a>
                </div>

            <?php } else { ?>
                <p class="text-center"><?php echo $text_empty; ?></p>
            <?php } ?>

            <?php if ($error_warning) { ?>
                <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                </div>
            <?php } ?>

            <?php echo $content_bottom; ?></div>

        <?php echo $column_right; ?>
    </div>
</div>

<?php echo $footer; ?>
