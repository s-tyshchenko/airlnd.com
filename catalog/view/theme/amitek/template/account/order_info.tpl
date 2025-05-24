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


    <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <div class="account-layout"><?php echo $column_left; ?>
        <div class="content">
            <?php echo $content_top; ?>
            <div class="order-info--table">

                <table class="table">
                    <thead>
                    <tr>
                        <th colspan="7">
                            <div class="d-flex flex-column">
                                <h2><?php echo $heading_title; ?> №<?php echo $order_id; ?></h2>
                                <p><?php echo $firstname; ?> <?php echo $lastname; ?>
                                    , <?php echo $date_added; ?></p>
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th scope="col">№</th>
                        <th scope="col"><?php echo $column_model; ?></th>
                        <th scope="col"><?php echo $column_name; ?></th>
                        <th scope="col"><?php echo $column_total; ?></th>
                        <th scope="col"><?php echo $column_quantity; ?></th>
                        <th scope="col"><?php echo $column_price; ?></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($products as $key => $product) { ?>
                        <tr>
                            <td><?php echo($key + 1); ?></td>
                            <td><?php echo $product['sku']; ?></td>
                            <td><a href="<?php echo $product['url']; ?>"><?php echo $product['name']; ?></a></td>
                            <td><?php echo $product['total']; ?></td>
                            <td><?php echo $product['quantity']; ?></td>
                            <td><?php echo $product['price']; ?></td>
                            <td>
                                <a href="<?php echo $product['reorder']; ?>" class="btn btn-outline-secondary">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                        <path d="M176 416C149.49 416 128 437.49 128 464S149.49 512 176 512S224 490.51 224 464S202.51 416 176 416ZM272 112H312V152C312 165.25 322.75 176 336 176S360 165.25 360 152V112H400C413.25 112 424 101.25 424 88S413.25 64 400 64H360V24C360 10.75 349.25 0 336 0S312 10.75 312 24V64H272C258.75 64 248 74.75 248 88S258.75 112 272 112ZM569.529 44.734C563.42 36.641 554.107 32 543.967 32H480V80H522.77L477.049 240H161.574L131.1 80H192V32H121.957L119.578 19.51C117.422 8.189 107.523 0 96 0H24C10.744 0 0 10.744 0 24C0 37.254 10.744 48 24 48H76.141L136.424 364.488C138.58 375.809 148.479 384 160.002 384H488C501.254 384 512 373.254 512 360C512 346.744 501.254 336 488 336H179.859L170.717 288H489.123C503.406 288 515.959 278.531 519.885 264.797L574.748 72.797C577.529 63.047 575.623 52.828 569.529 44.734ZM464 416C437.49 416 416 437.49 416 464S437.49 512 464 512S512 490.51 512 464S490.51 416 464 416Z"/>
                                    </svg>
                                </a>
                            </td>
                        </tr>
                    <?php } ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="3">Всього:</td>
                        <td colspan="4"><?php echo $totals['total']['text']; ?> грн з ПДВ</td>
                    </tr>
                    <tr>
                        <td colspan="2"><?php echo $text_shipping_method; ?></td>
                        <td colspan="5"><?php echo $shipping_method; ?></td>
                    </tr>
                    <?php if ($city) { ?>
                        <tr>
                            <td colspan="2"><?php echo $text_city; ?></td>
                            <td colspan="5"><?php echo $city; ?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><?php echo $text_address; ?></td>
                            <td colspan="5"><?php echo $address_1; ?></td>
                        </tr>
                    <?php } ?>
                    <tr>
                        <td colspan="2"><?php echo $text_telephone; ?></td>
                        <td colspan="5"><?php echo $telephone; ?></td>
                    </tr>
                    <tr>
                        <td colspan="2"><?php echo $text_customer; ?></td>
                        <td colspan="5"><?php echo "{$firstname} {$lastname}"; ?></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
