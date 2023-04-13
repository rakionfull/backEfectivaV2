<?php

namespace App\Models;

use CodeIgniter\Model;

class DescripcionAmenaza extends Model
{
    protected $table            = 'desc_amenaza';
    protected $useSoftDeletes   = false;
    protected $primaryKey       = 'id';
    protected $allowedFields    = [
        'id',
        'idtipo_amenaza',
        'amenaza',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];

    public function getAll(){
        $sql = "call sp_list_desc_amenaza";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function store($data){
        $sql = "call sp_add_desc_amenaza(?,?,?,?)";
        $result = $this->db->query($sql,[
            $data['idtipo_amenaza'],
            $data['amenaza'],
            $data['id_user_added'],
            $data['date_add']
        ]);
        if($result){
            return true;
        }
        return false;
    }

    public function edit($id,$data){
        $sql = "call sp_edit_desc_amenaza(?,?,?,?,?)";
        $result = $this->db->query($sql,[
            $id,
            $data['idtipo_amenaza'],
            $data['amenaza'],
            $data['id_user_updated'],
            $data['date_modify']
        ]);
        if($result){
            return true;
        }
        return false;
    }
    public function validateModify($data){
        $sql = "call sp_validate_descripcion_amenaza_modify(?,?,?)";
        $query = $this->db->query($sql,[
            $data['id'],
            $data['amenaza'],
            $data['idtipo_amenaza']
        ]);
        return $query->getResultArray();
    }
}