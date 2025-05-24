<?php if (count($languages) > 1) { ?>
    <form action="<?php echo $action; ?>" class="dropdown mb-0" method="post" enctype="multipart/form-data">
        <?php foreach ($languages as $language) { ?>
            <?php if ($language['code'] == $code) { ?>
                <button class="btn btn-sm btn-outline-primary dropdown-toggle" data-bs-toggle="dropdown"><?php echo $language['name']; ?></button>
            <?php } ?>
        <?php } ?>
        <ul class="dropdown-menu">
            <?php foreach ($languages as $language) { ?>
                <li>
                    <label class="dropdown-item">
                        <input class="d-none" type="radio" name="code" value="<?php echo $language['code']; ?>"
                               onchange="$(this).parents('form').first().submit();">
                        <?php echo $language['name']; ?>
                    </label>
                </li>
            <?php } ?>
        </ul>
        <input type="hidden" name="redirect_route" value="<?php echo $redirect_route; ?>">
        <input type="hidden" name="redirect_query" value="<?php echo isset($redirect_query) ? $redirect_query : ''; ?>">
        <input type="hidden" name="redirect_ssl" value="<?php echo isset($redirect_ssl) ? $redirect_ssl : ''; ?>"/>
    </form>
<?php } ?>
