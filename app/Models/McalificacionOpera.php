<?php

namespace App\Models;

use CodeIgniter\Model;

class MCalificacionOpera extends Model
{
    
    public function validaCalificacionOpera($data){
        
        $query = $this->db->query("EXEC valida_ClasificacionOpera
        @clasificacion='".$data['clasificacion']."',
        @condicion='".$data['condicion']."', 
        @valor='".$data['valor']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getCalificacionOpera(){
        
        $query = $this->db->query("EXEC listar_ClasificacionOpera");
        return $query->getResultArray();
    }


    public function saveCalificacionOpera($data){       

        $query=$this->db->query("EXEC agregar_ClasificacionOpera @clasificacion='{$data[0]['clasificacion']}',
        @descripcion='{$data[0]['descripcion']}', @condicion='{$data[0]['condicion']}', @valor='{$data[0]['valor']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateCalificacionOpera($data){  
        
        $query= $this->db->query("EXEC modificar_ClasificacionOpera @clasificacion='{$data[0]['clasificacion']}',
        @descripcion='{$data[0]['descripcion']}', @condicion='{$data[0]['condicion']}', @valor='{$data[0]['valor']}',@idUserAdd= {$data['user']},@idClasificacionOpera={$data[0]['id']}") ;
        return $query;
    }
    public function deleteCalificacionOpera($data){
            
        $query=$this->db->query("EXEC eliminar_ClasificacionOpera @idUserAdd={$data['user']}, @idClasificacionOpera={$data[0]['id']}") ;
        
        return $query;
    }
}