<?php

namespace App\Models;

use CodeIgniter\Model;

class MCobertura extends Model
{
    protected $table = 'cobertura';
    protected $primaryKey       = 'id';
    protected $useSoftDeletes   = false;
    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'date_add';
    protected $updatedField  = 'date_modify';
    protected $deletedField  = 'date_deleted';
    protected $allowedFields    = [
        'id',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];
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