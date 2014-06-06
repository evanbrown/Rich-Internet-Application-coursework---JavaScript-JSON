<?php
			// Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			// Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
			
			$jsonresponse='{"citiesarray":[';
			$citiesarray = StatesCollection::GetCities();
			
			
			foreach($citiesarray as $key => $row)				
			{
			
				$city_id=$row['city_id'];
				$city_name=$row['city_name'];
				//$state_abbreviation=$row['state_abbreviation'];			
				
				
				$jsonresponse .= '{"city_id":"'. $city_id .'",';
				//$jsonresponse .= '"state_abbreviation":"'. $state_abbreviation .'",';			
				$jsonresponse .= '"city_name":"'. $city_name.'"},';
			}
			$jsonresponse .= ']}';
			echo $jsonresponse;
?>		
