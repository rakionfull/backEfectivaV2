<?php

namespace App\Models;

use CodeIgniter\Model;

class MclasInformacion extends Model
{
    protected $table = 'clasificacion_informacion';
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
    public function validarClasInfo($data){
            
            // $query = $this->db->query("SELECT * FROM clasificacion_informacion 
            // where clasificacion='{$data}'");
            $query = $this->db->query("EXEC validaClasInfo 
            @clasificacion= '{$data}'");
            $query->getRow();
            if( $query->getRow()) return true;
            else return false;
    }
    public function getClasInformacion(){

        //$query = $this->db->query("SELECT * FROM clasificacion_informacion where is_deleted=0");
        $query = $this->db->query("EXEC listarclasinfo");
        return $query->getResultArray();
    }
    public function saveClasInformacion($data){       

        // $query=$this->db->query("INSERT INTO clasificacion_informacion
        // (clasificacion,descripcion, estado) VALUES
        // ('{$data['clasificacion']}','{$data['descripcion']}',{$data['estado']})") ;
        $query = $this->db->query("EXEC agregar_clasinfo
        @clasificacion = '{$data[0]['clasificacion']}',
        @descripcion= '{$data[0]['descripcion']}',
        @estado= '{$data[0]['estado']}',
        @idUserAdd= '{$data['user']}'");
        return $query;

    }
    public function updateClasInformacion($data){  
        
        // $query=$this->db->query("UPDATE clasificacion_informacion SET 
        // clasificacion = '{$data['clasificacion']}',
        // descripcion = '{$data['descripcion']}',
        // estado = '{$data['estado']}'
        // where id = {$data['id']} ") ;    
         $query = $this->db->query("EXEC editar_clasinfo
         @idclasi = '{$data[0]['id']}',
         @clasificacion = '{$data[0]['clasificacion']}',
         @descripcion= '{$data[0]['descripcion']}',
         @estado= '{$data[0]['estado']}',
         @idUserAdd= '{$data['user']}'");
        return $query;
    }
    // public function deleteClasInfo($data){
        
            
    //     $query=$this->db->query("DELETE clasificacion_informacion 
    //     where id = {$data} ") ;
        
    //     return $query;
    // }

}