<?php

namespace App\Models;

use CodeIgniter\Model;

class MriesgoPlanAccion extends Model
{
    protected $table            = 'plan_accion';
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
    //funciones para el envio de correo
    public function getCorreoPlan(){
    
        $sql = "call getCorreoPlan()";

        $query = $this->db->query($sql, [
        ]);
        return $query->getResultArray();
    }
    public function getCorreoActividad(){
        
    
        $sql = "call getCorreoActividad()";

        $query = $this->db->query($sql, [
        ]);
        return $query->getResultArray();
    }
    public function getCorreoPlanEnviados($id){
        
     
        $sql = "call getCorreoPlanEnviados(?)";

        $query = $this->db->query($sql, [
            $id
        ]);
        return $query->getRow();
    }
    public function getCorreoActividadesEnviados($id){
        
     
        $sql = "call getCorreoActividadesEnviados(?)";

        $query = $this->db->query($sql, [
            $id
        ]);
        return $query->getRow();
    }
    public function insertCorreoPlan($id,$fecha,$usuario){
   

        $sql = "call insertCorreoPlan(?,?,?)";
        $query = $this->db->query($sql, [
            $id,
            $fecha,
            $usuario
        ]);
        return $query;
    }
    public function updateEstadoPLan($id){
        
      
        $sql = "call updateEstadoPLan(?)";
        $query = $this->db->query($sql, [
            $id,
            
        ]);

        return $query;
    }
    public function insertCorreoActividad($id,$fecha,$usuario){
        
   
        $sql = "call insertCorreoActividad(?,?,?)";
        $query = $this->db->query($sql, [
            $id,
            $fecha,
            $usuario
        ]);
        return $query;
    }

    ////
    public function validaPlanAccion($data){
        
      

        $sql = "CALL validaPlanAccion(?)";

        $query = $this->db->query($sql, [ $data['plan_accion']  ]);

        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }

  
    public function getPlanAccion(){

     
        $sql = "CALL listar_plan_accion()";

        $query = $this->db->query($sql, [ ]);
        return $query->getResultArray();
    }
    

    public function savePlanAccion($data){

        $sql = "CALL agregar_plan_accion(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['id_riesgo'],
            $data[0]['id_control'],
            $data[0]['plan_accion'],
            $data[0]['descripcion'],
            $data[0]['fecha_inicio'],
            $data[0]['fecha_fin'],
            $data['user'],
            $data[0]['idempresa'],
            $data[0]['idarea'],
            $data[0]['idunidad'],
            $data[0]['idposicion'],
            $data[0]['idusuario'],
            $data[0]['idprioridad'],
            $data[0]['idestado'],
            $data[0]['idalerta'],
        
        ]);

               
        $last_id = $this->db->query("SELECT  id as maxid FROM 
        plan_accion order by id DESC LIMIT 1");

        return $last_id->getRow()->maxid;
    }

   
    public function updatePlanAccion($data){

    
        $sql = "CALL modificar_plan_accion(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['id'],
            $data[0]['plan_accion'],
            $data[0]['descripcion'],
            $data[0]['fecha_inicio'],
            $data[0]['fecha_fin'],
            $data[0]['idempresa'],
            $data[0]['idarea'],
            $data[0]['idunidad'],
            $data[0]['idposicion'],
            $data[0]['idusuario'],
            $data[0]['idprioridad'],
            $data[0]['idestado'],
            $data[0]['idalerta'],
            $data['user'],
            $data[0]['id_riesgo'],
            $data[0]['id_control'],
           
        ]);

        return $query;
    }


    public function deletePlanAccion($data){

   
        $sql = "CALL eliminar_plan_accion(?,?)";

        $query = $this->db->query($sql, [
            $data[0]['id'],
           
            $data['user'],
           
           
        ]);
        return $query;
    }



    



    //        Actividades del Plan

    public function getActividadPlan($id){


        $sql = "CALL listar_actividades_plan(?)";

        $query = $this->db->query($sql, [
            $id,         
           
        ]);
        
        return $query->getResultArray();
    }
    public function getDetallePlan($id){

      
        $sql = "CALL listar_detalle_plan(?)";

        $query = $this->db->query($sql, [
            $id,         
           
        ]);
        return $query->getRow();
    }
    public function getPlan($id){
       
        $sql = "CALL get_Plan_Control(?)";

        $query = $this->db->query($sql, [
            $id,         
           
        ]);
        return $query->getRow();
    }
 



    public function saveActividadPlan($data){
    
    

            $sql = "CALL agregar_actividades_plan(?,?,?,?,?,?,?,?,?,?,?,?)";

            $query = $this->db->query($sql, [
                $data['idempresa'],
                $data['idarea'],
                $data['idunidad'],
                $data['idposicion'],
                $data['idusuario'],
                $data['descripcion'],
                $data['fecha_inicio'],
                $data['fecha_fin'],
                $data['idalerta'],
                $data['progreso'],
                $data['user'],
                $data['idplanaccion'],
               
            ]);

        return $query;
    }
    
    public function updateActividadPlan($data){
       

            $sql = "CALL modificar_actividades_plan(?,?,?,?,?,?,?,?,?,?,?,?)";

            $query = $this->db->query($sql, [
                $data[0]['id'],
                $data[0]['idempresa'],
                $data[0]['idarea'],
                $data[0]['idunidad'],
                $data[0]['idposicion'],
                $data[0]['idusuario'],
                $data[0]['descripcion'],
                $data[0]['fecha_inicio'],
                $data[0]['fecha_fin'],
                $data[0]['idalerta'],
                $data[0]['progreso'],
               
                $data['user'],
             
            ]);

        return $query;
    }

    public function deleteActividadesPlan($data) {
       
    

        $sql = "CALL eliminar_actividades_plan(?,?)";

            $query = $this->db->query($sql, [
                $data[0]['id'],               
                $data['user'],
             
            ]);

        return $query;
    }
    



    

    

}