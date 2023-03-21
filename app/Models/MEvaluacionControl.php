<?php

namespace App\Models;

use CodeIgniter\Model;

class MEvaluacionControl extends Model
{
    protected $table = 'evaluacion_control2';
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
    public function getCalificacionSubMenu(){
        
        $query = $this->db->query("select * from caracteristica_control where tipo = 'submenu' and is_deleted=0 and estado= 1 and clasificacion=1");
        return $query->getResultArray();
    }
    public function getCalificacionOpcion($id){
        
        $query = $this->db->query("select * from caracteristica_control where tipo = 'opcion' and is_deleted=0 and estado= 1 and clasificacion=1 and idOpcion={$id}");
        return $query->getResultArray();
    }
   
    public function validaEvaluacionControl($data){
        
        $query = $this->db->query("EXEC valida_Evaluacion_Control @disenio='".$data['disenio']."',
        @operatividad='".$data['operatividad']."', @calificacion='".$data['calificacion']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    // public function getEvaluacionControl(){
        
    //     $query = $this->db->query("EXEC listar_Evaluacion_Control");
    //     return $query->getResultArray();
    // }
   
    public function getEvaluacionControl(){
        
        $query = $this->db->query("
        
            declare @valor nvarchar(400)

            set @valor = ''

            SELECT @valor = @valor + '[' + T.caracteristica + '],' FROM
            (select caracteristica from caracteristica_control where 
            tipo='submenu' and clasificacion=1 and is_deleted=0 ) AS T
            set @valor = left(@valor,len(@valor)-1)

            Execute ('(SELECT id,calificacion,IEC,'+@valor+',calificacion FROM

            (SELECT EC.id,DE.IEC,CC.caracteristica,(select caracteristica from caracteristica_control where 
            clasificacion=1 and id=CC.idOpcion) as dato,EC.calificacion from detalle_evaluacion_control as DE inner join evaluacion_control2 as EC on
            DE.IEC = EC.id inner join caracteristica_control as CC on CC.id=DE.ID_CC  where EC.is_deleted=0) AS SourceTable
            PIVOT(
            MAX(caracteristica)
            FOR dato IN ('+@valor+')
            ) as PivotTable)')");
        return $query->getResultArray();
    }
    public function saveEvaluacionControl($data){       

        $query=$this->db->query("EXEC agregar_Evaluacion_Control 
        @calificacion='{$data[0]['calificacion']}', @idUserAdd= {$data['user']}") ;

        $last_id = $this->db->query("EXEC last_id_Evaluacion_Control");
    
        return  $last_id->getRow()->maxid;
    }
    public function saveDetalleEvaluacionControl($data){       

        $query=$this->db->query("EXEC agregar_detalle_Evaluacion_Control  @IEC='{$data['id']}',
        @IDCC='{$data['valor']}'") ;    
        return  $query;
    }
    public function updateEvaluacionControl($data){  
        
        $query= $this->db->query("EXEC modificar_Evaluacion_Control @calificacion='{$data[0]['calificacion']}',
        @idUserAdd= {$data['user']},@idEvaluacionControl={$data[0]['id']}") ;
        return $query;
    }
    public function deleteDetalleEvaluacionControl($data){  
        
        $query= $this->db->query("delete from detalle_evaluacion_control where IEC='{$data[0]['id']}'") ;
        return $query;
    }
    public function deleteEvaluacionControl($data){
            
        $query=$this->db->query("EXEC eliminar_Evaluacion_Control @idUserAdd={$data['user']}, @idEvaluacionControl={$data[0]['id']}") ;
        
        return $query;
    }

    public function getDisenioCalificacion(){
        
        $id=$this->db->query("SELECT id from caracteristica_control 
        where is_deleted=0   and caracteristica='Diseño'") ;
        $disenio = $id->getRow()->id;
        
        $id_cali=$this->db->query("SELECT id from caracteristica_control 
        where is_deleted=0 and clasificacion =1 and idOpcion={$disenio}") ;
        $calificacion = $id_cali->getRow()->id;

        $query=$this->db->query("SELECT * from caracteristica_control 
        where is_deleted=0 and clasificacion =1 and tipo='opcion' and idOpcion={$calificacion}") ;
       


        return $query->getResultArray();
    }
    public function getOperatividadCalificacion(){
        
        $id=$this->db->query("SELECT id from caracteristica_control 
        where is_deleted=0  and caracteristica='Operatividad'") ;
        $disenio = $id->getRow()->id;
        
        $id_cali=$this->db->query("SELECT id from caracteristica_control 
        where is_deleted=0 and clasificacion =1 and idOpcion={$disenio}") ;
        $calificacion = $id_cali->getRow()->id;

        $query=$this->db->query("SELECT * from caracteristica_control 
        where is_deleted=0 and clasificacion =1 and tipo='opcion' and idOpcion={$calificacion}") ;
        
        return $query->getResultArray();
    }
  
    
}