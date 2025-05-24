<?php if ($logged) { ?>
    <aside class="column-left d-none d-lg-block">
        <div class="list-group">
            <a href="<?php echo $order; ?>" class="list-group-item <?php echo($order == $og_url ? 'active' : ''); ?>"><?php echo $text_order; ?></a>
            <a href="<?php echo $files; ?>" class="list-group-item <?php echo($files == $og_url ? 'active' : ''); ?>"><?php echo $text_files; ?></a>
            <a href="<?php echo $edit; ?>" class="list-group-item <?php echo($edit == $og_url ? 'active' : ''); ?>"><?php echo $text_edit; ?></a>
            <a href="<?php echo $address; ?>" class="list-group-item <?php echo($address == $og_url ? 'active' : ''); ?>"><?php echo $text_address; ?></a>
            <a href="<?php echo $password; ?>" class="list-group-item <?php echo($password == $og_url ? 'active' : ''); ?>"><?php echo $text_password; ?></a>
            <a href="<?php echo $logout; ?>" class="list-group-item <?php echo($logout == $og_url ? 'active' : ''); ?>"><?php echo $text_logout; ?></a>
        </div>
    </aside>
    <div class="column-left dropdown d-block d-lg-none">
        <a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
           aria-expanded="false">
            <?php echo $heading_title; ?>
        </a>

        <ul class="dropdown-menu">
            <li><a href="<?php echo $order; ?>" class="dropdown-item <?php echo($order == $og_url ? 'active' : ''); ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $files; ?>" class="dropdown-item <?php echo($files == $og_url ? 'active' : ''); ?>"><?php echo $text_files; ?></a></li>
            <li><a href="<?php echo $edit; ?>" class="dropdown-item <?php echo($edit == $og_url ? 'active' : ''); ?>"><?php echo $text_edit; ?></a></li>
            <li><a href="<?php echo $address; ?>" class="dropdown-item <?php echo($address == $og_url ? 'active' : ''); ?>"><?php echo $text_address; ?></a></li>
            <li><a href="<?php echo $password; ?>" class="dropdown-item <?php echo($password == $og_url ? 'active' : ''); ?>"><?php echo $text_password; ?></a></li>
            <li><a href="<?php echo $logout; ?>" class="dropdown-item <?php echo($logout == $og_url ? 'active' : ''); ?>"><?php echo $text_logout; ?></a></li>
        </ul>
    </div>
<?php } ?>
