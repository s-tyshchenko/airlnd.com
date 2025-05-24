<?php echo $header; ?>
<div class="container">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
		<?php $i=0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
			<?php if($i < count($breadcrumbs)){ ?>
				<li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } else { ?>
				<li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
			<?php } ?>
		<?php } ?>
		</ol>
	</nav>
	
	<div class="forgotten-page">

		<div class="h2"><?php echo $heading_title; ?></div>
	
		<div class="forgotten-page_subtitle">
			Введіть адресу вашої електронної пошти. </br>
			Посилання на сторінку зміни пароля буде надіслано на поштову скриньку.
		</div>
	
		<form class="forgotten-page_form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
				<input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
			</div>
			  
			<div class="buttons clearfix">
				<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
			</div>
		</form>
	 </div>
</div>
<?php echo $footer; ?>