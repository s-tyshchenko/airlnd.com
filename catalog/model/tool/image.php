<?php
class ModelToolImage extends Model {
	public function resize($filename, $width, $height) {
		if (!is_file(DIR_IMAGE . $filename)) {
			if (is_file(DIR_IMAGE . 'no_image.jpg')) {
				$filename = 'no_image.jpg';
			} elseif (is_file(DIR_IMAGE . 'no_image.png')) {
				$filename = 'no_image.png';
			} else {
				return;
			}
		}

		$extension = pathinfo($filename, PATHINFO_EXTENSION);

		$image_old = $filename;
		$image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . (int)$width . 'x' . (int)$height . '.' . $extension;
        $image_new_webp = 'cachewebp/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . (int)$width . 'x' . (int)$height . '.webp';

		if (!is_file(DIR_IMAGE . $image_new) || (filectime(DIR_IMAGE . $image_old) > filectime(DIR_IMAGE . $image_new))) {
			list($width_orig, $height_orig, $image_type) = getimagesize(DIR_IMAGE . $image_old);

			if (!in_array($image_type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF)) && $image_type) {
				return DIR_IMAGE . $image_old;
			}

			$path = '';

			$directories = explode('/', dirname($image_new));

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;

				if (!is_dir(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}
			}

			if ($width_orig != $width || $height_orig != $height) {
				$image = new Image(DIR_IMAGE . $image_old);
				$image->resize($width, $height);
				$image->save(DIR_IMAGE . $image_new);
			} else {
				copy(DIR_IMAGE . $image_old, DIR_IMAGE . $image_new);
			}
		}

        $gd = gd_info();
        if ($gd['WebP Support']) {
            if (!is_file(DIR_IMAGE . $image_new_webp) || (filectime(DIR_IMAGE . $image_new) > filectime(DIR_IMAGE . $image_new_webp))) {

                $path = '';

                $directories = explode('/', dirname($image_new_webp));

                foreach ($directories as $directory) {
                    $path = $path . '/' . $directory;

                    if (!is_dir(DIR_IMAGE . $path)) {
                        @mkdir(DIR_IMAGE . $path, 0777);
                    }
                }

                $image_webp = new Image(DIR_IMAGE . $image_old);
                $image_webp->resize($width, $height);
                $image_webp->save_webp(DIR_IMAGE . $image_new_webp);
            }
        }

		$imagepath_parts = explode('/', $image_new);
		$new_image = implode('/', array_map('rawurlencode', $imagepath_parts));

		if (mime_content_type(DIR_IMAGE . $image_old) != 'image/svg+xml' && in_array($extension, array('svg', 'SVG'))) {
			$dom = new DOMDocument;
			$dom->loadXML(file_get_contents(DIR_IMAGE . $image_old));

			if ($dom) {
				$svg = simplexml_import_dom($dom);
			}
		} elseif (mime_content_type(DIR_IMAGE . $image_old) == 'image/svg+xml') {
			$svg = simplexml_load_file(DIR_IMAGE . $image_old);
		}

		if (isset($svg)) {
			if ($svg['width'] && $svg['height']) {
				$width_orig = (string)$svg['width'];
				$height_orig = (string)$svg['height'];

				if (is_numeric($width_orig) && is_numeric($height_orig)) {
					$width_orig = (string)$svg['width'];
					$height_orig = (string)$svg['height'];
				} elseif (substr($width_orig, -2) == 'px' && substr($height_orig, -2) == 'px') {
					$width_orig = str_replace('px', '', $width_orig);
					$height_orig = str_replace('px', '', $height_orig);

					if (!is_numeric($width_orig) && !is_numeric($height_orig)) {
						$width_orig = '';
						$height_orig = '';
					}
				}
			} elseif ($svg['viewBox']) {
				$viewbox = explode(' ', $svg['viewBox']);

				$height_orig = array_pop($viewbox);
				$width_orig = array_pop($viewbox);
			} else {
				$width_orig = '';
				$height_orig = '';
			}

			if (($width_orig && $height_orig) && ($width_orig != $width || $height_orig != $height)) {
				$scale_w = $width / $width_orig;
				$scale_h = $height / $height_orig;

				$scale = min($scale_w, $scale_h);

				$new_width = (int)($width_orig * $scale);
				$new_height = (int)($height_orig * $scale);

				$svg['width'] = $new_width;
				$svg['height'] = $new_height;

				$svg->asXML(DIR_IMAGE . $image_new);
			} else {
				$svg['width'] = $width;
				$svg['height'] = $height;

				$svg->asXML(DIR_IMAGE . $image_new);
			}
		}
      
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			return $this->config->get('config_ssl') . 'image/' . $new_image;
		} else {
			return $this->config->get('config_url') . 'image/' . $new_image;
		}
	}
	
	public function responsive_resize($filename, $width, $height) {
		if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
			return;
		} 
		
		$info = pathinfo($filename);
		$extension = $info['extension'];
		
		$image_old = $filename;
		
		// Gif Fix
		if ($extension != 'gif') {
			$image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . (int)$width . 'x' . (int)$height . '.' . $extension;
		} else {
			$image_new = $image_old;
		}
        $image_new_webp = 'cachewebp/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . (int)$width . 'x' . (int)$height . '.webp';


        if (!file_exists(DIR_IMAGE . $image_new) || (filemtime(DIR_IMAGE . $image_old) > filemtime(DIR_IMAGE . $image_new))) {
			$path = '';
			
			$directories = explode('/', dirname(str_replace('../', '', $image_new)));
			
			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;
				
				if (!file_exists(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}		
			}
			
			$image = new Image(DIR_IMAGE . $image_old);
			$image->responsive_resize($width, $height);
			$image->save(DIR_IMAGE . $image_new);
		}

        $gd = gd_info();
        if ($gd['WebP Support']) {
            if (!is_file(DIR_IMAGE . $image_new_webp) || (filectime(DIR_IMAGE . $image_new) > filectime(DIR_IMAGE . $image_new_webp))) {

                $path = '';

                $directories = explode('/', dirname($image_new_webp));

                foreach ($directories as $directory) {
                    $path = $path . '/' . $directory;

                    if (!is_dir(DIR_IMAGE . $path)) {
                        @mkdir(DIR_IMAGE . $path, 0777);
                    }
                }

                $image_webp = new Image(DIR_IMAGE . $image_old);
                $image_webp->resize($width, $height);
                $image_webp->save_webp(DIR_IMAGE . $image_new_webp);
            }
        }

		$imagepath_parts = explode('/', $image_new);
		$image_new = implode('/', array_map('rawurlencode', $imagepath_parts));


		if (mime_content_type(DIR_IMAGE . $image_old) != 'image/svg+xml' && in_array($extension, array('svg', 'SVG'))) {
			$dom = new DOMDocument;
			$dom->loadXML(file_get_contents(DIR_IMAGE . $image_old));

			if ($dom) {
				$svg = simplexml_import_dom($dom);
			}
		} elseif (mime_content_type(DIR_IMAGE . $image_old) == 'image/svg+xml') {
			$svg = simplexml_load_file(DIR_IMAGE . $image_old);
		}

		if (isset($svg)) {
			if ($svg['width'] && $svg['height']) {
				$width_orig = (string)$svg['width'];
				$height_orig = (string)$svg['height'];

				if (is_numeric($width_orig) && is_numeric($height_orig)) {
					$width_orig = (string)$svg['width'];
					$height_orig = (string)$svg['height'];
				} elseif (substr($width_orig, -2) == 'px' && substr($height_orig, -2) == 'px') {
					$width_orig = str_replace('px', '', $width_orig);
					$height_orig = str_replace('px', '', $height_orig);

					if (!is_numeric($width_orig) && !is_numeric($height_orig)) {
						$width_orig = '';
						$height_orig = '';
					}
				}
			} elseif ($svg['viewBox']) {
				$viewbox = explode(' ', $svg['viewBox']);

				$height_orig = array_pop($viewbox);
				$width_orig = array_pop($viewbox);
			} else {
				$width_orig = '';
				$height_orig = '';
			}

			if (($width_orig && $height_orig) && ($width_orig != $width || $height_orig != $height)) {
				$scale_w = $width / $width_orig;
				$scale_h = $height / $height_orig;

				$scale = min($scale_w, $scale_h);

				$new_width = (int)($width_orig * $scale);
				$new_height = (int)($height_orig * $scale);

				$svg['width'] = $new_width;
				$svg['height'] = $new_height;

				$svg->asXML(DIR_IMAGE . $image_new);
			} else {
				$svg['width'] = $width;
				$svg['height'] = $height;

				$svg->asXML(DIR_IMAGE . $image_new);
			}
		}
      
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			return $this->config->get('config_ssl') . 'image/' . $image_new;
		} else {
			return $this->config->get('config_url') . 'image/' . $image_new;
		}	
	}
}
