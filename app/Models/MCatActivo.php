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
            $query = $this->db->query("EXEC validaCatActivo 
            @categoria = '{$data[0]['categoria']}',
            @tipo= '{$data[0]['idtipo']}'");
            $query->getRow();
            if( $query->getRow()) return true;
            else return false;
    }
    public function getCatActivo(){

        //$query = $this->db->query("SELECT CA.id,CA.categoria,CA.estado,CA.idtipo,TA.tipo FROM categoria_activo as CA inner join tipo_activo as TA on CA.idtipo=TA.id where CA.is_deleted=0");
        $query = $this->db->query("EXEC listarcatactivo ");
        return $query->getResultArray();
    }

    
    public function saveCatActivo($data){       

        // $query=$this->db->query("INSERT INTO categoria_activo
        // (categoria,estado,idtipo) VALUES
        // ('{$data['categoria']}',{$data['estado']},{$data['idtipo']})") ;
        $query = $this->db->query("EXEC agregar_catactivo
        @categoria= '{$data[0]['categoria']}',
        @tipo= '{$data[0]['idtipo']}',
        @estado= '{$data[0]['estado']}',
        @idUserAdd=  '{$data['user']}'");
        return $query;
    }
    public function updateCatActivo($data){  
        
        // $query=$this->db->query("UPDATE categoria_activo SET 
        // categoria = '{$data['categoria']}', estado = '{$data['estado']}', idtipo = '{$data['idtipo']}'
        // where id = {$data['id']} ") ;
        $query = $this->db->query("EXEC editar_catactivo  
        @categoria= '{$data[0]['categoria']}',
        @idcategoria= '{$data[0]['id']}',
        @tipo= '{$data[0]['idtipo']}',
        @estado= '{$data[0]['estado']}',
        @idUserAdd=  '{$data['user']}'");
        return $query;
    }
    // public function deleteCatActivo($data){
        
            
    //     $query=$this->db->query("DELETE categoria_activo 
    //     where id = {$data} ") ;
        
    //     return $query;
    // }


}