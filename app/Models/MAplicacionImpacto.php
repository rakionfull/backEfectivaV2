<?php

namespace App\Models;

use CodeIgniter\Model;

class MAplicacionImpacto extends Model
{
    protected $table = 'aplicacion_impacto';
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
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];

    public function validaAplicacionImpacto($data){
        
        $query = $this->db->query("EXEC valida_AplicacionImpacto @escenario='".$data['escenario']."' ,
        @disenio='".$data['disenio']."', @posicion='".$data['posicion']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getAplicacionImpacto($escenario){
        
        $query = $this->db->query("EXEC listar_AplicacionImpacto @escenario='{$escenario}'");
        return $query->getResultArray();
    }


    public function saveAplicacionImpacto($data){       

        $query=$this->db->query("EXEC agregar_AplicacionImpacto @disenio='{$data[0]['disenio']}',
        @posicion='{$data[0]['posicion']}', @escenario={$data[0]['escenario']}, @descripcion='{$data[0]['descripcion']}', @idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateAplicacionImpacto($data){  
        
        $query= $this->db->query("EXEC modificar_AplicacionImpacto @disenio='{$data[0]['disenio']}',
        @posicion='{$data[0]['posicion']}', @escenario={$data[0]['escenario']}, @descripcion='{$data[0]['descripcion']}',@idUserAdd= {$data['user']},@idAplicacionImpacto={$data[0]['id']}") ;
        return $query;
    }
    public function deleteAplicacionImpacto($data){
            
        $query=$this->db->query("EXEC eliminar_AplicacionImpacto @idUserAdd={$data['user']}, @idAplicacionImpacto={$data[0]['id']}") ;
        
        return $query;
    }
    public function getByCaracteristica($data){
        $query = $this->db->query("EXEC sp_get_aplicacion_impacto_by_caracteristica ?,?",[$data['caracteristica'],$data['escenario']]);
        return $query->getResultArray();
    }
}