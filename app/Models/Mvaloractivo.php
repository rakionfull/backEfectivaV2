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
    public function validarValActivo($data){
        
            // $query = $this->db->query("SELECT * FROM valor_activo where valor='{$data[0]['valor']}' and is_deleted=0");
            $sql = "CALL validaValorActivo(?)";

            $query = $this->db->query($sql, [
                $data[0]['valor']
            ]);
            if( $query->getRow()) return true;
            else return false;
    }
    public function getValorActivo(){

     
        // $query = $this->db->query("EXEC listarValorActivo");
        $sql = "CALL listarValorActivo()";

        $query = $this->db->query($sql, [
        
        ]);
        return $query->getResultArray();
    }



    public function saveValorActivo($data){       

      
        // $query = $this->db->query("EXEC agregar_valoractivo
        // @valor = '{$data[0]['valor']}',
        // @estado= {$data[0]['estado']},
        // @idUserAdd={$data['user']}");
        $sql = "CALL agregar_valoractivo(?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['valor'],
            $data[0]['estado'],
            $data['user']
        ]);
        return $query;
    }
    public function updateValorActivo($data){  
        
        
        // $query = $this->db->query("EXEC editar_valoractivo
        // @valor = '{$data[0]['valor']}',
        // @idvalor = '{$data[0]['id']}',
        // @estado= {$data[0]['estado']},
        // @idUserAdd={$data['user']}");
        $sql = "CALL editar_valoractivo(?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['valor'],
            $data[0]['id'],
            $data[0]['estado'],
            $data['user']
        ]);
        return $query;
    }
  
    public function getValorActivoByActivo(){

        // $query = $this->db->query("EXEC getValorActivoByActivo");
        $sql = "CALL getValorActivoByActivo()";

        $query = $this->db->query($sql, [
        
        ]);
        return $query->getResultArray();
    }


}