<?php

namespace App\Models;

use CodeIgniter\Model;

class MAutomatizacion extends Model
{
    
    public function validaAutomatizacion($data){
        
        $query = $this->db->query("EXEC valida_Automatizacion @caracteristica='".$data['caracteristica']."' ,
        @peso='".$data['peso']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getAutomatizacion(){
        
        $query = $this->db->query("EXEC listar_Automatizacion");
        return $query->getResultArray();
    }


    public function saveAutomatizacion($data){       

        $query=$this->db->query("EXEC agregar_Automatizacion @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @peso={$data[0]['peso']}, @estado='{$data[0]['estado']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateAutomatizacion($data){  
        
        $query= $this->db->query("EXEC modificar_Automatizacion @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @peso={$data[0]['peso']}, @estado='{$data[0]['estado']}',@idUserAdd= {$data['user']},@idAutomatizacion={$data[0]['id']}") ;
        return $query;
    }
    public function deleteAutomatizacion($data){
            
        $query=$this->db->query("EXEC eliminar_Automatizacion @idUserAdd={$data['user']}, @idAutomatizacion={$data[0]['id']}") ;
        
        return $query;
    }
}