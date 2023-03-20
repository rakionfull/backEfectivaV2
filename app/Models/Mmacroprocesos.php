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
        
        //$query = $this->db->query("SELECT * FROM macroproceso where  macroproceso='{$data['macroproceso']}' 
        //and idempresa='{$data['idempresa']}' and  idarea='{$data['idarea']}' and  idunidad='{$data['idunidad']}'");
        
        $query = $this->db->query("EXEC validaMacroproceso
        @area= {$data[0]['idarea']},
        @empresa={$data[0]['idempresa']} ,
        @unidad= {$data[0]['idunidad']},
        @macroproceso= '{$data[0]['macroproceso']}' ");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    
    //retorna todos MacroProcesos
    public function getMacroproceso($dato){

        if($dato == 0){
            // $query = $this->db->query("SELECT M.id, m.macroproceso,E.empresa,A.area,U.unidad,M.estado,M.idempresa,
            // M.idarea,M.idunidad
            // from macroproceso as M inner join empresa as E on M.idempresa=e.id
            //                         inner join area as A on M.idarea=A.id
            //                         inner join unidades as U on M.idunidad=U.id and M.is_deleted=0");
            $query = $this->db->query("EXEC listarMacroproceso");
    
    }else{
            // $query = $this->db->query("SELECT M.id, m.macroproceso,E.empresa,A.area,U.unidad,M.estado,M.idempresa,
            // M.idarea,M.idunidad
            // from macroproceso as M inner join empresa as E on M.idempresa=e.id
            //                         inner join area as A on M.idarea=A.id
            //                         inner join unidades as U on M.idunidad=U.id where E.id = {$dato} and M.is_deleted=0");
            $query = $this->db->query("EXEC listarMacroEmpresa @dato={$dato}");
    
    }


      
        return $query->getResultArray();
    }
   
    public function saveMacroproceso($data){
       

        // $query=$this->db->query("INSERT INTO macroproceso (macroproceso,estado,idempresa,idarea,idunidad) values
        // ('{$data['macroproceso']}', '{$data['estado']}', '{$data['idempresa']}','{$data['idarea']}','{$data['idunidad']}')") ;
    
        $query=$this->db->query("EXEC agregar_macroproceso 
        @area = {$data[0]['idarea']},
        @empresa= {$data[0]['idempresa']},
        @unidad=  {$data[0]['idunidad']},
        @macroproceso= '{$data[0]['macroproceso']}',
        @estado= {$data[0]['estado']},
        @idUserAdd= {$data['user']}
        ");
        return $query;
    }
    public function updateMacroproceso($data){
      
        
        // $query=$this->db->query("UPDATE macroproceso SET 
        // macroproceso = '{$data['macroproceso']}',
        // estado = '{$data['estado']}'
        // where id = {$data['id']} ") ;
        $query=$this->db->query("EXEC editar_macroproceso
        @area = {$data[0]['idarea']},
        @empresa= {$data[0]['idempresa']},
        @unidad=  {$data[0]['idunidad']},
        @macroproceso= '{$data[0]['macroproceso']}',
        @estado= {$data[0]['estado']},
        @idmacroproceso= {$data[0]['id']},
        @idUserAdd= {$data['user']}");
        return $query;
    }

    public function getMacroprocesoByActivo($data){

        // $query = $this->db->query("SELECT * from macroproceso where estado = '1' and idempresa='{$data['idempresa']}' and
        // idarea='{$data['idarea']}' and idunidad='{$data['idunidad']}'");
        $query = $this->db->query("EXEC listarMacroprocesoByActivo @empresa = {$data['idempresa']}
        ,@area={$data['idarea']} ,@unidad={$data['idunidad']}");
        return $query->getResultArray();
    }
    
    // public function deleteMacroproceso($data){
    
    //     $query = $this->db->query("DELETE from macroproceso where id = {$data} ");
    //     return $query;
    // }
}
