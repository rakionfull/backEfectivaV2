<?php

namespace App\Models;

use CodeIgniter\Model;

class EvaluacionRiesgo extends Model
{
    protected $table  = 'evaluacion_riesgo';

    public function getAll($id){
        $sql = "EXEC sp_list_evaluacion_riesgo @empresa = {$id}" ;
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function getAllHistoricos(){
        $sql = "EXEC sp_list_evaluacion_riesgo_historial";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function getById($id){
        $sql = "EXEC sp_get_evaluacion_riesgo_by_id ?";
        $result = $this->db->query($sql,[$id])->getResultArray();
        return $result;
    }
    
    public function store($data){
        $sql = "EXEC sp_add_evaluacion_riesgo ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?";
        $result = $this->db->query($sql,[
            $data['id_tipo_riesgo'],
            $data['id_empresa'],
            $data['id_area'],
            $data['id_unidad'],
            $data['id_macroproceso'],
            $data['id_proceso'],
            $data['id_activo'],
            $data['id_tipo_amenaza'],
            $data['id_descripcion_amenaza'],
            $data['id_tipo_vulnerabilidad'],
            $data['id_descripcion_vulnerabilidad'],
            $data['riesgo'],
            $data['valor_probabilidad'],
            $data['probabilidad'],
            $data['valor_impacto'],
            $data['impacto'],
            $data['valor'],
            $data['id_control'],
            $data['riesgo_controlado_probabilidad'],
            $data['riesgo_controlado_impacto'],
            $data['riesgo_controlado_valor'],
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
        $sql = "EXEC sp_update_evaluacion_riesgo ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?";
        $result = $this->db->query($sql,[
            $id,
            $data['id_tipo_riesgo'],
            $data['id_empresa'],
            $data['id_area'],
            $data['id_unidad'],
            $data['id_macroproceso'],
            $data['id_proceso'],
            $data['id_activo'],
            $data['id_tipo_amenaza'],
            $data['id_descripcion_amenaza'],
            $data['id_tipo_vulnerabilidad'],
            $data['id_descripcion_vulnerabilidad'],
            $data['riesgo'],
            $data['valor_probabilidad'],
            $data['probabilidad'],
            $data['valor_impacto'],
            $data['impacto'],
            $data['valor'],
            $data['id_control'],
            $data['riesgo_controlado_probabilidad'],
            $data['riesgo_controlado_impacto'],
            $data['riesgo_controlado_valor'],
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
        $sql = "EXEC sp_delete_evaluacion_riesgo ?,?,?";
        $result = $this->db->query($sql,[
            $id,
            $data['id_user_deleted'],
            $data['date_deleted']
        ]);
        if($result){
            return true;
        }
    }

    public function countByValor(){
        $sql = "EXEC sp_count_evaluacion_by_valor";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function save_historial($data){
        $sql = "EXEC sp_add_evaluacion_riesgo_historial ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?";
        $result = $this->db->query($sql,[
            $data['id_tipo_riesgo'],
            $data['id_empresa'],
            $data['id_area'],
            $data['id_unidad'],
            $data['id_macroproceso'],
            $data['id_proceso'],
            $data['id_activo'],
            $data['id_tipo_amenaza'],
            $data['id_descripcion_amenaza'],
            $data['id_tipo_vulnerabilidad'],
            $data['id_descripcion_vulnerabilidad'],
            $data['riesgo'],
            $data['valor_probabilidad'],
            $data['probabilidad'],
            $data['valor_impacto'],
            $data['impacto'],
            $data['valor'],
            $data['id_control'],
            $data['riesgo_controlado_probabilidad'],
            $data['riesgo_controlado_impacto'],
            $data['riesgo_controlado_valor'],
            $data['estado'],
            $data['id_user_added'],
            $data['date_add']
        ]);
        if($result){
            return true;
        }
        return false;
    }
}
