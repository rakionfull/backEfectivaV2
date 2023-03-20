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
        
        $query = $this->db->query("SELECT PA.id,TU.id_us as usuario, E.id as estado , PA.plan_accion,TU.email_us,E.estado,A.valor,CONVERT(date,PA.fecha_inicio,12) as fecha_ini,CONVERT (date,PA.fecha_fin,12) as fecha_fin,TU.nombres_us,TU.apepat_us,TU.apemat_us ,A.alerta
        FROM plan_accion as PA inner join tb_users as TU on PA.idusuario = TU.id_us 
        inner join alert_seguimiento as A on A.id=PA.idalerta inner join estado as E on PA.idestado = E.id
        where PA.is_deleted = 0 and E.id=2");

        return $query->getResultArray();
    }
    public function getCorreoActividad(){
        
        $query = $this->db->query("SELECT AP.id,PA.plan_accion,AP.descripcion ,TU.id_us,TU.email_us,A.valor,CONVERT(date,AP.fecha_inicio,12) as fecha_ini,
        CONVERT (date,AP.fecha_fin,12) as fecha_fin,TU.nombres_us,TU.apepat_us,TU.apemat_us ,A.alerta as usuario
        from actividades_plan as AP  inner join alert_seguimiento as A on AP.idalerta=A.id
        inner join tb_users as TU on AP.idusuario = TU.id_us  inner join plan_accion as PA on PA.id=AP.id_planes
        where AP.is_deleted = 0 and PA.idestado   = 2");

        return $query->getResultArray();
    }
    public function getCorreoPlanEnviados($id){
        
        $query = $this->db->query("SELECT TOP 1 * FROM correo_plan where idplan= {$id} ORDER BY id DESC");

        return $query->getRow();
    }
    public function getCorreoActividadesEnviados($id){
        
        $query = $this->db->query("SELECT TOP 1 * FROM correo_actividad where idactividad= {$id} ORDER BY id DESC");

        return $query->getRow();
    }
    public function insertCorreoPlan($id,$fecha,$usuario){
        
        $query = $this->db->query("INSERT INTO correo_plan (idplan,fecha_envio,idusuario) 
        VALUES ({$id},'{$fecha}',{$usuario})");

        return $query;
    }
    public function insertCorreoActividad($id,$fecha,$usuario){
        
        $query = $this->db->query("INSERT INTO correo_actividad (idactividad,fecha_envio,idusuario) 
        VALUES ({$id},'{$fecha}',{$usuario})");

        return $query;
    }

    ////
    public function validaPlanAccion($data){
        
        $query = $this->db->query("EXEC validaEstado @estado='".$data."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }

  
    public function getPlanAccion(){

        $query = $this->db->query("exec listar_plan_accion");
        return $query->getResultArray();
    }
    

    public function savePlanAccion($data){

        $query=$this->db->query("EXEC agregar_plan_accion
        @id_riesgo ='{$data[0]['id_riesgo']}',
        @id_control='{$data[0]['id_control']}',
        @plan_accion='{$data[0]['plan_accion']}',        
        @descripcion ='{$data[0]['descripcion']}',
        @fecha_inicio ='{$data[0]['fecha_inicio']}',            
        @fecha_fin='{$data[0]['fecha_fin']}',
        @id_user_added='{$data['user']}',
        @idempresa='{$data[0]['idempresa']}',
        @idarea='{$data[0]['idarea']}',
        @idunidad='{$data[0]['idunidad']}',
        @idposicion='{$data[0]['idposicion']}',
        @idusuario='{$data[0]['idusuario']}',
        @idprioridad='{$data[0]['idprioridad']}',
        @idestado='{$data[0]['idestado']}',
        @idalerta='{$data[0]['idalerta']}'") ;
        $last_id = $this->db->query("SELECT  @@IDENTITY as maxid FROM 
        plan_accion");

        return $last_id->getRow()->maxid;
    }

    
    // public function updatePlanAccion($data){
    //     $query=$this->db->query("EXEC modificar_estado @estado='{$data[0]['estado']}',
    //     @descripcion='{$data[0]['descripcion']}',@idUserAdd= {$data['user']},@idEstado={$data[0]['id']} ");
        
    //     return $query;
    // }
    public function updatePlanAccion($data){
        $query=$this->db->query("EXEC modificar_plan_accion 
        @id={$data[0]['id']},
        @plan='{$data[0]['plan_accion']}',
        @descripcion='{$data[0]['descripcion']}',
        @fecha_ini='{$data[0]['fecha_inicio']}',
        @fecha_fin='{$data[0]['fecha_fin']}',
        @empresa={$data[0]['idempresa']},
        @area={$data[0]['idarea']},
        @unidad={$data[0]['idunidad']},
        @posicion={$data[0]['idposicion']},
        @usuario={$data[0]['idusuario']},
        @prioridad={$data[0]['idprioridad']},
        @estado={$data[0]['idestado']},
        @alerta={$data[0]['idalerta']},
        @idUserAdd= {$data['user']},
        @idriesgo='{$data[0]['id_riesgo']}',
        @idcontrol='{$data[0]['id_control']}' ");
        
        return $query;
    }


    public function deletePlanAccion($data){

        $query = $this->db->query("EXEC eliminar_plan_accion 
        @id={$data[0]['id']},
        @id_user_deleted={$data['user']}");
        return $query;
    }



    



    //        Actividades del Plan

    public function getActividadPlan($id){

        $query = $this->db->query("exec listar_actividades_plan @id={$id}");
        return $query->getResultArray();
    }
    public function getDetallePlan($id){

        $query = $this->db->query("exec listar_detalle_plan @id={$id}");
        return $query->getRow();
    }
    public function getPlan($id){
        $query=$this->db->query("EXEC get_Plan_Control @id = {$id}");
    
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
        $query=$this->db->query("EXEC agregar_actividades_plan 
            @idempresa={$data['idempresa']},
            @idarea={$data['idarea']},
            @idunidad={$data['idunidad']},
            @idposicion={$data['idposicion']},
            @idusuario={$data['idusuario']},
            @descripcion='{$data['descripcion']}',
            @fecha_inicio='{$data['fecha_inicio']}',
            @fecha_fin='{$data['fecha_fin']}',
            @idalerta={$data['idalerta']},
            @progreso={$data['progreso']},
            @idUserAdd={$data['user']},
            @idplan={$data['idplanaccion']}");
    
        return $query;
    }
    
    public function updateActividadPlan($data){
        $query=$this->db->query("EXEC modificar_actividades_plan @id={$data[0]['id']},
            @idempresa={$data[0]['idempresa']},@idarea={$data[0]['idarea']},@idunidad={$data[0]['idunidad']},
            @idposicion={$data[0]['idposicion']},@idusuario={$data[0]['idusuario']},
            @descripcion='{$data[0]['descripcion']}',@fecha_inicio='{$data[0]['fecha_inicio']}',
            @fecha_fin='{$data[0]['fecha_fin']}',@idalerta={$data[0]['idalerta']},@progreso={$data[0]['progreso']},
            @idUserModify={$data['user']}");
        
        return $query;
    }

    public function deleteActividadesPlan($data) {
       
    
        $query = $this->db->query("EXEC eliminar_actividades_plan 
        @id={$data[0]['id']},
        @idUserDel={$data['user']}");
        return $query;
    }
    



    

    

}