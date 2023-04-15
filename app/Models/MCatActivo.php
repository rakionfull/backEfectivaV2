<?php

namespace App\Models;

use CodeIgniter\Model;

class MCatActivo extends Model
{
    protected $table = 'categoria_activo';
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
        'estado',
        'idtipo',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];
    public function validarCatActivo($data){
        
            // $query = $this->db->query("SELECT * FROM categoria_activo 
            // where categoria='{$data['categoria']}' 
            //  and idtipo='{$data['idtipo']}'");
             $sql = "CALL validaCatActivo(?,?)";

            $query = $this->db->query($sql, [
                $data['categoria'],
                $data['idtipo']
            ]);

            if( $query->getRow()) return true;
            else return false;
    }
    public function validateCatActivoModify($data){
          
        // $query = $this->db->query("SELECT * from empresa  
        // where empresa ='{$data['empresa']}' and is_deleted=0;");
        $sql = "CALL sp_cat_activo_modify(?,?,?)";

        $query = $this->db->query($sql, [
        
            $data[0]['id'],
            $data[0]['categoria'],
            $data[0]['idtipo'],
        ]);
        return $query->getResultArray();

    }
    public function getCatActivo(){

          //  $query = $this->db->query("EXEC listarcatactivo ");
        $sql = "CALL listarcatactivo()";

        $query = $this->db->query($sql, [
        ]);
        return $query->getResultArray();
    }

    
    public function saveCatActivo($data){       

        // $query = $this->db->query("EXEC agregar_catactivo
        // @categoria= '{$data[0]['categoria']}',
        // @tipo= '{$data[0]['idtipo']}',
        // @estado= '{$data[0]['estado']}',
        // @idUserAdd=  '{$data['user']}'");

        $sql = "CALL agregar_catactivo(?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['categoria'],
            $data[0]['idtipo'],
            $data[0]['estado'],
            $data['user']
        ]);

        return $query;
    }
    public function updateCatActivo($data){  
        
       
        // $query = $this->db->query("EXEC editar_catactivo  
        // @categoria= '{$data[0]['categoria']}',
        // @idcategoria= '{$data[0]['id']}',
        // @tipo= '{$data[0]['idtipo']}',
        // @estado= '{$data[0]['estado']}',
        // @idUserAdd=  '{$data['user']}'");

        $sql = "CALL editar_catactivo(?,?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['categoria'],
            $data[0]['id'],
            $data[0]['idtipo'],
            $data[0]['estado'],
            $data['user']
        ]);
        return $query;
    }
   
}