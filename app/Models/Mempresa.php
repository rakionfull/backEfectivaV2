<?php

namespace App\Models;

use CodeIgniter\Model;

class Mempresa extends Model
{
    protected $table = 'empresa';
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

    public function validaEmpresa($data){
        
        $query = $this->db->query("SELECT * FROM empresa where  empresa='{$data['empresa']}'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    //retorna todos los perfiles
    public function getEmpresas(){

        $query = $this->db->query("SELECT * FROM empresa");
        return $query->getResultArray();
    }
    public function getEmpresasByActivo(){

        $query = $this->db->query("SELECT * FROM empresa where estado='1'");
        return $query->getResultArray();
    }
    public function saveEmpresa($data){
    
        $query=$this->db->query("INSERT INTO empresa
        (empresa,estado) VALUES
        ('{$data[0]['empresa']}',{$data[0]['estado']})") ;
       $empresa = $this->db->query("SELECT  @@IDENTITY as maxid FROM empresa");
        
        $result = $this->db->query("EXEC add_escenario_active @idEmpresa={$empresa->getRow()->maxid} ,@escenario='1',@idUser={$data['user']}");
        return $result;
    }
    public function updateEmpresa($data){
      
        
        $query=$this->db->query("UPDATE empresa SET 
        empresa = '{$data['empresa']}',
        estado = '{$data['estado']}'
        where id = {$data['id']} ") ;
           
        return $query;
    }
    public function deleteEmpresa($data){
        
            
        $query=$this->db->query("DELETE empresa 
        where id = {$data} ") ;
        
        return $query;
    }
  
  
}
