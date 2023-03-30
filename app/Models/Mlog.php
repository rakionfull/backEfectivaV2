<?php

namespace App\Models;

use CodeIgniter\Model;

class Mlog extends Model
{
  
    //guardamos las acciones que se realicen en el sistema
    public function saveLog($data){
       
   
        $sql = "CALL saveLog(?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
            $data['terminal'],
            $data['ip_addres'],
            $data['u_ejecutor'],
            $data['u_afectado'],
            $data['accion'],
            $data['fecha']
        ]);

        return $query;
    }
    
}
