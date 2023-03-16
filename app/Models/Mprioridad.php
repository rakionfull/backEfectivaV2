<?php

namespace App\Models;

use CodeIgniter\Model;

class Mprioridad extends Model
{

    public function validaPrioridad($data){
        
        $query = $this->db->query("EXEC validaPrioridad @prioridad='".$data."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }

    public function getPrioridad(){

        $query = $this->db->query("EXEC listar_prioridad");
        return $query->getResultArray();
    }

    public function savePrioridad($data){

        $query=$this->db->query("EXEC agregar_prioridad
        @prioridad='{$data[0]['prioridad']}',
        @descripcion='{$data[0]['decripcion']}',@idUserAdd= {$data['user']}") ;
        return $query;
    }

    public function updatePrioridad($data){
        $query=$this->db->query("EXEC modificar_prioridad @prioridad='{$data[0]['prioridad']}',
        @descripcion='{$data[0]['decripcion']}',@idUserAdd= {$data['user']},@idPrioridad={$data[0]['id']} ") ;
        
        return $query;
    }

    public function deletePrioridad($data){

        $query = $this->db->query("EXEC eliminar_prioridad @idUserAdd={$data['id']}, @idPrioridad={$data[0]['id']}");
        return $query;
    }
    public function getPrioridadByActivo(){

        $query = $this->db->query("SELECT * FROM prioridad where is_deleted=0");
        return $query->getResultArray();
    }


}