<?php

namespace App\Models;

use CodeIgniter\Model;

class ImpactoRiesgo extends Model
{
    protected $table = 'impacto_riesgo';
    protected $primaryKey       = 'id';
    protected $useSoftDeletes   = false;

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'date_add';
    protected $updatedField  = 'date_modify';
    protected $deletedField  = 'date_deleted';

    protected $allowedFields = [
        'id',
        'descripcion',
        'tipo_regla',
        'tipo_valor',
        'formula',
        'operador1',
        'valor1',
        'operador2',
        'valor2',
        'comentario',
        'estado',
        'escenario',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];



    public function getAll($scene){
        $sql = "call sp_list_impacto(?)";
        $result = $this->db->query($sql,[$scene])->getResultArray();
        return $result;
    }

    public function store_1($data){
        $sql = "call sp_add_impacto_1(?,?,?,?,?,?,?,?,?)";
        $result = $this->db->query($sql,[
            $data['descripcion'],
            $data['tipo_regla'],
            $data['tipo_valor'],
            $data['comentario'],
            $data['estado'],
            '1',
            $data['formula'],
            $data['id_user_added'],
            $data['date_add']
        ]);
        if($result){
            return true;
        }
        return false;
    }

    public function store_2($data){

        $sql = "call sp_add_impacto_2(?,?,?,?,?,?,?,?,?,?,?,?)";
        $result = $this->db->query($sql,[
            $data['descripcion'],
            $data['tipo_regla'],
            $data['tipo_valor'],
            $data['operador1'],
            $data['valor1'],
            $data['operador2'],
            $data['valor2'],
            $data['comentario'],
            $data['estado'],
            '2',
            $data['id_user_added'],
            $data['date_add']
        ]);
        if($result){
            return true;
        }
        return false;

    }
    public function edit_1($data){
        $sql = "call sp_edit_impacto_1(?,?,?,?,?,?,?,?,?)";
        $result = $this->db->query($sql,[
            $data['id'],
            $data['descripcion'],
            $data['tipo_regla'],
            $data['tipo_valor'],
            $data['comentario'],
            $data['estado'],
            $data['formula'],
            $data['id_user_updated'],
            $data['date_modify']
        ]);
        if($result){
            return true;
        }
        return false;
    }
    public function edit_2($data){
        $sql = "call sp_edit_impacto_2(?,?,?,?,?,?,?,?,?,?,?,?)";
        $result = $this->db->query($sql,[
            $data['id'],
            $data['descripcion'],
            $data['tipo_regla'],
            $data['tipo_valor'],
            $data['operador1'],
            $data['valor1'],
            $data['operador2'],
            $data['valor2'],
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

    public function getActivesScene1(){
        $sql = "call sp_get_active_impacto_escenario_1";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function validateCombinatoria($data){
        $sql = "call sp_validate_combinatoria_impacto(?,?,?,?)";
        $result = $this->db->query($sql,[
            $data['operador1'],
            $data['valor1'],
            $data['operador2'],
            $data['valor2'],
        ])->getResultArray();
        return $result;
    }
    public function getByDescription($data){
        $sql = "call sp_get_impacto_by_description(?)";
        $result = $this->db->query($sql,[
            $data['descripcion']
        ])->getResultArray();
        return $result;
    }
    public function validateModify($data){
        $sql = "call sp_validate_impacto_riesgo_modify(?,?,?)";
        $query = $this->db->query($sql,[
            $data['id'],
            $data['descripcion'],
            $data['escenario']
        ]);
        return $query->getResultArray();
    }
}