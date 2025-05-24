<?php if (!$logged) { ?>

    <div class="modal auth-modal in" id="auth-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <ul class="auth-modal--nav nav nav-tabs">
                        <li class="nav-item">
                            <button type="button" id="register-tab" class="" data-bs-target="#tab-register"
                                    data-bs-toggle="tab"><?php echo $heading_register; ?></button>
                        </li>
                        <li class="nav-item">
                            <button type="button" id="login-tab" class="active" data-bs-target="#tab-login"
                                    data-bs-toggle="tab"><?php echo $heading_login; ?></button>
                        </li>
                    </ul>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                            <path d="M312.973 375.032C322.342 384.401 322.342 399.604 312.973 408.973S288.401 418.342 279.032 408.973L160 289.941L40.968 408.973C31.599 418.342 16.396 418.342 7.027 408.973S-2.342 384.401 7.027 375.032L126.059 256L7.027 136.968C-2.342 127.599 -2.342 112.396 7.027 103.027S31.599 93.658 40.968 103.027L160 222.059L279.032 103.027C288.401 93.658 303.604 93.658 312.973 103.027S322.342 127.599 312.973 136.968L193.941 256L312.973 375.032Z"/>
                        </svg>
                    </button>
                </div>

                <div class="auth-modal--body modal-body tab-content">

                    <div id="tab-register" class="tab-pane fade">

                        <ul class="tab-register--nav nav nav-tabs mb-4">
                            <li class="nav-item">
                                <button type="button" class="active" data-bs-toggle="tab"
                                        data-bs-target="#form-register--private">
                                    <span><?php echo $user_type_private; ?></span>
                                </button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="" data-bs-toggle="tab"
                                        data-bs-target="#form-register--business">
                                    <span><?php echo $user_type_business; ?></span>
                                </button>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <?php include DIR_TEMPLATE . 'amitek/template/account/ajax_auth/register_private.tpl'; ?>
                            <?php include DIR_TEMPLATE . 'amitek/template/account/ajax_auth/register_business.tpl'; ?>
                        </div>

                    </div>

                    <div id="tab-login" class="tab-pane fade show active">
                        <?php include DIR_TEMPLATE . 'amitek/template/account/ajax_auth/login.tpl'; ?>
                    </div>

                </div>
            </div>
        </div>
    </div>
<?php } ?>
