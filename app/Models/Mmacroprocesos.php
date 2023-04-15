<?php

namespace App\Models;

use CodeIgniter\Model;

class Mmacroprocesos extends Model
{
    protected $table            = 'macroproceso';
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
        'idunidad',
        'estado',
        'idempresa',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];
    public function validaMacroproceso($data){
        
        // $query = $this->db->query("SELECT * FROM macroproceso where  macroproceso='{$data['macroproceso']}' 
        // and idempresa='{$data['idempresa']}' and  idarea='{$data['idarea']}' and is_deleted= 0 and  idunidad='{$data['idunidad']}'");
          
          $sql = "CALL validaMacroproceso(?,?,?,?)";

          $query = $this->db->query($sql, [
            $data['idarea'],
            $data['idempresa'],
            $data['idunidad'],
            $data['macroproceso']         
          
          ]);
    
        if( $query->getRow()) return true;
        else return false;
    }
    public function validateMacroprocesoModify($data){
          
        // $query = $this->db->query("SELECT * from empresa  
        // where empresa ='{$data['empresa']}' and is_deleted=0;");
        $sql = "CALL sp_validate_macroproceso_modify(?,?,?,?,?)";

        $query = $this->db->query($sql, [
        
            $data[0]['id'],
            $data[0]['macroproceso'],
            $data[0]['idempresa'],
            $data[0]['idarea'],
            $data[0]['idunidad'],
           
            
        ]);
        return $query->getResultArray();

    }
    //retorna todos MacroProcesos
    public function getMacroproceso($dato){

        if($dato == 0){
            
             $sql = "CALL listarMacroproceso()";

             $query = $this->db->query($sql, [
             
             ]);
    }else{
           
            $sql = "CALL listarMacroEmpresa(?)";

            $query = $this->db->query($sql, [
             $dato
            ]);
    
    }


      
        return $query->getResultArray();
    }
   
    public function saveMacroproceso($data){
     
        $sql = "CALL agregar_macroproceso(?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
         $data[0]['idarea'],
         $data[0]['idempresa'],
         $data[0]['idunidad'],
         $data[0]['macroproceso'],
         $data[0]['estado'],
         $data['user'],
        ]);
        return $query;
    }
    public function updateMacroproceso($data){
      
    

        $sql = "CALL editar_macroproceso(?,?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
         $data[0]['idarea'],
         $data[0]['idempresa'],
         $data[0]['idunidad'],
         $data[0]['macroproceso'],
         $data[0]['estado'],
         $data[0]['id'],
         $data['user'],
        ]);
        return $query;
    }

    public function getMacroprocesoByActivo($data){

  
        // $query = $this->db->query("EXEC listarMacroprocesoByActivo @empresa = {$data['idempresa']}
        // ,@area={$data['idarea']} ,@unidad={$data['idunidad']}");

        $sql = "CALL listarMacroprocesoByActivo(?,?,?)";

        $query = $this->db->query($sql, [
         $data['idempresa'],
         $data['idarea'],
         $data['idunidad'],
        ]);
 
        return $query->getResultArray();
    }
    public function deleteMacroproceso($valor,$id){ 
        $sql = "CALL eliminar_general(?)";
        // $valor = 'macroproceso';
        $query = $this->db->query($sql, [$valor]);
        // aqui obtenermos los nombres de las tablas ralacionadas
        $tablas = $query->getResultArray();
        $resultado=false;
        $cont_tablas=0;
        // $id=20;
        foreach ($tablas as $key => $value) {
          
          // $sql2 = "SELECT {$value['TABLE_NAME']}.is_deleted FROM {$valor} INNER JOIN {$value['TABLE_NAME']} on {$valor}.id={$value['TABLE_NAME']}.id{$valor} where {$valor}.id={$id};";
           $sql2 = "CALL consulta_eliminar_general(?,?,?)";
            //$sql = "CALL deleteMacroproceso(?)";
           // $query2 = $this->db->query($sql2);

            $query2 = $this->db->query($sql2,[
                $valor,
                $value['TABLE_NAME'],
                $id
            ]);
            $resultado = $query2->getResultArray();
            if($resultado){
                //$resultado = $tablas[4]['TABLE_NAME'];
                $cont = 0;
                foreach ($resultado as $key => $value) {
                    if($value['is_deleted'] == 1){
                       
                        $cont++;
                    }

                 }
                if($cont == count($resultado)){
                    $resultado = "esta eliminado el hijo";
                    $cont_tablas ++ ;
                }
            }else{
                $cont_tablas ++ ;
            }
           //entonces si ya paso por todas las tablas
          
           
           
        }
        if($cont_tablas == count($tablas)){
            return true;
       
        }else{
            return false;
       
        }
        
        // return $resultado;
       
        //

        //probar
        //SET group_concat_max_len=(1024*1024);

    }
}
