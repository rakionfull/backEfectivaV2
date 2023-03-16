<?php

namespace App\Models;

use CodeIgniter\Model;

class Munidades extends Model
{
  
    public function validaUnidad($data){
        
        $query = $this->db->query("SELECT * FROM unidades where  idempresa='{$data['idempresa']}' 
        and idarea='{$data['idarea']}' and  unidad='{$data['unidad']}'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    //retorna todas las Unidades
    public function getUnidades(){

        $query = $this->db->query("SELECT U.id,U.unidad,E.empresa,A.area,U.estado,U.idempresa,U.idarea
        from unidades as U inner join empresa as E on U.idempresa = e.id
						   inner join area as A on U.idarea = A.id");
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
