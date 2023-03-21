<?php

namespace App\Models;

use CodeIgniter\Model;

class MaspectoSeg extends Model
{
    protected $table            = 'aspectos_seguridad';
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
    public function validaAspectoSeg($data){
      
        // $query = $this->db->query("SELECT * FROM aspectos_seguridad 
        // where aspecto='{$data}' where is_deleted=0");
        $query = $this->db->query("EXEC validaAspecto @aspecto = '{$data[0]['aspecto']}'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    } 
    public function getAspectoSeg(){

        // $query = $this->db->query("SELECT * FROM 
        // aspectos_seguridad where is_deleted=0");
        $query = $this->db->query("EXEC listarAspecto");
        return $query->getResultArray();
    }
    
    public function saveAspectoSeg($data){
       

        // $query=$this->db->query("INSERT INTO aspectos_seguridad
        // (aspecto,estado) VALUES
        // ('{$data['aspecto']}',{$data['estado']})") ;
        $query = $this->db->query("EXEC agregar_aspecto
        @aspecto = '{$data[0]['aspecto']}',
        @estado= {$data[0]['estado']},
        @idUserAdd= {$data['user']}");
    
        return $query;
    }
    public function updateAspectoSeg($data){
              
        // $query=$this->db->query("UPDATE aspectos_seguridad SET 
        // aspecto = '{$data['aspecto']}',
        // estado = '{$data['estado']}'
        // where id = {$data['id']} ") ;
        $query = $this->db->query("EXEC editar_aspecto
        @aspecto = '{$data[0]['aspecto']}',
        @idaspecto = '{$data[0]['id']}',
        @estado= {$data[0]['estado']},
        @idUserAdd= {$data['user']}");
        return $query;
    }
    // public function deleteAspectoSeg($data){
      
        
    //     $query=$this->db->query("DELETE aspectos_seguridad 
    //     where id = {$data} ") ;
           
    //     return $query;
    // }
    public function getAspectoByActivo(){

        //$query = $this->db->query("SELECT * FROM aspectos_seguridad where estado='1'");
        $query = $this->db->query("EXEC getAspectoByActivo");
        return $query->getResultArray();
    }
}