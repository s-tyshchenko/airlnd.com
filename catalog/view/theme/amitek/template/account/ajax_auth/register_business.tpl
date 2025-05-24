<form id="form-register--business" class="row tab-pane fade">

    <div class="register-business--steps mb-3">
        <div class="register-business--step active" data-step="#register-business--step-1"><?php echo $text_legal_information; ?></div>
        <div class="register-business--step disabled" data-step="#register-business--step-2"><?php echo $text_contact_details; ?></div>
        <div class="register-business--step disabled" data-step="#register-business--step-3"><?php echo $text_company_address; ?></div>
    </div>

    <!-- Step 1 -->
    <div class="row step_form" id="register-business--step-1">
        <input type="hidden" name="fop_step" value="1">

        <div class="col col-md-12">
            <div class="form-check form-check-inline mb-3">
                <input id="user_group_2" class="form-check-input" type="radio" name="user_group" value="2" checked="checked">
                <label class="form-check-label" for="user_group_2">
                    <?php echo $entry_business_private; ?>
                </label>
            </div>
            <div class="form-check form-check-inline mb-3">
                <input id="user_group_3" class="form-check-input" type="radio" name="user_group" value="3">
                <label class="form-check-label" for="user_group_3">
                    <?php echo $entry_business_entity; ?>
                </label>
            </div>

        </div>

        <div class="col col-md-6">
            <div class="mb-3" style="display: none;">
                <label class="form-label" for="qr_edrpou"><?php echo $entry_erdpou; ?></label>
                <input type="text" class="form-control" id="qr_edrpou" name="edrpou">
            </div>
            <div class="mb-3">
                <label class="form-label" for="qr_ipn"><?php echo $entry_inn; ?></label>
                <input type="text" class="form-control" id="qr_ipn" name="ipn">
            </div>
            <div class="mb-3">
                <label class="form-label" for="qr_company"><?php echo $entry_company; ?></label>
                <input type="text" class="form-control" id="qr_company" name="company">
            </div>
        </div>
        <div class="col col-md-6">
            <div class="mb-3">
                <label class="form-label" for="qr_password"><?php echo $entry_password; ?></label>
                <input type="password" class="form-control" id="qr_password" name="password">
            </div>
            <div class="mb-3">
                <label class="form-label" for="qr_confirm"><?php echo $entry_password_confirm; ?></label>
                <input type="password" class="form-control" id="qr_confirm" name="confirm">
            </div>
        </div>

        <div class="col col-md-12">
            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" name="pdw" value="1" id="pdw">
                <label class="form-check-label" for="pdw"><?php echo $entry_vat; ?></label>
            </div>
        </div>

        <div class="col col-md-12">
            <button class="btn btn-lg btn-primary" data-action="register-next-step" data-next-step="#register-business--step-2"><?php echo $text_next_step; ?></button>
        </div>
    </div>

    <!-- Step 2 -->
    <div class="row step_form" id="register-business--step-2" style="display: none;">
        <input type="hidden" name="fop_step" value="2">
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
                <label class="form-label" for="qr_middlename"><?php echo $entry_middlename; ?></label>
                <input type="text" class="form-control" id="qr_middlename" name="middlename">
            </div>
        </div>
        <div class="col col-md-6">
            <div class="mb-3">
                <label class="form-label" for="qr_email"><?php echo $entry_email; ?></label>
                <input type="email" class="form-control" id="qr_email" name="email">
            </div>
            <div class="mb-3">
                <label class="form-label" for="qr_telephone"><?php echo $entry_telephone; ?></label>
                <input type="tel" class="form-control" id="qr_telephone" name="telephone">
            </div>
            <div class="mb-3">
                <label class="form-label" for="qr_fax"><?php echo $entry_landline; ?></label>
                <input type="tel" class="form-control" id="qr_fax" name="fax">
            </div>
        </div>

        <div class="register-btn_block col col-md-12">
            <button class="btn btn-lg btn-primary" data-action="register-next-step" data-next-step="#register-business--step-3"><?php echo $text_next_step; ?></button>
        </div>
    </div>

    <!-- Step 3 -->
    <div class="row step_form" id="register-business--step-3" style="display: none;">
        <input type="hidden" name="fop_step" value="3">
        <div class="col col-md-6">
            <div class="mb-3">
                <label class="form-label" for="qr_city"><?php echo $entry_city; ?></label>
                <input type="text" class="form-control" id="qr_city" name="city" autocomplete="off">
            </div>
        </div>
        <div class="col col-md-6">
            <div class="mb-3">
                <label class="form-label" for="qr_address_1"><?php echo $entry_business_delivery_address; ?></label>
                <input type="text" class="form-control" id="qr_address_1" name="address_1" autocomplete="off">
            </div>
        </div>

        <div class="register-confirm_block col col-md-12">
            <div class="form-check mb-3">
                <input id="qr_confirm_check_fop" class="form-check-input" type="checkbox" name="confirm_check" value="1" >
                <label for="qr_confirm_check_fop" class="form-check-label" >Я погоджуюсь з усіма пунктами документів
                    <a href="#">“Умови користування”</a> та <a href="#">“Політика конфіденційності”</a>.</label>
            </div>
        </div>

        <div class="register-btn_block col col-md-12">
            <button class="btn btn-lg btn-primary" data-action="register"><?php echo $text_register; ?></button>
        </div>
    </div>
</form>
