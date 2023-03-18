<?php

namespace App\Models;

use CodeIgniter\Model;

class MUbicActivo extends Model
{
    protected $table = 'ubicacion_activo';
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
    public function validarUbiActivo($data){
        
            $query = $this->db->query("SELECT * FROM ubicacion_activo where 
            continente='{$data['idcontinente']}' and pais='{$data['idpais']}'
            and ciudad='{$data['idciudad']}' and direccion='{$data['direccion_ubi']}'
            and descripcion='{$data['desc_ubi']}'");
            $query->getRow();
            if( $query->getRow()) return true;
            else return false;
    }
    public function getUbiActivo(){

        $query = $this->db->query("SELECT UA.id,UA.continente,UA.pais,UA.ciudad,UA.estado,UA.direccion,
        UA.descripcion,C.PaisContinente,P.paisnombre ,CI.estadonombre FROM ubicacion_activo as UA 
        inner join continente as C on UA.continente=C.ContinenteCodigo inner join
        pais as P on UA.pais=P.id inner join ciudad as CI on UA.ciudad=CI.id where UA.is_deleted=0");
        return $query->getResultArray();
    }

    
    public function saveUbiActivo($data){       

        $query=$this->db->query("INSERT INTO ubicacion_activo
        (continente,pais,ciudad,direccion,descripcion,estado) VALUES
        ('{$data['idcontinente']}','{$data['idpais']}','{$data['idciudad']}','{$data['direccion_ubi']}'
        ,'{$data['desc_ubi']}' ,{$data['est_ubi_activo']})") ;

        return $query;
    }
    public function updateUbiActivo($data){  
        
        $query=$this->db->query("UPDATE ubicacion_activo SET 
        continente = '{$data['idcontinente']}', pais = '{$data['idpais']}', ciudad = '{$data['idciudad']}',
        direccion = '{$data['direccion_ubi']}',descripcion = '{$data['desc_ubi']}',estado = '{$data['est_ubi_activo']}'
        
        where id = {$data['id']} ") ;
        
        return $query;
    }
    public function deleteUbiActivo($data){
        
            
        $query=$this->db->query("DELETE ubicacion_activo 
        where id = {$data} ") ;
        
        return $query;
    }


}