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

    <h1 class="payment-and-delivery-page_heading"><?php echo $heading_title; ?></h1>

    <section class="payment-and-delivery-page_section">
        <h2><?php echo $heading_payment_methods; ?></h2>
        <p><?php echo $subheading_payment_methods; ?></p>

        <div class="payment-methods-container">
            <div class="payment-method-box">
                <div class="payment-method-box-heading">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                        <path d="M512 80c8.8 0 16 7.2 16 16v32H48V96c0-8.8 7.2-16 16-16H512zm16 144V416c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V224H528zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zm56 304c-13.3 0-24 10.7-24 24s10.7 24 24 24h48c13.3 0 24-10.7 24-24s-10.7-24-24-24H120zm128 0c-13.3 0-24 10.7-24 24s10.7 24 24 24H360c13.3 0 24-10.7 24-24s-10.7-24-24-24H248z"/>
                    </svg>
                    <h3><?php echo $heading_payment_method_1; ?></h3>
                </div>
                <p>
                    <?php echo $text_payment_method_1; ?>
                </p>
            </div>
            <div class="payment-method-box">
                <div class="payment-method-box-heading">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                        <path d="M64 64C28.7 64 0 92.7 0 128V384c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V128c0-35.3-28.7-64-64-64H64zm64 320H64V320c35.3 0 64 28.7 64 64zM64 192V128h64c0 35.3-28.7 64-64 64zM448 384c0-35.3 28.7-64 64-64v64H448zm64-192c-35.3 0-64-28.7-64-64h64v64zM288 160a96 96 0 1 1 0 192 96 96 0 1 1 0-192z"/>
                    </svg>
                    <h3><?php echo $heading_payment_method_2; ?></h3>
                </div>
                <p>
                    <?php echo $text_payment_method_2; ?>
                </p>
            </div>
            <div class="payment-method-box">
                <div class="payment-method-box-heading">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                        <path d="M64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V160H256c-17.7 0-32-14.3-32-32V0H64zM256 0V128H384L256 0zM80 64h64c8.8 0 16 7.2 16 16s-7.2 16-16 16H80c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64h64c8.8 0 16 7.2 16 16s-7.2 16-16 16H80c-8.8 0-16-7.2-16-16s7.2-16 16-16zm16 96H288c17.7 0 32 14.3 32 32v64c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V256c0-17.7 14.3-32 32-32zm0 32v64H288V256H96zM240 416h64c8.8 0 16 7.2 16 16s-7.2 16-16 16H240c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/>
                    </svg>
                    <h3><?php echo $heading_payment_method_3; ?></h3>
                </div>
                <p>
                    <?php echo $text_payment_method_3; ?>
                </p>
            </div>
        </div>
    </section>

    <section class="payment-and-delivery-page_section">
        <h2><?php echo $heading_delivery_methods; ?></h2>
        <p><?php echo $subheading_delivery_methods; ?></p>
        <div class="delivery-methods-container">
            <div class="delivery-method-box">
                <div class="delivery-method-box-heading">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 367.39 362.51">
                        <path d="M292.36,252.62c0,4.94,2.9,6.12,6.45,2.63l65.92-64.91c3.54-3.5,3.55-9.17,0.01-12.67c0,0-0.01-0.01-0.01-0.01
	l-65.92-64.92c-3.54-3.49-6.45-2.31-6.45,2.63V252.62L292.36,252.62z M142.38,76.28c5.01,0,9.12,4.03,9.12,8.97v49.8
	c0,4.94,4.09,8.97,9.11,8.97h49.96c5.01,0,9.08-4.01,9.11-8.97v-49.8c0-4.94,4.1-8.97,9.12-8.97h28.13c5,0,6.21-2.86,2.66-6.35
	L191.22,2.62c-3.57-3.49-9.31-3.49-12.88,0l-68.37,67.31c-3.54,3.49-2.34,6.35,2.66,6.35L142.38,76.28L142.38,76.28z M76.63,110.94
	c0-4.94-2.91-6.12-6.45-2.63L2.65,174.8c-3.54,3.51-3.54,9.18,0,12.69l67.53,66.5c3.54,3.48,6.45,2.31,6.45-2.63L76.63,110.94
	L76.63,110.94z M227.21,287.82c-5.03,0-9.11-4.02-9.13-8.99v-52.81c-0.02-4.96-4.09-8.97-9.1-8.98h-49.95
	c-5.03,0-9.11,4.02-9.13,8.99v52.81c-0.02,4.96-4.09,8.98-9.11,8.98h-28.15c-5,0-6.21,2.85-2.66,6.34l66.76,65.74
	c3.57,3.48,9.32,3.48,12.89,0l66.77-65.74c3.54-3.49,2.35-6.34-2.66-6.34C253.74,287.82,227.21,287.82,227.21,287.82z"/>
                    </svg>
                    <h3><?php echo $heading_delivery_method_1; ?></h3>
                </div>
                <p>
                    <?php echo $text_delivery_method_1; ?>
                </p>
            </div>
            <div class="delivery-method-box">
                <div class="delivery-method-box-heading">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 367.39 362.51">
                        <path d="M292.36,252.62c0,4.94,2.9,6.12,6.45,2.63l65.92-64.91c3.54-3.5,3.55-9.17,0.01-12.67c0,0-0.01-0.01-0.01-0.01
	l-65.92-64.92c-3.54-3.49-6.45-2.31-6.45,2.63V252.62L292.36,252.62z M142.38,76.28c5.01,0,9.12,4.03,9.12,8.97v49.8
	c0,4.94,4.09,8.97,9.11,8.97h49.96c5.01,0,9.08-4.01,9.11-8.97v-49.8c0-4.94,4.1-8.97,9.12-8.97h28.13c5,0,6.21-2.86,2.66-6.35
	L191.22,2.62c-3.57-3.49-9.31-3.49-12.88,0l-68.37,67.31c-3.54,3.49-2.34,6.35,2.66,6.35L142.38,76.28L142.38,76.28z M76.63,110.94
	c0-4.94-2.91-6.12-6.45-2.63L2.65,174.8c-3.54,3.51-3.54,9.18,0,12.69l67.53,66.5c3.54,3.48,6.45,2.31,6.45-2.63L76.63,110.94
	L76.63,110.94z M227.21,287.82c-5.03,0-9.11-4.02-9.13-8.99v-52.81c-0.02-4.96-4.09-8.97-9.1-8.98h-49.95
	c-5.03,0-9.11,4.02-9.13,8.99v52.81c-0.02,4.96-4.09,8.98-9.11,8.98h-28.15c-5,0-6.21,2.85-2.66,6.34l66.76,65.74
	c3.57,3.48,9.32,3.48,12.89,0l66.77-65.74c3.54-3.49,2.35-6.34-2.66-6.34C253.74,287.82,227.21,287.82,227.21,287.82z"/>
                    </svg>
                    <h3><?php echo $heading_delivery_method_2; ?></h3>
                </div>
                <p>
                    <?php echo $text_delivery_method_2; ?>
                </p>
            </div>
            <div class="delivery-method-box">
                <div class="delivery-method-box-heading">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                        <path d="M0 32C0 14.3 14.3 0 32 0h72.9c27.5 0 52 17.6 60.7 43.8L257.7 320c30.1 .5 56.8 14.9 74 37l202.1-67.4c16.8-5.6 34.9 3.5 40.5 20.2s-3.5 34.9-20.2 40.5L352 417.7c-.9 52.2-43.5 94.3-96 94.3c-53 0-96-43-96-96c0-30.8 14.5-58.2 37-75.8L104.9 64H32C14.3 64 0 49.7 0 32zM244.8 134.5c-5.5-16.8 3.7-34.9 20.5-40.3L311 79.4l19.8 60.9 60.9-19.8L371.8 59.6l45.7-14.8c16.8-5.5 34.9 3.7 40.3 20.5l49.4 152.2c5.5 16.8-3.7 34.9-20.5 40.3L334.5 307.2c-16.8 5.5-34.9-3.7-40.3-20.5L244.8 134.5z"/>
                    </svg>
                    <h3><?php echo $heading_delivery_method_3; ?></h3>
                </div>
                <p>
                    <?php echo $text_delivery_method_3; ?>
                </p>
            </div>
            <div class="delivery-method-box">
                <div class="delivery-method-box-heading">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                        <path d="M80 48a48 48 0 1 1 96 0A48 48 0 1 1 80 48zm64 193.7v65.1l51 51c7.1 7.1 11.8 16.2 13.4 26.1l15.2 90.9c2.9 17.4-8.9 33.9-26.3 36.8s-33.9-8.9-36.8-26.3l-14.3-85.9L66.8 320C54.8 308 48 291.7 48 274.7V186.6c0-32.4 26.2-58.6 58.6-58.6c24.1 0 46.5 12 59.9 32l47.4 71.1 10.1 5V160c0-17.7 14.3-32 32-32H384c17.7 0 32 14.3 32 32v76.2l10.1-5L473.5 160c13.3-20 35.8-32 59.9-32c32.4 0 58.6 26.2 58.6 58.6v88.1c0 17-6.7 33.3-18.7 45.3l-79.4 79.4-14.3 85.9c-2.9 17.4-19.4 29.2-36.8 26.3s-29.2-19.4-26.3-36.8l15.2-90.9c1.6-9.9 6.3-19 13.4-26.1l51-51V241.7l-19 28.5c-4.6 7-11 12.6-18.5 16.3l-59.6 29.8c-2.4 1.3-4.9 2.2-7.6 2.8c-2.6 .6-5.3 .9-7.9 .8H256.7c-2.5 .1-5-.2-7.5-.7c-2.9-.6-5.6-1.6-8.1-3l-59.5-29.8c-7.5-3.7-13.8-9.4-18.5-16.3l-19-28.5zM2.3 468.1L50.1 348.6l49.2 49.2-37.6 94c-6.6 16.4-25.2 24.4-41.6 17.8S-4.3 484.5 2.3 468.1zM512 0a48 48 0 1 1 0 96 48 48 0 1 1 0-96zm77.9 348.6l47.8 119.5c6.6 16.4-1.4 35-17.8 41.6s-35-1.4-41.6-17.8l-37.6-94 49.2-49.2z"/>
                    </svg>
                    <h3><?php echo $heading_delivery_method_4; ?></h3>
                </div>
                <p>
                    <?php echo $text_delivery_method_4; ?>
                </p>
            </div>
        </div>
    </section>

    <section class="payment-and-delivery-page_section out-of-stock_section">
        <h2><?php echo $heading_out_of_stock; ?></h2>
        <p>
            <?php echo $text_out_of_stock; ?>
        </p>
    </section>
</div>
<?php echo $footer; ?>
