<?php

namespace App\Models;

use CodeIgniter\Model;

class Mproceso extends Model
{
    protected $table            = 'proceso';
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
    public function validaProceso($data){
        
        $query = $this->db->query("SELECT * FROM proceso where  proceso='{$data['proceso']}' 
        and idempresa='{$data['idempresa']}' 
        and  idarea='{$data['idarea']}' and is_deleted=0 and  idunidad='{$data['idunidad']}'
        and  idmacroproceso='{$data['idmacroproceso']}'");

     
        if( $query->getRow()) return true;
        else return false;
    }
    //retorna todos Proceso
    public function getProceso($dato){
        if($dato == 0){
            $sql = "CALL listarProceso()";

            $query = $this->db->query($sql, [
               
            ]);
            // $query = $this->db->query("EXEC listarProceso");
        }else{
          
            // $query = $this->db->query("EXEC listarProcesoEmpresa @dato={$dato}" );
            $sql = "CALL listarProcesoEmpresa(?)";

            $query = $this->db->query($sql, [
                $dato
            ]);
        }
       
        return $query->getResultArray();
    }
    
  
    
    public function saveProceso($data){
    
        // $query=$this->db->query("EXEC agregar_proceso
        // @area = {$data[0]['idarea']},
        // @empresa={$data[0]['idempresa']} ,
        // @unidad= {$data[0]['idunidad']},
        // @macroproceso={$data[0]['idmacroproceso']} ,
        // @proceso='{$data[0]['proceso']}' ,
        // @estado= {$data[0]['estado']},
        // @idUserAdd={$data['user']} ");
        $sql = "CALL agregar_proceso(?,?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
         $data[0]['idarea'],
         $data[0]['idempresa'],
         $data[0]['idunidad'],
         $data[0]['idmacroproceso'],
         $data[0]['proceso'],
         $data[0]['estado'],
         $data['user'],
        ]);
        return $query;
    }
    public function updateProceso($data){
      
               
        // $query=$this->db->query("EXEC editar_proceso
        // @area = {$data[0]['idarea']},
        // @empresa={$data[0]['idempresa']} ,
        // @unidad= {$data[0]['idunidad']},
        // @macroproceso={$data[0]['idmacroproceso']} ,
        // @proceso='{$data[0]['proceso']}' ,
        // @estado= {$data[0]['estado']},
        // @idproceso= {$data[0]['id']},
        // @idUserAdd={$data['user']} ");

        $sql = "CALL editar_proceso(?,?,?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
         $data[0]['idarea'],
         $data[0]['idempresa'],
         $data[0]['idunidad'],
         $data[0]['idmacroproceso'],
         $data[0]['proceso'],
         $data[0]['estado'],
         $data[0]['id'],
         $data['user'],
        ]);
        return $query;
    }

    public function getProcesoByActivo(){

        
        // $query = $this->db->query("EXEC listaProcesoByEstado");
        $sql = "CALL listaProcesoByEstado()";

        $query = $this->db->query($sql, [
        ]);
        return $query->getResultArray();
    }
    public function getProcesoByMacro($data){

        
        // $query = $this->db->query("EXEC listaProcesoByEstado");
        $sql = "CALL listaProcesoByMacro(?,?,?,?)";

        $query = $this->db->query($sql, [
            $data['idempresa'],
            $data['idarea'],
            $data['idunidad'],
            $data['idmacroproceso'],
        ]);
        return $query->getResultArray();
    }
}
