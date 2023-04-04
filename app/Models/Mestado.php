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
        
       
        // $query = $this->db->query("SELECT * FROM estado where estado='{$data}' and is_deleted=0");

        $sql = "CALL validaEstado(?)";

        $query = $this->db->query($sql, [
            $data
        ]);
        if( $query->getRow()) return true;
        else return false;
    }

    public function getEstado(){

     
        $sql = "call listar_estado()";
        $query = $this->db->query($sql,[
         
        ]);
        return $query->getResultArray();
    }

    public function saveEstado($data){

        $sql = "call agregar_estado(?,?,?)";
        $query = $this->db->query($sql,[
            $data[0]['estado'],
            $data[0]['descripcion'],
            $data['user']
        ]);
        return $query;
    }

    
    public function updateEstado($data){
      
        $sql = "call modificar_estado(?,?,?,?)";
        $query = $this->db->query($sql,[
            $data[0]['estado'],
            $data[0]['descripcion'],
            $data['user'],
            $data[0]['id'],
        ]);
        return $query;
    }


    public function getEstadoByActivo(){

        // $query = $this->db->query("SELECT * FROM estado where is_deleted=0");
        $sql = "CALL listar_estado()";

        $query = $this->db->query($sql, [
            
        ]);
        return $query->getResultArray();
    }

}