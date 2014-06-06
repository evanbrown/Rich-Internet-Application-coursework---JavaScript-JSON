<?php
			// Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			// Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
			
			$jsonresponse='{"statesarray":[';
			$statesarray = StatesCollection::GetStates();
			
			
			foreach($statesarray as $key => $row)				
			{
				$state_id=$key+1;
				$state_abbreviation=$row['state_abbreviation'];
				$state_name=$row['state_name'];		
				
				$jsonresponse .= '{"state_id":"' . $state_name . '",';
				$jsonresponse .= '"state_abbreviation":"' . $state_abbreviation . '",';
				$jsonresponse .= '"state_name":"' . $state_name . '"},';
			}
			$jsonresponse .= ']}';
			echo $jsonresponse;
?>		
