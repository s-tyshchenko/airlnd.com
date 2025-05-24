<?php
class ModelCheckoutQuickCheckout extends Model {
    	
	/* Nova Poshta */
	public function __construct($registry) {
		parent::__construct($registry);
		$this->load->helper('novaposhta');
		$registry->set('novaposhta', new NovaPoshta($registry));
	}
    
    public function getNovaPoshtaCities($cityName) {		
		//print_r(get_class_methods($this->novaposhta));
		
        $values = array(
            array(
                'id'   => '', 
                'text' => $this->language->get('text_select')
            )
        );
		
		$results = $this->novaposhta->getCitiesWithAreasByCityName($cityName);

        foreach ($results as $result) {
            $values[] = array(
                'id'   => $result['Description'], 
                'text' => $result['Description']
            );
        }

        if (!$results) {
            $values[] = array(
                'id'   => 0, 
                'text' => $this->language->get('text_none')
            );
        }
        
        return $values;
    }
    
    public function getNovaPoshtaWarehouses($cityName) {
        $values = array(
            array(
                'id'   => '', 
                'text' => $this->language->get('text_select')
            )
        );
        
        $results = $this->novaposhta->getWarehousesByCityName($cityName);	

        foreach ($results as $result) {
            $values[] = array(
                'id'   => $result['Description'], 
                'text' => $result['Description']
            );
        }

        if (!$results) {
            $values[] = array(
                'id'   => 0, 
                'text' => $this->language->get('text_none')
            );
        }

        return $values;
    }
    
    /* Nova Poshta */
}