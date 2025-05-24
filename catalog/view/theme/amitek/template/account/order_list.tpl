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

            <?php if ($orders) { ?>
                <div class="order-list--table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col"><?php echo $column_order_id; ?></th>
                            <th scope="col"><?php echo $column_date_added; ?></th>
                            <th scope="col"><?php echo $column_customer; ?></th>
                            <th scope="col"><?php echo $column_total; ?></th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($orders as $order) { ?>
                            <tr>
                                <td scope="row">
                                    <button class="btn btn-outline-secondary" <?php echo(empty($order['files']) ? 'disabled="disabled"' : ''); ?>
                                            href="#files_<?php echo $order['order_id']; ?>"
                                            data-bs-toggle="collapse">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                                            <path d="M216 342.062V240C216 226.75 205.25 216 192 216S168 226.75 168 240V342.062L128.969 303.031C124.281 298.344 118.156 296 112 296S99.719 298.344 95.031 303.031C85.656 312.406 85.656 327.594 95.031 336.969L175.031 416.969C184.406 426.344 199.594 426.344 208.969 416.969L288.969 336.969C298.344 327.594 298.344 312.406 288.969 303.031S264.406 293.656 255.031 303.031L216 342.062ZM365.256 93.383L290.627 18.746C278.625 6.742 262.348 0 245.373 0H64C28.654 0 0 28.652 0 64L0.02 448C0.02 483.344 28.674 512 64.02 512H320C355.199 512 384 483.199 384 448V138.641C384 121.664 377.258 105.383 365.256 93.383ZM336.002 448C336.002 456.836 328.838 464 320.002 464H64.018C55.18 464 48.018 456.836 48.018 448L48 64.125C48 55.289 55.164 48.125 64 48.125H224.008V128C224.008 145.672 238.334 160 256.008 160H336.002V448Z"/>
                                        </svg>
                                        <span class="d-none d-lg-inline">Документи</span>
                                    </button>
                                </td>
                                <td>#<?php echo $order['order_id']; ?></td>
                                <td><?php echo $order['date_added']; ?></td>
                                <td><?php echo $order['name']; ?></td>
                                <td><?php echo $order['total']; ?></td>
                                <td>
                                    <a class="btn btn-link" href="<?php echo $order['view']; ?>">
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        Деталi</a>
                                </td>
                            </tr>
                            <?php if ($order['files']) { ?>
                                <tr id="files_<?php echo $order['order_id']; ?>" class="collapse">
                                    <td colspan="5">
                                        <div>
                                            <?php foreach ($order['files'] as $file) { ?>
                                                <ul class="order-file_list">
                                                    <li>
                                                        <div class="order-file_date"><?php echo $file['date_added']; ?></div>
                                                        <div class="order-file_name"><?php echo $file['name']; ?></div>
                                                        <div class="order-file_declaration">
                                                            <span>ТТН:</span> <?php echo $file['declaration']; ?>
                                                        </div>
                                                        <div class="order-file_total"><?php echo $file['total']; ?></div>
                                                        <a href="<?php echo $file['link']; ?>"
                                                           class="order-file_download btn btn-default"><span
                                                                    class="glyphicon glyphicon-floppy-save"
                                                                    aria-hidden="true"></span>
                                                            Завантажити</a>
                                                    </li>
                                                    <?php if ($file['files']) { ?>
                                                        <?php foreach ($file['files'] as $child) { ?>
                                                            <ul class="order-file_list">
                                                                <li>
                                                                    <div class="order-file_date"><?php echo $child['date_added']; ?></div>
                                                                    <div class="order-file_name"><?php echo $child['name']; ?></div>
                                                                    <div class="order-file_declaration">
                                                                        <span>ТТН:</span> <?php echo $child['declaration']; ?>
                                                                    </div>
                                                                    <div class="order-file_total"><?php echo $child['total']; ?></div>
                                                                    <a href="<?php echo $child['link']; ?>"
                                                                       class="order-file_download btn btn-default"><span
                                                                                class="glyphicon glyphicon-floppy-save"
                                                                                aria-hidden="true"></span>
                                                                        Завантажити</a>
                                                                </li>

                                                                <?php if ($child['files']) { ?>
                                                                    <?php foreach ($child['files'] as $child_2) { ?>
                                                                        <ul class="order-file_list">
                                                                            <li>
                                                                                <div class="order-file_date"><?php echo $child_2['date_added']; ?></div>
                                                                                <div class="order-file_name"><?php echo $child_2['name']; ?></div>
                                                                                <div class="order-file_declaration">
                                                                                    <span>ТТН:</span> <?php echo $child_2['declaration']; ?>
                                                                                </div>
                                                                                <div class="order-file_total"><?php echo $child_2['total']; ?></div>
                                                                                <a href="<?php echo $child_2['link']; ?>"
                                                                                   class="order-file_download btn btn-default"><span
                                                                                            class="glyphicon glyphicon-floppy-save"
                                                                                            aria-hidden="true"></span>
                                                                                    Завантажити</a>
                                                                            </li>

                                                                            <?php if ($child_2['files']) { ?>
                                                                                <?php foreach ($child_2['files'] as $child_3) { ?>
                                                                                    <ul class="order-file_list">
                                                                                        <li>
                                                                                            <div class="order-file_date"><?php echo $child_3['date_added']; ?></div>
                                                                                            <div class="order-file_name"><?php echo $child_3['name']; ?></div>
                                                                                            <div class="order-file_declaration">
                                                                                                <span>ТТН:</span> <?php echo $child_3['declaration']; ?>
                                                                                            </div>
                                                                                            <div class="order-file_total"><?php echo $child_3['total']; ?></div>
                                                                                            <a href="<?php echo $child_3['link']; ?>"
                                                                                               class="order-file_download btn btn-default"><span
                                                                                                        class="glyphicon glyphicon-floppy-save"
                                                                                                        aria-hidden="true"></span>
                                                                                                Завантажити</a>
                                                                                        </li>


                                                                                    </ul>
                                                                                <?php } ?>
                                                                            <?php } ?>
                                                                        </ul>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                            </ul>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </ul>
                                            <?php } ?>
                                        </div>
                                    </td>
                                </tr>
                            <?php } ?>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            <?php } else { ?>

                <h3 class="text-center"><?php echo $text_list; ?></h3>
                <p class="text-center text-empty"><?php echo $text_empty; ?></p>
                <div class="buttons clearfix">
                    <div class="text-center"><a href="<?php echo $continue; ?>"
                                                class="btn btn-default"><?php echo $button_continue; ?></a></div>
                </div>

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
