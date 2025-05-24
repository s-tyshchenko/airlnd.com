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

            <?php if (!empty($download_file)) { ?>
                <div class="files-list">

                    <div class="account-files_block">
                        <a href="<?php echo $download_file['link']; ?>"
                           class="order-file_download btn btn-primary">
                            <?php echo $button_download; ?>
                        </a>
                    </div>

                    <div class="text-center">
                        <?php echo $pagination; ?>
                    </div>
                </div>

            <?php } else { ?>

                <h3 class="text-center"><?php echo $text_list; ?></h3>
                <p class="text-center text-empty"><?php echo $text_empty; ?></p>

            <?php } ?>

            <?php echo $content_bottom; ?>
        </div>

        <?php echo $column_right; ?>
    </div>
</div>
<style>
    .table > tbody > tr > td {
        vertical-align: middle;
    }

</style>

<?php echo $footer; ?>
