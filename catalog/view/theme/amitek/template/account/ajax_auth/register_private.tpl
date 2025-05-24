<form id="form-register--private" class="tab-pane fade show active">
    <div class="row">
        <div class="col col-md-6">
            <div class="mb-3">
                <label class="form-label" for="qr_firstname"><?php echo $entry_firstname; ?></label>
                <input type="text" class="form-control" id="qr_firstname" name="firstname">
            </div>
            <div class="mb-3">
                <label class="form-label" for="qr_lastname"><?php echo $entry_lastname; ?></label>
                <input type="text" class="form-control" id="qr_lastname" name="lastname">
            </div>
            <div class="mb-3">
                <label class="form-label" for="qr_telephone"><?php echo $entry_telephone; ?></label>
                <input type="tel" class="form-control" id="qr_telephone" name="telephone">
            </div>
        </div>
        <div class="col col-md-6">
            <div class="mb-3">
                <label class="form-label" for="qr_email"><?php echo $entry_email; ?></label>
                <input type="text" class="form-control" id="qr_email" name="email">
            </div>
            <div class="mb-3">
                <label class="form-label" for="qr_password"><?php echo $entry_password; ?></label>
                <input type="password" class="form-control" id="qr_password" name="password">
            </div>
            <div class="mb-3">
                <label class="form-label" for="qr_confirm"><?php echo $entry_password_confirm; ?></label>
                <input type="password" class="form-control" id="qr_confirm" name="confirm">
            </div>
        </div>

        <input type="hidden" name="user_default" value="1"/>

        <div class="register-confirm_block col col-md-12">
            <div class="form-check mb-3">
                <input id="qr_confirm_check" class="form-check-input" type="checkbox" name="confirm_check" value="1" >
                <label for="qr_confirm_check" class="form-check-label" >Я погоджуюсь з усіма пунктами документів
                    <a href="#">“Умови користування”</a> та <a href="#">“Політика конфіденційності”</a>.</label>
            </div>
        </div>

        <div class="register-btn_block col col-md-12">
            <button data-action="register" class="btn btn-primary"><?php echo $button_register; ?></button>
        </div>
    </div>
</form>
