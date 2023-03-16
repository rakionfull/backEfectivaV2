<?php

namespace App\Models;

use CodeIgniter\Model;

class NivelRiesgo extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'nivel_riesgo';
    protected $allowedFields    = [
        'operador1',
        'operador2',
        'valor1',
        'valor2',
        'color',
        'descripcion',
        'comentario',
        'estado'
    ];

    public function getAll(){
        $sql = "EXEC sp_list_nivel_riesgo";
        $result = $this->db->query($sql)->getResultArray();
        return $result;
    }

    public function store($data){
        $sql = "EXEC sp_add_nivel_riesgo ?,?,?,?,?,?,?,?,?,?";
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
        $sql = "EXEC sp_edit_nivel_riesgo ?,?,?,?,?,?,?,?,?,?,?";
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

    public function destroy($id,$data){
        $sql = "EXEC sp_delete_nivel_riesgo ?,?,?";
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