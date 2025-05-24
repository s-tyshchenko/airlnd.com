<?php /* if ($selecteds) { ?>
<div class="list-group-item selected-options">
  <?php foreach ($selecteds as $option) { ?>
  <div class="ocfilter-option">
    <span><?php echo $option['name']; ?>:</span>
    <?php foreach ($option['values'] as $value) { ?>
    <button type="button" onclick="location = '<?php echo $value['href']; ?>';" class="btn btn-xs btn-danger" style="padding: 1px 4px;"><i class="fa fa-times"></i> <?php echo $value['name']; ?></button>
    <?php } ?>
  </div>
  <?php } ?>
	<?php $count = count($selecteds); $selected = $selecteds; $first = array_shift($selected); ?>
  <?php if ($count > 1 || count($first['values']) > 1) { ?>
  <button type="button" onclick="location = '<?php echo $link; ?>';" class="btn btn-block btn-danger" style="border-radius: 0;"><i class="fa fa-times-circle"></i> <?php echo $text_cancel_all; ?></button>
  <?php } ?>
</div>
<?php } */ ?>

<?php if ($selecteds) { ?>
    <?php
    $count = count($selecteds);
    $selected = $selecteds;
    $first = array_shift($selected);
    ?>

    <div class="d-flex flex-nowrap overflow-x-scroll">
        <div class="search-nav--button search-filter--clear btn btn-sm btn-outline-danger rounded-pill"
             onclick="location = '<?php echo $link; ?>';"><?php echo $text_cancel_all; ?></div>

        <?php foreach ($selecteds as $option) { ?>
            <?php foreach ($option['values'] as $value) { ?>
                <div class="search-nav--button btn btn-sm btn-outline-secondary rounded-pill"
                     onclick="location = '<?php echo $value['href']; ?>';">
                    <?php echo $value['name']; ?>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 12">
                        <path d="M2.08859 2.21569L2.14645 2.14645C2.32001 1.97288 2.58944 1.9536 2.78431 2.08859L2.85355 2.14645L6 5.293L9.14645 2.14645C9.34171 1.95118 9.65829 1.95118 9.85355 2.14645C10.0488 2.34171 10.0488 2.65829 9.85355 2.85355L6.707 6L9.85355 9.14645C10.0271 9.32001 10.0464 9.58944 9.91141 9.78431L9.85355 9.85355C9.67999 10.0271 9.41056 10.0464 9.21569 9.91141L9.14645 9.85355L6 6.707L2.85355 9.85355C2.65829 10.0488 2.34171 10.0488 2.14645 9.85355C1.95118 9.65829 1.95118 9.34171 2.14645 9.14645L5.293 6L2.14645 2.85355C1.97288 2.67999 1.9536 2.41056 2.08859 2.21569L2.14645 2.14645L2.08859 2.21569Z"></path>
                    </svg>
                </div>
            <?php } ?>
        <?php } ?>
    </div>
<?php } ?>