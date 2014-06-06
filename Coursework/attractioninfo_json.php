<?php

		    // Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			//Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
			
		
			
	//header("Content-type: application/json");
	$jsonresponse='{"attractionsarray":[';	
	
	
	$attractionsarray = StatesCollection::GetAttractionDetails($_GET['state_abbreviation']);
	
	foreach($attractionsarray as $state_abbreviation)				
	{
		
		
		$state_abbreviation=$attractionsarray['state_abbreviation'];	
		$attraction_name=$attractionsarray['attraction_name'];
		$attraction_lat=$attractionsarray['attraction_lat'];
		$attraction_long=$attractionsarray['attraction_long'];
		$attraction_image="./images/".$attractionsarray['attraction_image'];
		
		
		
		$jsonresponse .= '{"state_abbreviation":"' . $state_abbreviation. '", ';
		$jsonresponse .= '"attraction_name":"' . $attraction_name. '", ';
		$jsonresponse .= '"attraction_lat":"' . $attraction_lat . '",';
		$jsonresponse .= '"attraction_long":"' . $attraction_long. '", ';
		$jsonresponse .= '"attraction_image":"' . $attraction_image . '"}, ';	
			
						
	}
	
		
	

	

	$jsonresponse .= ']}';
	echo $jsonresponse;
?>		

