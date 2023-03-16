<?php

namespace App\Models;

use CodeIgniter\Model;

class CategoriasVulnerabilidad extends Model
{
    protected $table            = 'categoria_vulnerabilidad';
    protected $allowedFields    = [
        'categoria',
        'estado'
    ];

    public function getAll(){
        $sql = "EXEC sp_list_categoria_vulnerabilidad";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function store($data){
        $sql = "EXEC sp_add_categoria_vulnerabilidad ?,?,?,?";
        $result = $this->db->query($sql,[
            $data['categoria'],
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
        $sql = "EXEC sp_edit_categoria_vulnerabilidad ?,?,?,?,?";
        $result = $this->db->query($sql,[
            $id,
            $data['categoria'],
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
        $sql = "EXEC sp_delete_categoria_vulnerabilidad ?,?,?";
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