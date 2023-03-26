<?php

namespace App\Models;

use CodeIgniter\Model;

class Malerta_seguimiento extends Model
{
    protected $table = 'alert_seguimiento';
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


    public function validaAlerta_seguimiento($data){
        
    
        $query = $this->db->query("SELECT * FROM alert_seguimiento where alerta = '{$data}' and is_deleted='0'");
       
        if( $query->getRow()) return true;
        else return false;
    }

    public function getAlerta_seguimiento(){

      
        $sql = "call listar_alert_seguimiento()";
        $query = $this->db->query($sql,[
         
        ]);
        return $query->getResultArray();
    }

    public function saveAlerta_seguimiento($data){

     
        $sql = "call agregar_AlertSeguimiento(?,?,?,?)";
        $query = $this->db->query($sql,[
            $data[0]['alerta'],
            $data[0]['valor'],
            $data[0]['descripcion'],
           
            $data['user']
        ]);
        return $query;
    }

    public function updateAlerta_seguimiento($data){
        $sql = "call modificar_AlertSeguimiento(?,?,?,?,?)";
        $result = $this->db->query($sql,[
            $data[0]['alerta'],
            $data[0]['valor'],
            $data[0]['descripcion'],
           
            $data['user'],
            $data[0]['id'],
        ]);
        return $query;
    }

   
    public function getAlertaByActivo(){

        $query = $this->db->query("SELECT * FROM alert_seguimiento where is_deleted='0'");
        return $query->getResultArray();
    }



}