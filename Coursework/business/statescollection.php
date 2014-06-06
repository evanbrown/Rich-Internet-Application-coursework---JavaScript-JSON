<?php
// Business tier class for reading music collection information

class StatesCollection
{
	// Retrieves all states
	public static function GetStates()
	{
		// Build SQL query
		$sql = 'CALL states2014_get_states()';

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql);
	}

	// Retrieves state details
	public static function GetStateDetails($stateAbbreviation)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_state_details(:state_abbreviation)';

		// Build the parameters array
		$params = array (':state_abbreviation' => $stateAbbreviation);

		// Execute the query and return the results
		return DatabaseHandler::GetRow($sql, $params);
	}
	
	// Retrieves state images
	public static function GetStateImages($stateAbbreviation)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_state_images(:state_abbreviation)';

		// Build the parameters array
		$params = array (':state_abbreviation' => $stateAbbreviation);

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}
	
	// Retrieves state images
	public static function GetRandomStateImages($stateAbbreviation)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_random_state_images(:state_abbreviation)';

		// Build the parameters array
		$params = array (':state_abbreviation' => $stateAbbreviation);

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}	
	
	// Retrieves state details by state name
	public static function GetStateDetailsByStateName($stateName)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_state_details_by_statename(:state_name)';

		// Build the parameters array
		$params = array (':state_name' => $stateName);

		// Execute the query and return the results
		return DatabaseHandler::GetRow($sql, $params);
	}	
	
	// Retrieves state cities
	public static function GetStateCities($stateAbbreviation)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_state_cities(:stateAbbreviation)';

		// Build the parameters array
		$params = array (':stateAbbreviation' => $stateAbbreviation);
	
		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}
	
	// Retrieves state attractions
	public static function GetStateAttractions($stateAbbreviation)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_state_attractions(:stateAbbreviation)';

		// Build the parameters array
		$params = array (':stateAbbreviation' => $stateAbbreviation);
	
		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}
	
	// Retrieves state persons
	public static function GetStatePersons($stateAbbreviation)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_state_persons(:stateAbbreviation)';

		// Build the parameters array
		$params = array (':stateAbbreviation' => $stateAbbreviation);
	
		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}
	
	// Retrieves city attractions
	public static function GetCityAttractions($cityID)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_city_attractions(:cityID)';

		// Build the parameters array
		$params = array (':cityID' => $cityID);
	
		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}
	
	// Retrieves all cities
	public static function GetCities()
	{
		// Build SQL query
		$sql = 'CALL states2014_get_cities()';

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql);
	}

	// Retrieves all attractions
	public static function GetAttractions()
	{
		// Build SQL query
		$sql = 'CALL states2014_get_attractions()';

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql);
	}
	
	// Retrieves all persons
	public static function GetPersons()
	{
		// Build SQL query
		$sql = 'CALL states2014_get_persons()';

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql);
	}
	
	// Retrieves all users
	public static function GetUsers()
	{
		// Build SQL query
		$sql = 'CALL states2014_get_users()';

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql);
	}
	
	// Retrieves city details
	public static function GetCityDetails($cityID)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_city_details(:city_id)';

		// Build the parameters array
		$params = array (':city_id' => $cityID);

		// Execute the query and return the results
		return DatabaseHandler::GetRow($sql, $params);
	}
	
	// Retrieves city details by city name
	public static function GetCityDetailsByCityName($cityName)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_city_details_by_cityname(:city_name)';

		// Build the parameters array
		$params = array (':city_name' => $cityName);

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}
	
	// Retrieves attraction details
	public static function GetAttractionDetails($attractionID)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_attraction_details(:attraction_id)';

		// Build the parameters array
		$params = array (':attraction_id' => $attractionID);

		// Execute the query and return the results
		return DatabaseHandler::GetRow($sql, $params);
	}
	
	// Retrieves attraction details by attraction name
	public static function GetAttractionDetailsByAttractionName($attractionName)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_attraction_details_by_attractionname(:attraction_name)';

		// Build the parameters array
		$params = array (':attraction_name' => $attractionName);

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}
	
	// Retrieves person details
	public static function GetPersonDetails($personID)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_person_details(:person_id)';

		// Build the parameters array
		$params = array (':person_id' => $personID);

		// Execute the query and return the results
		return DatabaseHandler::GetRow($sql, $params);
	}
	
	// Retrieves person details by person name
	public static function GetPersonDetailsByPersonName($personName)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_person_details_by_personname(:person_name)';

		// Build the parameters array
		$params = array (':person_name' => $personName);

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}	
	
	// Retrieves user details
	public static function GetUserDetails($userID)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_user_details(:user_id)';

		// Build the parameters array
		$params = array (':user_id' => $userID);

		// Execute the query and return the results
		return DatabaseHandler::GetRow($sql, $params);
	}
	
	// Retrieves user details by username
	public static function GetUserDetailsByUsername($userName)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_user_details_by_username(:user_name)';

		// Build the parameters array
		$params = array (':user_name' => $userName);

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}
	
	// Retrieves user highest score by username
	public static function GetUserHighestScoreByUsername($userName)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_user_highestscore_by_username(:user_name)';

		// Build the parameters array
		$params = array (':user_name' => $userName);

		// Execute the query and return the results
		return DatabaseHandler::GetOne($sql, $params);
	}
	
	// Retrieves highest scores
	public static function GetHighestScores()
	{
		// Build SQL query
		$sql = 'CALL states2014_get_highestscores()';

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql);
	}
	
	// Retrieves category persons
	public static function GetCategoryPersons($category)
	{
		// Build SQL query
		$sql = 'CALL states2014_get_category_persons(:category)';

		// Build the parameters array
		$params = array (':category' => $category);

		// Execute the query and return the results
		return DatabaseHandler::GetAll($sql, $params);
	}
	
  // Add a state
  public static function AddState($stateAbbreviation, $stateName, $stateFlag, $stateImage, $stateCapital)
  {
    // Build the SQL query
    $sql = 'CALL states2014_add_state(:state_abbreviation, :state_name, :state_flag, :state_image, :state_capital)';

    // Build the parameters array
    $params = array (':state_abbreviation' => $stateAbbreviation,
                     ':state_name' => $stateName,
					 ':state_flag' => $stateFlag,
					 ':state_image'=> $stateImage,
					 ':state_capital'=>$stateCapital);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }
  
    // Add a city
  public static function AddCity($cityName, $stateAbbreviation, $cityLat, $cityLong, $cityImage)
  {
    // Build the SQL query
    $sql = 'CALL states2014_add_city(:city_name, :state_abbreviation, :city_lat, :city_long, :city_image)';

    // Build the parameters array
    $params = array (':city_name' => $cityName,
                     ':state_abbreviation' => $stateAbbreviation,
					 ':city_lat'=> $cityLat,
					 ':city_long'=> $cityLong,					 
					 ':city_image'=>$cityImage);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }
  
      // Add an attraction
  public static function AddAttraction($attractionName, $stateAbbreviation, $cityId, $attractionLat, $attractionLong, $attractionImage)
  {
    // Build the SQL query
    $sql = 'CALL states2014_add_attraction(:attraction_name, :state_abbreviation, :city_id, :attraction_lat, :attraction_long, :attraction_image)';

    // Build the parameters array
    $params = array (':attraction_name' => $attractionName,
                     ':state_abbreviation' => $stateAbbreviation,
					 ':city_id' => $cityId,
					 ':attraction_lat'=> $attractionLat,
					 ':attraction_long'=> $attractionLong,					 
					 ':attraction_image'=>$attractionImage);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }

      // Add a person
  public static function AddPerson($personName, $stateAbbreviation, $personCategory, $personImage, $personStory)
  {
    // Build the SQL query
    $sql = 'CALL states2014_add_person(:person_name, :state_abbreviation, :person_category, :person_image, :person_story)';

    // Build the parameters array
    $params = array (':person_name' => $personName,
                     ':state_abbreviation' => $stateAbbreviation,
					 ':person_category'=> $personCategory,	
					 ':person_image'=>$personImage,
					 ':person_story'=>$personStory);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }  
  
    // Add a user
  public static function AddUser($userName, $password)
  {
    // Build the SQL query
    $sql = 'CALL states2014_add_user(:user_name, :password)';

    // Build the parameters array
    $params = array (':user_name' => $userName,
					 ':password'=>$password);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  } 
   
  // Updates state details
  public static function UpdateState($stateAbbreviation, $stateName, $stateFlag, $stateImage, $stateCapital)
  {
    // Build the SQL query
    $sql = 'CALL states2014_update_state(:state_name, :state_flag, :state_image, :state_capital, :state_abbreviation)';

    // Build the parameters array
    $params = array (':state_abbreviation' => $stateAbbreviation,
                     ':state_name' => $stateName,
                     ':state_flag' => $stateFlag,
					 ':state_image' => $stateImage,
					 ':state_capital'=> $stateCapital);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }  

  // Updates city details
  public static function UpdateCity($cityId, $cityName, $stateAbbreviation, $cityLat, $cityLong, $cityImage)
  {
    // Build the SQL query
    $sql = 'CALL states2014_update_city(:city_name, :state_abbreviation, :city_lat, :city_long, :city_image, :city_id)';

    // Build the parameters array
    $params = array (':city_id' => $cityId,
                     ':city_name' => $cityName,
                     ':state_abbreviation' => $stateAbbreviation,
					 ':city_lat' => $cityLat,
					 ':city_long' => $cityLong,					 
					 ':city_image'=> $cityImage);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }
  
  // Updates attraction details
  public static function UpdateAttraction($attractionId, $attractionName, $stateAbbreviation, $cityId, $attractionLat, $attractionLong, $attractionImage)
  {
    // Build the SQL query
    $sql = 'CALL states2014_update_attraction(:attraction_name, :state_abbreviation, :city_id, :attraction_lat, :attraction_long, :attraction_image, :attraction_id)';

    // Build the parameters array
    $params = array (':attraction_id' => $attractionId,
                     ':attraction_name' => $attractionName,
                     ':state_abbreviation' => $stateAbbreviation,
					 ':city_id' => $cityId,					 
					 ':attraction_lat' => $attractionLat,
					 ':attraction_long' => $attractionLong,					 
					 ':attraction_image'=> $attractionImage);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }  
  
  // Updates person details
  public static function UpdatePerson($personId, $personName, $personCategory, $personImage, $personStory)
  {
    // Build the SQL query
    $sql = 'CALL states2014_update_person(:person_name, :person_category, :person_image, :person_story, :person_id)';

    // Build the parameters array
    $params = array (':person_id' => $personId,
                     ':person_name' => $personName,
                     ':person_category' => $personCategory,
					 ':person_image' => $personImage,					 				 
					 ':person_story'=> $personStory);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }    
  
    // Add person state
  public static function AddPersonState($personId, $stateAbbreviation)
  {
    // Build the SQL query
    $sql = 'CALL states2014_add_person_state(:person_id, :state_abbreviation)';

    // Build the parameters array
    $params = array (':person_id' => $personId,					 				 
					 ':state_abbreviation'=> $stateAbbreviation);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  } 
  
  // Updates user details
  public static function UpdateUser($userId, $userName, $password, $highestScore)
  {
    // Build the SQL query
    $sql = 'CALL states2014_update_user(:user_name, :password, :highest_score, :user_id)';

    // Build the parameters array
    $params = array (':user_id' => $userId,
                     ':user_name' => $userName,
                     ':password' => $password,				 				 
					 ':highest_score'=> $highestScore);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }   
  
  // Updates user highest score
  public static function UpdateUserHighestScore($userId, $highestScore)
  {
    // Build the SQL query
    $sql = 'CALL states2014_update_user_highestscore(:highest_score, :user_id)';

    // Build the parameters array
    $params = array (':user_id' => $userId,			 				 
					 ':highest_score'=> $highestScore);

    // Execute the query
    DatabaseHandler::Execute($sql, $params);
  }     
  
    // Retrieves customer by login details
  public static function CheckLogin($username, $password)
  {
    // Build SQL query
    $sql = 'CALL states2014_check_login(:username, :password)';

    // Build the parameters array
    $params = array (':username' => $username, ':password' => $password);

    // Execute the query and return the results
    return DatabaseHandler::GetRow($sql, $params);
  }
}		
?>
