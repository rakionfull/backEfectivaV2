<?php

namespace App\Models;

use CodeIgniter\Model;

class Mvaloractivo extends Model
{
    protected $table = 'valor_activo';
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
    public function validaValorActivo($data){
        
            $query = $this->db->query("SELECT * FROM valor_activo where valor='{$data}'");
            $query->getRow();
            if( $query->getRow()) return true;
            else return false;
    }
    public function getValorActivo(){

        $query = $this->db->query("SELECT * FROM valor_activo where is_deleted=0");
        return $query->getResultArray();
    }

    public function getValorActivo2(){

        $query = $this->db->query("SELECT * FROM valor_activo where is_delted=0");
        return $query->getResultArray();
    }

    public function saveValorActivo($data){       

        $query=$this->db->query("INSERT INTO valor_activo
        (valor,estado) VALUES
        ('{$data['valor']}',{$data['estado']})") ;

        return $query;
    }
    public function updateValorActivo($data){  
        
        $query=$this->db->query("UPDATE valor_activo SET 
        valor = '{$data['valor']}',
        estado = '{$data['estado']}'
        where id = {$data['id']} ") ;
        
        return $query;
    }
    public function deleteValorActivo($data){
        
            
        $query=$this->db->query("DELETE valor_activo 
        where id = {$data} ") ;
        
        return $query;
    }
    public function getValorActivoByActivo(){

        $query = $this->db->query("SELECT * FROM valor_activo where estado='1'");
        return $query->getResultArray();
    }


}