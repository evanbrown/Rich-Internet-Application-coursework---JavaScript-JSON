<?php
			// Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			// Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
	
			$obj1 = (array) StatesCollection::GetStateImages($_GET["state"]);
			$obj2 = (array) StatesCollection::GetRandomStateImages($_GET["state"]);
			$obj = array_merge($obj1, $obj2);
			echo json_encode( (array) $obj );
?>		