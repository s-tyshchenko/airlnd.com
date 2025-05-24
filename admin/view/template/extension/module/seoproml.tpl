<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right form-inline">
				<button type="submit" form="form-module" name="apply" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-success"><i class="fa fa-check"></i></button>
				<button type="submit" form="form-module" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning): ?>
			<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php endif; ?>
		<?php if ($success): ?>
			<div class="alert alert-success alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php endif; ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab-main" data-toggle="tab"><?php echo $tab_main; ?></a></li>
					<li><a href="#tab-home" data-toggle="tab"><?php echo $tab_home; ?></a></li>
					<li><a href="#tab-logo" data-toggle="tab"><?php echo $tab_logo; ?></a></li>
					<li><a href="#tab-license" data-toggle="tab"><?php echo $tab_license; ?></a></li>
				</ul>
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-module" class="form-horizontal">
					<div class="tab-content">
						<div id="tab-main" class="tab-pane active form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-status"><span class="help" title="<?php echo $help_status; ?>" data-toggle="tooltip"><?php echo $entry_status; ?></span></label>
								<div class="col-sm-10">
									<select name="seoproml_status" id="input-status" class="form-control">
										<option value="0" <?php echo "0" == $seoproml_status ? "selected" : ""; ?>><?php echo $text_disabled; ?></option>
										<option value="1" <?php echo "1" == $seoproml_status ? "selected" : ""; ?>><?php echo $text_enabled; ?></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-prefix"><span class="help" title="<?php echo $help_prefix; ?>" data-toggle="tooltip"><?php echo $entry_prefix; ?></span></label>
								<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon">
												<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
											</span>
											<input type="text" name="seoproml_prefix[<?php echo $language['code']; ?>]" value="<?php echo isset($seoproml_prefix[$language['code']]) ? $seoproml_prefix[$language['code']] : ''; ?>" placeholder="<?php echo substr($language['code'], -2); ?>" class="form-control" />
										</div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hreflang"><span class="help" title="<?php echo $help_hreflang; ?>" data-toggle="tooltip"><?php echo $entry_hreflang; ?></span></label>
								<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon">
												<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
											</span>
											<input type="text" name="seoproml_hreflang[<?php echo $language['language_id']; ?>]" value="<?php echo isset($seoproml_hreflang[$language['language_id']]) ? $seoproml_hreflang[$language['language_id']] : ''; ?>" placeholder="<?php echo $language['code']; ?>" class="form-control" />
										</div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-xdefault"><span class="help" title="<?php echo $help_xdefault; ?>" data-toggle="tooltip"><?php echo $entry_xdefault; ?></span></label>
								<div class="col-sm-10">
									<select name="seoproml_xdefault" id="input-xdefault" class="form-control">
										<option value="0" <?php echo "0" == $seoproml_xdefault ? "selected" : ""; ?>><?php echo $text_disabled; ?></option>
										<?php foreach ($languages as $language) { ?>
										<option value="<?php echo $language['code']; ?>" <?php echo $language['code'] == $seoproml_xdefault ? "selected" : ""; ?>><?php echo $language['code']; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
						</div>
						<div id="tab-home" class="tab-pane form-horizontal">
							<ul class="nav nav-tabs" id="language-home">
								<?php foreach ($languages as $language) { ?>
									<li><a href="#home-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>
							<div class="tab-content">
								<?php foreach ($languages as $language) { ?>
									<div class="tab-pane" id="home-language<?php echo $language['language_id']; ?>">
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_h1; ?></label>
											<div class="col-sm-10">
												<input type="text" name="seoproml_tags[<?php echo $language['language_id']; ?>][home][h1]" value="<?php echo isset($seoproml_tags[$language['language_id']]['home']['h1']) ? $seoproml_tags[$language['language_id']]['home']['h1'] : ''; ?>" placeholder="<?php echo $entry_h1; ?>" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>
											<div class="col-sm-10">
												<textarea name="seoproml_tags[<?php echo $language['language_id']; ?>][home][description]" placeholder="<?php echo $entry_description; ?>" class="form-control summernote"><?php echo isset($seoproml_tags[$language['language_id']]['home']['description']) ? $seoproml_tags[$language['language_id']]['home']['description'] : ''; ?></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_meta_title; ?></label>
											<div class="col-sm-10">
												<input type="text" name="seoproml_tags[<?php echo $language['language_id']; ?>][home][meta_title]" value="<?php echo isset($seoproml_tags[$language['language_id']]['home']['meta_title']) ? $seoproml_tags[$language['language_id']]['home']['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_meta_description; ?></label>
											<div class="col-sm-10">
												<textarea name="seoproml_tags[<?php echo $language['language_id']; ?>][home][meta_description]" placeholder="<?php echo $entry_meta_description; ?>" rows="4" class="form-control"><?php echo isset($seoproml_tags[$language['language_id']]['home']['meta_description']) ? $seoproml_tags[$language['language_id']]['home']['meta_description'] : ''; ?></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_meta_keywords; ?></label>
											<div class="col-sm-10">
												<input type="text" name="seoproml_tags[<?php echo $language['language_id']; ?>][home][meta_keywords]" value="<?php echo isset($seoproml_tags[$language['language_id']]['home']['meta_keywords']) ? $seoproml_tags[$language['language_id']]['home']['meta_keywords'] : ''; ?>" placeholder="<?php echo $entry_meta_keywords; ?>" class="form-control">
											</div>
										</div>
									</div>
								<?php } ?>
							</div>
						</div>
						<div id="tab-logo" class="tab-pane form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-logo-status"><?php echo $entry_logo_status; ?></label>
								<div class="col-sm-10">
									<select name="seoproml_logo_status" id="input-logo-status" class="form-control">
										<option value="0" <?php echo ("0" == $seoproml_logo_status) ? "selected" : ""; ?>><?php echo $text_disabled; ?></option>
										<option value="1" <?php echo ("1" == $seoproml_logo_status) ? "selected" : ""; ?>><?php echo $text_enabled; ?></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_logo; ?></label>
								<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon">
												<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
											</span>
											<a href="" id="thumb-logo-<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail">
												<img src="<?php echo $thumb[$language['language_id']]; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
											</a>
											<input type="hidden" name="seoproml_logo[<?php echo $language['language_id']; ?>]" value="<?php echo $seoproml_logo[$language['language_id']]; ?>" id="input-logo-<?php echo $language['language_id']; ?>" />
										</div><br>
									<?php } ?>
								</div>
							</div>
						</div>
						<div id="tab-license" class="tab-pane form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="seoproml_license">
									<span data-toggle="tooltip" title="<?php echo $help_license; ?>"><?php echo $entry_license; ?></span>
								</label>
								<div class="col-sm-10">
									<input type="text" name="seoproml_license" id="seoproml_license" value="<?php echo $seoproml_license; ?>" class="form-control"/>
									<br>
									<?php echo $text_copyright; ?>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>

<script type="text/javascript"><!--
$('#language-home a:first').tab('show');
//--></script>

<?php echo $footer; ?>