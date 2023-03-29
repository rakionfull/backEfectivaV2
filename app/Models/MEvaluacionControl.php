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
 
    //aqui falta agregarles
    public function getEvaluacionControl(){
        
  
        // //primero consigo las columnas de las calificacion
       


        $cabeceras="SELECT caracteristica from caracteristica_control where tipo='submenu' and clasificacion=1 and is_deleted=0;";
        $query= $this->db->query($cabeceras); 
        $calificacion = $query -> getResultArray();
            //construimos la consulta
        $parte1="SELECT EC.id,DE.IEC,EC.calificacion ,";
        

        $parte2= "";
        for ($i=0; $i < count($calificacion) ; $i++) { 
            if($i == count($calificacion) - 1){ 
                $parte2= $parte2." MAX(CASE when (select caracteristica from caracteristica_control where 
                clasificacion=1 and id=CC.idOpcion) = '{$calificacion[$i]['caracteristica'] }' THEN CC.caracteristica  ELSE 0 END) as '{$calificacion[$i]['caracteristica'] }' ";
                
            }else{
                $parte2= $parte2." MAX(CASE when (select caracteristica from caracteristica_control where 
                clasificacion=1 and id=CC.idOpcion) = '{$calificacion[$i]['caracteristica'] }' THEN CC.caracteristica ELSE 0 END) as  '{$calificacion[$i]['caracteristica'] }' , ";
            }
           
          
        }
        
        $parte3=", EC.calificacion FROM detalle_evaluacion_control as DE inner join evaluacion_control2 as EC on
         DE.IEC = EC.id inner join caracteristica_control as CC on CC.id=DE.ID_CC  where EC.is_deleted=0 GROUP BY EC.id;";
     

       // luego 
        $query2 = $this->db->query($parte1.$parte2.$parte3);
        
        // return  count($calificacion);
        return  $query2 -> getResultArray();
        //return  $parte1.$parte2.$parte3;
        //return $query2;
    }
    public function saveEvaluacionControl($data){       

        // $query=$this->db->query("EXEC agregar_Evaluacion_Control 
        // @calificacion='{$data[0]['calificacion']}', @idUserAdd= {$data['user']}") ;

        $sql = "CALL agregar_Evaluacion_Control(?,?)";

	    $query = $this->db->query($sql, [
            $data[0]['calificacion'],
            $data['user'],
    
        
        ]);


        $last_id = $this->db->query("CALL last_id_Evaluacion_Control ()");
        if($last_id->getRow()) return  $last_id->getRow()->maxid;
        else return 0;



        
    }
    public function saveDetalleEvaluacionControl($data){       

        // $query=$this->db->query("EXEC agregar_detalle_Evaluacion_Control  @IEC='{$data['id']}',
        // @IDCC='{$data['valor']}'") ;    
        $sql = "CALL agregar_detalle_Evaluacion_Control(?,?)";

	    $query = $this->db->query($sql, [
            $data['id'],
            $data['valor'],
        ]);

        return  $query;
    }
    public function updateEvaluacionControl($data){  
        
        // $query= $this->db->query("EXEC modificar_Evaluacion_Control @calificacion='{$data[0]['calificacion']}',
        // @idUserAdd= {$data['user']},@idEvaluacionControl={$data[0]['id']}") ;

        $sql = "CALL modificar_Evaluacion_Control(?,?,?)";
        $query = $this->db->query($sql, [
            $data[0]['calificacion'],
            $data['user'],
            $data[0]['id']
        ]);
        
        return $query;
    }
    public function deleteDetalleEvaluacionControl($data){  
        
        $query= $this->db->query("delete from detalle_evaluacion_control where IEC='{$data[0]['id']}'") ;
        return $query;
    }
    public function deleteEvaluacionControl($data){
            
        // $query=$this->db->query("EXEC eliminar_Evaluacion_Control @idUserAdd={$data['user']}, @idEvaluacionControl={$data[0]['id']}") ;
        $sql = "CALL eliminar_Evaluacion_Control(?,?,?)";
        $query = $this->db->query($sql, [
            $data['user'],
            $data[0]['id']
        ]);
        return $query;
    }

    public function getDisenioCalificacion(){
        
        $id=$this->db->query("SELECT id from caracteristica_control 
        where is_deleted=0   and caracteristica='Diseño'") ;
        if($id){
            $disenio = $id->getRow()->id;
            $id_cali=$this->db->query("SELECT id from caracteristica_control 
            where is_deleted=0 and clasificacion =1 and idOpcion={$disenio}") ;
           
            if($id_cali->getRow()){
                    $calificacion = $id_cali->getRow()->id;

                    $query=$this->db->query("SELECT * from caracteristica_control 
                    where is_deleted=0 and clasificacion =1 and tipo='opcion' and idOpcion={$calificacion}") ;

                    return $query->getResultArray();
            }else{
                return 0;
            }
            //return $id_cali->getRow();
        
        }else{
            return 0;
        }
        
       
       


      
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
  
    public function getCaracteristicaOpcion($escenario){
        $sql = "call sp_get_caracteristica_control_opcion(?)";
        $result = $this->db->query($sql,[$escenario]);
        return $result->getResultArray();
    }
    
}