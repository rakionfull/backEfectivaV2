<?php

namespace App\Models;

use CodeIgniter\Model;

class MOperatividad extends Model
{
    
    public function validaOperatividad($data){
        
        $query = $this->db->query("EXEC valida_Operatividad @caracteristica='".$data."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getOperatividad(){
        
        $query = $this->db->query("EXEC listar_Operatividad");
        return $query->getResultArray();
    }
    public function getOpcionesOperatividad(){
        
        $query = $this->db->query("SELECT * FROM operatividad where is_deleted=0 and estado=1");
        return $query->getResultArray();
    }


    public function saveOperatividad($data){       

        $query=$this->db->query("EXEC agregar_Operatividad @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @estado='{$data[0]['estado']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateOperatividad($data){  
        
        $query= $this->db->query("EXEC modificar_Operatividad @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @estado='{$data[0]['estado']}',@idUserAdd= {$data['user']},@idOperatividad={$data[0]['id']}") ;
        return $query;
    }
    public function deleteOperatividad($data){
            
        $query=$this->db->query("EXEC eliminar_Operatividad @idUserAdd={$data['user']}, @idOperatividad={$data[0]['id']}") ;
        
        return $query;
    }
}