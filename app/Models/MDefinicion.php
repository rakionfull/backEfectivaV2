<?php

namespace App\Models;

use CodeIgniter\Model;

class MDefinicion extends Model
{
    
    public function validaDefinicion($data){
        
        $query = $this->db->query("EXEC valida_Definicion @caracteristica='".$data['caracteristica']."' ,
        @peso='".$data['peso']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getDefinicion(){
        
        $query = $this->db->query("EXEC listar_Definicion");
        return $query->getResultArray();
    }


    public function saveDefinicion($data){       

        $query=$this->db->query("EXEC agregar_Definicion @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @peso={$data[0]['peso']}, @estado='{$data[0]['estado']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateDefinicion($data){  
        
        $query= $this->db->query("EXEC modificar_Definicion @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @peso={$data[0]['peso']}, @estado='{$data[0]['estado']}',@idUserAdd= {$data['user']},@idDefinicion={$data[0]['id']}") ;
        return $query;
    }
    public function deleteDefinicion($data){
            
        $query=$this->db->query("EXEC eliminar_Definicion @idUserAdd={$data['user']}, @idDefinicion={$data[0]['id']}") ;
        
        return $query;
    }
}