<?php

namespace App\Models;

use CodeIgniter\Model;

class Msesiones extends Model
{
  
    public function saveSesion($data,$id_user){
        // return $data;
        $last_activity = date('Y-m-d H:i:s');
        // $query=$this->db->query("INSERT INTO tb_sesiones 
        // (id_us,iat,expi,last_activity,loged) VALUES
        // ('{$id_user}','{$data['iat']}',
        // '{$data['exp']}','{$last_activity}','1')") ;
    
        // return $this->db->insert('users', $data);

        $sql = "CALL saveSesion(?,?,?,?)";

        $query = $this->db->query($sql, [
            $id_user,
            $data['iat'],
            $data['exp'],
            $last_activity
            ]);

        return $query;
    }
    public function getByIdSesion($id,$iat){

        // $query = $this->db->query("SELECT  * from tb_sesiones
        //  where id_us=$id and expi > $iat and loged='1' ORDER BY id_se LIMIT 1" );
          $sql = "CALL getByIdSesion(?,?)";

          $query = $this->db->query($sql, [
              $id,
              $iat
              ]);
        return $query->getResultArray();
    }
    public function updateLoged($data){
        // return $data;
        // $query=$this->db->query("DELETE FROM tb_sesiones 
        // where id_us = $data") ;
            
        $sql = "CALL updateLoged(?)";

        $query = $this->db->query($sql, [
            $data
            ]);
        return $query;
    }
    
}

