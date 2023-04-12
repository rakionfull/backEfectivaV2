<?php

namespace App\Models;

use CodeIgniter\Model;

class Munidades extends Model
{
    protected $table            = 'unidades';
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
        'idarea',
        'idempresa',
        'estado',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];
    public function validaUnidad($data){
        
        // $query = $this->db->query("SELECT * FROM unidades where  
        // idempresa='{$data['idempresa']}' 
        // and idarea='{$data['idarea']}' and is_deleted=0 and  
        // unidad='{$data['unidad']}'");

         $sql = "CALL validaUnidad(?,?,?)";

         $query = $this->db->query($sql, [
            $data['idarea'],
            $data['idempresa'],
            $data['unidad']
        ]);
     
        if( $query->getRow()) return true;
        else return false;
    }
    //retorna todas las Unidades
    public function getUnidades($dato){
        if($dato == 0){
            // $query = $this->db->query("EXEC listarUnidades");
            $sql = "CALL listarUnidades()";

                $query = $this->db->query($sql, [
            ]);
        
        }else{
         
                $sql = "CALL listarUnidadEmpresa(?)";

                $query = $this->db->query($sql, [
                $dato
            ]);
        }
       
        return $query->getResultArray();
    }
    
    public function saveUnidades($data){
       

      
        // $query=$this->db->query("EXEC agregar_unidad 
        // @unidad = '{$data[0]['unidad']}',
        // @empresa= '{$data[0]['idempresa']}',
        // @area= '{$data[0]['idarea']}',
        // @estado= '{$data[0]['estado']}',
        // @idUserAdd= '{$data['user']}'");
        $sql = "CALL agregar_unidad(?,?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['idarea'],
        
         $data[0]['idempresa'],
         $data[0]['unidad'],
         $data[0]['estado'],
         $data['user']
        ]);
        return $query;
    }
    public function updateUnidades($data){
              
       
        // $query=$this->db->query("EXEC editar_unidad 
        // @unidad = '{$data[0]['unidad']}',
        // @empresa= {$data[0]['idempresa']},
        // @area= {$data[0]['idarea']},
        // @estado= {$data[0]['estado']},
        // @idunidad= {$data[0]['id']},
        // @idUserAdd= {$data['user']}");

        $sql = "CALL editar_unidad(?,?,?,?,?,?)";

       $query = $this->db->query($sql, [
        $data[0]['idarea'],
        $data[0]['idempresa'],
        $data[0]['unidad'],
        $data[0]['estado'],
        $data[0]['id'],
        $data['user']
       ]);
        return $query;
    }
    /*
    public function getEmpresaAreaUnidades(){

        $query = $this->db->query("SELECT U.id,U.unidad,E.empresa,A.area,U.estado
        from unidades as U inner join empresa as E on U.idempresa = e.id
						   inner join area as A on U.idarea = A.id");
        return $query->getResultArray();
    }
    */
    public function getUnidadByActivo($data){

    
       $sql = "CALL listarUnidadByActivo(?,?)";

       $query = $this->db->query($sql, [
        $data['idempresa'],
        $data['idarea'],

       ]);

     return $query->getResultArray();
     
    }

    public function getComboUnidad(){

      
    //    $query = $this->db->query("EXEC listarUnidadByEstado");
       $sql = "CALL listarUnidadByEstado()";

       $query = $this->db->query($sql, [
       ]);
       return $query->getResultArray();
    }
}
