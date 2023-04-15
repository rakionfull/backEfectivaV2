<?php

namespace App\Models;

use CodeIgniter\Model;

class TipoRiesgo extends Model
{
    protected $table = 'tipo_riesgo';

    protected $useSoftDeletes   = false;
    // protected $protectFields    = true;
    protected $primaryKey       = 'id';
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

    public function getAll(){
        $sql = "call sp_list_tipo_riesgo";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function store($data){
        $sql = "call sp_insert_tipo_riesgo(?,?,?,?,?)";
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
        $sql = "call sp_update_tipo_riesgo(?,?,?,?,?,?)";
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

    public function validateModify($data){
        $sql = "call sp_validate_tipo_riesgo_modify(?,?)";
        $query = $this->db->query($sql,[
            $data['id'],
            $data['tipo_riesgo']
        ]);
        return $query->getResultArray();
    }
    
}