<?php

namespace App\Models;

use CodeIgniter\Model;

class Mprioridad extends Model
{
    protected $table = 'prioridad';
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

    public function validaPrioridad($data){
        
      
        $sql = "call validaPrioridad(?)";
        $query = $this->db->query($sql,[
            $data
        ]);
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }

    public function getPrioridad(){

        // $query = $this->db->query("EXEC listar_prioridad");
        $sql = "call listar_prioridad()";
        $query = $this->db->query($sql,[
          
        ]);
        return $query->getResultArray();
    }

    public function savePrioridad($data){

     
        $sql = "call agregar_prioridad(?,?,?)";
        $query = $this->db->query($sql,[
            $data[0]['prioridad'],
            $data[0]['decripcion'],
            $data['user']
        ]);
        return $query;
    }

    public function updatePrioridad($data){
       
        $sql = "call modificar_prioridad(?,?,?,?)";
        $query = $this->db->query($sql,[
            $data[0]['prioridad'],
            $data[0]['decripcion'],
            $data['user'],
            $data[0]['id'],
        ]);
        return $query;
    }

 
    public function getPrioridadByActivo(){

        $query = $this->db->query("SELECT * FROM prioridad where is_deleted=0");
        return $query->getResultArray();
    }


}