<?php

namespace App\Models;

use CodeIgniter\Model;

class Mlog extends Model
{
  
    //guardamos las acciones que se realicen en el sistema
    public function saveLog($data){
       
         $query=$this->db->query("INSERT INTO log_acciones
        (terminal,ip_addres,u_ejecutor,u_afectado,accion,fecha) VALUES
        ('{$data['terminal']}','{$data['ip_addres']}',{$data['u_ejecutor']},{$data['u_afectado']}
        ,'{$data['accion']}','{$data['fecha']}')") ;
    
    
        return $query;
    }
    
}
