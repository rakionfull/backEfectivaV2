<?php

namespace App\Models;

use CodeIgniter\Model;

class MaspectoSeg extends Model
{
    public function validaAspectoSeg($data){
      
        $query = $this->db->query("SELECT * FROM aspectos_seguridad where aspecto='{$data}'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    } 
    public function getAspectoSeg(){

        $query = $this->db->query("SELECT * FROM aspectos_seguridad");
        return $query->getResultArray();
    }
    
    public function saveAspectoSeg($data){
       

        $query=$this->db->query("INSERT INTO aspectos_seguridad
        (aspecto,estado) VALUES
        ('{$data['aspecto']}',{$data['estado']})") ;
    
    
        return $query;
    }
    public function updateAspectoSeg($data){
              
        $query=$this->db->query("UPDATE aspectos_seguridad SET 
        aspecto = '{$data['aspecto']}',
        estado = '{$data['estado']}'
        where id = {$data['id']} ") ;
           
        return $query;
    }
    public function deleteAspectoSeg($data){
      
        
        $query=$this->db->query("DELETE aspectos_seguridad 
        where id = {$data} ") ;
           
        return $query;
    }
    public function getAspectoByActivo(){

        $query = $this->db->query("SELECT * FROM aspectos_seguridad where estado='1'");
        return $query->getResultArray();
    }
}
