<?php

namespace App\Models;

use CodeIgniter\Model;

class MPrueba extends Model
{
    
    public function validaPrueba($data){
        
        $query = $this->db->query("EXEC valida_Prueba @caracteristica='".$data['caracteristica']."' ,
        @peso='".$data['peso']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getPrueba(){
        
        $query = $this->db->query("EXEC listar_Prueba");
        return $query->getResultArray();
    }


    public function savePrueba($data){       

        $query=$this->db->query("EXEC agregar_Prueba @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @peso={$data[0]['peso']}, @estado='{$data[0]['estado']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updatePrueba($data){  
        
        $query= $this->db->query("EXEC modificar_Prueba @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @peso={$data[0]['peso']}, @estado='{$data[0]['estado']}',@idUserAdd= {$data['user']},@idPrueba={$data[0]['id']}") ;
        return $query;
    }
    public function deletePrueba($data){
            
        $query=$this->db->query("EXEC eliminar_Prueba @idUserAdd={$data['user']}, @idPrueba={$data[0]['id']}") ;
        
        return $query;
    }
}