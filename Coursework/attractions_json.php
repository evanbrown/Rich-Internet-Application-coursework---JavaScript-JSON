<?php
			// Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			// Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
			
			$jsonresponse='{"attractionsarray":[';
			$attractionsarray = StatesCollection::GetAttractions();
			
			
			foreach($attractionsarray as $key => $row)				
			{
			
				$attraction_id=$row['attraction_id'];
				$attraction_name=$row['attraction_name'];
				$state_abbreviation =$row['state_abbreviation'];


			
				
				
				$jsonresponse .= '{"attraction_id":"'. $attraction_id .'",';
				$jsonresponse .= '"attraction_name":"'. $attraction_name .'",';
				$jsonresponse .= '"state_abbreviation":"'. $state_abbreviation .'"},';

			}
			$jsonresponse .= ']}';
			echo $jsonresponse;
?>		
