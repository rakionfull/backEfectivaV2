<?php

namespace App\Models;

use CodeIgniter\Model;

class DescripcionVulnerabilidad extends Model
{
    protected $table            = 'desc_vulnerabilidad';
    protected $allowedFields    = [
        'idcategoria',
        'vulnerabilidad'
    ];
    public function getAll(){
        $sql = "EXEC sp_list_desc_vulnerabilidad";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function store($data){
        $sql = "EXEC sp_add_desc_vulnerabilidad ?,?,?,?";
        $result = $this->db->query($sql,[
            $data['idcategoria'],
            $data['vulnerabilidad'],
            $data['id_user_added'],
            $data['date_add']
        ]);
        if($result){
            return true;
        }
        return false;
    }

    public function edit($id,$data){
        $sql = "EXEC sp_edit_desc_vulnerabilidad ?,?,?,?,?";
        $result = $this->db->query($sql,[
            $id,
            $data['idcategoria'],
            $data['vulnerabilidad'],
            $data['id_user_updated'],
            $data['date_modify']
        ]);
        if($result){
            return true;
        }
        return false;
    }

    public function destroy($id,$data){
        $sql = "EXEC sp_delete_desc_vulnerabilidad ?,?,?";
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