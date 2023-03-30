<?php

namespace App\Models;

use CodeIgniter\Model;

class MPais extends Model
{
  
    
    //retorna todos los perfiles
    public function getContinente(){

        // $query = $this->db->query("SELECT * FROM continente where ContinenteCodigo='América'");
        $sql = "CALL getContinente()";

        $query = $this->db->query($sql, [
           
        ]);
        return $query->getResultArray();
    }
    public function getPaises($data){

        // $query = $this->db->query("SELECT * FROM pais where continente='{$data}'");

        $sql = "CALL getPaises(?)";

        $query = $this->db->query($sql, [
            $data
        ]);
        return $query->getResultArray();
    }
    public function getCiudad($data){

        // $query = $this->db->query("SELECT * FROM ciudad where ubicacionpaisid='{$data}'");
        $sql = "CALL getCiudad(?)";

        $query = $this->db->query($sql, [
            $data
        ]);
        return $query->getResultArray();
    }
   
}
