<ul class="tab-login--nav nav nav-tabs mb-4">
    <li class="nav-item">
        <button type="button" class="active" data-bs-toggle="tab" data-bs-target="#tab-login--private">
            <span><?php echo $user_type_private; ?></span>
        </button>
    </li>
    <li class="nav-item">
        <button type="button" class="" data-bs-toggle="tab" data-bs-target="#tab-login--business">
            <span><?php echo $user_type_business; ?></span>
        </button>
    </li>
</ul>

<form id="form-login" class="tab-content">
    <div id="tab-login--private" class="tab-pane fade show active">
        <div class="row">
            <div class="col col-md-12">
                <div class="mb-3">
                    <label class="form-label" for="qr_username"><?php echo $entry_username; ?></label>
                    <input type="text" class="form-control" id="qr_username" name="username">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="qr_password"><?php echo $entry_password; ?></label>
                    <input type="password" class="form-control" id="qr_password" name="password">
                </div>
            </div>
            <input type="hidden" name="user_default" value="1"/>
        </div>
    </div>

    <div id="tab-login--business" class="row tab-pane fade">
        <div class="row">
            <div class="col col-md-12">
                <div class="mb-3">
                    <label class="form-label" for="qr_username"><?php echo $entry_ein; ?></label>
                    <input type="text" class="form-control" id="qr_username" name="username">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="qr_password"><?php echo $entry_password; ?></label>
                    <input type="password" class="form-control" id="qr_password" name="password">
                </div>
            </div>
        </div>
    </div>
</form>

<div class="row">

    <div class="login-remember_block col col-md-6">
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" name="remember" value="1" id="qr_remember">
            <label class="form-check-label" for="qr_remember"><?php echo $text_remember; ?></label>
        </div>
    </div>

    <div class="login-links_block col col-md-6">
        <a href="/index.php?route=account/forgotten" class="login-links_item"><?php echo $text_forgot_password; ?></a>
    </div>

    <div class="register-btn_block col col-md-12">
        <button id="btn_ajax_login" class="btn btn-lg btn-primary" data-action="login" data-form="#tab-login--private"><?php echo $button_login; ?></button>
    </div>
</div>
