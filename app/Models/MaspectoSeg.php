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
      
        $query = $this->db->query("SELECT * FROM aspectos_seguridad where aspecto='{$data}' where is_deleted=0");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    } 
    public function getAspectoSeg(){

        $query = $this->db->query("SELECT * FROM aspectos_seguridad where is_deleted=0");
        return $query->getResultArray();
    }
    
    public function saveAspectoSeg($data){
       

        $query=$this->db->query("INSERT INTO aspectos_seguridad
        (aspecto,estado) VALUES
        ('{$data['aspecto']}',{$data['estado']})") ;
    
    
        return $query;
    }
    public function updateAspectoSeg($data){
              
        $query=$this->db->query("UPDATE aspectos_seguridad SET 
        aspecto = '{$data['aspecto']}',
        estado = '{$data['estado']}'
        where id = {$data['id']} ") ;
           
        return $query;
    }
    public function deleteAspectoSeg($data){
      
        
        $query=$this->db->query("DELETE aspectos_seguridad 
        where id = {$data} ") ;
           
        return $query;
    }
    public function getAspectoByActivo(){

        $query = $this->db->query("SELECT * FROM aspectos_seguridad where estado='1'");
        return $query->getResultArray();
    }
}
