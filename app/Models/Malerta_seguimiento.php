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
        
        $query = $this->db->query("EXEC validaAlerta_seguimiento @alert='".$data."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }

    public function getAlerta_seguimiento(){

        $query = $this->db->query("EXEC listar_alert_seguimiento");
        return $query->getResultArray();
    }

    public function saveAlerta_seguimiento($data){

        $query=$this->db->query("EXEC agregar_AlertSeguimiento
        @alerta='{$data[0]['alerta']}',
        @descripcion='{$data[0]['descripcion']}',
        @valor='{$data[0]['valor']}',@idUserAdd= {$data['user']}") ;
        return $query;
    }

    public function updateAlerta_seguimiento($data){
        $query=$this->db->query("EXEC modificar_AlertSeguimiento @alerta='{$data[0]['alerta']}',
        @valor='{$data[0]['valor']}',@descripcion='{$data[0]['descripcion']}',@idUserAdd= {$data['user']},@idAlerta={$data[0]['id']} ") ;
        
        return $query;
    }

    public function deleteAlerta_seguimiento($data){

        $query = $this->db->query("EXEC eliminar_alertSeguimiento @idUserAdd={$data['id']}, @idAlerta={$data[0]['id']} ");
        return $query;
    }
    public function getAlertaByActivo(){

        $query = $this->db->query("SELECT * FROM alert_seguimiento where is_deleted='0'");
        return $query->getResultArray();
    }

    public function getAlerta(){

        $query = $this->db->query("SELECT * FROM alert_seguimiento where is_deleted='0'");
        return $query->getResultArray();
    }

}