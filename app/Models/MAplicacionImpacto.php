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
        
        $query = $this->db->query("SELECT * FROM aplicacion_impacto where idclasificacion= '{$data['disenio']}' and 
        posicion= '{$data['posicion']}' and escenario='{$data['escenario']}' and is_deleted=0");
        
        if( $query->getRow()) return true;
        else return false;
    }
    public function getAplicacionImpacto($escenario){
        
        //$query = $this->db->query("EXEC listar_AplicacionImpacto @escenario='{$escenario}'");

        $sql = "CALL listar_AplicacionImpacto(?)";

	    $query = $this->db->query($sql, [
            $escenario
            
        ]);

        return $query->getResultArray();
    }


    public function saveAplicacionImpacto($data){       

        // $query=$this->db->query("EXEC agregar_AplicacionImpacto @disenio='{$data[0]['disenio']}',
        // @posicion='{$data[0]['posicion']}', @escenario={$data[0]['escenario']},
        //  @descripcion='{$data[0]['descripcion']}', @idUserAdd= {$data['user']}") ;
        
        $sql = "CALL agregar_AplicacionImpacto(?,?,?,?,?)";

	    $query = $this->db->query($sql, [
            $data[0]['disenio'],
            $data[0]['posicion'],
            $data[0]['escenario'],
            $data[0]['descripcion'],
            $data['user']
        ]);

        return $query;
    }
    public function updateAplicacionImpacto($data){  
        
        // $query= $this->db->query("EXEC modificar_AplicacionImpacto 
        // @disenio='{$data[0]['disenio']}',
        // @posicion='{$data[0]['posicion']}', 
        // @escenario={$data[0]['escenario']}, 
        // @descripcion='{$data[0]['descripcion']}',
        // @idUserAdd= {$data['user']},
        // @idAplicacionImpacto={$data[0]['id']}") ;
        $sql = "CALL modificar_AplicacionImpacto(?,?,?,?,?,?)";

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
    public function deleteAplicacionImpacto($data){
            
        //$query=$this->db->query("EXEC eliminar_AplicacionImpacto @idUserAdd={$data['user']}, @idAplicacionImpacto={$data[0]['id']}") ;
        $sql = "CALL eliminar_AplicacionImpacto(?,?)";

	    $query = $this->db->query($sql, [
            $data['user'],
            $data[0]['id']
        ]);
        return $query;
    }
    public function getByCaracteristica($data){
        //$query = $this->db->query("EXEC sp_get_aplicacion_impacto_by_caracteristica ?,?",[$data['caracteristica'],$data['escenario']]);
        $sql = "CALL sp_get_aplicacion_impacto_by_caracteristica(?,?)";

	    $query = $this->db->query($sql, [
            $data['caracteristica'],
            $data['escenario']
        ]);
        return $query->getResultArray();
    }
    
}