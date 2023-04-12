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
        
        // $query = $this->db->query("SELECT * from empresa  
        // where empresa ='{$data['empresa']}' and is_deleted=0;");
        $sql = "CALL validaEmpresa(?)";

        $query = $this->db->query($sql, [
          $data['empresa']
        ]);
        if( $query->getRow()) return true;
        else return false;
    }
    //retorna todos los perfiles
    public function getEmpresas(){

      
        $sql = "CALL listarEmpresa()";

	      $query = $this->db->query($sql, [
        
        ]);
        return $query->getResultArray();
    }
    public function getEmpresasByActivo(){

    
        $sql = "CALL listarEmpresaByAcivo()";

	    $query = $this->db->query($sql, [
        
        ]);
        return $query->getResultArray();
    }
    public function saveEmpresa($data){
    
 
  
          $sql = "CALL agregar_empresa(?,?,?)";

          $query = $this->db->query($sql, [
            $data[0]['empresa'],
            $data[0]['estado'],
            $data['user']
          ]);
          return $query;
    }
    public function updateEmpresa($data){
      
 
        $sql = "CALL editar_empresa(?,?,?,?)";

          $query = $this->db->query($sql, [
            $data[0]['empresa'],
            $data[0]['estado'],
            $data[0]['id'],
            $data['user']
          ]);
        return $query;
    }

    public function validateEmpresaModify($data){
      $sql = "call sp_validate_empresa_modify(?,?)";
      $query = $this->db->query($sql,[
        $data[0]['id'],
        $data[0]['empresa']
      ]);
      return $query->getResultArray();

    }
   
}
