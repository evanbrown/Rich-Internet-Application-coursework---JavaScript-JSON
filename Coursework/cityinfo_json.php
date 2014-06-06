<?php

		    // Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			//Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
			
		
			
	//header("Content-type: application/json");
	$jsonresponse='{"citiesinfoarray":[';	
	
	
	
	
	  // if (isset($_GET['state_abbreviation']))
	//{
		$citiesarray = StatesCollection::GetCityDetails($_GET['city_id']);
		
		//foreach($citiesarray as $state_abbreviation)				
	//{
		
		
		$state_abbreviation=$citiesarray['state_abbreviation'];	
		$city_id = $citiesarray['city_id'];
		$city_name=$citiesarray['city_name'];
		$city_lat=$citiesarray['city_lat'];
		$city_long=$citiesarray['city_long'];
		$city_image=$citiesarray['city_image'];
		
		
			
		
		$jsonresponse .= '{"city_id":"' . $city_id. '", ';	
		$jsonresponse .= '"city_image":"' . $city_image . '", ';
		$jsonresponse .= '"city_lat":"' . $city_lat . '", ';
		$jsonresponse .= '"city_long":"' . $city_long . '", ';
		$jsonresponse .= '"state_abbreviation":"' . $state_abbreviation . '", ';
		
		$attractionsarray = StatesCollection::GetCityAttractions($city_id);

		if(sizeof($attractionsarray) > 0){
			$jsonresponse .= '"city_name":"' . $city_name . '", ';
			$jsonresponse .= '"attraction_name":"';
		}else{
			$jsonresponse .= '"city_name":"' . $city_name . '"}, ';
		}
			
		foreach($attractionsarray as $attraction)				
		{
			
			
			$attraction_name=$attraction['attraction_name'];
			
			
			
			$jsonresponse .=$attraction_name;
			
			
			if($attraction !== end($attractionsarray)){
				$jsonresponse .= ', ';
			}else{
				$jsonresponse .= '"}';
			}
		   
			
		}
			
						
	//}
	

	//}
	

	$jsonresponse .= ']}';
	echo $jsonresponse;
?>		

