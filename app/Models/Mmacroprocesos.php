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
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];
    public function validaMacroproceso($data){
        
        $query = $this->db->query("SELECT * FROM macroproceso where  macroproceso='{$data['macroproceso']}' 
        and idempresa='{$data['idempresa']}' and  idarea='{$data['idarea']}' and is_deleted= 0 and  idunidad='{$data['idunidad']}'");
        
    
        if( $query->getRow()) return true;
        else return false;
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
       
        // $query=$this->db->query("EXEC agregar_macroproceso 
        // @area = {$data[0]['idarea']},
        // @empresa= {$data[0]['idempresa']},
        // @unidad=  {$data[0]['idunidad']},
        // @macroproceso= '{$data[0]['macroproceso']}',
        // @estado= {$data[0]['estado']},
        // @idUserAdd= {$data['user']}
        // ");
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
      
        
        
        // $query=$this->db->query("EXEC editar_macroproceso
        // @area = {$data[0]['idarea']},
        // @empresa= {$data[0]['idempresa']},
        // @unidad=  {$data[0]['idunidad']},
        // @macroproceso= '{$data[0]['macroproceso']}',
        // @estado= {$data[0]['estado']},
        // @idmacroproceso= {$data[0]['id']},
        // @idUserAdd= {$data['user']}");

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
    

}
