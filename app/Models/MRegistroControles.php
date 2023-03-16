<?php

namespace App\Models;

use CodeIgniter\Model;

class MRegistroControles extends Model
{

    public function getCCMenu(){
        
        $query = $this->db->query("select * from caracteristica_control where tipo = 'menu' and is_deleted=0 and estado= 1");
        return $query->getResultArray();
    }
    public function getCCSubMenu(){
        
        $query = $this->db->query("select * from caracteristica_control where tipo = 'submenu' and is_deleted=0 and estado= 1 and clasificacion=0");
        return $query->getResultArray();
    }

    public function getCCOpciones(){
        
        $query = $this->db->query("
        select * from caracteristica_control where tipo = 'opcion' and is_deleted=0 and estado= 1 and clasificacion=0");
        return $query->getResultArray();
    }
    public function getCoberturaByActivo(){
        
        $query = $this->db->query("select * from cobertura where is_deleted=0");
        return $query->getResultArray();
    }
    public function getTabla($id){
        
        $query = $this->db->query("SELECT nom_tabla FROM catalogo_tabla where id={$id}");
        return $query->getRow()->nom_tabla;
    }
    public function getData2($tabla){
        
        $query = $this->db->query("SELECT * FROM {$tabla} where is_deleted=0 and estado=1 ");
        return $query->getResultArray();
    }
    public function LastIdControles(){
        
        $query = $this->db->query("SELECT IDENT_CURRENT ('registro_controles') AS last_id;  ");
        return $query->getRow()->last_id;
    }
    public function obtenerPeso($id){
        
        $query = $this->db->query("select peso from caracteristica_control where id='{$id}' ");
        return $query->getRow()->peso;
    }
    public function getValoresControles($id){
        
        $id_cali=$this->db->query("SELECT id from caracteristica_control 
        where is_deleted=0 and clasificacion =1 and idOpcion={$id}") ;
        $calificacion = $id_cali->getRow()->id;

        $query=$this->db->query("SELECT * from caracteristica_control 
        where is_deleted=0 and clasificacion =1 and tipo='opcion' and idOpcion={$calificacion} ORDER BY valor DESC") ;
       


        return $query->getResultArray();
    }
    public function getEvaluacionControl(){
        
        $query = $this->db->query("select * from evaluacion_control2 where is_deleted=0");
        return $query->getResultArray();
    }
    
    public function getRegistroControles(){
        
        $query = $this->db->query("select * from registro_controles where is_deleted=0");
        return $query->getResultArray();
    }
    public function getRegistroControl($id){
        
        $query = $this->db->query("select * from registro_controles where id='{$id}'");
        return $query->getRow();
    }
    public function getRegistroDetalleControl($id){
        
        $query = $this->db->query("select * from detalle_controles where idControles='{$id}'");
        return $query->getResultArray();
    }
    

    public function getDetalleEvaluacionControl($id){
        
        $query = $this->db->query("select DET.id as IDET,DET.ID_CC,CC.idOpcion,CC.caracteristica as caracteristica,EC.id as id, EC.calificacion as calificacion from evaluacion_control2 as EC inner join detalle_evaluacion_control as DET on EC.id=DET.IEC
        inner join caracteristica_control as CC on CC.id=DET.ID_CC where EC.id='{$id}' order by CC.idOpcion");
        return $query->getResultArray();
       
    }
    public function getById($id){
        
        $id_cali=$this->db->query("SELECT id from caracteristica_control 
        where is_deleted=0 and clasificacion =1 and idOpcion='{$id}'") ;
        $calificacion = $id_cali->getRow()->id;

        // $query=$this->db->query("SELECT id from caracteristica_control 
        // where is_deleted=0 and clasificacion =1 and tipo='submenu' and idOpcion='{$calificacion}'") ;
        return $id_cali->getRow()->id;
      
    }
    // public function getEstado(){

    //     $query = $this->db->query("EXEC listar_estado");
    //     return $query->getResultArray();
    // }

    public function saveControles($data){

        $query=$this->db->query("EXEC agregar_Registro_Controles
        @IDR='{$data[0]['IDR']}',
        @riesgo='{$data[0]['riesgo']}',
        @IDC='{$data[0]['IDC']}',
        @control='{$data[0]['control']}',
        @cobertura='{$data[0]['cobertura']}',
        @evaluacion='{$data[0]['evaluacion']}',
        @estado='{$data[0]['estado']}',
        @idUserAdd= {$data['user']}") ;
       
        
        $last_id = $this->db->query("EXEC last_id_Registro_Proceso");
    
        return  $last_id->getRow()->maxid;
    }
    public function saveDtealle_Control($data){

        $query=$this->db->query("EXEC agregar_detalle_control
        @idControl='{$data['idControl']}',
        @idCC='{$data['idCC']}',
        @nom_tabla='{$data['nom_tabla']}',
        @valor='{$data['valor']}'") ;
       

        return  $query;
    }
    
    public function updateControles($data){

        $query=$this->db->query("EXEC modificar_Registro_Controles
        @IDR='{$data[0]['IDR']}',
        @riesgo='{$data[0]['riesgo']}',
        @IDC='{$data[0]['IDC']}',
        @control='{$data[0]['control']}',
        @cobertura='{$data[0]['cobertura']}',
        @evaluacion='{$data[0]['evaluacion']}',
        @estado='{$data[0]['estado']}',
        @idUserAdd= {$data['user']},
        @idControl= {$data[0]['id']}") ;
       
    
        return  $query;
    }
    public function updateDtealle_Control($data){

        $query=$this->db->query("EXEC modificar_detalle_control
        @valor='{$data['valor']}', @idControl= {$data['idControl']},@idCC={$data['idCC'] }") ;
       

        return  $query;
    }
    public function deleteControles($data){

        $query=$this->db->query("EXEC eliminar_Registro_Controles @idUserAdd= {$data['user']},@idControl={$data['id'] }") ;
       

        return  $query;
    }
    public function getRegistroControles2(){
        
        $query = $this->db->query("SELECT *,RC.id as IDRC ,RC.estado as RCEstado,DC.valor as RCValor from registro_controles  as RC 
        inner join detalle_controles as DC on RC.id=DC.idControles inner join caracteristica_control as CC 
        on DC.idCC=CC.id");

        // $query = $this ->db->query("
        // declare @valor nvarchar(400)
        
        // set @valor = ''
        
        // SELECT @valor = @valor + '[' + T.caracteristica + '],' FROM
        // (select caracteristica from caracteristica_control where 
        // tipo='opcion' and clasificacion=0 and is_deleted=0 ) AS T
        // set @valor = left(@valor,len(@valor)-1)
        
        
        // Execute ('(SELECT id,nom_control,estado,'+@valor+' FROM
        
        // (SELECT RC.id as id,RC.nom_control,RC.estado,CC.caracteristica as dato,DC.valor from registro_controles 
        // as RC inner join detalle_controles as DC on RC.id=DC.idControles 
        // inner join caracteristica_control as CC on DC.idCC=CC.id) AS SourceTable
        // PIVOT(
        // MAX(valor)
        // FOR dato IN ('+@valor+')
        // ) as PivotTable)')");
        return $query->getResultArray();
    }
    public function getControlesRiesgos(){
        $query = $this->db->query(" EXEC listar_riesgos");
        return $query->getResultArray();
    }

    public function validaRegistroControl($data){
        
        $query = $this->db->query("select * from registro_controles where is_deleted=0 and nom_control='{$data['control']}' ");
        return $query->getResultArray();
    }
    public function getPlanControl(){
        $query = $this->db->query("select * from registro_controles where is_deleted=0 ");
        return $query->getResultArray();
    }
   
}