<?php

namespace App\Models;

use CodeIgniter\Model;

class TipoAmenaza extends Model
{
    protected $table            = 'tipo_amenaza';
    protected $useSoftDeletes   = false;
    // protected $protectFields    = true;
    protected $primaryKey       = 'id';
    protected $allowedFields    = [
        'id',
        'tipo',
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
        $sql = "call sp_list_tipo_amenaza";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function store($data){
        $sql = "call sp_add_tipo_amenaza(?,?,?,?)";
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
        $sql = "call sp_edit_tipo_amenaza(?,?,?,?,?)";
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
        $sql = "call sp_delete_tipo_amenaza(?,?,?)";
        $result = $this->db->query($sql,[
            $id,
            $data['id_user_deleted'],
            $data['date_deleted']
        ]);
        if($result){
            return true;
        }
    }
    public function validateModify($data){
        $sql = "call sp_validate_tipo_amenaza_modify(?,?)";
        $query = $this->db->query($sql,[
            $data['id'],
            $data['tipo']
        ]);
        return $query->getResultArray();
    }

}