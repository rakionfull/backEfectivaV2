<?php

namespace App\Controllers;
use App\Controllers\BaseController;

class Task extends BaseController
{
    public function mensaje()
    {
        log_message('debug','Hola mundo');
        echo ("hola mundo");
    }
}
