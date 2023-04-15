<?php

namespace App\Models;

use CodeIgniter\Model;

class EvaluacionRiesgosControles extends Model
{
    protected $table            = 'evaluacion_riesgos_controles';
    protected $primaryKey       = 'id';
    protected $useSoftDeletes   = true;
    protected $allowedFields    = [
        'id_evaluacion_riesgo',
        'id_control',
        'id_user_added',
        'date_add',
        'id_user_updated',
        'date_modify',
        'id_user_deleted',
        'date_deteled',
        'is_deleted'
    ];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'date_add';
    protected $updatedField  = 'date_modify';
    protected $deletedField  = 'date_deteled';

    public function store($data){
        $sql = "call add_evaluacion_riesgos_controles(?,?,?)";
        $result = $this->db->query($sql,[
            $data['id_evaluacion_riesgo'],
            $data['id_control'],
            $data['id_user_added'],
            // $data['date_add']
        ]);
        if($result){
            return true;
        }
        return false;
    }
    public function getByEvaluacionRiesgoId($id){
        $sql = "call sp_get_evaluacion_riesgo_controles_by_evaluacion_riesgo_id(?)";
        $result = $this->db->query($sql,[$id])->getResultArray();
        return $result;
    }
}
