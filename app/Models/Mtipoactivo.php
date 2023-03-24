<?php

namespace App\Models;

use CodeIgniter\Model;

class Mtipoactivo extends Model
{
    protected $table = 'tipo_activo';
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

    public function validarTipoActivo($data){
      
         $query = $this->db->query("SELECT * FROM tipo_activo 
         where tipo='{$data[0]['tipo']}'");
        //$query = $this->db->query("EXEC validaTipoActivo @tipo='{$data[0]['tipo']}'");
     
        if( $query->getRow()) return true;
        else return false;
    } 
    public function getTipoActivoByActivo(){
        // $query = $this->db->query("EXEC getTipoActivoByActivo");
        $sql = "CALL getTipoActivoByActivo()";

        $query = $this->db->query($sql, [
        
        ]);
        return $query->getResultArray();
    }
    public function getTipoActivo(){

        // $query = $this->db->query("EXEC listartipoactivo");
        $sql = "CALL listartipoactivo()";

        $query = $this->db->query($sql, [
        
        ]);
        return $query->getResultArray();
    }
    public function saveTipoActivo($data){       
        // $query = $this->db->query("EXEC agregar_tipoactivo
        // @tipo = '{$data[0]['tipo']}',
        // @estado= '{$data[0]['estado']}',
        // @idUserAdd= '{$data['user']}'");

        $sql = "CALL agregar_tipoactivo(?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['tipo'],
            $data[0]['estado'],
            $data['user']
        ]);
        return $query;
    }
    public function updateTipoActivo($data){  
        
       
        // $query = $this->db->query("EXEC editar_tipoactivo
        // @tipo = '{$data[0]['tipo']}',
        // @idtipo = '{$data[0]['id']}',
        // @estado= '{$data[0]['estado']}',
        // @idUserAdd= '{$data['user']}'");

        $sql = "CALL editar_tipoactivo(?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['tipo'],
            $data[0]['id'],
            $data[0]['estado'],
            $data['user']
        ]);

        return $query;
    }
 


}