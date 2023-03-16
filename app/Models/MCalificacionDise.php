<?php

namespace App\Models;

use CodeIgniter\Model;

class MCalificacionDise extends Model
{
    
    public function validaCalificacionDise($data){
        
        $query = $this->db->query("EXEC valida_ClasificacionDise 
        @clasificacion='".$data['clasificacion']."',
        @condicion='".$data['condicion']."', 
        @valor='".$data['valor']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getCalificacionDise(){
        
        $query = $this->db->query("EXEC listar_ClasificacionDise");
        return $query->getResultArray();
    }


    public function saveCalificacionDise($data){       

        $query=$this->db->query("EXEC agregar_ClasificacionDise @clasificacion='{$data[0]['clasificacion']}',
        @descripcion='{$data[0]['descripcion']}', @condicion='{$data[0]['condicion']}', @valor='{$data[0]['valor']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateCalificacionDise($data){  
        
        $query= $this->db->query("EXEC modificar_ClasificacionDise @clasificacion='{$data[0]['clasificacion']}',
        @descripcion='{$data[0]['descripcion']}', @condicion='{$data[0]['condicion']}', @valor='{$data[0]['valor']}',@idUserAdd= {$data['user']},@idClasificacionDise={$data[0]['id']}") ;
        return $query;
    }
    public function deleteCalificacionDise($data){
            
        $query=$this->db->query("EXEC eliminar_ClasificacionDise @idUserAdd={$data['user']}, @idClasificacionDise={$data[0]['id']}") ;
        
        return $query;
    }
}