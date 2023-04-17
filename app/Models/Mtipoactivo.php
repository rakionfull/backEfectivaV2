<?php

namespace App\Models;

use CodeIgniter\Model;

class Mtipoactivo extends Model
{
    protected $table = 'tipo_activo';
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

    public function validarTipoActivo($data){
      
        //  $query = $this->db->query("SELECT * FROM tipo_activo 
        //  where tipo='{$data[0]['tipo']}'");
      
        $sql = "CALL validaTipoActivo(?)";

        $query = $this->db->query($sql, [
            $data[0]['tipo']
        ]);
        if( $query->getRow()) return true;
        else return false;
    } 
    public function validateTipoActivoModify($data){
          
        // $query = $this->db->query("SELECT * from empresa  
        // where empresa ='{$data['empresa']}' and is_deleted=0;");
        $sql = "CALL sp_validate_tipo_activo_modify(?,?)";

        $query = $this->db->query($sql, [
        
            $data[0]['id'],
            $data[0]['tipo'],
              
        ]);
        return $query->getResultArray();

    }
    public function getTipoActivoByActivo(){
        // $query = $this->db->query("EXEC getTipoActivoByActivo");
        $sql = "CALL getTipoActivoByActivo()";

        $query = $this->db->query($sql, [
        
        ]);
        return $query->getResultArray();
    }
    public function getTipoActivo(){

        // $query = $this->db->query("EXEC listartipoactivo");
        $sql = "CALL listartipoactivo()";

        $query = $this->db->query($sql, [
        
        ]);
        return $query->getResultArray();
    }
    public function saveTipoActivo($data){       
        // $query = $this->db->query("EXEC agregar_tipoactivo
        // @tipo = '{$data[0]['tipo']}',
        // @estado= '{$data[0]['estado']}',
        // @idUserAdd= '{$data['user']}'");

        $sql = "CALL agregar_tipoactivo(?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['tipo'],
            $data[0]['estado'],
            $data['user']
        ]);
        return $query;
    }
    public function updateTipoActivo($data){  
        
       
        // $query = $this->db->query("EXEC editar_tipoactivo
        // @tipo = '{$data[0]['tipo']}',
        // @idtipo = '{$data[0]['id']}',
        // @estado= '{$data[0]['estado']}',
        // @idUserAdd= '{$data['user']}'");

        $sql = "CALL editar_tipoactivo(?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['tipo'],
            $data[0]['id'],
            $data[0]['estado'],
            $data['user']
        ]);

        return $query;
    }
 
    public function listaCategoriaByActivo($data){

        
        // $query = $this->db->query("EXEC listaProcesoByEstado");
        $sql = "CALL listaCategoriaByActivo(?)";

        $query = $this->db->query($sql, [
            $data['idactivo'],
          
        ]);
        return $query->getResultArray();
    }
    public function deleteTipoActivo($valor,$id){ 
        $sql = "CALL eliminar_general(?)";
        
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