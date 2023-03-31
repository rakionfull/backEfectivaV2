<?php

namespace App\Models;

use CodeIgniter\Model;

class MCaractControl extends Model
{
    protected $table = 'caracteristica_control';
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
    public function validaCaractControl($data){
        


        $sql = "CALL valida_caractControl(?,?)";

        $query = $this->db->query($sql, [
            $data[0]['caracteristica'],
            $data[0]['id']
        ]);

        if( $query->getRow()) return true;
        else return false;
    }
    public function getCaractControl($id,$tipo,$calificacion){
        
        // $query = $this->db->query("EXEC listar_caractControl");
        if($id == 0){
            // $query = $this->db->query("SELECT * FROM caracteristica_control where tipo='menu' and estado=1 and is_deleted=0 ");
            $sql = "CALL getCaractControl()";

            $query = $this->db->query($sql, [
              
            ]);
        }else{
                    // $query = $this->db->query("SELECT * FROM caracteristica_control 
                    // where estado=1 and is_deleted=0  and idOpcion={$id}");
                     $sql = "CALL getCaractControlById(?)";

                     $query = $this->db->query($sql, [
                        $id
                     ]);
            
        }
        
        return $query->getResultArray();
    }

    // public function getOpcionesCaracteristica(){
        
    //     $query = $this->db->query("SELECT * from caracteristica_control where is_deleted=0 and estado=1 order by caracteristica");
    //     return $query->getResultArray();
    // }
    public function getOpcionesCaracteristica($tipo){
        
        // $query = $this->db->query("SELECT * from caracteristica_control where is_deleted=0 and estado=1 and tipo='{$tipo}' order by date_add ");
        
        $sql = "CALL getOpcionesCaracteristica(?)";

                     $query = $this->db->query($sql, [
                        $tipo
                     ]);
            
        return $query->getResultArray();
    }
    public function saveCaractControl($data){       

    
        $sql = "CALL agregar_caractControl(?,?,?,?,?,?,?,?,?,?,?,?,?)";

	    $query = $this->db->query($sql, [
            $data[0]['caracteristica'],
            $data[0]['descripcion'],
            $data[0]['estado'],
            $data[0]['peso'],
            $data[0]['valor'],
            $data[0]['condicion'],
            $data[0]['tipo'],
            $data[0]['id'],
            $data[0]['calificacion'],
            $data[0]['check_tabla'],
            $data[0]['nom_tabla'],
            $data[0]['seleccionable'],
            $data['user']
        
        ]);

        return $query;
    }
    public function updateCaractControl($data){  
        

        $sql = "CALL modificar_caractControl(?,?,?,?,?,?,?,?,?,?,?,?)";

	    $query = $this->db->query($sql, [
            $data[0]['caracteristica'],
            $data[0]['descripcion'],
            $data[0]['estado'],
            $data[0]['peso'],
            $data[0]['valor'],
            $data[0]['condicion'],
            $data[0]['check_tabla'],
            $data[0]['nom_tabla'],
           
            $data[0]['calificacion'],
            $data[0]['seleccionable'],
            $data['user'],
            $data[0]['id_op'],
        
        ]);

        return $query;
    }
    public function deleteCaractControl($data){
            
        // $query=$this->db->query("EXEC eliminar_caractControl @idUserAdd={$data['user']}, @idCaractControl={$data[0]['id_op']}") ;
        $sql = "CALL eliminar_caractControl(?,?)";

	    $query = $this->db->query($sql, [

            $data['user'],
            $data[0]['id_op']
        
        ]);
        return $query;
    }
}