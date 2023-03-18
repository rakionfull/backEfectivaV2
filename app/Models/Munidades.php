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
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];
    public function validaUnidad($data){
        
        $query = $this->db->query("SELECT * FROM unidades where  idempresa='{$data['idempresa']}' 
        and idarea='{$data['idarea']}' and  unidad='{$data['unidad']}'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    //retorna todas las Unidades
    public function getUnidades($dato){
        if($dato == 0){
            $query = $this->db->query("SELECT U.id,U.unidad,E.empresa,A.area,U.estado,U.idempresa,U.idarea
            from unidades as U inner join empresa as E on U.idempresa = e.id
                               inner join area as A on U.idarea = A.id and U.is_deleted=0");
        }else{
            $query = $this->db->query("SELECT U.id,U.unidad,E.empresa,A.area,U.estado,U.idempresa,U.idarea
            from unidades as U inner join empresa as E on U.idempresa = e.id
                               inner join area as A on U.idarea = A.id where e.id  = $dato and U.is_deleted=0");
        }
       
        return $query->getResultArray();
    }
    
    public function saveUnidades($data){
       

        $query=$this->db->query("INSERT INTO unidades
        (unidad,idempresa,idarea,estado) VALUES
        ('{$data['unidad']}','{$data['idempresa']}','{$data['idarea']}',{$data['estado']})") ;
    
        return $query;
    }
    public function updateUnidades($data){
              
        $query=$this->db->query("UPDATE unidades SET 
        unidad = '{$data['unidad']}',
        idempresa = '{$data['idempresa']}',
		idarea = '{$data['idarea']}',
        estado = '{$data['estado']}'
        where id = {$data['id']} ") ;
           
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

        $query = $this->db->query("SELECT * FROM unidades where estado='1' and idempresa={$data['idempresa']} and idarea={$data['idarea']}");
        return $query->getResultArray();
    }
    public function deleteUnidad($data){
    
        $query = $this->db->query("DELETE from unidades where id = {$data} ");
        return $query;
    }
    public function getComboUnidad(){

        $query = $this->db->query("SELECT * FROM unidades where estado='1'");
        return $query->getResultArray();
    }
}
