<?php

		    // Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			//Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
			
		
			
	//header("Content-type: application/json");
	$jsonresponse='{"personarray":[';	
	
	
	
	
	   if (isset($_GET['person_id']))
	{
		$personarray = StatesCollection::GetPersonDetails($_GET['person_id']);
		
		foreach($personarray as $person_id)				
	{
		
		$person_id=$personarray['person_id'];
		$person_name=$personarray['person_name'];
		$person_category=$personarray['person_category'];
		$person_image="./images/".$personarray['person_image'];
		$person_story=$personarray['person_story'];
		
		
		
		$jsonresponse .= '{"person_id":"' . $person_id . '", ';
		$jsonresponse .= '"person_name":"' . $person_name. '",';
		$jsonresponse .= '"person_category":"' . $person_category. '", ';
	    $jsonresponse .= '"person_image":"' . $person_image. '", ';	
		$jsonresponse .= '"person_story":"' . $person_story. '"},';
		
	}
	}
	

	$jsonresponse .= ']}';
	echo $jsonresponse;
?>		

