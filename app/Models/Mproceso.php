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
        'idempresa',
        'idunidad',
        'estado',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];
    public function validaProceso($data){
        
        // $query = $this->db->query("SELECT * FROM proceso where  proceso='{$data['proceso']}' 
        // and idempresa='{$data['idempresa']}' 
        // and  idarea='{$data['idarea']}' and is_deleted=0 and  idunidad='{$data['idunidad']}'
        // and  idmacroproceso='{$data['idmacroproceso']}'");

        $sql = "CALL validaProceso(?,?,?,?,?)";

        $query = $this->db->query($sql, [
            
            $data['idarea'],
            $data['idempresa'],
            $data['idunidad'],
            $data['idmacroproceso'],
            $data['proceso']
           
           
        ]);

        if( $query->getRow()) return true;
        else return false;
    }
    public function validateProcesoModify($data){
          
        // $query = $this->db->query("SELECT * from empresa  
        // where empresa ='{$data['empresa']}' and is_deleted=0;");
        $sql = "CALL sp_validate_proceso_modify(?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
        
            $data[0]['id'],
            $data[0]['proceso'],
           
            $data[0]['idempresa'],
            $data[0]['idarea'],
            $data[0]['idunidad'],
            $data[0]['idmacroproceso'],
           
            
        ]);
        return $query->getResultArray();

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
      
     

        $sql = "CALL editar_proceso(?,?,?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
         $data[0]['idarea'],
         $data[0]['idempresa'],
         $data[0]['idunidad'],
         $data[0]['idmacroproceso'],
         $data[0]['proceso'],
         $data[0]['id'],
         $data[0]['estado'],
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
    public function deleteProceso($valor,$id){ 
        $sql = "CALL eliminar_general(?)";
        // $valor = 'macroproceso';
        $query = $this->db->query($sql, [$valor]);
        // aqui obtenermos los nombres de las tablas ralacionadas
        $tablas = $query->getResultArray();
        $resultado=false;
        $cont_tablas=0;
        // $id=20;
        foreach ($tablas as $key => $value) {
          
            $sql2 = "CALL consulta_eliminar_general(?,?,?)";
          

            $query2 = $this->db->query($sql2,[
                $valor,
                $value['TABLE_NAME'],
                $id
            ]);
            $resultado = $query2->getResultArray();
            if($resultado){
               
                $cont = 0;
                foreach ($resultado as $key => $value) {
                    if($value['is_deleted'] == 1){
                       
                        $cont++;
                    }

                 }
                if($cont == count($resultado)){
               
                    $cont_tablas ++ ;
                }
            }else{
                $cont_tablas ++ ;
            }
         
           
        }
        if($cont_tablas == count($tablas)){
            return true;
       
        }else{
            return false;
       
        }

    }
}
