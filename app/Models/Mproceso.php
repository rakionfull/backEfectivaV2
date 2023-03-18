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
        and idempresa='{$data['idempresa']}' and  idarea='{$data['idarea']}' and  idunidad='{$data['idunidad']}'
        and  idmacroproceso='{$data['idmacroproceso']}'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    //retorna todos Proceso
    public function getProceso($dato){
        if($dato == 0){
            $query = $this->db->query("SELECT P.id,P.proceso,E.empresa,A.area,U.unidad,m.macroproceso,P.estado,
            P.idempresa,P.idarea,P.idunidad,P.idmacroproceso
            from proceso as P inner join empresa as E on P.idempresa=e.id
                                    inner join area as A on P.idarea=A.id
                                    inner join unidades as U on P.idunidad=U.id												   
                                    inner join macroproceso as M on P.idmacroproceso = M.id and P.is_deleted=0");
        }else{
            $query = $this->db->query("SELECT P.id,P.proceso,E.empresa,A.area,U.unidad,m.macroproceso,P.estado,
            P.idempresa,P.idarea,P.idunidad,P.idmacroproceso
            from proceso as P inner join empresa as E on P.idempresa=e.id
                                    inner join area as A on P.idarea=A.id
                                    inner join unidades as U on P.idunidad=U.id												   
                                    inner join macroproceso as M on P.idmacroproceso = M.id where e.id = {$dato} and P.is_deleted=0");
        }
       
        return $query->getResultArray();
    }
    
    public function getProcesoByActivo(){

        $query = $this->db->query("SELECT * FROM proceso where estado='1'");
        return $query->getResultArray();
    }
    
    public function saveProceso($data){
       

        $query=$this->db->query("INSERT INTO proceso
        (proceso,estado,idempresa,idarea,idunidad,idmacroproceso) VALUES
        ('{$data['proceso']}',{$data['estado']},{$data['idempresa']},{$data['idarea']},
        {$data['idunidad']},{$data['idmacroproceso']})") ;
    
    
        return $query;
    }
    public function updateProceso($data){
      
        
        $query=$this->db->query("UPDATE proceso SET 
        proceso = '{$data['proceso']}',
        idempresa = '{$data['idempresa']}',
        idarea = '{$data['idarea']}',
        idunidad = '{$data['idunidad']}',
        idmacroproceso = '{$data['idmacroproceso']}',
        estado = '{$data['estado']}'
        where id = {$data['id']} ") ;
           
        return $query;
    }

    public function deleteProceso(){
    
        $query = $this->db->query("DELETE from proceso where id = {$data} ");
        return $query->getResultArray();
    }
}
