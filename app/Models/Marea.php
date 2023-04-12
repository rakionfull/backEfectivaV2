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
    
    public function validaArea($data){
        
        // $query = $this->db->query("SELECT * FROM area 
        // where  idempresa='{$data['empresa']}' 
        // and  is_deleted=0 and area='{$data['area']}'");
         
         $sql = "CALL validaArea(?,?)";

         $query = $this->db->query($sql, [
            $data['area'],
            $data['empresa']
           
         ]);  

            if( $query->getRow()) return true;
            else return false;
    }
        //retorna        
        public function getArea($dato){

            if($dato == 0){
               
               
                $sql = "CALL listarArea()";

                $query = $this->db->query($sql, [
                 
                ]);
            } else{
               
             
               $sql = "CALL listarAreaEmpresa(?)";

               $query = $this->db->query($sql, [
                $dato
               ]);
            }
           
            return $query->getResultArray();
        }

        public function saveArea($data){

        
            $sql = "CALL agregar_area(?,?,?,?)";

               $query = $this->db->query($sql, [
                $data[0]['area'],
                $data[0]['empresa'],
                $data[0]['estado'],
                $data['user']
               ]);
            return $query;
        }

        public function updateArea($data){
           
        
            $sql = "CALL editar_area(?,?,?,?,?)";

            $query = $this->db->query($sql, [
             $data[0]['area'],
             $data[0]['idempresa'],
             $data[0]['estado'],
            
             $data[0]['id'],
             $data['user'],
            ]);
            return $query;
        }


        public function getAreasByActivo($data){

          
            $sql = "CALL listarAreaByActivo(?)";

            $query = $this->db->query($sql, [
             $data
            ]);
            return $query->getResultArray();
        }
      
        public function getAreasEmpresa($id){
       
         
            $sql = "CALL listarAreaByActivo(?)";

            $query = $this->db->query($sql, [
             $data
            ]);
            return $query->getResultArray();
        }
        // public function getComboAreas(){
        // //    $query = $this->db->query("EXEC listarAreaByEstado");
        //    $sql = "CALL listarAreaByEstado()";

        //    $query = $this->db->query($sql, [
        //    ]);
        //     return $query->getResultArray();
        // }
}
