<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="row">
				<ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
			<br>
			<h1><i class="fa fa-truck"></i> <?php echo $heading_title; ?> v. <?php echo $v; ?></h1>
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" onclick="save();" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
					<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="caret"></span>
						<span class="sr-only"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right">
						<li><a onclick="save('exit');" style="cursor: pointer;"><i class="fa fa-sign-out fa-fw" aria-hidden="true"></i> <?php echo $button_save_and_exit; ?></a></li>
						<li><a onclick="settings('basic');" style="cursor: pointer;"><i class="fa fa-cloud-download fa-fw" aria-hidden="true"></i> <?php echo $button_download_basic_settings; ?></a></li>
						<li><a onclick="settings('import');" style="cursor: pointer;"><i class="fa fa-download fa-fw" aria-hidden="true"></i> <?php echo $button_import_settings; ?></a></li>
						<li><a onclick="settings('export');" style="cursor: pointer;"><i class="fa fa-upload fa-fw" aria-hidden="true"></i> <?php echo $button_export_settings; ?></a></li>
					</ul>
				</div>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-danger" role="button"><i class="fa fa-reply"></i></a>
			</div>
		</div>
	</div>
 	<div class="container-fluid">
 		<?php if ($success) { ?>
    	<div class="alert alert-success">
    		<i class="fa fa-check-circle"></i> <?php echo $success; ?>
      		<button type="button" class="close" data-dismiss="alert">&times;</button>
    	</div>
    	<?php } ?>
    	<?php if ($error_warning) { ?>
    	<div class="alert alert-danger">
    		<i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      		<button type="button" class="close" data-dismiss="alert">&times;</button>
    	</div>
    	<?php } ?>
    	<div class="panel panel-default">
      		<div class="panel-heading">
        		<h3 class="panel-title"><i class="fa fa-cog" aria-hidden="true"></i> <?php echo $text_settings; ?></h3>
				<select name="store_id" id="input-store_id" onchange="location.href = 'index.php?route=extension/shipping/novaposhta&token=<?php echo $token; ?>&store_id=' + this.value;" class="form-control" style="display: inline; width: auto;">
					<?php foreach ($stores as $store) { ?>
					<?php if ($store_id == $store['store_id'] ) { ?>
					<option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
					<?php } ?>
					<?php } ?>
				</select>
      		</div>
      		<div class="panel-body">
        		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-novaposhta" class="form-horizontal">
        			<ul class="nav nav-tabs">
        				<?php if ($license) { ?>
			  			<li<?php if ($license) { ?> class="active"<?php } ?>><a href="#tab-general" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_general; ?></a></li>
						<li><a href="#tab-tariffs" data-toggle="tab"><i class="fa fa-calculator"></i> <?php echo $tab_tariffs; ?></a></li>
			  			<li><a href="#tab-database" data-toggle="tab"><i class="fa fa-database"></i> <?php echo $tab_database; ?></a></li>
			  			<li><a href="#tab-sender" data-toggle="tab"><i class="fa fa-user" aria-hidden="true"></i> <?php echo $tab_sender; ?></a></li>
			  			<li><a href="#tab-recipient" data-toggle="tab"><i class="fa fa-users" aria-hidden="true"></i> <?php echo $tab_recipient; ?></a></li>
			  			<li><a href="#tab-departure" data-toggle="tab"><i class="fa fa-cube" aria-hidden="true"></i> <?php echo $tab_departure; ?></a></li>
			  			<li><a href="#tab-payment" data-toggle="tab"><i class="fa fa-money" aria-hidden="true"></i> <?php echo $tab_payment; ?></a></li>
						<li><a href="#tab-consignment_note" data-toggle="tab"><i class="fa fa-file-text-o" aria-hidden="true"></i> <?php echo $tab_consignment_note; ?></a></li>
			  			<li><a href="#tab-cron" data-toggle="tab"><i class="fa fa-tasks"></i> <?php echo $tab_cron; ?></a></li>
		  				<?php } ?>
					</ul>
					<div class="tab-content">
						<?php if ($license) { ?>
						<div class="tab-pane fade<?php if ($license) { ?>in active<?php } ?>" id="tab-general">
							<div class="col-sm-2">
								<ul class="nav nav-pills nav-stacked">
									<li class="active"><a href="#tab-global" data-toggle="pill"><?php echo $text_global; ?></a></li>
						  			<li><a href="#tab-department" data-toggle="pill"><?php echo $text_department; ?></a></li>
						  			<li><a href="#tab-doors" data-toggle="pill"><?php echo $text_doors; ?></a></li>
									<li><a href="#tab-poshtomat" data-toggle="pill"><?php echo $text_poshtomat; ?></a></li>
								</ul>
							</div>
							<div class="col-sm-10">
								<div class="tab-content">
									<div class="tab-pane active" id="tab-global">
										<div class="form-group">
				      						<label class="col-sm-2 control-label" for="input-status"><span data-toggle="tooltip" title="<?php echo $help_status; ?>"><?php echo $entry_status; ?></span></label>
				      						<div class="col-sm-10">
												<input type="checkbox" name="novaposhta_status" id="input-status" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if ($novaposhta_status) { echo ' checked'; }?>>
				      						</div>
			            				</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-debugging_mode"><span data-toggle="tooltip" title="<?php echo $help_debugging_mode; ?>"><?php echo $entry_debugging_mode; ?></span></label>
											<div class="col-sm-10">
												<input type="checkbox" name="novaposhta[debugging_mode]" id="input-debugging_mode" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['debugging_mode'])) { echo ' checked'; }?>>
											</div>
										</div>
			            				<div class="form-group">
			            					<label class="col-sm-2 control-label" for="input-sort_order"><span data-toggle="tooltip" title="<?php echo $help_sort_order; ?>"><?php echo $entry_sort_order; ?></span></label>
			            					<div class="col-sm-10">
			              						<input type="text" name="novaposhta_sort_order" value="<?php echo $novaposhta_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort_order" class="form-control" />
			            					</div>
			            				</div>
			            				<div class="form-group required">
					            			<label class="col-sm-2 control-label" for="input-key_api"><span data-toggle="tooltip" title="<?php echo $help_key_api; ?>"><?php echo $entry_key_api; ?></span></label>
					            			<div class="col-sm-10">
					              				<input type="text" name="novaposhta[key_api]" value="<?php echo $novaposhta['key_api']; ?>" placeholder="<?php echo $entry_key_api; ?>" id="input-key_api" class="form-control" />
												<?php if ($error_key_api) { ?>
												<div class="text-danger"><?php echo $error_key_api; ?></div>
												<?php } ?>
					            			</div>
					          			</div>
			            				<div class="form-group">
					          				<label class="col-sm-2 control-label" for="input-image"><span data-toggle="tooltip" title="<?php echo $help_image; ?>"><?php echo $entry_image; ?></span></label>
					          				<div class="col-sm-4">
					          					<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
					          					<input type="hidden" name="novaposhta[image]" value="<?php echo $novaposhta['image']; ?>" id="input-image" />
					          				</div>
					          				<label class="col-sm-2 control-label" for="input-image_output_place"><span data-toggle="tooltip" title="<?php echo $help_image_output_place; ?>"><?php echo $entry_image_output_place; ?></span></label>
					          				<div class="col-sm-4">
					          					<select name="novaposhta[image_output_place]" id="input-image_output_place" class="form-control">
					          						<option value="0"><?php echo $text_select; ?></option>
			                						<?php foreach ($image_output_places as $code => $name) { ?>
			                							<?php if ($code == $novaposhta['image_output_place']) { ?>
			                								<option value="<?php echo $code; ?>" selected="selected"><?php echo $name; ?></option>
			                							<?php } else { ?>
			                								<option value="<?php echo $code; ?>"><?php echo $name; ?></option>
			               								<?php } ?>
			                						<?php } ?>
			              						</select>
					          				</div>
					          			</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-curl_connecttimeout"><span data-toggle="tooltip" title="<?php echo $help_curl_connecttimeout; ?>"><?php echo $entry_curl_connecttimeout; ?></span></label>
											<div class="col-sm-4">
												<input type="text" name="novaposhta[curl_connecttimeout]" value="<?php echo $novaposhta['curl_connecttimeout']; ?>" placeholder="<?php echo $entry_curl_connecttimeout; ?>" id="input-curl_connecttimeout" class="form-control" />
											</div>
											<label class="col-sm-2 control-label" for="input-curl_timeout"><span data-toggle="tooltip" title="<?php echo $help_curl_timeout; ?>"><?php echo $entry_curl_timeout; ?></span></label>
											<div class="col-sm-4">
												<input type="text" name="novaposhta[curl_timeout]" value="<?php echo $novaposhta['curl_timeout']; ?>" placeholder="<?php echo $entry_curl_timeout; ?>" id="input-curl_timeout" class="form-control" />
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab-department">
										<div class="form-group">
			            					<label class="col-sm-2 control-label" for="input-department_status"><span data-toggle="tooltip" title="<?php echo $help_method_status; ?>"><?php echo $entry_method_status; ?></span></label>
			            					<div class="col-sm-10">
												<input type="checkbox" name="novaposhta[shipping_methods][department][status]" id="input-department_status" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['department']['status'])) { echo ' checked'; }?>>
				      						</div>
			            				</div>
										<div class="form-group">
								            <label class="col-sm-2 control-label" for="input-department_name"><span data-toggle="tooltip" title="<?php echo $help_name; ?>"><?php echo $entry_name; ?></span></label>
								            <div class="col-sm-10">
								            	<ul class="nav nav-tabs" role="tablist">
								            		<?php foreach ($languages as $language) { ?>
								            			<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#department_name_<?php echo $language['language_id']; ?>" aria-controls="department_name_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']]; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								            		<?php } ?>	
								            	 </ul>
								            	<div class="tab-content">
									            	<?php foreach ($languages as $language) { ?>
									    				<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="department_name_<?php echo $language['language_id']; ?>">	
									              			<input type="text" name="novaposhta[shipping_methods][department][name][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['shipping_methods']['department']['name'][$language['language_id']]; ?>" placeholder="<?php echo $entry_name; ?>" id="input-department_name_<?php echo $language['language_id']; ?>" class="form-control" />
									              		</div>
									              	<?php } ?>
								            	</div>
								        	</div>
								        </div>
			          					<div class="form-group">
			           						<label class="col-sm-2 control-label" for="input-department_geo_zone_id"><span data-toggle="tooltip" title="<?php echo $help_geo_zone; ?>"><?php echo $entry_geo_zone; ?></span></label>
			            					<div class="col-sm-10">
			              						<select name="novaposhta[shipping_methods][department][geo_zone_id]" id="input-department_geo_zone_id" class="form-control">
			                						<option value="0"><?php echo $text_all_zones; ?></option>
			               							<?php foreach ($geo_zones as $geo_zone) { ?>
			               								<?php if ($geo_zone['geo_zone_id'] == $novaposhta['shipping_methods']['department']['geo_zone_id']) { ?>
			               									<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
			                							<?php } else { ?>
			                								<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
			                							<?php } ?>
			               							<?php } ?>
			              						</select>
			            					</div>
			            				</div>
			            				<div class="form-group">	
			            					<label class="col-sm-2 control-label" for="input-department_tax_class_id"><span data-toggle="tooltip" title="<?php echo $help_tax_class; ?>"><?php echo $entry_tax_class; ?></span></label>
			            					<div class="col-sm-10">
			              						<select name="novaposhta[shipping_methods][department][tax_class_id]" id="input-department_tax_class_id" class="form-control">
			                						<option value="0"><?php echo $text_none; ?></option>
			                						<?php foreach ($tax_classes as $tax_class) { ?>
			                							<?php if ($tax_class['tax_class_id'] == $novaposhta['shipping_methods']['department']['tax_class_id']) { ?>
			                								<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
			                							<?php } else { ?>
			                								<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
			               								<?php } ?>
			                						<?php } ?>
			              						</select>
			            					</div>
			          					</div>
			          					<div class="form-group">
			          						<label class="col-sm-2 control-label" for="input-department_minimum_order_amount"><span data-toggle="tooltip" title="<?php echo $help_minimum_order_amount; ?>"><?php echo $entry_minimum_order_amount; ?></span></label>
			            					<div class="col-sm-4">
												<div class="input-group">
													<input type="text" name="novaposhta[shipping_methods][department][minimum_order_amount]" value="<?php echo $novaposhta['shipping_methods']['department']['minimum_order_amount']; ?>" placeholder="<?php echo $entry_minimum_order_amount; ?>" id="input-department_minimum_order_amount" class="form-control" />
													<span class="input-group-addon"><?php echo $text_grn; ?></span>
												</div>
			            					</div>
			            					<label class="col-sm-2 control-label" for="input-department_maximum_order_amount"><span data-toggle="tooltip" title="<?php echo $help_maximum_order_amount; ?>"><?php echo $entry_maximum_order_amount; ?></span></label>
			            					<div class="col-sm-4">
												<div class="input-group">
			              							<input type="text" name="novaposhta[shipping_methods][department][maximum_order_amount]" value="<?php echo $novaposhta['shipping_methods']['department']['maximum_order_amount']; ?>" placeholder="<?php echo $entry_maximum_order_amount; ?>" id="input-department_maximum_order_amount" class="form-control" />
													<span class="input-group-addon"><?php echo $text_grn; ?></span>
												</div>
			            					</div>
			                    		</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-department_free_shipping"><span data-toggle="tooltip" title="<?php echo $help_free_shipping; ?>"><?php echo $entry_free_shipping; ?></span></label>
											<div class="col-sm-4">
												<div class="input-group">
													<input type="text" name="novaposhta[shipping_methods][department][free_shipping]" value="<?php echo $novaposhta['shipping_methods']['department']['free_shipping']; ?>" placeholder="<?php echo $entry_free_shipping; ?>" id="input-department_free_shipping" class="form-control" />
													<span class="input-group-addon"><?php echo $text_grn; ?></span>
												</div>
											</div>
											<label class="col-sm-2 control-label" for="input-department_free_cost_text"><span data-toggle="tooltip" title="<?php echo $help_free_cost_text; ?>"><?php echo $entry_free_cost_text; ?></span></label>
											<div class="col-sm-4">
												<ul class="nav nav-tabs" role="tablist">
													<?php foreach ($languages as $language) { ?>
													<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#department_free_cost_text_<?php echo $language['language_id']; ?>" aria-controls="department_free_cost_text_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']]; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
													<?php } ?>
												</ul>
												<div class="tab-content">
													<?php foreach ($languages as $language) { ?>
													<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="department_free_cost_text_<?php echo $language['language_id']; ?>">
														<input type="text" name="novaposhta[shipping_methods][department][free_cost_text][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['shipping_methods']['department']['free_cost_text'][$language['language_id']]; ?>" placeholder="<?php echo $entry_free_cost_text; ?>" id="input-department_free_cost_text_<?php echo $language['language_id']; ?>" class="form-control" />
													</div>
													<?php } ?>
												</div>
											</div>
										</div>
			          					<div class="form-group">
			                    			<label class="col-sm-2 control-label" for="input-department_cost"><span data-toggle="tooltip" title="<?php echo $help_cost; ?>"><?php echo $entry_cost; ?></span></label>
			                    			<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][department][cost]" id="input-department_cost" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['department']['cost'])) { echo ' checked'; }?>>
				      						</div>
			                    			<label class="col-sm-2 control-label" for="input-department_api_calculation"><span data-toggle="tooltip" title="<?php echo $help_api_calculation; ?>"><?php echo $entry_api_calculation; ?></span></label>
			                    			<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][department][api_calculation]" id="input-department_api_calculation" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['department']['api_calculation'])) { echo ' checked'; }?>>
											</div>
			                    			<label class="col-sm-2 control-label" for="input-department_tariff_calculation"><span data-toggle="tooltip" title="<?php echo $help_tariff_calculation; ?>"><?php echo $entry_tariff_calculation; ?></span></label>
			                    			<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][department][tariff_calculation]" id="input-department_tariff_calculation" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['department']['tariff_calculation'])) { echo ' checked'; }?>>
				      						</div>
			                    		</div>
			                    		<div class="form-group">
			                    			<label class="col-sm-2 control-label" for="input-department_delivery_period"><span data-toggle="tooltip" title="<?php echo $help_delivery_period; ?>"><?php echo $entry_delivery_period; ?></span></label>
			                    			<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][department][delivery_period]" id="input-department_delivery_period" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['department']['delivery_period'])) { echo ' checked'; }?>>
				      						</div>
			                  			</div>
			                  			<div class="form-group">	
			                    			<label class="col-sm-2 control-label" for="input-departments_filter_weight"><span data-toggle="tooltip" title="<?php echo $help_departments_filter_weight; ?>"><?php echo $entry_departments_filter_weight; ?></span></label>
			                    			<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][department][departments_filter_weight]" id="input-departments_filter_weight" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['department']['departments_filter_weight'])) { echo ' checked'; }?>>
				      						</div>
			                  			</div>
			            				<div class="form-group">
			            					<label class="col-sm-2 control-label" for="input-department_types"><span data-toggle="tooltip" title="<?php echo $help_department_types; ?>"><?php echo $entry_department_types; ?></span></label>
			            					<div class="col-sm-10">
											<?php if (is_array($department_types)) { ?>
												<select name="novaposhta[shipping_methods][department][department_types][]" id="input-department_types" class="form-control selectpicker" title="<?php echo $text_all; ?>" data-actions-box="true" multiple>
												<?php foreach ($department_types as $department_type) { ?>
													<?php if (isset($novaposhta['shipping_methods']['department']['department_types']) && is_array($novaposhta['shipping_methods']['department']['department_types']) && in_array($department_type['Ref'], $novaposhta['shipping_methods']['department']['department_types'])) { ?>
													<option value="<?php echo $department_type['Ref']; ?>" selected><?php echo $department_type['Description']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $department_type['Ref']; ?>"><?php echo $department_type['Description']; ?></option>
													<?php } ?>
												<?php } ?>
												</select>
											<?php } ?>
			            					</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-department_statuses"><span data-toggle="tooltip" title="<?php echo $help_department_statuses; ?>"><?php echo $entry_department_statuses; ?></span></label>
											<div class="col-sm-10">
												<?php if (is_array($department_statuses)) { ?>
												<select name="novaposhta[shipping_methods][department][department_statuses][]" id="input-department_statuses" class="form-control selectpicker" title="<?php echo $text_all; ?>" multiple data-actions-box="true">
													<?php foreach ($department_statuses as $v) { ?>
													<?php if (isset($novaposhta['shipping_methods']['department']['department_statuses']) && is_array($novaposhta['shipping_methods']['department']['department_statuses']) && in_array($v['id'], $novaposhta['shipping_methods']['department']['department_statuses'])) { ?>
													<option value="<?php echo $v['id']; ?>" selected><?php echo $v['Description']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $v['id']; ?>"><?php echo $v['Description']; ?></option>
													<?php } ?>
													<?php } ?>
												</select>
												<?php } ?>
											</div>
			            				</div>
		            				</div>
		            				<div class="tab-pane" id="tab-doors">
										<div class="form-group">
			            					<label class="col-sm-2 control-label" for="input-doors_status"><span data-toggle="tooltip" title="<?php echo $help_method_status; ?>"><?php echo $entry_method_status; ?></span></label>
			            					<div class="col-sm-4">
												<input type="checkbox" name="novaposhta[shipping_methods][doors][status]" id="input-doors_status" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['doors']['status'])) { echo ' checked'; }?>>
				      						</div>
			            				</div>
										<div class="form-group">
								            <label class="col-sm-2 control-label" for="input-doors_name"><span data-toggle="tooltip" title="<?php echo $help_name; ?>"><?php echo $entry_name; ?></span></label>
								            <div class="col-sm-10">
								            	<ul class="nav nav-tabs" role="tablist">
								            		<?php foreach ($languages as $language) { ?>
								            			<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#doors_name_<?php echo $language['language_id']; ?>" aria-controls="doors_name_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']]; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								            		<?php } ?>	
								            	 </ul>
								            	<div class="tab-content">
									            	<?php foreach ($languages as $language) { ?>
									    				<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="doors_name_<?php echo $language['language_id']; ?>">	
									              			<input type="text" name="novaposhta[shipping_methods][doors][name][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['shipping_methods']['doors']['name'][$language['language_id']]; ?>" placeholder="<?php echo $entry_name; ?>" id="input-doors_name_<?php echo $language['language_id']; ?>" class="form-control" />
									              		</div>
									              	<?php } ?>
								            	</div>
								        	</div>
								        </div>
			          					<div class="form-group">
			           						<label class="col-sm-2 control-label" for="input-doors_geo_zone_id"><span data-toggle="tooltip" title="<?php echo $help_geo_zone; ?>"><?php echo $entry_geo_zone; ?></span></label>
			            					<div class="col-sm-10">
			              						<select name="novaposhta[shipping_methods][doors][geo_zone_id]" id="input-doors_geo_zone_id" class="form-control">
			                						<option value="0"><?php echo $text_all_zones; ?></option>
			               							<?php foreach ($geo_zones as $geo_zone) { ?>
			               								<?php if ($geo_zone['geo_zone_id'] == $novaposhta['shipping_methods']['doors']['geo_zone_id']) { ?>
			               									<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
			                							<?php } else { ?>
			                								<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
			                							<?php } ?>
			               							<?php } ?>
			              						</select>
			            					</div>
			            				</div>
			            				<div class="form-group">	
			            					<label class="col-sm-2 control-label" for="input-doors_tax_class_id"><span data-toggle="tooltip" title="<?php echo $help_tax_class; ?>"><?php echo $entry_tax_class; ?></span></label>
			            					<div class="col-sm-10">
			              						<select name="novaposhta[shipping_methods][doors][tax_class_id]" id="input-doors_tax_class_id" class="form-control">
			                						<option value="0"><?php echo $text_none; ?></option>
			                						<?php foreach ($tax_classes as $tax_class) { ?>
			                							<?php if ($tax_class['tax_class_id'] == $novaposhta['shipping_methods']['doors']['tax_class_id']) { ?>
			                								<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
			                							<?php } else { ?>
			                								<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
			               								<?php } ?>
			                						<?php } ?>
			              						</select>
			            					</div>
			          					</div>
			          					<div class="form-group">
			          						<label class="col-sm-2 control-label" for="input-doors_minimum_order_amount"><span data-toggle="tooltip" title="<?php echo $help_minimum_order_amount; ?>"><?php echo $entry_minimum_order_amount; ?></span></label>
			            					<div class="col-sm-4">
												<div class="input-group">
			              							<input type="text" name="novaposhta[shipping_methods][doors][minimum_order_amount]" value="<?php echo $novaposhta['shipping_methods']['doors']['minimum_order_amount']; ?>" placeholder="<?php echo $entry_minimum_order_amount; ?>" id="input-doors_minimum_order_amount" class="form-control" />
													<span class="input-group-addon"><?php echo $text_grn; ?></span>
												</div>
			            					</div>
			            					<label class="col-sm-2 control-label" for="input-doors_maximum_order_amount"><span data-toggle="tooltip" title="<?php echo $help_maximum_order_amount; ?>"><?php echo $entry_maximum_order_amount; ?></span></label>
			            					<div class="col-sm-4">
												<div class="input-group">
			              							<input type="text" name="novaposhta[shipping_methods][doors][maximum_order_amount]" value="<?php echo $novaposhta['shipping_methods']['doors']['maximum_order_amount']; ?>" placeholder="<?php echo $entry_maximum_order_amount; ?>" id="input-doors_maximum_order_amount" class="form-control" />
													<span class="input-group-addon"><?php echo $text_grn; ?></span>
												</div>
			            					</div>
			                    		</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-doors_free_shipping"><span data-toggle="tooltip" title="<?php echo $help_free_shipping; ?>"><?php echo $entry_free_shipping; ?></span></label>
											<div class="col-sm-4">
												<div class="input-group">
													<input type="text" name="novaposhta[shipping_methods][doors][free_shipping]" value="<?php echo $novaposhta['shipping_methods']['doors']['free_shipping']; ?>" placeholder="<?php echo $entry_free_shipping; ?>" id="input-doors_free_shipping" class="form-control" />
													<span class="input-group-addon"><?php echo $text_grn; ?></span>
												</div>
											</div>
											<label class="col-sm-2 control-label" for="input-doors_free_cost_text"><span data-toggle="tooltip" title="<?php echo $help_free_cost_text; ?>"><?php echo $entry_free_cost_text; ?></span></label>
											<div class="col-sm-4">
												<ul class="nav nav-tabs" role="tablist">
													<?php foreach ($languages as $language) { ?>
													<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#doors_free_cost_text_<?php echo $language['language_id']; ?>" aria-controls="doors_free_cost_text_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']]; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
													<?php } ?>
												</ul>
												<div class="tab-content">
													<?php foreach ($languages as $language) { ?>
													<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="doors_free_cost_text_<?php echo $language['language_id']; ?>">
														<input type="text" name="novaposhta[shipping_methods][doors][free_cost_text][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['shipping_methods']['doors']['free_cost_text'][$language['language_id']]; ?>" placeholder="<?php echo $entry_free_cost_text; ?>" id="input-doors_free_cost_text_<?php echo $language['language_id']; ?>" class="form-control" />
													</div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-doors_cost"><span data-toggle="tooltip" title="<?php echo $help_cost; ?>"><?php echo $entry_cost; ?></span></label>
											<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][doors][cost]" id="input-doors_cost" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['doors']['cost'])) { echo ' checked'; }?>>
											</div>
											<label class="col-sm-2 control-label" for="input-doors_api_calculation"><span data-toggle="tooltip" title="<?php echo $help_api_calculation; ?>"><?php echo $entry_api_calculation; ?></span></label>
											<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][doors][api_calculation]" id="input-doors_api_calculation" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['doors']['api_calculation'])) { echo ' checked'; }?>>
											</div>
											<label class="col-sm-2 control-label" for="input-doors_tariff_calculation"><span data-toggle="tooltip" title="<?php echo $help_tariff_calculation; ?>"><?php echo $entry_tariff_calculation; ?></span></label>
											<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][doors][tariff_calculation]" id="input-doors_tariff_calculation" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['doors']['tariff_calculation'])) { echo ' checked'; }?>>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-doors_delivery_period"><span data-toggle="tooltip" title="<?php echo $help_delivery_period; ?>"><?php echo $entry_delivery_period; ?></span></label>
											<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][doors][delivery_period]" id="input-doors_delivery_period" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['doors']['delivery_period'])) { echo ' checked'; }?>>
											</div>
										</div>
		            				</div>
									<div class="tab-pane" id="tab-poshtomat">
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-poshtomat_status"><span data-toggle="tooltip" title="<?php echo $help_method_status; ?>"><?php echo $entry_method_status; ?></span></label>
											<div class="col-sm-4">
												<input type="checkbox" name="novaposhta[shipping_methods][poshtomat][status]" id="input-poshtomat_status" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['poshtomat']['status'])) { echo ' checked'; }?>>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-poshtomat_name"><span data-toggle="tooltip" title="<?php echo $help_name; ?>"><?php echo $entry_name; ?></span></label>
											<div class="col-sm-10">
												<ul class="nav nav-tabs" role="tablist">
													<?php foreach ($languages as $language) { ?>
													<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#poshtomat_name_<?php echo $language['language_id']; ?>" aria-controls="poshtomat_name_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']]; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
													<?php } ?>
												</ul>
												<div class="tab-content">
													<?php foreach ($languages as $language) { ?>
													<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="poshtomat_name_<?php echo $language['language_id']; ?>">
														<input type="text" name="novaposhta[shipping_methods][poshtomat][name][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['shipping_methods']['poshtomat']['name'][$language['language_id']]; ?>" placeholder="<?php echo $entry_name; ?>" id="input-poshtomat_name_<?php echo $language['language_id']; ?>" class="form-control" />
													</div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-poshtomat_geo_zone_id"><span data-toggle="tooltip" title="<?php echo $help_geo_zone; ?>"><?php echo $entry_geo_zone; ?></span></label>
											<div class="col-sm-10">
												<select name="novaposhta[shipping_methods][poshtomat][geo_zone_id]" id="input-poshtomat_geo_zone_id" class="form-control">
													<option value="0"><?php echo $text_all_zones; ?></option>
													<?php foreach ($geo_zones as $geo_zone) { ?>
													<?php if ($geo_zone['geo_zone_id'] == $novaposhta['shipping_methods']['poshtomat']['geo_zone_id']) { ?>
													<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
													<?php } ?>
													<?php } ?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-poshtomat_tax_class_id"><span data-toggle="tooltip" title="<?php echo $help_tax_class; ?>"><?php echo $entry_tax_class; ?></span></label>
											<div class="col-sm-10">
												<select name="novaposhta[shipping_methods][poshtomat][tax_class_id]" id="input-poshtomat_tax_class_id" class="form-control">
													<option value="0"><?php echo $text_none; ?></option>
													<?php foreach ($tax_classes as $tax_class) { ?>
													<?php if ($tax_class['tax_class_id'] == $novaposhta['shipping_methods']['poshtomat']['tax_class_id']) { ?>
													<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
													<?php } ?>
													<?php } ?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-poshtomat_minimum_order_amount"><span data-toggle="tooltip" title="<?php echo $help_minimum_order_amount; ?>"><?php echo $entry_minimum_order_amount; ?></span></label>
											<div class="col-sm-4">
												<div class="input-group">
													<input type="text" name="novaposhta[shipping_methods][poshtomat][minimum_order_amount]" value="<?php echo $novaposhta['shipping_methods']['poshtomat']['minimum_order_amount']; ?>" placeholder="<?php echo $entry_minimum_order_amount; ?>" id="input-poshtomat_minimum_order_amount" class="form-control" />
													<span class="input-group-addon"><?php echo $text_grn; ?></span>
												</div>
											</div>
											<label class="col-sm-2 control-label" for="input-poshtomat_maximum_order_amount"><span data-toggle="tooltip" title="<?php echo $help_maximum_order_amount; ?>"><?php echo $entry_maximum_order_amount; ?></span></label>
											<div class="col-sm-4">
												<div class="input-group">
													<input type="text" name="novaposhta[shipping_methods][poshtomat][maximum_order_amount]" value="<?php echo $novaposhta['shipping_methods']['poshtomat']['maximum_order_amount']; ?>" placeholder="<?php echo $entry_maximum_order_amount; ?>" id="input-poshtomat_maximum_order_amount" class="form-control" />
													<span class="input-group-addon"><?php echo $text_grn; ?></span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-poshtomat_free_shipping"><span data-toggle="tooltip" title="<?php echo $help_free_shipping; ?>"><?php echo $entry_free_shipping; ?></span></label>
											<div class="col-sm-4">
												<div class="input-group">
													<input type="text" name="novaposhta[shipping_methods][poshtomat][free_shipping]" value="<?php echo $novaposhta['shipping_methods']['poshtomat']['free_shipping']; ?>" placeholder="<?php echo $entry_free_shipping; ?>" id="input-poshtomat_free_shipping" class="form-control" />
													<span class="input-group-addon"><?php echo $text_grn; ?></span>
												</div>
											</div>
											<label class="col-sm-2 control-label" for="input-poshtomat_free_cost_text"><span data-toggle="tooltip" title="<?php echo $help_free_cost_text; ?>"><?php echo $entry_free_cost_text; ?></span></label>
											<div class="col-sm-4">
												<ul class="nav nav-tabs" role="tablist">
													<?php foreach ($languages as $language) { ?>
													<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#poshtomat_free_cost_text_<?php echo $language['language_id']; ?>" aria-controls="poshtomat_free_cost_text_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']]; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
													<?php } ?>
												</ul>
												<div class="tab-content">
													<?php foreach ($languages as $language) { ?>
													<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="poshtomat_free_cost_text_<?php echo $language['language_id']; ?>">
														<input type="text" name="novaposhta[shipping_methods][poshtomat][free_cost_text][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['shipping_methods']['poshtomat']['free_cost_text'][$language['language_id']]; ?>" placeholder="<?php echo $entry_free_cost_text; ?>" id="input-poshtomat_free_cost_text_<?php echo $language['language_id']; ?>" class="form-control" />
													</div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-poshtomat_cost"><span data-toggle="tooltip" title="<?php echo $help_cost; ?>"><?php echo $entry_cost; ?></span></label>
											<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][poshtomat][cost]" id="input-poshtomat_cost" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['poshtomat']['cost'])) { echo ' checked'; }?>>
											</div>
											<label class="col-sm-2 control-label" for="input-poshtomat_api_calculation"><span data-toggle="tooltip" title="<?php echo $help_api_calculation; ?>"><?php echo $entry_api_calculation; ?></span></label>
											<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][poshtomat][api_calculation]" id="input-poshtomat_api_calculation" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['poshtomat']['api_calculation'])) { echo ' checked'; }?>>
											</div>
											<label class="col-sm-2 control-label" for="input-poshtomat_tariff_calculation"><span data-toggle="tooltip" title="<?php echo $help_tariff_calculation; ?>"><?php echo $entry_tariff_calculation; ?></span></label>
											<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][poshtomat][tariff_calculation]" id="input-poshtomat_tariff_calculation" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['poshtomat']['tariff_calculation'])) { echo ' checked'; }?>>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-poshtomat_delivery_period"><span data-toggle="tooltip" title="<?php echo $help_delivery_period; ?>"><?php echo $entry_delivery_period; ?></span></label>
											<div class="col-sm-2">
												<input type="checkbox" name="novaposhta[shipping_methods][poshtomat][delivery_period]" id="input-poshtomat_delivery_period" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['shipping_methods']['poshtomat']['delivery_period'])) { echo ' checked'; }?>>
											</div>
										</div>
									</div>
								</div>
							</div>
                  		</div>
						<div class="tab-pane fade" id="tab-tariffs">
							<blockquote>
								<h2><?php echo $text_parcel_tariffs; ?></h2>
							</blockquote>
							<div class="table-responsive">
								<table class="table table-bordered table-hover" id="table-tariffs-parcel">
									<thead>
									<tr>
										<td class="text-center" rowspan="3"><?php echo $column_weight; ?></td>
										<td class="text-center" colspan="4"><?php echo $column_department_service_cost; ?></td>
										<td class="text-center" colspan="2"><?php echo $column_doors_service_cost; ?></td>
										<td class="text-center" rowspan="3"><?php echo $column_action; ?></td>
									</tr>
									<tr>
										<td class="text-center"><?php echo $column_tariff_transfer_in_department; ?></td>
										<td class="text-center"><?php echo $column_tariff_zone_city; ?></td>
										<td class="text-center"><?php echo $column_tariff_zone_region; ?></td>
										<td class="text-center"><?php echo $column_tariff_zone_ukraine; ?></td>
										<td class="text-center" rowspan="2"><?php echo $column_doors_pickup; ?></td>
										<td class="text-center" rowspan="2"><?php echo $column_doors_delivery; ?></td>
									</tr>
									<tr>
										<td class="text-center"><?php echo $column_delivery_period; ?> <input type="text" name="novaposhta[tariffs][parcel][department_delivery_period]" value="<?php echo $novaposhta['tariffs']['parcel']['department_delivery_period']; ?>" class="form-control" style="display: inline; width: auto;" /></td>
										<td class="text-center"><?php echo $column_delivery_period; ?> <input type="text" name="novaposhta[tariffs][parcel][city_delivery_period]" value="<?php echo $novaposhta['tariffs']['parcel']['city_delivery_period']; ?>" class="form-control" style="display: inline; width: auto;" /></td>
										<td class="text-center"><?php echo $column_delivery_period; ?> <input type="text" name="novaposhta[tariffs][parcel][region_delivery_period]" value="<?php echo $novaposhta['tariffs']['parcel']['region_delivery_period']; ?>" class="form-control" style="display: inline; width: auto;" /></td>
										<td class="text-center"><?php echo $column_delivery_period; ?> <input type="text" name="novaposhta[tariffs][parcel][ukraine_delivery_period]" value="<?php echo $novaposhta['tariffs']['parcel']['ukraine_delivery_period']; ?>" class="form-control" style="display: inline; width: auto;" /></td>
									</tr>
									</thead>
									<tbody>
									<?php if (isset($novaposhta['tariffs']['parcel']) && is_array($novaposhta['tariffs']['parcel'])) { ?>
									<?php foreach ($novaposhta['tariffs']['parcel'] as $k => $tariff) { ?>
									<?php if (is_array($tariff)) { ?>
									<tr>
										<td><input type="text" name="novaposhta[tariffs][parcel][<?php echo $k; ?>][weight]" value="<?php echo $tariff['weight']; ?>" class="form-control" /></td>
										<td><input type="text" name="novaposhta[tariffs][parcel][<?php echo $k; ?>][department]" value="<?php echo $tariff['department']; ?>" class="form-control" /></td>
										<td><input type="text" name="novaposhta[tariffs][parcel][<?php echo $k; ?>][city]" value="<?php echo $tariff['city']; ?>" class="form-control" /></td>
										<td><input type="text" name="novaposhta[tariffs][parcel][<?php echo $k; ?>][region]" value="<?php echo $tariff['region']; ?>" class="form-control" /></td>
										<td><input type="text" name="novaposhta[tariffs][parcel][<?php echo $k; ?>][Ukraine]" value="<?php echo $tariff['Ukraine']; ?>" class="form-control" /></td>
										<td><input type="text" name="novaposhta[tariffs][parcel][<?php echo $k; ?>][overpay_doors_pickup]" value="<?php echo $tariff['overpay_doors_pickup']; ?>" class="form-control" /></td>
										<td><input type="text" name="novaposhta[tariffs][parcel][<?php echo $k; ?>][overpay_doors_delivery]" value="<?php echo $tariff['overpay_doors_delivery']; ?>" class="form-control" /></td>
										<td class="text-center"><button type="button" onclick="$(this).parents('tr').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
									</tr>
									<?php } ?>
									<?php } ?>
									<?php } ?>
									</tbody>
									<tfoot>
									<tr>
										<td colspan="7"></td>
										<td class="text-center"><button type="button" onclick="addTariff('parcel');" data-toggle="modal" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
										</td>
									</tr>
									</tfoot>
								</table>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-tariffs-parcel_discount"><span data-toggle="tooltip" title="<?php echo $help_discount; ?>"><?php echo $entry_discount; ?></span></label>
								<div class="col-sm-10">
									<div class="input-group">
										<input type="text" name="novaposhta[tariffs][parcel][discount]" value="<?php echo $novaposhta['tariffs']['parcel']['discount']; ?>" placeholder="<?php echo $entry_discount; ?>" id="input-tariffs-parcel_discount" class="form-control" />
										<span class="input-group-addon"><?php echo $text_pct; ?></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-tariffs-parcel_declared_cost_commission"><span data-toggle="tooltip" title="<?php echo $help_declared_cost_commission; ?>"><?php echo $entry_declared_cost_commission; ?></span></label>
								<div class="col-sm-2">
									<div class="input-group">
										<input type="text" name="novaposhta[tariffs][parcel][declared_cost_commission]" value="<?php echo $novaposhta['tariffs']['parcel']['declared_cost_commission']; ?>" placeholder="<?php echo $entry_declared_cost_commission; ?>" id="input-tariffs-parcel_declared_cost_commission" class="form-control" />
										<span class="input-group-addon"><?php echo $text_pct; ?></span>
									</div>
								</div>
								<label class="col-sm-2 control-label" for="input-tariffs-parcel_declared_cost_minimum_commission"><span data-toggle="tooltip" title="<?php echo $help_declared_cost_minimum_commission; ?>"><?php echo $entry_declared_cost_minimum_commission; ?></span></label>
								<div class="col-sm-2">
									<div class="input-group">
										<input type="text" name="novaposhta[tariffs][parcel][declared_cost_minimum_commission]" value="<?php echo $novaposhta['tariffs']['parcel']['declared_cost_minimum_commission']; ?>" placeholder="<?php echo $entry_declared_cost_minimum_commission; ?>" id="input-tariffs-parcel_declared_cost_minimum_commission" class="form-control" />
										<span class="input-group-addon"><?php echo $text_grn; ?></span>
									</div>
								</div>
								<label class="col-sm-2 control-label" for="input-tariffs-parcel_declared_cost_commission_bottom"><span data-toggle="tooltip" title="<?php echo $help_declared_cost_commission_bottom; ?>"><?php echo $entry_declared_cost_commission_bottom; ?></span></label>
								<div class="col-sm-2">
									<div class="input-group">
										<input type="text" name="novaposhta[tariffs][parcel][declared_cost_commission_bottom]" value="<?php echo $novaposhta['tariffs']['parcel']['declared_cost_commission_bottom']; ?>" placeholder="<?php echo $entry_declared_cost_commission_bottom; ?>" id="input-tariffs-parcel_declared_cost_commission_bottom" class="form-control" />
										<span class="input-group-addon"><?php echo $text_grn; ?></span>
									</div>
								</div>
							</div>
							<hr>
							<br><br><br>
							<blockquote>
								<h2><?php echo $text_cod_tariffs; ?></h2>
							</blockquote>
							<div class="table-responsive" style="overflow-y:visible; overflow-x:visible;">
								<table class="table table-bordered table-hover" id="table-tariffs-cod">
									<thead>
									<tr>
										<td class="text-center"><?php echo $column_delivery_type; ?></td>
										<td class="text-center"><?php echo $column_calculation_base; ?></td>
										<td class="text-center"><?php echo $column_tariff_limit; ?></td>
										<td class="text-center"><?php echo $column_percent; ?></td>
										<td class="text-center"><?php echo $column_fixed_amount; ?></td>
										<td class="text-center"><?php echo $column_minimum_payment; ?></td>
										<td class="text-center"><?php echo $column_action; ?></td>
									</tr>
									</thead>
									<tbody>
									<?php if (isset($novaposhta['tariffs']['cod']) && is_array($novaposhta['tariffs']['cod'])) { ?>
									<?php foreach ($novaposhta['tariffs']['cod'] as $i => $tariff) { ?>
									<?php if (is_array($tariff)) { ?>
									<tr>
										<td>
											<select name="novaposhta[tariffs][cod][<?php echo $i; ?>][delivery_type]" class="form-control">
												<?php foreach ($delivery_types as $v) { ?>
												<?php if ($v['id'] == $tariff['delivery_type']) { ?>
												<option value="<?php echo $v['id']; ?>" selected><?php echo $v['Description']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $v['id']; ?>"><?php echo $v['Description']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</td>
										<td>
											<select name="novaposhta[tariffs][cod][<?php echo $i; ?>][calculation_base][]" class="form-control selectpicker" title="<?php echo $text_select; ?>" multiple data-actions-box="true">
												<?php foreach ($totals as $k => $v) { ?>
												<?php if (isset($tariff['calculation_base']) && is_array($tariff['calculation_base']) && in_array($k, $tariff['calculation_base'])) { ?>
												<option value="<?php echo $k; ?>" selected><?php echo $v; ?></option>
												<?php } else { ?>
												<option value="<?php echo $k; ?>"><?php echo $v; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</td>
										<td><input type="text" name="novaposhta[tariffs][cod][<?php echo $i; ?>][tariff_limit]" value="<?php echo $tariff['tariff_limit']; ?>" class="form-control" /></td>
										<td><input type="text" name="novaposhta[tariffs][cod][<?php echo $i; ?>][percent]" value="<?php echo $tariff['percent']; ?>" class="form-control" /></td>
										<td><input type="text" name="novaposhta[tariffs][cod][<?php echo $i; ?>][fixed_amount]" value="<?php echo $tariff['fixed_amount']; ?>" class="form-control" /></td>
										<td><input type="text" name="novaposhta[tariffs][cod][<?php echo $i; ?>][minimum_payment]" value="<?php echo $tariff['minimum_payment']; ?>" class="form-control" /></td>
										<td class="text-center"><button type="button" onclick="$(this).parents('tr').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
									</tr>
									<?php } ?>
									<?php } ?>
									<?php } ?>
									</tbody>
									<tfoot>
									<tr>
										<td colspan="6"></td>
										<td class="text-center"><button type="button" onclick="addTariff('cod');" data-toggle="modal" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
										</td>
									</tr>
									</tfoot>
								</table>
							</div>
						</div>
          				<div class="tab-pane fade" id="tab-database">
          					<div class="table-responsive">
            					<table class="table table-bordered table-hover">
              						<thead>
                						<tr>
                  							<td class="text-center"><?php echo $column_type; ?></td>
                  							<td class="text-center"><?php echo $column_date; ?></td>
                  							<td class="text-center"><?php echo $column_amount; ?></td>
                  							<td class="text-center"><?php echo $column_description; ?></td>
                  							<td class="text-center"><?php echo $column_action; ?></td>
                						</tr>
              						</thead>
              						<tbody>
										<tr>
											<td class="text-left"><?php echo $entry_references; ?></td>
											<td class="text-center"><?php if (!empty($database['references']['update_datetime'])) { echo $database['references']['update_datetime']; } ?></td>
											<td class="text-center" id="td-references_amount"><?php if (!empty($database['references']['amount'])) { echo $database['references']['amount']; } ?></td>
											<td class="text-left"><?php echo $help_update_references; ?></td>
											<td class="text-center">
												<a onclick="update('references');" id="button-update_references" data-toggle="tooltip" title="" class="btn btn-success" data-original-title="<?php echo $button_update; ?>"><i class="fa fa-refresh"></i></a>
											</td>
										</tr>
                						<tr>
                  							<td class="text-left"><?php echo $entry_region; ?></td>
                  							<td class="text-center"><?php if (!empty($database['regions']['update_datetime'])) { echo $database['regions']['update_datetime']; } ?></td>
                  							<td class="text-center" id="td-regions_amount"><?php if (!empty($database['regions']['amount'])) { echo $database['regions']['amount']; } ?></td>
                  							<td class="text-left"><?php echo $help_update_regions; ?></td>
                  							<td class="text-center">
                  								<a onclick="update('regions');" id="button-update_regions" data-toggle="tooltip" title="" class="btn btn-success" data-original-title="<?php echo $button_update; ?>"><i class="fa fa-refresh"></i></a>
                  							</td>
               			 				</tr>
               			 				<tr>
                  							<td class="text-left"><?php echo $entry_city; ?></td>
                  							<td class="text-center"><?php if (!empty($database['cities']['update_datetime'])) { echo $database['cities']['update_datetime']; } ?></td>
                  							<td class="text-center" id="td-cities_amount"><?php if (!empty($database['cities']['amount'])) { echo $database['cities']['amount']; } ?></td>
                  							<td class="text-left"><?php echo $help_update_cities; ?></td>
                  							<td class="text-center">
                  								<a onclick="update('cities');" id="button-update_cities" data-toggle="tooltip" title="" class="btn btn-success" data-original-title="<?php echo $button_update; ?>"><i class="fa fa-refresh"></i></a>
                  							</td>
               			 				</tr>
               			 				<tr>
                  							<td class="text-left"><?php echo $entry_department; ?></td>
                  							<td class="text-center"><?php if (!empty($database['departments']['update_datetime'])) { echo $database['departments']['update_datetime']; } ?></td>
                  							<td class="text-center" id="td-departments_amount"><?php if (!empty($database['departments']['amount'])) { echo $database['departments']['amount']; } ?></td>
                  							<td class="text-left"><?php echo $help_update_departments; ?></td>
                  							<td class="text-center">
                  								<a onclick="update('departments');" id="button-update_departments" data-toggle="tooltip" title="" class="btn btn-success" data-original-title="<?php echo $button_update; ?>"><i class="fa fa-refresh"></i></a>
                  							</td>
               			 				</tr>
										<tr>
											<td class="text-left"><?php echo $entry_settlement; ?></td>
											<td class="text-center"><span class="label label-success">online</span></td>
											<td class="text-center" id="td-settlements_amount"></td>
											<td class="text-left"><?php echo $help_update_settlements; ?></td>
											<td class="text-center">
												<input type="checkbox" name="novaposhta[settlements]" id="button-update_settlements" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-size="mini" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['settlements'])) { echo ' checked'; }?>>
											</td>
										</tr>
										<tr>
											<td class="text-left"><?php echo $entry_street; ?></td>
											<td class="text-center"><span class="label label-success">online</span></td>
											<td class="text-center" id="td-streets_amount"></td>
											<td class="text-left"><?php echo $help_update_streets; ?></td>
											<td class="text-center">
												<input type="checkbox" name="novaposhta[streets]" id="button-update_streets" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-size="mini" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['streets'])) { echo ' checked'; }?>>
											</td>
										</tr>
              						</tbody>
            					</table>
          					</div>
          				</div>
          				<div class="tab-pane fade" id="tab-sender">
          					<div class="form-group">
          						<label class="col-sm-2 control-label" for="input-sender"><span data-toggle="tooltip" title="<?php echo $help_sender; ?>"><?php echo $entry_sender; ?></span></label>
            					<div class="col-sm-10">
              						<select name="novaposhta[sender]" id="input-sender" class="form-control selectpicker show-tick" data-live-search="true">
										<option value="0"><?php echo $text_select; ?></option>
										<?php if (is_array($senders)) { ?>
                							<?php foreach ($senders as $v) { ?>
                								<?php if ($v['Ref'] == $novaposhta['sender']) { ?>
                						<option value="<?php echo $v['Ref']; ?>" selected="selected"><?php echo $v['Description']; ?><?php echo ($v['CityDescription']) ? ', ' . $v['CityDescription'] : ''; ?></option>
                								<?php } else { ?>
                						<option value="<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?><?php echo ($v['CityDescription']) ? ', ' . $v['CityDescription'] : ''; ?></option>
               									<?php } ?>
                							<?php } ?>
										<?php } ?>
              						</select>
            					</div>
          					</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-sender_contact_person"><span data-toggle="tooltip" title="<?php echo $help_sender_contact_person; ?>"><?php echo $entry_contact_person; ?></span></label>
            					<div class="col-sm-10">
              						<select name="novaposhta[sender_contact_person]" id="input-sender_contact_person" class="form-control selectpicker show-tick" data-live-search="true">
										<option value="0"><?php echo $text_select; ?></option>
                						<?php foreach ($sender_contact_persons as $v) { ?>
                							<?php if ($v['Ref'] == $novaposhta['sender_contact_person']) { ?>
                						<option value="<?php echo $v['Ref']; ?>" selected="selected"><?php echo $v['Description'] . ', ' . $v['Phones']; ?></option>
                							<?php } else { ?>
                						<option value="<?php echo $v['Ref']; ?>"><?php echo $v['Description'] . ', ' . $v['Phones']; ?></option>
               								<?php } ?>
                						<?php } ?>
              						</select>
              					</div>
              				</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-sender_region"><span data-toggle="tooltip" title="<?php echo $help_sender_region; ?>"><?php echo $entry_region; ?></span></label>
								<div class="col-sm-10">
									<select name="novaposhta[sender_region]" id="input-sender_region" class="form-control selectpicker show-tick" data-live-search="true">
										<option value=""><?php echo $text_select; ?></option>
										<?php foreach ($regions as $v) { ?>
										<?php if ($v['Ref'] == $novaposhta['sender_region']) { ?>
										<option value="<?php echo $v['Ref']; ?>" selected="selected"><?php echo $v['Description']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-sender_city"><span data-toggle="tooltip" title="<?php echo $help_sender_city; ?>"><?php echo $entry_city; ?></span></label>
								<div class="col-sm-10">
									<select name="novaposhta[sender_city]" id="input-sender_city" class="form-control selectpicker show-tick" data-live-search="true"></select>
								</div>
							</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-sender_department"><span data-toggle="tooltip" title="<?php echo $help_sender_department; ?>"><?php echo $entry_department; ?></span></label>
            					<div class="col-sm-10">
									<select name="novaposhta[sender_department]" id="input-sender_department" class="form-control selectpicker show-tick" data-live-search="true"></select>
              					</div>
              				</div>
							<div class="form-group" style="display: none;">
								<label class="col-sm-2 control-label" for="input-sender_address"><span data-toggle="tooltip" title="<?php echo $help_sender_address; ?>"><?php echo $entry_address; ?></span></label>
								<div class="col-sm-10">
									<select name="novaposhta[sender_address]" id="input-sender_address" class="form-control selectpicker show-tick" data-live-search="true"></select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-sender_address_pick_up"><span data-toggle="tooltip" title="<?php echo $help_sender_address_pick_up; ?>"><?php echo $entry_address_pick_up; ?></span></label>
								<div class="col-sm-10">
									<input type="checkbox" name="novaposhta[sender_address_pick_up]" id="input-sender_address_pick_up" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['sender_address_pick_up'])) { echo ' checked'; }?>>
									<input type="hidden" name="novaposhta[sender_address_type]" value="<?php echo $novaposhta['sender_address_type']; ?>" id="input-sender_address_type"/>
								</div>
							</div>
          				</div>
          				<div class="tab-pane fade" id="tab-recipient">
          					<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_name"><span data-toggle="tooltip" title="<?php echo $help_recipient; ?>"><?php echo $entry_recipient; ?></span></label>
            					<div class="col-sm-10">
              						<input type="text" name="novaposhta[recipient_name]" value="<?php echo $novaposhta['recipient_name']; ?>" placeholder="<?php echo $text_select; ?>" id="input-recipient_name" class="form-control" />
              						<input type="hidden" name="novaposhta[recipient]" value="<?php echo $novaposhta['recipient']; ?>" id="input-recipient" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_contact_person"><span data-toggle="tooltip" title="<?php echo $help_recipient_contact_person; ?>"><?php echo $entry_contact_person; ?></span></label>
            					<div class="col-sm-10">
            						<input type="text" name="novaposhta[recipient_contact_person]" value="<?php echo $novaposhta['recipient_contact_person']; ?>" placeholder="<?php echo $entry_contact_person; ?>" id="input-recipient_contact_person" class="form-control" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_contact_person_phone"><span data-toggle="tooltip" title="<?php echo $help_recipient_contact_person_phone; ?>"><?php echo $entry_phone; ?></span></label>
            					<div class="col-sm-10">
            						<input type="text" name="novaposhta[recipient_contact_person_phone]" value="<?php echo $novaposhta['recipient_contact_person_phone']; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-recipient_contact_person_phone" class="form-control" />
              					</div>
              				</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-recipient_edrpou"><span data-toggle="tooltip" title="<?php echo $help_recipient_edrpou; ?>"><?php echo $entry_edrpou; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="novaposhta[recipient_edrpou]" value="<?php echo $novaposhta['recipient_edrpou']; ?>" placeholder="<?php echo $entry_edrpou; ?>" id="input-recipient_edrpou" class="form-control" />
								</div>
							</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_region"><span data-toggle="tooltip" title="<?php echo $help_recipient_region; ?>"><?php echo $entry_region; ?></span></label>
            					<div class="col-sm-10">
              						<input type="text" name="novaposhta[recipient_region]" value="<?php echo $novaposhta['recipient_region']; ?>" placeholder="<?php echo $entry_region; ?>" id="input-recipient_region" class="form-control" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_city"><span data-toggle="tooltip" title="<?php echo $help_recipient_city; ?>"><?php echo $entry_city; ?></span></label>
            					<div class="col-sm-10">
              						<input type="text" name="novaposhta[recipient_city]" value="<?php echo $novaposhta['recipient_city']; ?>" placeholder="<?php echo $entry_city; ?>" id="input-recipient_city" class="form-control" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_department"><span data-toggle="tooltip" title="<?php echo $help_recipient_department; ?>"><?php echo $entry_department; ?></span></label>
            					<div class="col-sm-10">
            						<input type="text" name="novaposhta[recipient_department]" value="<?php echo $novaposhta['recipient_department']; ?>" placeholder="<?php echo $entry_department; ?>" id="input-recipient_department" class="form-control" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_address"><span data-toggle="tooltip" title="<?php echo $help_recipient_address; ?>"><?php echo $entry_address; ?></span></label>
            					<div class="col-sm-10">
            						<input type="text" name="novaposhta[recipient_address]" value="<?php echo $novaposhta['recipient_address']; ?>" placeholder="<?php echo $entry_address; ?>" id="input-recipient_address" class="form-control" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_street"><span data-toggle="tooltip" title="<?php echo $help_recipient_street; ?>"><?php echo $entry_street; ?></span></label>
            					<div class="col-sm-10">
            						<input type="text" name="novaposhta[recipient_street]" value="<?php echo $novaposhta['recipient_street']; ?>" placeholder="<?php echo $entry_street; ?>" id="input-recipient_street" class="form-control" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_house"><span data-toggle="tooltip" title="<?php echo $help_recipient_house; ?>"><?php echo $entry_house; ?></span></label>
            					<div class="col-sm-10">
            						<input type="text" name="novaposhta[recipient_house]" value="<?php echo $novaposhta['recipient_house']; ?>" placeholder="<?php echo $entry_house; ?>" id="input-recipient_house" class="form-control" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-recipient_flat"><span data-toggle="tooltip" title="<?php echo $help_recipient_flat; ?>"><?php echo $entry_flat; ?></span></label>
            					<div class="col-sm-10">
            						<input type="text" name="novaposhta[recipient_flat]" value="<?php echo $novaposhta['recipient_flat']; ?>" placeholder="<?php echo $entry_flat; ?>" id="input-recipient_flat" class="form-control" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-preferred_delivery_date"><span data-toggle="tooltip" title="<?php echo $help_preferred_delivery_date; ?>"><?php echo $entry_preferred_delivery_date; ?></span></label>
            					<div class="col-sm-10">
            						<input type="text" name="novaposhta[preferred_delivery_date]" value="<?php echo $novaposhta['preferred_delivery_date']; ?>" placeholder="<?php echo $entry_preferred_delivery_date; ?>" id="input-preferred_delivery_date" class="form-control" />
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-preferred_delivery_time"><span data-toggle="tooltip" title="<?php echo $help_preferred_delivery_time; ?>"><?php echo $entry_preferred_delivery_time; ?></span></label>
            					<div class="col-sm-10">
            						<input type="text" name="novaposhta[preferred_delivery_time]" value="<?php echo $novaposhta['preferred_delivery_time']; ?>" placeholder="<?php echo $entry_preferred_delivery_time; ?>" id="input-preferred_delivery_time" class="form-control" />
              					</div>
              				</div>
          				</div>
          				<div class="tab-pane fade" id="tab-departure">
          					<div class="form-group">
          						<label class="col-sm-2 control-label" for="input-autodetection_departure_type"><span data-toggle="tooltip" title="<?php echo $help_autodetection_departure_type; ?>"><?php echo $entry_autodetection_departure_type; ?></span></label>
            					<div class="col-sm-2">
									<input type="checkbox" name="novaposhta[autodetection_departure_type]" id="input-autodetection_departure_type" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['autodetection_departure_type'])) { echo ' checked'; }?>>
				      			</div>
            					<label class="col-sm-2 control-label" for="input-departure_type"><span data-toggle="tooltip" title="<?php echo $help_departure_type; ?>"><?php echo $entry_departure_type; ?></span></label>
            					<div class="col-sm-6">
            						<select name="novaposhta[departure_type]" id="input-departure_type" class="form-control">
                					<?php foreach ($cargo_types as $v) { ?>
                						<?php if (isset($novaposhta['departure_type']) && $v['Ref'] == $novaposhta['departure_type']) { ?>
                						<option value="<?php echo $v['Ref']; ?>" selected="selected"><?php echo $v['Description']; ?></option>
                						<?php } else { ?>
                						<option value="<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?></option>
               							<?php } ?>
                					<?php } ?>
              						</select>
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-calculate_volume"><span data-toggle="tooltip" title="<?php echo $help_calculate_volume; ?>"><?php echo $entry_calculate_volume; ?></span></label>
            					<div class="col-sm-2">
									<input type="checkbox" name="novaposhta[calculate_volume]" id="input-calculate_volume" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['calculate_volume'])) { echo ' checked'; }?>>
				      			</div>
				      			<label class="col-sm-2 control-label" for="input-calculate_volume_type"><span data-toggle="tooltip" title="<?php echo $help_calculate_volume_type; ?>"><?php echo $entry_calculate_volume_type; ?></span></label>
            					<div class="col-sm-6">
									<div class="btn-group" data-toggle="buttons">
										<?php foreach ($calculate_volume_types as $k => $v) { ?>
										<?php if (isset($novaposhta['calculate_volume_type']) && $k == $novaposhta['calculate_volume_type']) { ?>
										<label class="btn btn-default active">
											<input type="radio" name="novaposhta[calculate_volume_type]" value="<?php echo $k; ?>" id="input-calculate_volume_type-<?php echo $k; ?>" checked><?php echo $v; ?>
										</label>
										<?php } else { ?>
										<label class="btn btn-default">
											<input type="radio" name="novaposhta[calculate_volume_type]" value="<?php echo $k; ?>" id="input-calculate_volume_type-<?php echo $k; ?>"><?php echo $v; ?>
										</label>
										<?php } ?>
										<?php } ?>
									</div>
            					</div>
            				</div>
            				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-seats_amount"><span data-toggle="tooltip" title="<?php echo $help_seats_amount; ?>"><?php echo $entry_seats_amount; ?></span></label>
            					<div class="col-sm-10">
									<div class="input-group">
										<input type="text" name="novaposhta[seats_amount]" value="<?php echo $novaposhta['seats_amount']; ?>" placeholder="<?php echo $entry_seats_amount; ?>" id="input-seats_amount" class="form-control" />
										<span class="input-group-addon"><?php echo $text_pc; ?></span>
									</div>
              					</div>
              				</div>
            				<div class="form-group">
			            		<label class="col-sm-2 control-label" for="input-declared_cost"><span data-toggle="tooltip" title="<?php echo $help_declared_cost; ?>"><?php echo $entry_declared_cost; ?></span></label>
			            		<div class="col-sm-4">
			            			<div class="well well-sm" style="height: 150px; overflow: auto;">
			            			<?php if (is_array($totals)) { ?>
			            				<?php foreach ($totals as $code => $title) { ?>
			            				<div class="checkbox">
			            					<label>
			            					<?php if (!empty($novaposhta['declared_cost']) && is_array($novaposhta['declared_cost']) && in_array($code, $novaposhta['declared_cost'])) { ?>
			            						<input type="checkbox" name="novaposhta[declared_cost][]" value="<?php echo $code; ?>" checked="checked" /> <?php echo $title; ?>
			            					<?php } else { ?>
			            						<input type="checkbox" name="novaposhta[declared_cost][]" value="<?php echo $code; ?>" /> <?php echo $title; ?>
			            					<?php } ?>
			            					</label>
			            				</div>
			            				<?php } ?>
			            			<?php } ?>
									<?php if (!empty($novaposhta['declared_cost']) && is_array($novaposhta['declared_cost'])) { ?>
										<?php foreach ($novaposhta['declared_cost'] as $v) { ?>
										<?php if (is_array($v)) { ?>
										<div class="checkbox">
											<label>
											<?php if (in_array($v['code'], $novaposhta['declared_cost'])) { ?>
												<input type="checkbox" name="novaposhta[declared_cost][]" value="<?php echo $v['code']; ?>" checked="checked" /> <?php echo $v['name']; ?>
											<?php } else { ?>
												<input type="checkbox" name="novaposhta[declared_cost][]" value="<?php echo $v['code']; ?>" /> <?php echo $v['name']; ?>
											<?php } ?>
												<button type="button" class="btn btn-danger btn-xs" onclick="$(this).parents('div.checkbox').remove();"><i class="fa fa-minus-circle" aria-hidden="true"></i></button>
											</label>
											<input type="hidden" name="novaposhta[declared_cost][<?php echo $v['code']; ?>][code]" value="<?php echo $v['code']; ?>" />
											<input type="hidden" name="novaposhta[declared_cost][<?php echo $v['code']; ?>][name]" value="<?php echo $v['name']; ?>" />
										</div>
										<?php } ?>
										<?php } ?>
									<?php } ?>
										<br/>
										<button type="button" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $button_add; ?>" onclick="addCustomMethod('declared_cost');"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>
			            			</div>
			            		</div>
			            		<label class="col-sm-2 control-label" for="input-declared_cost_default"><span data-toggle="tooltip" title="<?php echo $help_declared_cost_default; ?>"><?php echo $entry_declared_cost_default; ?></span></label>
            					<div class="col-sm-4">
            						<div class="input-group">
              							<input type="text" name="novaposhta[declared_cost_default]" value="<?php echo $novaposhta['declared_cost_default']; ?>" placeholder="<?php echo $entry_declared_cost_default; ?>" id="input-declared_cost_default" class="form-control" />
              							<span class="input-group-addon"><?php echo $text_grn; ?></span>
              						</div>
              					</div>
			            	</div>
          					<div class="form-group">
								<label class="col-sm-offset-10 col-sm-2 control-label"><a class="btn btn-default pull-right" data-toggle="collapse" href="#departure_additional_information_t_m" aria-expanded="false" aria-controls="departure_additional_information_t_m" role="button"><?php echo $text_macros; ?> <i class="fa fa-angle-down" aria-hidden="true"></i></a></label>
								<div class="col-sm-12">
									<div id="departure_additional_information_t_m" class="collapse">
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="col-sm-6">
													<?php echo $text_order_template_macros; ?>
												</div>
												<div class="col-sm-6">
													<?php echo $text_products_template_macros; ?>
												</div>
											</div>
										</div>
									</div>
								</div>
            					<label class="col-sm-2 control-label" for="input-departure_description"><span data-toggle="tooltip" title="<?php echo $help_departure_description; ?>"><?php echo $entry_departure_description; ?></span></label>
            					<div class="col-sm-4">
              						<input type="text" name="novaposhta[departure_description]" value="<?php echo $novaposhta['departure_description']; ?>" placeholder="<?php echo $entry_departure_description; ?>" id="input-departure_description" class="form-control" />
              					</div>
			          			<label class="col-sm-2 control-label" for="input-departure_additional_information"><span data-toggle="tooltip" title="<?php echo $help_departure_additional_information; ?>"><?php echo $entry_departure_additional_information; ?></span></label>
			            		<div class="col-sm-4">
			            			<textarea name="novaposhta[departure_additional_information]" rows="3" id="input-departure_additional_information" class="form-control"><?php echo $novaposhta['departure_additional_information']; ?></textarea>
			          			</div>
			          		</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-general_parameters"><span data-toggle="tooltip" title="<?php echo $help_general_parameters; ?>"><?php echo $entry_general_parameters; ?></span></label>
								<div class="col-sm-2">
									<input type="checkbox" name="novaposhta[general_parameters]" id="input-general_parameters" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['general_parameters'])) { echo ' checked'; } ?>>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-manual_processing"><span data-toggle="tooltip" title="<?php echo $help_manual_processing; ?>"><?php echo $entry_manual_processing; ?></span></label>
								<div class="col-sm-2">
									<input type="checkbox" name="novaposhta[manual_processing]" id="input-manual_processing" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['manual_processing'])) { echo ' checked'; } ?>>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-avia_delivery"><span data-toggle="tooltip" title="<?php echo $help_avia_delivery; ?>"><?php echo $entry_avia_delivery; ?></span></label>
								<div class="col-sm-2">
									<input type="checkbox" name="novaposhta[avia_delivery]" id="input-avia_delivery" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['avia_delivery'])) { echo ' checked'; } ?>>
								</div>
							</div>
            				<legend><?php echo $text_default_departure_options; ?></legend>
            				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-use_parameters"><span data-toggle="tooltip" title="<?php echo $help_use_parameters; ?>"><?php echo $entry_use_parameters; ?></span></label>
            					<div class="col-sm-10">
									<div class="btn-group" data-toggle="buttons">
										<?php foreach ($use_parameters as $k => $v) { ?>
										<?php if (isset($novaposhta['use_parameters']) && $k == $novaposhta['use_parameters']) { ?>
										<label class="btn btn-default active">
											<input type="radio" name="novaposhta[use_parameters]" value="<?php echo $k; ?>" id="input-use_parameters-<?php echo $k; ?>" checked><?php echo $v; ?>
										</label>
										<?php } else { ?>
										<label class="btn btn-default">
											<input type="radio" name="novaposhta[use_parameters]" value="<?php echo $k; ?>" id="input-use_parameters-<?php echo $k; ?>"><?php echo $v; ?>
										</label>
										<?php } ?>
										<?php } ?>
									</div>
            					</div>
            				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-weight"><span data-toggle="tooltip" title="<?php echo $help_weight; ?>"><?php echo $entry_weight; ?></span></label>
            					<div class="col-sm-10">
            						<div class="input-group">
              							<input type="text" name="novaposhta[weight]" value="<?php echo $novaposhta['weight']; ?>" placeholder="0" id="input-weight" class="form-control" />
              							<span class="input-group-addon"><?php echo $text_kg; ?></span>
              						</div>
              					</div>
              				</div>
              				<div class="form-group">	
              					<label class="col-sm-2 control-label" for="input-dimensions_w"><span data-toggle="tooltip" title="<?php echo $help_dimensions; ?>"><?php echo $entry_dimensions; ?></span></label>
            					<div class="col-sm-3">
            						<div class="input-group">
              							<input type="text" name="novaposhta[dimensions_w]" value="<?php echo $novaposhta['dimensions_w']; ?>" placeholder="0" id="input-dimensions_w" class="form-control" />
              							<span class="input-group-addon"><?php echo $text_cm; ?></span>
              						</div>
            					</div>
            					<div class="col-sm-4">
            						<div class="input-group">
              							<input type="text" name="novaposhta[dimensions_l]" value="<?php echo $novaposhta['dimensions_l']; ?>" placeholder="0" id="input-dimensions_l" class="form-control" />
              							<span class="input-group-addon"><?php echo $text_cm; ?></span>
              						</div>
            					</div>
            					<div class="col-sm-3">
            						<div class="input-group">
	              						<input type="text" name="novaposhta[dimensions_h]" value="<?php echo $novaposhta['dimensions_h']; ?>" placeholder="0" id="input-dimensions_h" class="form-control" />
	              						<span class="input-group-addon"><?php echo $text_cm; ?></span>
              						</div>
            					</div>
          					</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-allowance_w"><span data-toggle="tooltip" title="<?php echo $help_allowance; ?>"><?php echo $entry_allowance; ?></span></label>
								<div class="col-sm-3">
									<div class="input-group">
										<input type="text" name="novaposhta[allowance_w]" value="<?php echo $novaposhta['allowance_w']; ?>" placeholder="0" id="input-allowance_w" class="form-control" />
										<span class="input-group-addon"><?php echo $text_cm; ?></span>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="input-group">
										<input type="text" name="novaposhta[allowance_l]" value="<?php echo $novaposhta['allowance_l']; ?>" placeholder="0" id="input-allowance_l" class="form-control" />
										<span class="input-group-addon"><?php echo $text_cm; ?></span>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group">
										<input type="text" name="novaposhta[allowance_h]" value="<?php echo $novaposhta['allowance_h']; ?>" placeholder="0" id="input-allowance_h" class="form-control" />
										<span class="input-group-addon"><?php echo $text_cm; ?></span>
									</div>
								</div>
							</div>
          					<legend><?php echo $text_pack; ?></legend>
            				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-pack"><span data-toggle="tooltip" title="<?php echo $help_pack; ?>"><?php echo $entry_pack; ?></span></label>
            					<div class="col-sm-10">
										<input type="checkbox" name="novaposhta[pack]" id="input-pack" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['pack'])) { echo ' checked'; }?>>
				      			</div>
            				</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-pack_type"><span data-toggle="tooltip" title="<?php echo $help_pack_type; ?>"><?php echo $entry_pack_type; ?></span></label>
								<div class="col-sm-10">
								<?php if (is_array($pack_types)) { ?>
									<select name="novaposhta[pack_type][]" id="input-pack_type" class="form-control selectpicker" title="<?php echo $text_select; ?>" data-actions-box="true" multiple>
									<?php foreach ($pack_types as $v) { ?>
										<?php if (isset($novaposhta['pack_type']) && is_array($novaposhta['pack_type']) && in_array($v['Ref'], $novaposhta['pack_type'])) { ?>
										<option value="<?php echo $v['Ref']; ?>" selected><?php echo $v['Description']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?></option>
										<?php } ?>
									<?php } ?>
									</select>
								<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-autodetection_pack_type"><span data-toggle="tooltip" title="<?php echo $help_autodetection_pack_type; ?>"><?php echo $entry_autodetection_pack_type; ?></span></label>
								<div class="col-sm-10">
									<input type="checkbox" name="novaposhta[autodetection_pack_type]" id="input-autodetection_pack_type" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['autodetection_pack_type'])) { echo ' checked'; }?>>
								</div>
							</div>
          				</div>
          				<div class="tab-pane fade" id="tab-payment">
          					<div class="form-group">
          						<label class="col-sm-2 control-label" for="input-delivery_payer"><span data-toggle="tooltip" title="<?php echo $help_delivery_payer; ?>"><?php echo $entry_delivery_payer; ?></span></label>
            					<div class="col-sm-10">
									<div class="btn-group" data-toggle="buttons">
										<?php foreach ($payer_types as $v) { ?>
										<?php if (isset($novaposhta['delivery_payer']) && $v['Ref'] == $novaposhta['delivery_payer']) { ?>
										<label class="btn btn-default active">
											<input type="radio" name="novaposhta[delivery_payer]" value="<?php echo $v['Ref']; ?>" id="input-delivery_payer-<?php echo $v['Ref']; ?>" checked><?php echo $v['Description']; ?>
										</label>
										<?php } else { ?>
										<label class="btn btn-default">
											<input type="radio" name="novaposhta[delivery_payer]" value="<?php echo $v['Ref']; ?>" id="input-delivery_payer-<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?>
										</label>
										<?php } ?>
										<?php } ?>
									</div>
              					</div>
          					</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-third_person"><span data-toggle="tooltip" title="<?php echo $help_third_person; ?>"><?php echo $entry_third_person; ?></span></label>
								<div class="col-sm-10">
									<select name="novaposhta[third_person]" id="input-third_person" class="form-control">
										<option value="0"><?php echo $text_select; ?></option>
										<?php foreach ($third_persons as $v) { ?>
										<?php if (isset($novaposhta['third_person']) && $v['Ref'] == $novaposhta['third_person']) { ?>
										<option value="<?php echo $v['Ref']; ?>" selected="selected"><?php echo $v['Description']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-payment_type"><span data-toggle="tooltip" title="<?php echo $help_payment_type; ?>"><?php echo $entry_payment_type; ?></span></label>
								<div class="col-sm-10">
									<div class="btn-group" data-toggle="buttons">
										<?php foreach ($payment_types as $v) { ?>
										<?php if (isset($novaposhta['payment_type']) && $v['Ref'] == $novaposhta['payment_type']) { ?>
										<label class="btn btn-default active">
											<input type="radio" name="novaposhta[payment_type]" value="<?php echo $v['Ref']; ?>" id="input-payment_type-<?php echo $v['Ref']; ?>" checked><?php echo $v['Description']; ?>
										</label>
										<?php } else { ?>
										<label class="btn btn-default">
											<input type="radio" name="novaposhta[payment_type]" value="<?php echo $v['Ref']; ?>" id="input-payment_type-<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?>
										</label>
										<?php } ?>
										<?php } ?>
									</div>
								</div>
							</div>
          					<div class="form-group">
			                  	<label class="col-sm-2 control-label" for="input-payment_cod"><span data-toggle="tooltip" title="<?php echo $help_payment_cod; ?>"><?php echo $entry_payment_cod; ?></span></label>
			            		<div class="col-sm-10">
			            			<div class="well well-sm" style="height: 150px; overflow: auto;">
			            			<?php foreach ($payment_methods as $code => $title) { ?>
			            				<div class="checkbox">
			            					<label>
			            					<?php if (!empty($novaposhta['payment_cod']) && is_array($novaposhta['payment_cod']) && in_array($code, $novaposhta['payment_cod'])) { ?>
			            						<input type="checkbox" name="novaposhta[payment_cod][]" value="<?php echo $code; ?>" checked="checked" /> <?php echo $title; ?>
			            					<?php } else { ?>
			            						<input type="checkbox" name="novaposhta[payment_cod][]" value="<?php echo $code; ?>" /> <?php echo $title; ?>
			            					<?php } ?>
			            					</label>
			            				</div>
			            			<?php } ?>
									<?php if (!empty($novaposhta['payment_cod']) && is_array($novaposhta['payment_cod'])) { ?>
										<?php foreach ($novaposhta['payment_cod'] as $v) { ?>
										<?php if (is_array($v)) { ?>
										<div class="checkbox">
											<label>
												<?php if (in_array($v['code'], $novaposhta['payment_cod'])) { ?>
												<input type="checkbox" name="novaposhta[payment_cod][]" value="<?php echo $v['code']; ?>" checked="checked" /> <?php echo $v['name']; ?>
												<?php } else { ?>
												<input type="checkbox" name="novaposhta[payment_cod][]" value="<?php echo $v['code']; ?>" /> <?php echo $v['name']; ?>
												<?php } ?>
												<button type="button" class="btn btn-danger btn-xs" onclick="$(this).parents('div.checkbox').remove();"><i class="fa fa-minus-circle" aria-hidden="true"></i></button>
											</label>
											<input type="hidden" name="novaposhta[payment_cod][<?php echo $v['code']; ?>][code]" value="<?php echo $v['code']; ?>" />
											<input type="hidden" name="novaposhta[payment_cod][<?php echo $v['code']; ?>][name]" value="<?php echo $v['name']; ?>" />
										</div>
										<?php } ?>
										<?php } ?>
									<?php } ?>
										<br/>
										<button type="button" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $button_add; ?>" onclick="addCustomMethod('payment_cod');"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>
			            			</div>
			            		</div>
			            	</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-calculate_cod-enabled"><span data-toggle="tooltip" title="<?php echo $help_calculate_cod; ?>"><?php echo $entry_calculate_cod; ?></span></label>
								<div class="col-sm-10">
									<div class="btn-group" data-toggle="buttons">
										<?php foreach ($calculate_cod_types as $k => $v) { ?>
										<?php if (isset($novaposhta['calculate_cod']) && $k == $novaposhta['calculate_cod']) { ?>
										<label class="btn btn-default active">
											<input type="radio" name="novaposhta[calculate_cod]" value="<?php echo $k; ?>" id="input-calculate_cod-<?php echo $k; ?>" checked><?php echo $v; ?>
										</label>
										<?php } else { ?>
										<label class="btn btn-default">
											<input type="radio" name="novaposhta[calculate_cod]" value="<?php echo $k; ?>" id="input-calculate_cod-<?php echo $k; ?>"><?php echo $v; ?>
										</label>
										<?php } ?>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-calculate_declared_cost_commision-enabled"><span data-toggle="tooltip" title="<?php echo $help_calculate_declared_cost_comm; ?>"><?php echo $entry_calculate_declared_cost_comm; ?></span></label>
								<div class="col-sm-10">
									<div class="btn-group" data-toggle="buttons">
										<?php if (empty($novaposhta['calculate_declared_cost_commision'])) { ?>
										<label class="btn btn-default active">
											<input type="radio" name="novaposhta[calculate_declared_cost_commision]" value="0" id="input-calculate_declared_cost_commision-disabled" checked><?php echo $text_disabled; ?>
										</label>
										<label class="btn btn-default">
											<input type="radio" name="novaposhta[calculate_declared_cost_commision]" value="1" id="input-calculate_declared_cost_commision-enabled"><?php echo $text_enabled; ?>
										</label>
										<?php } else { ?>
										<label class="btn btn-default">
											<input type="radio" name="novaposhta[calculate_declared_cost_commision]" value="0" id="input-calculate_declared_cost_commision-disabled"><?php echo $text_disabled; ?>
										</label>
										<label class="btn btn-default active">
											<input type="radio" name="novaposhta[calculate_declared_cost_commision]" value="1" id="input-calculate_declared_cost_commision-enabled" checked><?php echo $text_enabled; ?>
										</label>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-backward_delivery"><span data-toggle="tooltip" title="<?php echo $help_backward_delivery; ?>"><?php echo $entry_backward_delivery; ?></span></label>
								<div class="col-sm-10">
									<select name="novaposhta[backward_delivery]" id="input-payment_type" class="form-control">
										<option value="0"><?php echo $text_select; ?></option>
										<option value="N"<?php echo ($novaposhta['backward_delivery'] == 'N') ? ' selected="selected"' : ''; ?>><?php echo $text_no_backward_delivery; ?></option>
										<?php foreach ($backward_delivery_types as $v) { ?>
										<?php if (isset($novaposhta['backward_delivery']) && $v['Ref'] == $novaposhta['backward_delivery']) { ?>
										<option value="<?php echo $v['Ref']; ?>" selected="selected"><?php echo $v['Description']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-backward_delivery_payer"><span data-toggle="tooltip" title="<?php echo $help_backward_delivery_payer; ?>"><?php echo $entry_backward_delivery_payer; ?></span></label>
								<div class="col-sm-10">
									<div class="btn-group" data-toggle="buttons">
										<?php foreach ($backward_delivery_payers as $v) { ?>
										<?php if (isset($novaposhta['backward_delivery_payer']) && $v['Ref'] == $novaposhta['backward_delivery_payer']) { ?>
										<label class="btn btn-default active">
											<input type="radio" name="novaposhta[backward_delivery_payer]" value="<?php echo $v['Ref']; ?>" id="input-backward_delivery_payer-<?php echo $v['Ref']; ?>" checked><?php echo $v['Description']; ?>
										</label>
										<?php } else { ?>
										<label class="btn btn-default">
											<input type="radio" name="novaposhta[backward_delivery_payer]" value="<?php echo $v['Ref']; ?>" id="input-backward_delivery_payer-<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?>
										</label>
										<?php } ?>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-payment_control"><span data-toggle="tooltip" title="<?php echo $help_payment_control; ?>"><?php echo $entry_payment_control; ?></span></label>
								<div class="col-sm-4">
									<div class="well well-sm" style="height: 150px; overflow: auto;">
										<?php if (is_array($totals)) { ?>
										<?php foreach ($totals as $code => $title) { ?>
										<div class="checkbox">
											<label>
												<?php if (!empty($novaposhta['payment_control']) && is_array($novaposhta['payment_control']) && in_array($code, $novaposhta['payment_control'])) { ?>
												<input type="checkbox" name="novaposhta[payment_control][]" value="<?php echo $code; ?>" checked="checked" /> <?php echo $title; ?>
												<?php } else { ?>
												<input type="checkbox" name="novaposhta[payment_control][]" value="<?php echo $code; ?>" /> <?php echo $title; ?>
												<?php } ?>
											</label>
										</div>
										<?php } ?>
										<?php } ?>
										<?php if (!empty($novaposhta['payment_control']) && is_array($novaposhta['payment_control'])) { ?>
										<?php foreach ($novaposhta['payment_control'] as $v) { ?>
										<?php if (is_array($v)) { ?>
										<div class="checkbox">
											<label>
												<?php if (in_array($v['code'], $novaposhta['payment_control'])) { ?>
												<input type="checkbox" name="novaposhta[payment_control][]" value="<?php echo $v['code']; ?>" checked="checked" /> <?php echo $v['name']; ?>
												<?php } else { ?>
												<input type="checkbox" name="novaposhta[payment_control][]" value="<?php echo $v['code']; ?>" /> <?php echo $v['name']; ?>
												<?php } ?>
												<button type="button" class="btn btn-danger btn-xs" onclick="$(this).parents('div.checkbox').remove();"><i class="fa fa-minus-circle" aria-hidden="true"></i></button>
											</label>
											<input type="hidden" name="novaposhta[payment_control][<?php echo $v['code']; ?>][code]" value="<?php echo $v['code']; ?>" />
											<input type="hidden" name="novaposhta[payment_control][<?php echo $v['code']; ?>][name]" value="<?php echo $v['name']; ?>" />
										</div>
										<?php } ?>
										<?php } ?>
										<?php } ?>
										<br/>
										<button type="button" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $button_add; ?>" onclick="addCustomMethod('payment_control');"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>
									</div>
								</div>
							</div>
          				</div>
						<div class="tab-pane fade" id="tab-consignment_note">
							<legend><?php echo $text_consignment_note_list; ?></legend>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-display_all_consignments"><span data-toggle="tooltip" title="<?php echo $help_display_all_consignments; ?>"><?php echo $entry_display_all_consignments; ?></span></label>
								<div class="col-sm-2">
									<input type="checkbox" name="novaposhta[display_all_consignments]" id="input-display_all_consignments" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['display_all_consignments'])) { echo ' checked'; }?>>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-consignment_displayed_information"><span data-toggle="tooltip" title="<?php echo $help_displayed_information; ?>"><?php echo $entry_displayed_information; ?></span></label>
								<div class="col-sm-10">
									<select name="novaposhta[consignment_displayed_information][]" id="input-consignment_displayed_information" class="form-control selectpicker" title="<?php echo $text_select; ?>" data-actions-box="true" multiple>
										<?php foreach ($consignment_displayed_information as $k => $v) { ?>
											<?php if (isset($novaposhta['consignment_displayed_information']) && in_array($k, $novaposhta['consignment_displayed_information'])) { ?>
												<option value="<?php echo $k; ?>" selected><?php echo $v; ?></option>
											<?php } else { ?>
												<option value="<?php echo $k; ?>"><?php echo $v; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<legend><?php echo $text_print_settings; ?></legend>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-print_format"><span data-toggle="tooltip" title="<?php echo $help_print_format; ?>"><?php echo $entry_print_format; ?></span></label>
								<div class="col-sm-10">
									<select name="novaposhta[print_format]" id="input-print_format" class="form-control">
									<?php foreach ($print_formats as $k => $v) { ?>
										<?php if ($novaposhta['print_format'] == $k) { ?>
										<option value="<?php echo $k; ?>" selected><?php echo $v; ?></option>
										<?php } else { ?>
										<option value="<?php echo $k; ?>"><?php echo $v; ?></option>
										<?php } ?>
									<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-number_of_copies"><span data-toggle="tooltip" title="<?php echo $help_number_of_copies; ?>"><?php echo $entry_number_of_copies; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="novaposhta[number_of_copies]" value="<?php echo $novaposhta['number_of_copies']; ?>" placeholder="<?php echo $entry_number_of_copies; ?>" id="input-number_of_copies" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-template_type"><span data-toggle="tooltip" title="<?php echo $help_template_type; ?>"><?php echo $entry_template_type; ?></span></label>
								<div class="col-sm-10">
									<select name="novaposhta[template_type]" id="input-template_type" class="form-control">
										<?php foreach ($template_types as $k => $v) { ?>
										<?php if ($novaposhta['template_type'] == $k) { ?>
										<option value="<?php echo $k; ?>" selected><?php echo $v; ?></option>
										<?php } else { ?>
										<option value="<?php echo $k; ?>"><?php echo $v; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-print_type"><span data-toggle="tooltip" title="<?php echo $help_print_type; ?>"><?php echo $entry_print_type; ?></span></label>
								<div class="col-sm-10">
									<select name="novaposhta[print_type]" id="input-print_type" class="form-control">
									<?php foreach ($print_types as $k => $v) { ?>
										<?php if ($novaposhta['print_type'] == $k) { ?>
										<option value="<?php echo $k; ?>" selected><?php echo $v; ?></option>
										<?php } else { ?>
										<option value="<?php echo $k; ?>"><?php echo $v; ?></option>
										<?php } ?>
									<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-print_start"><span data-toggle="tooltip" title="<?php echo $help_print_start; ?>"><?php echo $entry_print_start; ?></span></label>
								<div class="col-sm-10">
									<div class="btn-group-vertical" id="div-vertical-1" data-toggle="buttons">
									<?php for ($i = 1; $i <= 6; $i++) { ?>
										<label class="btn btn-default <?php echo (isset($novaposhta['print_start']) && $novaposhta['print_start'] == $i) ? 'active' : '' ; ?>">
											<input type="radio" name="novaposhta[print_start]" value="<?php echo $i; ?>" id="input-print_start-1-<?php echo $i; ?>" autocomplete="off" <?php echo (isset($novaposhta['print_start']) && $novaposhta['print_start'] == $i) ? 'checked' : '' ; ?>><?php echo $i; ?>
										</label>
									<?php } ?>
									</div>
									<div class="btn-group-vertical" id="div-vertical-2" data-toggle="buttons">
										<?php for ($i = 1; $i <= 6; $i++) { ?>
										<label class="btn btn-default <?php echo (isset($novaposhta['print_start']) && $novaposhta['print_start'] == $i) ? 'active' : '' ; ?>">
											<input type="radio" name="novaposhta[print_start]" value="<?php echo $i; ?>" id="input-print_start-2-<?php echo $i; ?>" autocomplete="off" <?php echo (isset($novaposhta['print_start']) && $novaposhta['print_start'] == $i) ? 'checked' : '' ; ?>><?php echo $i; ?>
										</label>
										<?php } ?>
									</div>
								</div>
							</div>
							<legend><?php echo $text_integration_with_orders; ?></legend>
							<div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_help_integration_with_orders; ?></div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-compatible_shipping_method"><span data-toggle="tooltip" title="<?php echo $help_compatible_shipping_method; ?>"><?php echo $entry_compatible_shipping_method; ?></span></label>
								<div class="col-sm-10">
									<div class="well well-sm" style="height: 150px; overflow: auto;">
									<?php foreach ($shipping_methods as $k => $n) { ?>
										<div class="checkbox">
											<label>
												<?php if (isset($novaposhta['compatible_shipping_method']) && is_array($novaposhta['compatible_shipping_method']) && in_array($k, $novaposhta['compatible_shipping_method'])) { ?>
												<input type="checkbox" name="novaposhta[compatible_shipping_method][]" value="<?php echo $k; ?>" checked="checked" /> <?php echo $n; ?>
												<?php } else { ?>
												<input type="checkbox" name="novaposhta[compatible_shipping_method][]" value="<?php echo $k; ?>" /> <?php echo $n; ?>
												<?php } ?>
											</label>
										</div>
									<?php } ?>
									<?php if (!empty($novaposhta['compatible_shipping_method']) && is_array($novaposhta['compatible_shipping_method'])) { ?>
										<?php foreach ($novaposhta['compatible_shipping_method'] as $v) { ?>
										<?php if (is_array($v)) { ?>
										<div class="checkbox">
											<label>
												<?php if (in_array($v['code'], $novaposhta['compatible_shipping_method'])) { ?>
												<input type="checkbox" name="novaposhta[compatible_shipping_method][]" value="<?php echo $v['code']; ?>" checked="checked" /> <?php echo $v['name']; ?>
												<?php } else { ?>
												<input type="checkbox" name="novaposhta[compatible_shipping_method][]" value="<?php echo $v['code']; ?>" /> <?php echo $v['name']; ?>
												<?php } ?>
												<button type="button" class="btn btn-danger btn-xs" onclick="$(this).parents('div.checkbox').remove();"><i class="fa fa-minus-circle" aria-hidden="true"></i></button>
											</label>
											<input type="hidden" name="novaposhta[compatible_shipping_method][<?php echo $v['code']; ?>][code]" value="<?php echo $v['code']; ?>" />
											<input type="hidden" name="novaposhta[compatible_shipping_method][<?php echo $v['code']; ?>][name]" value="<?php echo $v['name']; ?>" />
										</div>
										<?php } ?>
										<?php } ?>
									<?php } ?>
										<br/>
										<button type="button" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $button_add; ?>" onclick="addCustomMethod('compatible_shipping_method');"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-consignment_create"><span data-toggle="tooltip" title="<?php echo $help_consignment_create; ?>"><?php echo $entry_consignment_create; ?></span></label>
								<div class="col-sm-1">
									<input type="checkbox" name="novaposhta[consignment_create]" id="input-consignment_create" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['consignment_create'])) { echo ' checked'; }?>>
								</div>
								<label class="col-sm-1 control-label" for="input-consignment_create_text"><?php echo $entry_menu_text; ?></label>
								<div class="col-sm-8">
									<ul class="nav nav-tabs" role="tablist">
										<?php foreach ($languages as $language) { ?>
										<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#consignment_create_text_<?php echo $language['language_id']; ?>" aria-controls="consignment_create_text_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']] ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
									</ul>
									<div class="tab-content">
										<?php foreach ($languages as $language) { ?>
										<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="consignment_create_text_<?php echo $language['language_id']; ?>">
											<input type="text" name="novaposhta[consignment_create_text][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['consignment_create_text'][$language['language_id']]; ?>" placeholder="<?php echo $entry_menu_text; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-consignment_edit"><span data-toggle="tooltip" title="<?php echo $help_consignment_edit; ?>"><?php echo $entry_consignment_edit; ?></span></label>
								<div class="col-sm-1">
									<input type="checkbox" name="novaposhta[consignment_edit]" id="input-consignment_edit" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['consignment_edit'])) { echo ' checked'; }?>>
								</div>
								<label class="col-sm-1 control-label" for="input-consignment_edit_text"><?php echo $entry_menu_text; ?></label>
								<div class="col-sm-8">
									<ul class="nav nav-tabs" role="tablist">
										<?php foreach ($languages as $language) { ?>
										<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#consignment_edit_text_<?php echo $language['language_id']; ?>" aria-controls="consignment_edit_text_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']] ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
									</ul>
									<div class="tab-content">
										<?php foreach ($languages as $language) { ?>
										<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="consignment_edit_text_<?php echo $language['language_id']; ?>">
											<input type="text" name="novaposhta[consignment_edit_text][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['consignment_edit_text'][$language['language_id']]; ?>" placeholder="<?php echo $entry_menu_text; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-consignment_delete-enabled"><span data-toggle="tooltip" title="<?php echo $help_consignment_delete; ?>"><?php echo $entry_consignment_delete; ?></span></label>
								<div class="col-sm-1">
									<input type="checkbox" name="novaposhta[consignment_delete]" id="input-consignment_delete" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['consignment_delete'])) { echo ' checked'; }?>>
								</div>
								<label class="col-sm-1 control-label" for="input-consignment_delete_text"><?php echo $entry_menu_text; ?></label>
								<div class="col-sm-8">
									<ul class="nav nav-tabs" role="tablist">
										<?php foreach ($languages as $language) { ?>
										<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#consignment_delete_text_<?php echo $language['language_id']; ?>" aria-controls="consignment_delete_text_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']] ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
									</ul>
									<div class="tab-content">
										<?php foreach ($languages as $language) { ?>
										<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="consignment_delete_text_<?php echo $language['language_id']; ?>">
											<input type="text" name="novaposhta[consignment_delete_text][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['consignment_delete_text'][$language['language_id']]; ?>" placeholder="<?php echo $entry_menu_text; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-consignment_assignment_to_order-enabled"><span data-toggle="tooltip" title="<?php echo $help_consignment_assignment_to_order; ?>"><?php echo $entry_consignment_assignment_to_order; ?></span></label>
								<div class="col-sm-1">
									<input type="checkbox" name="novaposhta[consignment_assignment_to_order]" id="input-consignment_assignment_to_order" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger"<?php if (!empty($novaposhta['consignment_assignment_to_order'])) { echo ' checked'; }?>>
								</div>
								<label class="col-sm-1 control-label" for="input-consignment_assignment_to_order_text"><?php echo $entry_menu_text; ?></label>
								<div class="col-sm-8">
									<ul class="nav nav-tabs" role="tablist">
										<?php foreach ($languages as $language) { ?>
										<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#consignment_assignment_to_order_text_<?php echo $language['language_id']; ?>" aria-controls="consignment_assignment_to_order_text_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']] ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
									</ul>
									<div class="tab-content">
										<?php foreach ($languages as $language) { ?>
										<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="consignment_assignment_to_order_text_<?php echo $language['language_id']; ?>">
											<input type="text" name="novaposhta[consignment_assignment_to_order_text][<?php echo $language['language_id']; ?>]" value="<?php echo $novaposhta['consignment_assignment_to_order_text'][$language['language_id']]; ?>" placeholder="<?php echo $entry_menu_text; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
							</div>
						</div>
          				<div class="tab-pane fade" id="tab-cron">
          					<div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_help_cron; ?></div>
          					<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-key_cron"><span data-toggle="tooltip" title="<?php echo $help_key_cron; ?>"><?php echo $entry_key_cron; ?></span></label>
            					<div class="col-sm-10">
    								<div class="input-group">
    									<input type="text" name="novaposhta[key_cron]" value="<?php echo $novaposhta['key_cron']; ?>" placeholder="<?php echo $entry_key_cron; ?>" id="input-key_cron" class="form-control" />
    									<span class="input-group-btn">
    										<button id="button-generate-cron-key" onclick="generateKey();" type="button" class="btn btn-info" data-toggle="tooltip" title="<?php echo $button_generate; ?>"><i class="fa fa-cog"></i></button>
    									</span>
    								</div>	
    							</div>
              				</div>
          					<legend><?php echo $text_base_update; ?></legend>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-cron_update_references"><?php echo $entry_references; ?></label>
								<div class="col-sm-10">
									<div class="input-group">
										<input type="text" value="<?php echo $cron_update_references; ?>"  id="input-cron_update_references" class="form-control" readonly />
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" data-toggle="tooltip" title="<?php echo $button_copy; ?>" onclick="copyToClipboard('input-cron_update_references');"><i class="fa fa-files-o" aria-hidden="true"></i></button>
										</span>
									</div>
								</div>
							</div>
          					<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-cron_update_regions"><?php echo $entry_region; ?></label>
            					<div class="col-sm-10">
									<div class="input-group">
										<input type="text" value="<?php echo $cron_update_regions; ?>"  id="input-cron_update_regions" class="form-control" readonly />
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" data-toggle="tooltip" title="<?php echo $button_copy; ?>" onclick="copyToClipboard('input-cron_update_regions');"><i class="fa fa-files-o" aria-hidden="true"></i></button>
										</span>
									</div>
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-cron_update_cities"><?php echo $entry_city; ?></label>
            					<div class="col-sm-10">
									<div class="input-group">
              							<input type="text" value="<?php echo $cron_update_cities; ?>"  id="input-cron_update_cities" class="form-control" readonly />
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" data-toggle="tooltip" title="<?php echo $button_copy; ?>" onclick="copyToClipboard('input-cron_update_cities');"><i class="fa fa-files-o" aria-hidden="true"></i></button>
										</span>
									</div>
              					</div>
              				</div>
              				<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-cron_update_departments"><?php echo $entry_department; ?></label>
            					<div class="col-sm-10">
									<div class="input-group">
              							<input type="text" value="<?php echo $cron_update_departments; ?>"  id="input-cron_update_departments" class="form-control" readonly />
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" data-toggle="tooltip" title="<?php echo $button_copy; ?>" onclick="copyToClipboard('input-cron_update_departments');"><i class="fa fa-files-o" aria-hidden="true"></i></button>
										</span>
									</div>
              					</div>
              				</div>
              				<legend><?php echo $text_departures_tracking; ?></legend>
          					<div class="form-group">
            					<label class="col-sm-2 control-label" for="input-cron_departures_tracking"><?php echo $entry_departures_tracking; ?></label>
            					<div class="col-sm-10">
									<div class="input-group">
              							<input type="text" value="<?php echo $cron_departures_tracking; ?>"  id="input-cron_departures_tracking" class="form-control" readonly />
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" data-toggle="tooltip" title="<?php echo $button_copy; ?>" onclick="copyToClipboard('input-cron_departures_tracking');"><i class="fa fa-files-o" aria-hidden="true"></i></button>
											<a href="<?php echo $cron_departures_tracking_href; ?>" class="btn btn-default" role="button" data-toggle="tooltip" title="<?php echo $button_run; ?>" target="_blank"><i class="fa fa-terminal" aria-hidden="true"></i></a>
										</span>
									</div>
              					</div>
              				</div>
              				<div class="form-group">
					        	<label class="col-sm-2 control-label" for="input-tracking_statuses"><span data-toggle="tooltip" title="<?php echo $help_tracking_statuses; ?>"><?php echo $entry_tracking_statuses; ?></span></label>
					        	<div class="col-sm-10">
								<?php if (is_array($order_statuses)) { ?>
									<select name="novaposhta[tracking_statuses][]" id="input-tracking_statuses"  class="form-control selectpicker" title="<?php echo $text_select; ?>" data-actions-box="true" multiple>
									<?php foreach ($order_statuses as $order_status) { ?>
										<?php if (isset($novaposhta['tracking_statuses']) && is_array($novaposhta['tracking_statuses']) && in_array($order_status['order_status_id'], $novaposhta['tracking_statuses'])) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
									</select>
								<?php } ?>
					        	</div>
					        </div>
							<a class="btn btn-default pull-right" data-toggle="collapse" href="#message-macros-collapse" aria-expanded="false" aria-controls="message-macros-collapse" role="button"><?php echo $text_message_template_macros; ?> <i class="fa fa-angle-down" aria-hidden="true"></i></a>
							<div class="clearfix"></div>
							<div id="message-macros-collapse" class="collapse">
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="col-sm-4">
											<?php echo $text_cn_template_macros; ?>
										</div>
										<div class="col-sm-4">
											<?php echo $text_order_template_macros; ?>
										</div>
										<div class="col-sm-4">
											<?php echo $text_products_template_macros; ?>
										</div>
									</div>
								</div>
							</div>
					        <div class="panel panel-default">
							    <div class="panel-heading">
							    	<h3 class="panel-title"><?php echo $text_settings_departures_statuses; ?></h3>
								</div>
								<div class="table-responsive">
					            	<table class="table table-bordered table-hover" id="table-tracking_statuses">
					              		<thead>
					                		<tr>
					                  			<td class="text-center" width="15%"><?php echo $column_postal_company_status; ?></td>
					                  			<td class="text-center"><?php echo $column_store_status; ?></td>
												<td class="text-center"><?php echo $column_implementation_delay; ?></td>
					                  			<td class="text-center"><?php echo $column_notification; ?></td>
					                  			<td class="text-center" width="40%"><?php echo $column_message_template; ?></td>
					                  			<td class="text-center"><?php echo $column_action; ?></td>
					                		</tr>
					              		</thead>
										<tbody>
										<?php if (isset($novaposhta['settings_tracking_statuses']) && is_array($novaposhta['settings_tracking_statuses'])) { $c = 0; ?>
										<?php foreach ($novaposhta['settings_tracking_statuses'] as $i => $settings) { ?>
										<tr>
											<td>
												<select name="novaposhta[settings_tracking_statuses][<?php echo $c; ?>][shipment_statuses][]" class="form-control selectpicker" title="<?php echo $text_select; ?>" data-width="250px" data-dropup-auto="false" multiple>
													<?php foreach ($document_statuses as $document_status) { ?>
													<?php if (isset($settings['shipment_statuses']) && in_array($document_status['StatusId'], $settings['shipment_statuses'])) { ?>
													<option value="<?php echo $document_status['StatusId']; ?>" selected="selected"><?php echo $document_status['Description']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $document_status['StatusId']; ?>"><?php echo $document_status['Description']; ?></option>
													<?php } ?>
													<?php } ?>
												</select>
											</td>
											<td>
												<select name="novaposhta[settings_tracking_statuses][<?php echo $c; ?>][store_status]" class="form-control">
													<?php foreach ($order_statuses as $order_status) { ?>
													<?php if ($order_status['order_status_id'] == $settings['store_status']) { ?>
													<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
													<?php } ?>
													<?php } ?>
												</select>
											</td>
											<td>
												<div class="input-group">
														<span class="input-group-btn" style="width: 50%;">
															<select name="novaposhta[settings_tracking_statuses][<?php echo $c; ?>][implementation_delay][type]" class="form-control">
															<?php foreach ($time as $k => $v) { ?>
																<?php if ($k == $settings['implementation_delay']['type']) { ?>
																<option value="<?php echo $k; ?>" selected="selected"><?php echo $v; ?></option>
																<?php } else { ?>
																<option value="<?php echo $k; ?>"><?php echo $v; ?></option>
																<?php } ?>
																<?php } ?>
															</select>
														</span><input type="text" name="novaposhta[settings_tracking_statuses][<?php echo $c; ?>][implementation_delay][value]" value="<?php echo $novaposhta['settings_tracking_statuses'][$i]['implementation_delay']['value']; ?>" class="form-control" />
												</div>
											</td>
											<td>
												<div class="row">
													<label class="col-sm-8"><?php echo $entry_admin_notification; ?></label>
													<div class="col-sm-4">
														<input type="checkbox" name="novaposhta[settings_tracking_statuses][<?php echo $c; ?>][admin_notification]" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-size="mini" data-onstyle="success" data-offstyle="danger"<?php if (!empty($settings['admin_notification'])) { echo ' checked'; }?>>
													</div>
												</div>
												<hr>
												<div class="row">
													<label class="col-sm-8"><?php echo $entry_customer_notification; ?></label>
													<div class="col-sm-4">
														<input type="checkbox" name="novaposhta[settings_tracking_statuses][<?php echo $c; ?>][customer_notification]" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-size="mini" data-onstyle="success" data-offstyle="danger"<?php if (!empty($settings['customer_notification'])) { echo ' checked'; }?>>
													</div>
												</div>
												<hr>
												<div class="row">
													<label class="col-sm-8"><?php echo $entry_customer_notification_default; ?></label>
													<div class="col-sm-4">
														<input type="checkbox" name="novaposhta[settings_tracking_statuses][<?php echo $c; ?>][customer_notification_default]" data-on="<i class='fa fa-check'></i>" data-off="<i class='fa fa-times'></i>" data-toggle="toggle" data-size="mini" data-onstyle="success" data-offstyle="danger"<?php if (!empty($settings['customer_notification_default'])) { echo ' checked'; }?>>
													</div>
												</div>
											</td>
											<td>
												<div class="row">
													<label class="col-sm-2 control-label"><?php echo $entry_email; ?></label>
													<div class="col-sm-10">
														<ul class="nav nav-tabs" role="tablist">
															<?php foreach ($languages as $language) { ?>
															<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#tracking_statuses_email_<?php echo $c; ?>_<?php echo $language['language_id']; ?>" aria-controls="tracking_statuses_email_<?php echo $c; ?>_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']] ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
															<?php } ?>
														</ul>
														<div class="tab-content">
															<?php foreach ($languages as $language) { ?>
															<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="tracking_statuses_email_<?php echo $c; ?>_<?php echo $language['language_id']; ?>">
																<textarea name="novaposhta[settings_tracking_statuses][<?php echo $c; ?>][email][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_email; ?>"class="form-control summernote"><?php echo $novaposhta['settings_tracking_statuses'][$i]['email'][$language['language_id']]; ?></textarea>
															</div>
															<?php } ?>
														</div>
													</div>
												</div>
												<hr>
												<div class="row">
													<label class="col-sm-2 control-label"><?php echo $entry_sms; ?></label>
													<div class="col-sm-10">
														<ul class="nav nav-tabs" role="tablist">
															<?php foreach ($languages as $language) { ?>
															<li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#tracking_statuses_sms_<?php echo $c; ?>_<?php echo $language['language_id']; ?>" aria-controls="tracking_statuses_sms_<?php echo $c; ?>_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']] ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
															<?php } ?>
														</ul>
														<div class="tab-content"><?php foreach ($languages as $language) { ?>
															<div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="tracking_statuses_sms_<?php echo $c; ?>_<?php echo $language['language_id']; ?>">
																<textarea name="novaposhta[settings_tracking_statuses][<?php echo $c; ?>][sms][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_sms; ?>"class="form-control"><?php echo $novaposhta['settings_tracking_statuses'][$i]['sms'][$language['language_id']]; ?></textarea>
															</div>
															<?php } ?>
														</div>
													</div>
												</div>
											</td>
											<td class="text-center"><button type="button" onclick="$(this).parents('tr').remove()" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
										</tr>
										<?php $c++; } ?>
										<?php } ?>
										</tbody>
					              		<tfoot>
					              			<tr>
					              				<td colspan="5"></td>
					              				<td class="text-center"><button type="button" onclick="addTrackingStatus();" data-toggle="modal" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
					              			</tr>
					              		</tfoot>
					            	</table>
					          	</div>
				          	</div>
          				</div>
          				<?php } ?>
          				<div class="tab-pane fade<?php if (!$license) { ?>in active<?php } ?>" id="tab-support">
          					<?php echo $support; ?>			
          				</div>
          			</div>
          			<!-- Modal of API verifying START -->
					<div class="modal fade" id="modal-verifying_api_access" tabindex="-1" role="dialog" aria-labelledby="modal-verifying_api_access-label">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      	<div class="modal-header">
						        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        	<h4 class="modal-title" id="modal-verifying_api_access-label"><?php echo $heading_verifying_api_access; ?></h4>
						      	</div>
							    <div class="modal-body">
				          			<div class="well" id="verifying_api_access-log"></div>
				          			<p class="text-center"><i class="fa fa-cog fa-spin fa-3x text-primary" id="verifying_api_access-icon"></i></p>
							    </div>
							    <div class="modal-footer">
									<button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-check"></i></button>
							    </div>
						    </div>
						</div>
					</div>         
				    <!-- Modal of API verifying END -->
					<!-- Modal of custom total START -->
					<div class="modal fade" id="modal-custom-method" tabindex="-1" role="dialog" aria-labelledby="modal-custom-method-label">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="modal-custom-method-label"><?php echo $heading_adding_custom_method; ?></h4>
								</div>
								<div class="modal-body">
									<input type="hidden" name="custom_method_type" value="" id="input-custom-method-type" />
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-custom-method-name"><?php echo $entry_name; ?></label>
										<div class="col-sm-10">
											<input type="text" name="custom_method_name" value="" placeholder="<?php echo $entry_name; ?>" id="input-custom-method-name" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-custom-method-code"><?php echo $entry_code; ?></label>
										<div class="col-sm-10">
											<input type="text" name="custom_method_code" value="" placeholder="<?php echo $entry_code; ?>" id="input-custom-method-code" class="form-control" />
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" onclick="addCustomMethod('save');"><i class="fa fa-check"></i></button>
									<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i></button>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal of custom total END-->
        		</form>
				<form action="<?php echo $action_settings; ?>&type=import" method="post" enctype="multipart/form-data" style="display: none;">
					<input type="file" name="import" accept="text/plain" id="input-import-settings" onchange="this.form.submit();">
				</form>
      		</div>
    	</div>
  	</div>
</div>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-<?php echo $translations_code; ?>.min.js"></script>
<script type="text/javascript"><!--
	function save(type) {
		var post_data = $('#form-novaposhta').serialize() + '&store_id=' + $('#input-store_id').val();

		$('div.toggle input[type="checkbox"]:not(:checked)').each(function(i, el) {
			post_data += '&' + el.name + '='
		});

		if (type === 'exit') {
			post_data += '&exit'
		}

		$.ajax({
			url: 'index.php?route=extension/shipping/novaposhta&token=<?php echo $token; ?>',
			type: 'POST',
			data: post_data,
			dataType: 'html',
			success: function (data, textStatus, jqXHR) {
				var $data = $(data);

				if ($data.find('div.alert-danger').length) {
					$('.container-fluid:eq(1)').prepend($data.find('div.alert-danger'));
				} else {
					if (type === 'exit') {
						location.href = 'index.php?route=extension/extension&token=<?php echo $token; ?>&type=shipping';
					}
				}

				if ($data.find('div.text-danger').length) {
					$data.find('div.text-danger').each(function(i, el) {
						var id = '#' + $(el).parents('div[class^="col-sm"]:first').find('input, select, textarea, radio').attr('id');

						$(id).parents('div[class^="col-sm"]:first').append(el);
						$(id).parents('div.form-group').addClass('has-error');
					});
				}

				if ($data.find('div.alert-success').length) {
					$('.container-fluid:eq(1)').prepend($data.find('div.alert-success'));
				}
			}
		});
	}

	function settings(type) {
		if (!confirm('<?php echo $text_confirm; ?>')) {
			return false;
		}

		if (type == 'basic') {
			$.ajax({
				url: 'index.php?route=extension/shipping/novaposhta/extensionSettings&token=<?php echo $token; ?>&type=' + type,
				type: 'GET',
				dataType: 'json',
				success: function (json) {
					if (json['success']) {
						$('.container-fluid:eq(1)').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

						setTimeout(function() { location.reload(); }, 2000);
					}

					if(json['error']) {
						$('.container-fluid:eq(1)').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			});
		} else if (type == 'export') {
			location.href = 'index.php?route=extension/shipping/novaposhta/extensionSettings&token=<?php echo $token; ?>&type=' + type;
		} else if (type == 'import') {
			$('#input-import-settings').trigger('click');
		}
	}

	function formHandler(element) {
		switch (element.id) {
			case 'input-key_api':
				var key_api = element.value;

				$('#modal-verifying_api_access').modal('show');

				$('#verifying_api_access-icon').addClass('fa-spin');
				$('#verifying_api_access-log').empty().append('<p><?php echo $text_verifying_api_access; ?> <i class="fa fa-circle-o-notch fa-spin"></i></p>');

				function action(act) {
					$.ajax({
						url: 'index.php?route=extension/shipping/novaposhta/verifyingAPIaccess&token=<?php echo $token; ?>',
						type: 'POST',
						data: 'action=' + act + '&key=' + key_api,
						dataType: 'json',
						beforeSend: function () {
						},
						complete: function () {
						},
						success: function(json) {
							if (json['error']) {
								$('#verifying_api_access-log').find('i:last').replaceWith('<i class="fa fa-exclamation-circle text-danger"></i>');
								$('#verifying_api_access-icon').removeClass('fa-spin');

								for(var e in json['error']) {
									$('#verifying_api_access-log').append('<p class="text-danger">' + json['error'][e] + '</p>');
								}
							}

							if (json['next_action']) {
								$('#verifying_api_access-log').find('i').replaceWith('<i class="fa fa-check text-success" aria-hidden="true"></i>');
								$('#verifying_api_access-log').append('<p>' + json['next_action_text'] + ' <i class="fa fa-circle-o-notch fa-spin"></i></p>');

								if (json['next_action'] == 'saving') {
									$('#verifying_api_access-icon').removeClass('fa-spin');

									if (json['recipient']) {
                                        $('#input-recipient').val(json['recipient']);
                                    }

									save();

									setTimeout(function() {
											$('#modal-verifying_api_access').modal('hide');

											location.reload();
										},
										2000
									);
								} else {
									action(json['next_action']);
								}
							}
						}
					});
				}

				action('check');

				break;

			case 'input-department_cost':
			case 'input-doors_cost':
			case 'input-poshtomat_cost':
			case 'input-calculate_volume':
				if ($(element).is(':checked')) {
					$(element).parent().parent().nextAll().fadeIn();
				} else {
					$(element).parent().parent().nextAll().fadeOut();
				}

				break;

			case 'input-sender':
				$.ajax({
					url: 'index.php?route=extension/shipping/novaposhta/getNPData&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'action=getSenderContactPersons&filter=' + element.value,
					dataType: 'json',
					success: function (json) {
						var
								html = '<option value=""><?php echo $text_select; ?></option>',
								checked = "<?php echo $novaposhta['sender_contact_person']; ?>";

						for (var i in json) {
							if (json[i]['Ref'] == checked) {
								html += '<option value="' + json[i]['Ref'] + '" selected="selected">' + json[i]['Description'] + ', ' + json[i]['Phones'] + '</option>';
							} else {
								html += '<option value="' + json[i]['Ref'] + '">' + json[i]['Description'] + ', ' + json[i]['Phones'] + '</option>';
							}
						}

						$('#input-sender_contact_person').html(html).selectpicker('refresh').trigger('change');
					}
				});

				break;

			case 'input-sender_region':
				$.ajax({
					url: 'index.php?route=extension/shipping/novaposhta/getNPData&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'action=getCities&filter=' + encodeURIComponent(element.value),
					dataType: 'json',
					success: function (json) {
						if (json instanceof Array) {
							var
									html = '<option value=""><?php echo $text_select; ?></option>',
									subtext,
									option_s;

							for(var i in json) {
								if (!element.value) {
									subtext = ' data-subtext="' + json[i]['region_description'] + '"';
								} else {
									subtext = '';
								}

								if (json[i]['Ref'] == '<?php echo $novaposhta["sender_city"]; ?>') {
									option_s = ' selected="selected"';
								} else {
									option_s = '';
								}

								html += '<option value="' + json[i]['Ref'] + '"' + subtext + option_s + '>' + json[i]['description'] + '</option>'
							}

							$('#input-sender_city').html(html).selectpicker('refresh').trigger('change');
						}
					}
				});

				break;

			case 'input-sender_city':
				$.ajax({
					url: 'index.php?route=extension/shipping/novaposhta/getNPData&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'action=getDepartments&filter=' + encodeURIComponent(element.value),
					dataType: 'json',
					success: function (json) {
						if (json instanceof Array || json instanceof Object) {
							var
									option_s,
									html = '<option value=""><?php echo $text_select; ?></option>';

							for(var i in json) {
								if (json[i]['Ref'] == '<?php echo $novaposhta["sender_department"]; ?>') {
									option_s = ' selected="selected"';
								} else {
									option_s = '';
								}

								html += '<option data-tokens="' + json[i]['Number'] + '" value="' + json[i]['Ref'] + '"' + option_s + '>' + json[i]['description'] + '</option>'
							}

							$('#input-sender_department').html(html).selectpicker('refresh').trigger('change');
						}
					}
				});

				$.ajax({
					url: 'index.php?route=extension/shipping/novaposhta/getNPData&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'action=getAddress&filter=' + encodeURIComponent(element.value) + '&sender=' + encodeURIComponent($('#input-sender').val()),
					dataType: 'json',
					success: function (json) {
						if (json instanceof Array || json instanceof Object) {
							var
									option_s,
									html = '<option value=""><?php echo $text_select; ?></option>';

							for(var i in json) {
								if (json[i]['Ref'] == '<?php echo $novaposhta["sender_address"]; ?>') {
									option_s = ' selected="selected"';
								} else {
									option_s = '';
								}

								html += '<option value="' + json[i]['Ref'] + '"' + option_s + '>' + json[i]['description'] + '</option>'
							}

							$('#input-sender_address').html(html).selectpicker('refresh').trigger('change');
						}
					}
				});

				break;

			case 'input-sender_address_pick_up':
				if ($(element).is(':checked')) {
					$('label[for="input-sender_department"]').parent().fadeOut();
					$('label[for="input-sender_address"]').parent().fadeIn();
					$('#input-sender_address_type').val('Doors');
				} else {
					$('label[for="input-sender_department"]').parent().fadeIn();
					$('label[for="input-sender_address"]').parent().fadeOut();
					$('#input-sender_address_type').val('Warehouse');
				}

				break;

			case 'input-recipient_name':
				$('#input-recipient').val('');

				break;

			case 'input-autodetection_departure_type':
				if ($(element).is(':checked')) {
					$(element).parent().parent().nextAll().fadeOut();
				} else {
					$(element).parent().parent().nextAll().fadeIn();
				}

				break;

			case 'input-print_format':
			case 'input-template_type':
				var
					print_format = $('#input-print_format').val(),
					template_type = $('#input-template_type').val();

					if (print_format == 'mark_85_85' || print_format == 'mark_100_100') {
						$('#input-number_of_copies, #input-template_type').parents('div.form-group').fadeIn();

						if (template_type == 'html') {
							$('#input-print_type, input[id^="input-print_start"]').parents('div.form-group').fadeIn();
						} else {
							$('#input-print_type, input[id^="input-print_start"]').parents('div.form-group').fadeOut();
						}
					} else if (print_format == 'registry') {
						$('#input-number_of_copies, #input-print_type, input[id^="input-print_start"]').parents('div.form-group').fadeOut();
					} else {
						$('#input-number_of_copies, #input-template_type').parents('div.form-group').fadeIn();
						$('#input-print_type, input[id^="input-print_start"]').parents('div.form-group').fadeOut();
					}

				break;

			case 'input-print_type':
				var
						$print_start_1 = $('#div-vertical-1'),
						$print_start_2 = $('#div-vertical-2')

				if (element.value == 'horPrint') {
					$print_start_1.find('label:odd').hide();
					$print_start_1.find('label:even').show();
					$print_start_2.find('label:odd').show();
					$print_start_2.find('label:even').hide();
				} else {
					$print_start_1.find('label:lt(3)').show();
					$print_start_1.find('label:gt(2)').hide();
					$print_start_2.find('label:lt(3)').hide();
					$print_start_2.find('label:gt(2)').show();
				}

				break;
		}
	}

	function update(type) {
		$.ajax({
			url: 'index.php?route=extension/shipping/novaposhta/update&type=' + type + '&token=<?php echo $token; ?>',
			dataType: 'json',
			beforeSend: function () {
				$('#button-update_' + type + ' > i').addClass('fa-spin');
			},
			complete: function () {
				var $alerts = $('.alert-danger, .alert-success');

				$('#button-update_' + type + ' > i').removeClass('fa-spin');

				if ($alerts.length !== 0) {
					setTimeout(function() { $alerts.fadeOut(); },5000);
				}
			},
			success: function (json) {
				if(json['success']) {
					var diff = json['amount'] - $('#td-' + type + '_amount').text();

					$('.container-fluid:eq(1)').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					if (diff > 0) {
						$('#td-' + type + '_amount').append(' <span class="label label-success">+' + diff + '</span>');
					} else if (diff < 0) {
						$('#td-' + type + '_amount').append(' <span class="label label-danger">' + diff + '</span>');
					}
				}

				if(json['error']) {
					$('.container-fluid:eq(1)').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		});
	}

	function addCustomMethod(type) {
		if (type != 'save') {
			$('#input-custom-method-type').val(type);
			$('#modal-custom-method').modal('show');
		} else {
			var
				method_type = $('#input-custom-method-type').val(),
				method_name = $('#input-custom-method-name').val(),
				method_code = $('#input-custom-method-code').val();

			$('label[for=input-' + method_type + '] + div').find('br').before('<div class="checkbox"><label><input type="hidden" name="novaposhta[' + method_type + '][' + method_code + '][code]" value="' + method_code + '" /><input type="hidden" name="novaposhta[' + method_type + '][' + method_code + '][name]" value="' + method_name + '" /><input type="checkbox" name="novaposhta[' + method_type + '][]" value="' + method_code + '" /> ' + method_name + ' <button type="button" class="btn btn-danger btn-xs" onclick="$(this).parents(\'div.checkbox\').remove();"><i class="fa fa-minus-circle" aria-hidden="true"></i></button></label></div>');
		}
	}

	function addTariff(tariff_name) {
		var
				count = $('#table-tariffs-' + tariff_name + ' tbody tr').length + 1,
				row = '<tr>';

		if (tariff_name == 'cod') {
			row += '<td><select name="novaposhta[tariffs][' + tariff_name + '][' + count + '][delivery_type]" class="form-control"><?php foreach ($delivery_types as $v) { ?><option value="<?php echo $v['id']; ?>"><?php echo $v['Description']; ?></option><?php } ?></select></td>';
			row += '<td><select name="novaposhta[tariffs][' + tariff_name + '][' + count + '][calculation_base][]" class="form-control selectpicker" title="<?php echo $text_select; ?>" multiple data-actions-box="true"><?php foreach ($totals as $k => $v) { ?><option value="<?php echo $k; ?>"><?php echo $v; ?></option><?php } ?></select></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][tariff_limit]" value="" class="form-control" /></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][percent]" value="" class="form-control" /></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][fixed_amount]" value="" class="form-control" /></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][minimum_payment]" value="" class="form-control" /></td>';
			row += '<td class="text-center"><button type="button" onclick="$(this).parents(\'tr\').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		} else {
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][weight]" value="" class="form-control" /></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][department]" value="" class="form-control" /></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][city]" value="" class="form-control" /></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][region]" value="" class="form-control" /></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][Ukraine]" value="" class="form-control" /></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][overpay_doors_pickup]" value="" class="form-control" /></td>';
			row += '<td><input type="text" name="novaposhta[tariffs][' + tariff_name + '][' + count + '][overpay_doors_delivery]" value="" class="form-control" /></td>';
			row += '<td class="text-center"><button type="button" onclick="$(this).parents(\'tr\').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		}

		row += '</tr>';

		$('#table-tariffs-' + tariff_name + ' tbody').append(row);

		$('#table-tariffs-' + tariff_name + ' tbody tr:last select.selectpicker').selectpicker('refresh');
	}

	function addTrackingStatus() {
		var
			count = $('#table-tracking_statuses tbody tr').length,
			row = '<tr>';

		row += '<td><select name="novaposhta[settings_tracking_statuses][' + count + '][shipment_statuses][]" class="form-control selectpicker" title="<?php echo $text_select; ?>" data-width="250px" data-dropup-auto="false" multiple><?php foreach ($document_statuses as $document_status) { ?><option value="<?php echo $document_status['StatusId']; ?>"><?php echo $document_status['Description']; ?></option><?php } ?></select></td>';
		row += '<td><select name="novaposhta[settings_tracking_statuses][' + count + '][store_status]" class="form-control"><?php foreach ($order_statuses as $order_status) { ?><option value="<?php echo $order_status["order_status_id"]; ?>"><?php echo $order_status["name"]; ?></option><?php } ?></select></td>';
		row += '<td><div class="input-group"><span class="input-group-btn" style="width: 50%;"><select name="novaposhta[settings_tracking_statuses][' + count + '][implementation_delay][type]" class="form-control"><?php foreach ($time as $k => $v) { ?><option value="<?php echo $k; ?>"><?php echo $v; ?></option><?php } ?></select></span><input type="text" name="novaposhta[settings_tracking_statuses][' + count + '][implementation_delay][value]" value="" class="form-control" /></div></td>';
		row += '<td><div class="row"><label class="col-sm-8"><?php echo $entry_admin_notification; ?></label><div class="col-sm-4"><input type="checkbox" name="novaposhta[settings_tracking_statuses][' + count + '][admin_notification]" data-on="<i class=\'fa fa-check\'></i>" data-off="<i class=\'fa fa-times\'></i>" data-toggle="toggle" data-size="mini" data-onstyle="success" data-offstyle="danger"></div></div><hr><div class="form-group"><label class="col-sm-8"><?php echo $entry_customer_notification; ?></label><div class="col-sm-4"><input type="checkbox" name="novaposhta[settings_tracking_statuses][' + count + '][customer_notification]" data-on="<i class=\'fa fa-check\'></i>" data-off="<i class=\'fa fa-times\'></i>" data-toggle="toggle" data-size="mini" data-onstyle="success" data-offstyle="danger"></div></div><hr><div class="row"><label class="col-sm-8"><?php echo $entry_customer_notification_default; ?></label><div class="col-sm-4"><input type="checkbox" name="novaposhta[settings_tracking_statuses][' + count + '][customer_notification_default]" data-on="<i class=\'fa fa-check\'></i>" data-off="<i class=\'fa fa-times\'></i>" data-toggle="toggle" data-size="mini" data-onstyle="success" data-offstyle="danger"></div></div></td>';
		row += '<td><div class="row"><label class="col-sm-2 control-label"><?php echo $entry_email; ?></label><div class="col-sm-10"><ul class="nav nav-tabs" role="tablist"><?php foreach ($languages as $language) { ?><li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#tracking_statuses_email_' + count + '_<?php echo $language['language_id']; ?>" aria-controls="tracking_statuses_email_' + count + '_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']] ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li><?php } ?> </ul><div class="tab-content"><?php foreach ($languages as $language) { ?><div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="tracking_statuses_email_' + count + '_<?php echo $language['language_id']; ?>"><textarea name="novaposhta[settings_tracking_statuses][' + count + '][email][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_email; ?>" class="form-control summernote"></textarea></div><?php } ?></div></div></div><hr><div class="row"><label class="col-sm-2 control-label"><?php echo $entry_sms; ?></label><div class="col-sm-10"><ul class="nav nav-tabs" role="tablist"><?php foreach ($languages as $language) { ?><li<?php echo ($language_id == $language['language_id']) ? ' class="active"' : '' ?>><a href="#tracking_statuses_sms_' + count + '_<?php echo $language['language_id']; ?>" aria-controls="tracking_statuses_sms_' + count + '_<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="<?php echo $language_flag[$language['language_id']] ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li><?php } ?> </ul><div class="tab-content"><?php foreach ($languages as $language) { ?><div role="tabpanel" class="tab-pane<?php echo ($language_id == $language['language_id']) ? ' active' : '' ?>" id="tracking_statuses_sms_' + count + '_<?php echo $language['language_id']; ?>"><textarea name="novaposhta[settings_tracking_statuses][' + count + '][sms][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_sms; ?>"class="form-control"></textarea></div><?php } ?></div></div></div></td>';
		row += '<td class="text-center"><button type="button" onclick="$(this).parents(\'tr\').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		row += '</tr>';

		$('#table-tracking_statuses tbody').append(row);

		$('#table-tracking_statuses tbody tr:last select.selectpicker').selectpicker('refresh');
		$('#table-tracking_statuses tbody tr:last input[type="checkbox"]').bootstrapToggle();
		$('#table-tracking_statuses tbody tr:last textarea.summernote').summernote();
	}

	function generateKey() {
		$.ajax({
			url: 'index.php?route=extension/shipping/novaposhta/generateKey&token=<?php echo $token; ?>',
			dataType: 'json',
			beforeSend: function () {
				$('#button-generate-cron-key > i').addClass('fa-spin');
			},
			complete: function () {
				$('#button-generate-cron-key > i').removeClass('fa-spin');
			},
			success: function (json) {
				if (json['code']) {
					$('#input-key_cron').val(json['code'])
				}
			}
		});
	}

	function copyToClipboard(container_id) {
		window.getSelection().removeAllRanges();

		if (document.selection) {
			var
				range = document.body.createTextRange(),
				el = document.getElementById(container_id);

			range.moveToElementText(el);
			range.select().createTextRange();
			document.execCommand('Copy');
		} else if (window.getSelection) {
			var
				range = document.createRange(),
				el = document.getElementById(container_id);

			range.selectNode(el);
			window.getSelection().addRange(range);
			document.execCommand('Copy');
		}
	}

	$(function() {
		$('.selectpicker').selectpicker({
			liveSearchStyle: 'startsWith',
			iconBase: 'fa',
			tickIcon: 'fa-check'
		});

		$('.summernote').summernote();

		$.ajaxSetup({
			beforeSend: function () {
				$('body').fadeTo('fast', 0.7).prepend('<div id="ocmax-loader" style="position: fixed; top: 50%;	left: 50%; z-index: 9999;"><i class="fa fa-spinner fa-spin fa-3x fa-fw"></i></div>');
			},
			complete: function () {
				var $alerts = $('.alert-danger, .alert-success');

				if ($alerts.length !== 0) {
					setTimeout(function() { $alerts.fadeOut(); }, 5000);
				}

				$('body').fadeTo('fast', 1);
				$('#ocmax-loader').remove();
			},
			error: function (jqXHR, textStatus, errorThrown) {
				console.log(textStatus);
			}
		});


		$('#input-department_cost, #input-doors_cost, #input-poshtomat_cost, #input-sender_region, input[id^="input-sender_address_pick_up"]:checked, #input-autodetection_departure_type, #input-calculate_volume, #input-print_format, #input-print_type').each(function() {
			formHandler(this);
		});

		$('input, select, textarea').on('change', function(e) {
			formHandler(e.currentTarget);
		});

		$('#div-vertical-1, #div-vertical-2').on('click', function (e) {
			$('#div-vertical-1, #div-vertical-2').not('#' + e.currentTarget.id).find('label').removeClass('active').find('input').removeAttr('checked');
		});

		/* Recipient */
		$('#input-recipient_name').autocomplete({
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=extension/shipping/novaposhta/autocomplete&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'recipient_name=' + encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['FullDescription'],
								value: item['Description'],
								ref: item['Ref']
							}
						}));
					}
				});
			},
			select: function(item) {
				$(this).val(item['value']);
				$(this).siblings('input[type="hidden"]').val(item['ref']);
			}
		});

		/* Departure description */
		$('#input-departure_description').autocomplete({
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=extension/shipping/novaposhta/autocomplete&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'departure_description=' + encodeURIComponent(request),
					dataType: 'json',
					beforeSend: function () {
					},
					complete: function () {
					},
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['Description'],
								value: item['Description'],
							}
						}));
					}
				});
			},
			select: function(item) {
				$(this).val(item['value']);
			}
		});
	});
//--></script>     
<?php echo $footer; ?> 