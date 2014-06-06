<?php
			// Include utility files
			require_once 'include/config.php';	
				
			// Load the database handler
			require_once BUSINESS_DIR . 'database_handler.php'; 

			// Load Business Tier
			require_once BUSINESS_DIR . 'statescollection.php';
	
			//$obj = StatesCollection::GetStates();
			//$obj = StatesCollection::GetStateDetails('CA');	
			//$obj = StatesCollection::GetStateDetailsByStateName('Alaska');		
			//$obj = StatesCollection::GetStateCities('CA');	
			//$obj = StatesCollection::GetStateAttractions('CA');	
			//$obj = StatesCollection::GetStatePersons('CA');			
			//$obj = StatesCollection::GetCityAttractions(3);
			//$obj = StatesCollection::GetCities();
			//$obj = StatesCollection::GetAttractions();
			//$obj = StatesCollection::GetPersons();	
			//$obj = StatesCollection::GetUsers();
			//$obj = StatesCollection::GetCityDetails(3);
			//$obj = StatesCollection::GetCityDetailsByCityName('Do');
			//$obj = StatesCollection::GetAttractionDetails(11);	
			//$obj = StatesCollection::GetAttractionDetailsByAttractionName('Zoo');	
			//$obj = StatesCollection::GetPersonDetails(23);
			//$obj = StatesCollection::GetPersonDetailsByPersonName('John');	
			//$obj = StatesCollection::GetUserDetails(5);
			//$obj = StatesCollection::GetUserDetailsByUserName('Joni');	
			//$obj = StatesCollection::GetUserHighestScoreByUserName('Joni');
			//$obj = StatesCollection::GetHighestScores();	
			//$obj = StatesCollection::GetCategoryPersons('Musician');	
			//StatesCollection::AddState('FL', 'Florida', 'florida_flag.jpg', 'florida_image.jpg', 'Tallahassee');
			//$obj = StatesCollection::GetStates();
			//StatesCollection::AddCity('Tallahassee', 'FL', 30.438256, -84.280733, 'tallahassee_fl.jpg');
			//$obj = StatesCollection::GetStateCities('FL');
			//StatesCollection::AddAttraction('Florida Keys', 'FL', null, 24.555736, -81.782654, 'floridakeys.jpg');
			//$obj = StatesCollection::GetStateAttractions('FL');	
			//StatesCollection::AddPerson('Johnny Depp', 'FL', 'Actor', 'johnnydepp.jpg', 'Don Juan De Marco');
			//$obj = StatesCollection::GetStatePersons('FL');	
			//StatesCollection::AddUser('Johnny Depp', 'Don Juan De Marco');
			//$obj = StatesCollection::GetUsers();
			//StatesCollection::UpdateState('DE', 'Delaware', 'delaware_flag.jpg', 'delaware_image.jpg', 'Dover');
			//$obj = StatesCollection::GetStateDetails('DE');
			//StatesCollection::UpdateCity(23, 'Dover', 'DE', 39.158169, -75.524368, 'dover_de.jpg');
			//$obj = StatesCollection::GetCityDetails(23);
			//StatesCollection::UpdateAttraction(38, 'Frightland', 'DE', null, 39.524883, -75.648445, 'frightland.jpg');
			//$obj = StatesCollection::GetAttractionDetails(38);	
			//StatesCollection::UpdatePerson(38, 'Judge Reinhold', 'Actor', 'judgereinhold.jpg', 'Comedy');
			//$obj = StatesCollection::GetPersonDetails(38);	
			//StatesCollection::AddPersonState(40, 'CA');
			//$obj = StatesCollection::GetStatePersons('CA');		
			//StatesCollection::UpdateUser(8, 'Johnny Depp', 'Scissorhands', 5);
			//$obj = StatesCollection::GetUserDetails(8);
			//StatesCollection::UpdateUserHighestScore(8, 0);
			//$obj = StatesCollection::GetUserDetails(8);			
			$username = 'Bobby'; //$_POST['username'];
			$password = 'Cat'; //$_POST['password'];
			$obj = StatesCollection::CheckLogin($username, $password);			
			echo json_encode( (array) $obj );
?>		