<?php

namespace App\Validation;

use App\Models\Muser;
use Exception;

class UserRules
{
 
    public function validateUser(string $str, string $fields, array $data): bool
    {
        try {
            $model = new Muser();
            $user = $model->getUser($data['username']);
            return password_verify($data['password'], $user->pass_cl);
        } catch (Exception $ex) {
            return false;
        }
    }
    public function validatePass(string $str, string $fields, array $data): bool
    {
        
        $password = trim($data['passw']);

		$regex_lowercase = '/[a-z]/';
		$regex_uppercase = '/[A-Z]/';
		$regex_number = '/[0-9]/';
		$regex_special = '/[!@#$%^&*()\-_=+{};:,<.>ยง~]/';
	
			if (preg_match_all($regex_lowercase, $password) < 1)
			{
				
				return FALSE;
			}
	
			if (preg_match_all($regex_uppercase, $password) < 1)
			{
				
				return FALSE;
			}
	
		
		
		    if (preg_match_all($regex_number, $password) < 1)
			{
				
				return FALSE;
			}
		
		
			if (preg_match_all($regex_special, $password) < 1)
			{
			
				return FALSE;
			}
		
		return TRUE;
      
    }
   
}