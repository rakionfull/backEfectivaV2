<?php

namespace App\Models;

use CodeIgniter\Model;

class Marea extends Model
{
    protected $table = 'area';
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
    
    public function validaArea($data){
        
        // $query = $this->db->query("SELECT * FROM area 
        // where  idempresa='{$data['empresa']}' 
        // and area='{$data['area']}'");
            $query = $this->db->query("EXEC validaArea 
            @empresa='{$data['empresa']}' ,
            @area='{$data['area']}'");
            $query->getRow();
            if( $query->getRow()) return true;
            else return false;
    }
        //retorna        
        public function getArea($dato){

            if($dato == 0){
                // $query = $this->db->query("SELECT a.id,a.idempresa,e.empresa,a.area,a.estado
                // from empresa as E inner join area as A on a.idempresa = e.id");
                $query = $this->db->query("EXEC listarArea");
            } else{
                // $query = $this->db->query("SELECT a.id,a.idempresa,e.empresa,a.area,a.estado
                // from empresa as E inner join area as A on a.idempresa = e.id where a.idempresa=$dato");
               
               $query = $this->db->query("EXEC listarAreaEmpresa @dato={$dato}");    
            }
           
            return $query->getResultArray();
        }

        public function saveArea($data){

            // $query=$this->db->query("INSERT INTO area
            // (area, idempresa, estado) VALUES
            // ('{$data['area']}', {$data['empresa']}, {$data['estado']})") ;
            $query=$this->db->query("EXEC agregar_area @area= '{$data[0]['area']}',
            @empresa= {$data[0]['empresa']} ,
            @estado=  {$data[0]['estado']},
            @idUserAdd=  {$data['user']} ");
            return $query;
        }

        public function updateArea($data){
            // $query=$this->db->query("UPDATE area SET 
            // area = '{$data['area']}',
            // idempresa = '{$data['idempresa']}',
            // estado = '{$data['estado']}'
            // where id = {$data['id']} ") ;
            $query=$this->db->query("EXEC editar_area
            @area = '{$data[0]['area']}',
            @empresa = '{$data[0]['idempresa']}',
            @estado = '{$data[0]['estado']}',
            @idUserAdd = '{$data['user']}',
            @idarea = '{$data[0]['id']}'") ;
            return $query;
        }


        public function getAreasByActivo($data){

            // $query = $this->db->query("SELECT * FROM area 
            // where estado='1' and idempresa='{$data}'");
            $query = $this->db->query("EXEC listarAreaByActivo @empresa ={$data}");
            return $query->getResultArray();
        }
        // public function deleteArea($data){

        //     $query = $this->db->query("DELETE from area where id = {$data} ");
        //     return $query;
        // }
        public function getAreasEmpresa($id){
          //  $query = $this->db->query("SELECT * FROM area where idempresa='{$id}'");
            $query = $this->db->query("EXEC listarAreaByActivo @empresa ={$data}");
            return $query->getResultArray();
        }
        public function getComboAreas(){

           // $query = $this->db->query("SELECT * FROM area where estado='1'");
           $query = $this->db->query("EXEC listarAreaByEstado");
            return $query->getResultArray();
        }
}
