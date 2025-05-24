<?php
class Pagination {
	public $total = 0;
	public $page = 1;
	public $limit = 20;
	public $num_links = 5;
	public $url = '';
	public $text_first = '|&lt;';
	public $text_last = '&gt;|';
	public $text_next = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none">
	  <rect width="24" height="24"/>
	  <path fill-rule="evenodd" clip-rule="evenodd" d="M14.9947 10.9951C15.1821 11.1826 15.2875 11.4369 15.2875 11.7021C15.2875 11.9672 15.1821 12.2215 14.9947 12.4091L10.4017 17.0021C10.2154 17.1846 9.96458 17.2863 9.70375 17.285C9.44292 17.2837 9.19315 17.1795 9.00871 16.995C8.82428 16.8106 8.72008 16.5608 8.71876 16.3C8.71745 16.0392 8.81911 15.7884 9.00168 15.6021L12.9017 11.7021L9.00168 7.80207C8.81911 7.61578 8.71745 7.36497 8.71876 7.10414C8.72008 6.84331 8.82428 6.59354 9.00871 6.4091C9.19315 6.22467 9.44292 6.12047 9.70375 6.11915C9.96458 6.11784 10.2154 6.21951 10.4017 6.40207L14.9947 10.9951Z" fill="#111111"/>
	</svg>';
	public $text_prev = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none">
	  <rect width="24" height="24"/>
	  <path fill-rule="evenodd" clip-rule="evenodd" d="M9.0047 10.9951L13.5977 6.40205C13.6893 6.3086 13.7985 6.23422 13.919 6.18324C14.0395 6.13225 14.1689 6.10565 14.2998 6.10499C14.4306 6.10433 14.5603 6.12962 14.6813 6.17939C14.8023 6.22915 14.9123 6.30242 15.0048 6.39494C15.0973 6.48747 15.1706 6.59742 15.2204 6.71844C15.2701 6.83945 15.2954 6.96913 15.2948 7.09998C15.2941 7.23083 15.2675 7.36025 15.2165 7.48076C15.1655 7.60126 15.0912 7.71047 14.9977 7.80205L11.0977 11.7021L14.9977 15.6021C15.1803 15.7883 15.2819 16.0392 15.2806 16.3C15.2793 16.5608 15.1751 16.8106 14.9907 16.995C14.8062 17.1795 14.5565 17.2837 14.2956 17.285C14.0348 17.2863 13.784 17.1846 13.5977 17.0021L9.0047 12.4101C8.81723 12.2225 8.71191 11.9682 8.71191 11.7031C8.71191 11.4379 8.81723 11.1836 9.0047 10.9961V10.9951Z" fill="#828282"/>
	</svg>';

	public function render() {
		$total = $this->total;

		if ($this->page < 1) {
			$page = 1;
		} else {
			$page = $this->page;
		}

		if (!(int)$this->limit) {
			$limit = 10;
		} else {
			$limit = $this->limit;
		}

		$num_links = $this->num_links;
		$num_pages = ceil($total / $limit);

		$this->url = str_replace('%7Bpage%7D', '{page}', $this->url);

		$output = '<ul class="pagination">';

		/* if ($page > 1) {			
			if ($page - 1 === 1) {
                $output .= '<li class="page-item"><a class="page-link" href="' . str_replace(array('&amp;page={page}', '?page={page}', '&page={page}'), '', $this->url) . '">' . $this->text_prev . '</a></li>';
			} else {
				$output .= '<li class="page-item"><a class="page-link" href="' . str_replace('{page}', $page - 1, $this->url) . '">' . $this->text_prev . '</a></li>';
			}
		} */
		if ($page > 1) { //Если номер текущей страницы больше 1
 
			if ($page - 1 === 1) { //Если при этом предыдущая страница, относительно текущей, имеет номер 1
			  $output .= '<li class="page-item"><a class="page-link" href="' . str_replace(array('&page={page}', '&page={page}'), '', $this->url) . '">' . $this->text_prev . '</a></li>'; //Выводится кнопка "назад" с ссылкой на 1ю страницу
			} else {
			  $output .= '<li class="page-item"><a class="page-link" href="' . str_replace('{page}', $page - 1, $this->url) . '">' . $this->text_prev . '</a></li>'; //Выводится кнопка "назад" с ссылкой на предыдущую страницу
			}
			
			if( $page >= ($num_links - 1) ){ //Если текущая страница больше или равна количеству выводимых ссылок - 1 (в данном случае >=5)
			  $output .= '<li class="page-item"><a class="page-link" href="' . str_replace('{page}', '&page={page}', $this->url) . '">' . '1' . '</a></li>'; //Выводим ссылку на первую страницу
			  $output .= '<li class="page-item disabled"><span class="page-link">' . '...' . '</span></a></li>'; //Выводим многоточие
			}
		 
		  }

		if ($num_pages > 1) {
			if ($num_pages <= $num_links) {
				$start = 1;
				$end = $num_pages;
			} else {
				$start = $page - floor($num_links / 2);
				$end = $page + floor($num_links / 2);

				if ($start < 1) {
					$end += abs($start) + 1;
					$start = 1;
				}

				if ($end > $num_pages) {
					$start -= ($end - $num_pages);
					$end = $num_pages;
				}
			}

			for ($i = $start; $i <= $end; $i++) {
				if ($page == $i) {
					$output .= '<li class="page-item active"><span class="page-link">' . $i . '</span></li>';
				} else {
					if ($i === 1) {
                        $output .= '<li class="page-item"><a class="page-link" href="' . str_replace(array('&amp;page={page}', '?page={page}', '&page={page}'), '', $this->url) . '">' . $i . '</a></li>';
					} else {
						$output .= '<li class="page-item"><a class="page-link" href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a></li>';
					}
				}
			}
		}

		/* if ($page < $num_pages) {
			$output .= '<li class="page-item"><a class="page-link" href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a></li>';
		} */
		if ($page < $num_pages) { // Если номер текущей страницы меньше, чем всего страниц
			if ( ($num_pages - $num_links + 1) < $page){ // Если (всего страниц - количество выводимых ссылок + 1) меньше, чем номер текущей страницы
			  $output .= '<li class="page-item"><a class="page-link" href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a></li>'; //Выводим кнопку "далее"
			}
			else {
			  $output .= '<li class="page-item disabled"><span class="page-link">' . '...' . '</span></a></li>'; //Выводим многоточие
			  $output .= '<li class="page-item"><a class="page-link" href="' . str_replace('{page}', $num_pages, $this->url) . '">' . $num_pages . '</a></li>'; //Выводим ссылку на последнюю страницу
			  $output .= '<li class="page-item"><a class="page-link" href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a></li>'; //Выводим кнопку "далее"
			}
		}

		$output .= '</ul>';

		if ($num_pages > 1) {
			return $output;
		} else {
			return '';
		}
	}
}