<?php

namespace App\Models;

use CodeIgniter\Model;

class TipoAmenaza extends Model
{
    protected $table            = 'tipo_amenaza';
    protected $allowedFields    = [
        'tipo',
        'estado'
    ];

    public function getAll(){
        $sql = "EXEC sp_list_tipo_amenaza";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function store($data){
        $sql = "EXEC sp_add_tipo_amenaza ?,?,?,?";
        $result = $this->db->query($sql,[
            $data['tipo'],
            $data['estado'],
            $data['id_user_added'],
            $data['date_add']
        ]);
        if($result){
            return true;
        }
        return false;
    }

    public function edit($id,$data){
        $sql = "EXEC sp_edit_tipo_amenaza ?,?,?,?,?";
        $result = $this->db->query($sql,[
            $id,
            $data['tipo'],
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
        $sql = "EXEC sp_delete_tipo_amenaza ?,?,?";
        $result = $this->db->query($sql,[
            $id,
            $data['id_user_deleted'],
            $data['date_deleted']
        ]);
        if($result){
            return true;
        }
    }

}