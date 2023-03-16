<?php

namespace App\Models;

use CodeIgniter\Model;

class MDisenio extends Model
{
    
    public function validaDisenio($data){
        
        $query = $this->db->query("EXEC valida_Diseño @caracteristica='".$data."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getDisenio(){
        
        $query = $this->db->query("EXEC listar_Diseño");
        return $query->getResultArray();
    }

    public function getOpcionesDisenio(){
        
        $query = $this->db->query("SELECT * FROM  diseño where is_deleted=0 and estado=1");
        return $query->getResultArray();
    }

    public function saveDisenio($data){       

        $query=$this->db->query("EXEC agregar_Diseño @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @estado='{$data[0]['estado']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateDisenio($data){  
        
        $query= $this->db->query("EXEC modificar_Diseño @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @estado='{$data[0]['estado']}',@idUserAdd= {$data['user']},@idDisenio={$data[0]['id']}") ;
        return $query;
    }
    public function deleteDisenio($data){
            
        $query=$this->db->query("EXEC eliminar_Diseño @idUserAdd={$data['user']}, @idDisenio={$data[0]['id']}") ;
        
        return $query;
    }
}