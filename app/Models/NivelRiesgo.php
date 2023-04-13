<?php

namespace App\Models;

use CodeIgniter\Model;

class NivelRiesgo extends Model
{
    protected $table            = 'nivel_riesgo';
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
        'operador1',
        'operador2',
        'valor1',
        'valor2',
        'color',
        'descripcion',
        'comentario',
        'estado',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];

    public function getAll(){
        $sql = "call sp_list_nivel_riesgo";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function store($data){
        $sql = "call sp_add_nivel_riesgo(?,?,?,?,?,?,?,?,?,?)";
        $result = $this->db->query($sql,[
            $data['descripcion'],
            $data['operador1'],
            $data['valor1'],
            $data['operador2'],
            $data['valor2'],
            $data['color'],
            $data['comentario'],
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
        $sql = "call sp_edit_nivel_riesgo(?,?,?,?,?,?,?,?,?,?,?)";
        $result = $this->db->query($sql,[
            $id,
            $data['descripcion'],
            $data['operador1'],
            $data['valor1'],
            $data['operador2'],
            $data['valor2'],
            $data['color'],
            $data['comentario'],
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
        $sql = "call sp_validate_nivel_riesgo_modify(?,?)";
        $query = $this->db->query($sql,[
            $data['id'],
            $data['descripcion']
        ]);
        return $query->getResultArray();
    }
}