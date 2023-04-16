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
    public function validateAreaModify($data){
          
        // $query = $this->db->query("SELECT * from empresa  
        // where empresa ='{$data['empresa']}' and is_deleted=0;");
        $sql = "CALL sp_validate_area_modify(?,?,?)";

        $query = $this->db->query($sql, [
        
            $data[0]['id'],
            $data[0]['area'],
            $data[0]['idempresa']
        ]);
        return $query->getResultArray();

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
        public function deleteArea($valor,$id){ 
            $sql = "CALL eliminar_general(?)";
            // $valor = 'macroproceso';
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
