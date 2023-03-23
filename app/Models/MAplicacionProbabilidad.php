<?php

namespace App\Models;

use CodeIgniter\Model;

class MAplicacionProbabilidad extends Model
{
    protected $table = 'aplicacion_probailidad';
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
    public function validaAplicacionProbabilidad($data){
        
        // $query = $this->db->query("EXEC valida_AplicacionProbabilidad @escenario='".$data['escenario']."' ,
        // @disenio='".$data['disenio']."', @posicion='".$data['posicion']."'");

        $sql = "CALL valida_AplicacionProbabilidad(?,?,?)";

	    $query = $this->db->query($sql, [
            $data['escenario'],
            $data['disenio'],
            $data['posicion']
        ]);

        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getAplicacionProbabilidad($escenario){
        
        //$query = $this->db->query("EXEC listar_AplicacionProbabilidad @escenario='{$escenario}'");
        $sql = "CALL listar_AplicacionProbabilidad(?)";

	    $query = $this->db->query($sql, [
           $escenario
        ]);
        return $query->getResultArray();
    }


    public function saveAplicacionProbabilidad($data){       

        // $query=$this->db->query("EXEC agregar_AplicacionProbabilidad 
        // @disenio='{$data[0]['disenio']}',
        // @posicion='{$data[0]['posicion']}', 
        // @escenario={$data[0]['escenario']}, 
        // @descripcion='{$data[0]['descripcion']}', 
        // @idUserAdd= {$data['user']}") ;
        $sql = "CALL agregar_AplicacionProbabilidad(?,?,?,?,?)";

	    $query = $this->db->query($sql, [
            $data[0]['disenio'],
            $data[0]['posicion'],
            $data[0]['escenario'],
            $data[0]['descripcion'],
            $data['user'],
        ]);
        return $query;
    }
    public function updateAplicacionProbabilidad($data){  
        
        // $query= $this->db->query("EXEC modificar_AplicacionProbabilidad 
        // @disenio='{$data[0]['disenio']}',
        // @posicion='{$data[0]['posicion']}', 
        // @escenario={$data[0]['escenario']}, 
        // @descripcion='{$data[0]['descripcion']}',
        // @idUserAdd= {$data['user']},
        // @idAplicacionProbabilidad={$data[0]['id']}") ;

        $sql = "CALL modificar_AplicacionProbabilidad(?,?,?,?,?,?)";

	    $query = $this->db->query($sql, [
            $data[0]['disenio'],
            $data[0]['posicion'],
            $data[0]['escenario'],
            $data[0]['descripcion'],
            $data['user'],
            $data[0]['id']
        ]);
        
        return $query;
    }
    public function deleteAplicacionProbabilidad($data){
            
        //$query=$this->db->query("EXEC eliminar_AplicacionProbabilidad @idUserAdd={$data['user']},
        // @idAplicacionProbabilidad={$data[0]['id']}") ;
        $sql = "CALL eliminar_AplicacionProbabilidad(?,?,?,?,?,?)";

	    $query = $this->db->query($sql, [
            $data['user'],
            $data[0]['id']
        ]);

        return $query;
    }
    public function getByCaracteristica($data){
        //$query = $this->db->query("EXEC sp_get_aplicacion_probabilidad_by_caracteristica ?,?",[$data['caracteristica'],$data['escenario']]);
        $sql = "CALL sp_get_aplicacion_probabilidad_by_caracteristica(?,?)";

	    $query = $this->db->query($sql, [
            $data['caracteristica'],
            $data['escenario']
        ]);
        
        return $query->getResultArray();
    }
}