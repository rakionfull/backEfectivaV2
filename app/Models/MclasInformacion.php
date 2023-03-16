<?php

namespace App\Models;

use CodeIgniter\Model;

class MclasInformacion extends Model
{
    public function validarClasInfo($data){
            
            $query = $this->db->query("SELECT * FROM clasificacion_informacion where clasificacion='{$data}'");
            $query->getRow();
            if( $query->getRow()) return true;
            else return false;
    }
    public function getClasInformacion(){

        $query = $this->db->query("SELECT * FROM clasificacion_informacion");
        return $query->getResultArray();
    }
    public function saveClasInformacion($data){       

        $query=$this->db->query("INSERT INTO clasificacion_informacion
        (clasificacion,descripcion, estado) VALUES
        ('{$data['clasificacion']}','{$data['descripcion']}',{$data['estado']})") ;
        return $query;

    }
    public function updateClasInformacion($data){  
        
        $query=$this->db->query("UPDATE clasificacion_informacion SET 
        clasificacion = '{$data['clasificacion']}',
        descripcion = '{$data['descripcion']}',
        estado = '{$data['estado']}'
        where id = {$data['id']} ") ;    
        return $query;
    }
    public function deleteClasInfo($data){
        
            
        $query=$this->db->query("DELETE clasificacion_informacion 
        where id = {$data} ") ;
        
        return $query;
    }

}