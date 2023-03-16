<?php

namespace App\Models;

use CodeIgniter\Model;

class MCaracteristicaOpera extends Model
{
    
    public function validaCaracteristicaOpera($data){
        
        $query = $this->db->query("EXEC valida_CaracteristicaOpera
        @caracteristica='".$data['caracteristica']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getCaracteristicaOpera(){
        
        $query = $this->db->query("EXEC listar_CaracteristicaOpera");
        return $query->getResultArray();
    }


    public function saveCaracteristicaOpera($data){       

        $query=$this->db->query("EXEC agregar_CaracteristicaOpera @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateCaracteristicaOpera($data){  
        
        $query= $this->db->query("EXEC modificar_CaracteristicaOpera @caracteristica='{$data[0]['caracteristica']}',
        @descripcion='{$data[0]['descripcion']}',@idUserAdd= {$data['user']},@idClasificacionOpera={$data[0]['id']}") ;
        return $query;
    }
    public function deleteCaracteristicaOpera($data){
            
        $query=$this->db->query("EXEC eliminar_CaracteristicaOpera @idUserAdd={$data['user']}, @idClasificacionOpera={$data[0]['id']}") ;
        
        return $query;
    }
}