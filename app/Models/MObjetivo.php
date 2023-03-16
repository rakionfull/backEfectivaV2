<?php

namespace App\Models;

use CodeIgniter\Model;

class MObjetivo extends Model
{
    
    public function validaObjetivo($data){
        
        $query = $this->db->query("EXEC valida_Objetivo @caracteristica='".$data['caracteristica']."',
        @peso='".$data['peso']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getObjetivo(){
        
        $query = $this->db->query("EXEC listar_Objetivo");
        return $query->getResultArray();
    }


    public function saveObjetivo($data){       

        $query=$this->db->query("EXEC agregar_Objetivo @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @peso={$data[0]['peso']}, @estado='{$data[0]['estado']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateObjetivo($data){  
        
        $query= $this->db->query("EXEC modificar_Objetivo @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @peso={$data[0]['peso']}, @estado='{$data[0]['estado']}',@idUserAdd= {$data['user']},@idObjetivo={$data[0]['id']}") ;
        return $query;
    }
    public function deleteObjetivo($data){
            
        $query=$this->db->query("EXEC eliminar_Objetivo @idUserAdd={$data['user']}, @idObjetivo={$data[0]['id']}") ;
        
        return $query;
    }
}