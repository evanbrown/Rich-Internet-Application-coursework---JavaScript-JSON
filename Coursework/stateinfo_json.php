<?php

		    // Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			//Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
			
		
			
	//header("Content-type: application/json");
	$jsonresponse='{"statesarray":[';	
	
	
	
	
	   if (isset($_GET['state_abbreviation']))
	{
		$statesarray = StatesCollection::GetStateDetails($_GET['state_abbreviation']);
		
		foreach($statesarray as $state_abbreviation)				
	{
		
		$state_abbreviation=$statesarray['state_abbreviation'];
		$state_name=$statesarray['state_name'];
		$state_flag="./images/".$statesarray['state_flag'];
		$state_image="./images/".$statesarray['state_image'];
		$state_capital=$statesarray['state_capital'];
		
		
		
		$jsonresponse .= '{"state_abbreviation":"' . $state_abbreviation . '", ';
		$jsonresponse .= '"state_name":"' . $state_name. '",';
		$jsonresponse .= '"state_flag":"' . $state_flag. '", ';
	    $jsonresponse .= '"state_image":"' . $state_image. '", ';	
		$jsonresponse .= '"state_capital":"' . $state_capital. '"},';
		
	}
		
		$statesarray = StatesCollection::GetStateCities($_GET['state_abbreviation']);
		
		foreach($statesarray as $city)				
	{
		
		$city_id=$city['city_id'];
		$city_name=$city['city_name'];
		$state_abbreviation=$city['state_abbreviation'];
		//$city_lat=$citiesarray['city_lat'];
		//$city_long=$citiesarray['city_long'];
		//$city_image="./images/".$citiesarray['city_image'];
		
		
		
		$jsonresponse .= '{"city_id":"' . $city_id. '", ';
		$jsonresponse .= '"city_name":"' . $city_name. '",';
		$jsonresponse .= '"state_abbreviation":"' . $state_abbreviation. '"}, ';
	    //$jsonresponse .= '"city_long":"' . $city_long. '", ';	
		//$jsonresponse .= '"state_capital":"' . $state_capital. '", ';
		//$jsonresponse .= '"city_image":"' . $city_image. '"},';
		
	}
	$statesarray = StatesCollection::GetStateAttractions($_GET['state_abbreviation']);
		
		foreach($statesarray as $attraction)				
	{
		
		$attraction_id=$attraction['attraction_id'];
		$attraction_name=$attraction['attraction_name'];
		$state_abbreviation=$attraction['state_abbreviation'];
		
		
		
		$jsonresponse .= '{"attraction_id":"' . $attraction_id. '", ';
		$jsonresponse .= '"attraction_name":"' . $attraction_name. '",';
		$jsonresponse .= '"state_abbreviation":"' . $state_abbreviation. '"}, ';
	   
		
	}
	
	
	}
	
	$jsonresponse .= ']}';
	echo $jsonresponse;
?>		

