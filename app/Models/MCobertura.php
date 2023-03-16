<?php

namespace App\Models;

use CodeIgniter\Model;

class MCobertura extends Model
{
    
    public function validaCobertura($data){
        
        $query = $this->db->query("EXEC valida_cobertura @cobertura='".$data."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getCobertura(){
        
        $query = $this->db->query("EXEC listar_cobertura");
        return $query->getResultArray();
    }


    public function saveCobertura($data){       

        $query=$this->db->query("EXEC agregar_cobertura @cobertura='{$data[0]['cobertura']}',
        @descripcion='{$data[0]['descripcion']}',@idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateCobertura($data){  
        
        $query= $this->db->query("EXEC modificar_cobertura @cobertura='{$data[0]['cobertura']}',
        @descripcion='{$data[0]['descripcion']}',@idUserAdd= {$data['user']},@idCobertura={$data[0]['id']}") ;
        return $query;
    }
    public function deleteCobertura($data){
            
        $query=$this->db->query("EXEC eliminar_cobertura @idUserAdd={$data['user']}, @idCobertura={$data[0]['id']}") ;
        
        return $query;
    }
}