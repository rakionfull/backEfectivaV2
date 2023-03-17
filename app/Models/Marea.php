<?php

namespace App\Models;

use CodeIgniter\Model;

class Marea extends Model
{
  
    public function validaArea($data){
        
        $query = $this->db->query("SELECT * FROM area where  idempresa='{$data['empresa']}' 
        and area='{$data['area']}'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
        //retorna        
        public function getArea($dato){

            if($dato == 0){
                $query = $this->db->query("SELECT a.id,a.idempresa,e.empresa,a.area,a.estado
                from empresa as E inner join area as A on a.idempresa = e.id");
            } else{
                $query = $this->db->query("SELECT a.id,a.idempresa,e.empresa,a.area,a.estado
                from empresa as E inner join area as A on a.idempresa = e.id where a.idempresa=$dato");
            }
           
            return $query->getResultArray();
        }

        public function saveArea($data){

            $query=$this->db->query("INSERT INTO area
            (area, idempresa, estado) VALUES
            ('{$data['area']}', {$data['empresa']}, {$data['estado']})") ;
            return $query;
        }

        public function updateArea($data){
            $query=$this->db->query("UPDATE area SET 
            area = '{$data['area']}',
            idempresa = '{$data['idempresa']}',
            estado = '{$data['estado']}'
            where id = {$data['id']} ") ;
            
            return $query;
        }


        public function getAreasByActivo($data){

            $query = $this->db->query("SELECT * FROM area where estado='1' and idempresa='{$data}'");
            return $query->getResultArray();
        }
        public function deleteArea($data){

            $query = $this->db->query("DELETE from area where id = {$data} ");
            return $query;
        }
        public function getAreasEmpresa($id){
            $query = $this->db->query("SELECT * FROM area where idempresa='{$id}'");
            return $query->getResultArray();
        }
        public function getComboAreas(){

            $query = $this->db->query("SELECT * FROM area where estado='1'");
            return $query->getResultArray();
        }
}
