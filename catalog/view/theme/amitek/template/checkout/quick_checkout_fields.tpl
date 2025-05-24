<?php if (!empty($fields)) { ?>
    <div class="row">
        <?php $i = 0; foreach ($fields as $field => $data) { $i++;?>
            <div class="col-md-12">
                <div class="<?php echo $data['type'] == 'select' ? 'dropdown' : ''; ?> <?php echo $i !== 1 ? 'mt-3' : ''; ?>">
                    <label class="form-label" for="qc_<?php echo $field; ?>"><?php echo $data['name']; ?></label>
                    <input class="form-control"
                           type="<?php echo $data['type']; ?>"
                           placeholder="<?php echo $data['placeholder']; ?>"
                           id="qc_<?php echo $field; ?>"
                           name="<?php echo $field; ?>"
                           value="<?php echo $data['value']; ?>"
                    >
                </div>
            </div>
        <?php } ?>
    </div>
<?php } ?>