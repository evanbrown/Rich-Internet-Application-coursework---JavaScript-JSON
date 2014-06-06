<?php
			// Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			// Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
			
			$jsonresponse='{"personarray":[';
			$peoplearray = StatesCollection::GetPersons();
			
			
			foreach($peoplearray as $key => $row)				
			{
				$person_id=$row['person_id'];
				$person_name=$row['person_name'];
				$person_category=$row['person_category'];
				$person_image="./images/".$row['person_image'];
				$person_story=$row['person_story'];
				
				
				$jsonresponse .= '{"person_id":"' . $person_id . '",';
				$jsonresponse .= '"person_name":"' . $person_name . '",';
				$jsonresponse .= '"person_category":"' . $person_category . '",';
				$jsonresponse .= '"person_image":"' . $person_image. '",';
				$jsonresponse .= '"person_story":"' . $person_story . '"},';
			}
			$jsonresponse .= ']}';
			echo $jsonresponse;
?>		
