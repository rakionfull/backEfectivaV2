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
        
            // $query = $this->db->query("SELECT * FROM ubicacion_activo 
            // where 
            // continente='{$data['idcontinente']}' 
            // and pais='{$data['idpais']}'
            // and ciudad='{$data['idciudad']}' 
            // and direccion='{$data['direccion_ubi']}'
            // and descripcion='{$data['desc_ubi']}'");
            // $query = $this->db->query("EXEC validaUbiActivo
            // @continente= '{$data[0]['idcontinente']}',
            // @pais= '{$data[0]['idpais']}' ,
            // @ciudad= '{$data[0]['idciudad']}',
            // @direccion = '{$data[0]['direccion_ubi']}',
            // @descripcion= '{$data[0]['desc_ubi']}'");
            $sql = "call validaUbiActivo(?,?,?,?,?)";

            $query = $this->db->query($sql, [
                $data[0]['idcontinente'],
                $data[0]['idpais'],
                $data[0]['idciudad'],
                $data[0]['direccion_ubi'], 
                $data[0]['desc_ubi'],
               
            ]);
            if( $query->getRow()) return true;
            else return false;
    }
    public function getUbiActivo(){

   
        // $query = $this->db->query("EXEC listarubiactivo");
        $sql = "CALL listarubiactivo()";

        $query = $this->db->query($sql, [
        ]);
        return $query->getResultArray();
    }

    
    public function saveUbiActivo($data){       

      

         
        $sql = "CALL agregar_ubiactivo(?,?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['idcontinente'],
            $data[0]['idpais'],
            $data[0]['idciudad'],
            $data[0]['direccion_ubi'],
            $data[0]['desc_ubi'],
            $data[0]['est_ubi_activo'],
            $data['user']
        ]);
        return $query;
    }
    public function updateUbiActivo($data){  
    
       

        $sql = "CALL editar_ubiactivo(?,?,?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['id'],
            $data[0]['idcontinente'],
            $data[0]['idpais'],
            $data[0]['idciudad'],
            $data[0]['direccion_ubi'],
            $data[0]['desc_ubi'],
            $data[0]['est_ubi_activo'],
            $data['user']
        ]);
        return $query;
    }


}