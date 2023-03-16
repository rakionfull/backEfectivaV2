<?php

namespace App\Models;

use CodeIgniter\Model;

class Mtipoactivo extends Model
{

    public function validarTipoActivo($data){
      
        $query = $this->db->query("SELECT * FROM tipo_activo where tipo='{$data}'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    } 
    public function getTipoActivoByActivo(){

        $query = $this->db->query("SELECT * FROM tipo_activo where estado='1'");
        return $query->getResultArray();
    }
    public function getTipoActivo(){

        $query = $this->db->query("SELECT * FROM tipo_activo");
        return $query->getResultArray();
    }
    public function saveTipoActivo($data){       

        $query=$this->db->query("INSERT INTO tipo_activo
        (tipo,estado) VALUES
        ('{$data['tipo']}',{$data['estado']})") ;
        return $query;
    }
    public function updateTipoActivo($data){  
        
        $query=$this->db->query("UPDATE tipo_activo SET 
        tipo = '{$data['tipo']}',
        estado = '{$data['estado']}'
        where id = {$data['id']} ") ;    
        return $query;
    }
    public function deleteTipoActivo($data){
      
        
        $query=$this->db->query("DELETE tipo_activo 
        where id = {$data} ") ;
           
        return $query;
    }


}