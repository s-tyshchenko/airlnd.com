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

    <?php if($h1){ ?>
    <h1 class="information-heading"><?php echo $h1; ?></h1>
    <?php } ?>

    <div class="information-page">

        <?php echo $description; ?>

    </div>
</div>

<?php echo $footer; ?>
