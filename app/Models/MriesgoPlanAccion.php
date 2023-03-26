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
        
        $query = $this->db->query("SELECT PA.id,TU.id_us as usuario, E.id as estado ,
         PA.plan_accion,TU.email_us,E.estado,A.valor,PA.fecha_inicio as fecha_ini,
         PA.fecha_fin as fecha_fin,TU.nombres_us,TU.apepat_us,TU.apemat_us ,A.alerta as alerta
        FROM plan_accion as PA inner join tb_users as TU on PA.idusuario = TU.id_us 
        inner join alert_seguimiento as A on A.id=PA.idalerta inner join estado as E on PA.idestado = E.id
        where PA.is_deleted = 0 ");

        return $query->getResultArray();
    }
    public function getCorreoActividad(){
        
        $query = $this->db->query("SELECT AP.progreso as progreso,AP.id as id_act,PA.plan_accion,AP.descripcion ,TU.id_us,TU.email_us,A.valor,AP.fecha_inicio as 
        fecha_ini,
        AP.fecha_fin as fecha_fin,TU.nombres_us,TU.apepat_us,TU.apemat_us ,A.alerta as alerta
        from actividades_plan as AP  inner join alert_seguimiento as A on AP.idalerta=A.id
        inner join tb_users as TU on AP.idusuario = TU.id_us  inner join plan_accion as PA on PA.id=AP.id_planes
        where AP.is_deleted = 0 and PA.idestado   = 2");

        return $query->getResultArray();
    }
    public function getCorreoPlanEnviados($id){
        
        $query = $this->db->query("SELECT * FROM correo_plan where idplan= {$id} ORDER BY id DESC LIMIT 1");

        return $query->getRow();
    }
    public function getCorreoActividadesEnviados($id){
        
        $query = $this->db->query("SELECT * FROM correo_actividad where idactividad= {$id} ORDER BY id DESC LIMIT 1");

        return $query->getRow();
    }
    public function insertCorreoPlan($id,$fecha,$usuario){
        
        $query = $this->db->query("INSERT INTO correo_plan (idplan,fecha_envio,idusuario) 
        VALUES ({$id},'{$fecha}',{$usuario})");

        return $query;
    }
    public function updateEstadoPLan($id){
        
        $query = $this->db->query("UPDATE plan_accion SET idestado=2 where id =  {$id}") ;
       

        return $query;
    }
    public function insertCorreoActividad($id,$fecha,$usuario){
        
        $query = $this->db->query("INSERT INTO correo_actividad (idactividad,fecha_envio,idusuario) 
        VALUES ({$id},'{$fecha}',{$usuario})");

        return $query;
    }

    ////
    public function validaPlanAccion($data){
        
        // $query = $this->db->query("EXEC validaPlanAccion	 @estado='".$data."'");

        $sql = "CALL validaPlanAccion(?)";

        $query = $this->db->query($sql, [ $data['plan_accion']  ]);

        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }

  
    public function getPlanAccion(){

        // $query = $this->db->query("exec listar_plan_accion");
      
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

    
    // public function updatePlanAccion($data){
    //     $query=$this->db->query("EXEC modificar_estado @estado='{$data[0]['estado']}',
    //     @descripcion='{$data[0]['descripcion']}',@idUserAdd= {$data['user']},@idEstado={$data[0]['id']} ");
        
    //     return $query;
    // }
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

        // $query = $this->db->query("EXEC eliminar_plan_accion 
        // @id={$data[0]['id']},
        // @id_user_deleted={$data['user']}");
        $sql = "CALL eliminar_plan_accion(?,?)";

        $query = $this->db->query($sql, [
            $data[0]['id'],
           
            $data['user'],
           
           
        ]);
        return $query;
    }



    



    //        Actividades del Plan

    public function getActividadPlan($id){

        // $query = $this->db->query("exec listar_actividades_plan @id={$id}");

        $sql = "CALL listar_actividades_plan(?)";

        $query = $this->db->query($sql, [
            $id,         
           
        ]);
        
        return $query->getResultArray();
    }
    public function getDetallePlan($id){

        // $query = $this->db->query("exec listar_detalle_plan @id={$id}");
        $sql = "CALL listar_detalle_plan(?)";

        $query = $this->db->query($sql, [
            $id,         
           
        ]);
        return $query->getRow();
    }
    public function getPlan($id){
        // $query=$this->db->query("EXEC get_Plan_Control @id = {$id}");
        $sql = "CALL get_Plan_Control(?)";

        $query = $this->db->query($sql, [
            $id,         
           
        ]);
        return $query->getRow();
    }
 


/*
protected $table = 'tabla_actividades';

public function getActividadesPorPlan($id_plan)
{
        $builder = $this->db->table($this->table);
        $builder->where('id_plan', $id_plan);
        $query = $builder->get();
        return $query->getResultArray();
}
*/


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
       
    
        // $query = $this->db->query("EXEC eliminar_actividades_plan 
        // @id={$data[0]['id']},
        // @idUserDel={$data['user']}");

        $sql = "CALL eliminar_actividades_plan(?,?)";

            $query = $this->db->query($sql, [
                $data[0]['id'],               
                $data['user'],
             
            ]);

        return $query;
    }
    



    

    

}