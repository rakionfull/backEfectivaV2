<?php

namespace App\Models;

use CodeIgniter\Model;

class TipoRiesgo extends Model
{
    protected $table = 'tipo_riesgo';

    public function getAll(){
        $sql = "EXEC sp_list_tipo_riesgo";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function store($data){
        $sql = "EXEC sp_insert_tipo_riesgo ?,?,?,?,?";
        $result = $this->db->query($sql,[
            $data['tipo_riesgo'],
            $data['descripcion'],
            $data['estado'],
            $data['id_user_added'],
            $data['date_add']
        ]);
        if($result){
            return true;
        }
        return false;
    }

    public function edit($data){
        $sql = "EXEC sp_update_tipo_riesgo ?,?,?,?,?,?";
        $result = $this->db->query($sql,[
            $data['id'],
            $data['tipo_riesgo'],
            $data['descripcion'],
            $data['estado'],
            $data['id_user_updated'],
            $data['date_modify']
        ]);
        if($result){
            return true;
        }
        return false;
    }

    public function destroy($id,$data){
        $sql = "EXEC sp_delete_tipo_riesgo ?,?,?";
        $result = $this->db->query($sql,[
            $id,
            $data['id_user_deleted'],
            $data['date_deleted']
        ]);
        if($result){
            return true;
        }
        return false;
    }
    
}