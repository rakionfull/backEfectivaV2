<?php

namespace App\Models;

use CodeIgniter\Model;

class Mestado extends Model
{
    protected $table = 'estado';
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

    public function validaEstado($data){
        
        $query = $this->db->query("EXEC validaEstado @estado='".$data."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }

    public function getEstado(){

        $query = $this->db->query("EXEC listar_estado");
        return $query->getResultArray();
    }

    public function saveEstado($data){

        $query=$this->db->query("EXEC agregar_estado
        @estado='{$data[0]['estado']}',
        @descripcion='{$data[0]['descripcion']}',@idUserAdd= {$data['user']}") ;
        return $query;
    }

    
    public function updateEstado($data){
        $query=$this->db->query("EXEC modificar_estado @estado='{$data[0]['estado']}',
        @descripcion='{$data[0]['descripcion']}',@idUserAdd= {$data['user']},@idEstado={$data[0]['id']} ");
        
        return $query;
    }


    public function deleteEstado($data){

        $query = $this->db->query("EXEC eliminar_estado @idUserAdd={$data['id']}, @idEstado={$data[0]['id']}");
        return $query;
    }
    public function getEstadoByActivo(){

        $query = $this->db->query("SELECT * FROM estado where is_deleted=0");
        return $query->getResultArray();
    }

}