<?php

namespace App\Models;

use CodeIgniter\Model;

class MRegistroControles extends Model
{
    protected $table            = 'registro_controles';
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
    public function getCCMenu(){
        
        $sql = "CALL getCCMenu()";

        $query = $this->db->query($sql, [
        ]);
        return $query->getResultArray();
    }
    public function getCCSubMenu(){
        
    
        $sql = "CALL getCCSubMenu()";

        $query = $this->db->query($sql, [
        ]);
        return $query->getResultArray();
    }

    public function getCCOpciones(){
        
      
        $sql = "CALL getCCOpciones()";

        $query = $this->db->query($sql, [
        ]);
        return $query->getResultArray();
    }
    public function getCoberturaByActivo(){
        
 

        $sql = "CALL getCoberturaByActivo()";

        $query = $this->db->query($sql, [
        ]);

        return $query->getResultArray();
    }
    public function getTabla($id){
        
        
         $sql = "CALL getTabla(?)";

        $query = $this->db->query($sql, [
            $id
        ]);
        return $query->getRow()->nom_tabla;
    }
    //esta funcion debe quedarse asi
    public function getData2($tabla){
        
         $query = $this->db->query("SELECT * FROM {$tabla} where is_deleted=0 and estado=1 ");
        // $sql = "CALL getData2(?)";

        // $query = $this->db->query($sql, [
        //     $tabla
        // ]);
        return $query->getResultArray();
    }
    public function LastIdControles(){
        
   
        $sql = "CALL LastIdControles()";

        $query = $this->db->query($sql, [
           
        ]);
        if($query->getRow())  return $query->getRow()->last_id;
        else  return 0;
        // return $query->getRow();
    }
    public function obtenerPeso($id){
        
     
        $sql = "CALL obtenerPeso(?)";

        $query = $this->db->query($sql, [
           $id
        ]);
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
    
        $sql = "CALL getEvaluacionControl()";

        $query = $this->db->query($sql, [
           
        ]);
        return $query->getResultArray();
    }
    
    public function getRegistroControles(){
        
   
        $sql = "CALL getRegistroControles()";

        $query = $this->db->query($sql, [
           
        ]);
        return $query->getResultArray();
    }
    public function getRegistroControl($id){
        
      
        $sql = "CALL getRegistroControl(?)";

        $query = $this->db->query($sql, [
           $id
        ]);
        return $query->getRow();
    }
    public function getRegistroDetalleControl($id){
        
   
        $sql = "CALL getRegistroDetalleControl(?)";

        $query = $this->db->query($sql, [
           $id
        ]);
        return $query->getResultArray();
    }
    

    public function getDetalleEvaluacionControl($id){
        
 
        $sql = "CALL getDetalleEvaluacionControl(?)";

        $query = $this->db->query($sql, [
           $id
        ]);
        return $query->getResultArray();
       
    }
    public function getById($id){
        
  

        $sql = "CALL getById(?)";

        $id_cali = $this->db->query($sql, [
        $id
        ]);

        $calificacion = $id_cali->getRow()->id;

     
        return $id_cali->getRow()->id;
      
    }


    public function saveControles($data){

      
       
        $sql = "CALL agregar_Registro_Controles(?,?,?,?,?,?,?,?)";

	    $this->db->query($sql, [
            $data[0]['IDR'],
            $data[0]['riesgo'],
            $data[0]['IDC'],
            $data[0]['control'],
            $data[0]['cobertura'],
            $data[0]['evaluacion'],
            $data[0]['estado'],
            $data['user']
        ]);
        
        $sql2 = "CALL last_id_Registro_Proceso()";
        $last_id = $this->db->query($sql2, []);

     
    
        return  $last_id->getRow()->maxid;
    }
    public function saveDetalle_Control($data){

        $sql = "CALL agregar_detalle_control(?,?,?,?)";

	    $query = $this->db->query($sql, [
            $data['idControl'],
            $data['idCC'],
            $data['nom_tabla'],
            $data['valor']
        ]);

     
       
        return  $query;
    }
    
    public function updateControles($data){

     
        $sql = "CALL modificar_Registro_Controles(?,?,?,?,?,?,?,?,?)";

        $query = $this->db->query($sql, [
            $data[0]['IDR'],
            $data[0]['riesgo'],
            $data[0]['IDC'],
            $data[0]['control'],
            $data[0]['cobertura'],
            $data[0]['evaluacion'],
            $data[0]['estado'],
            $data['user'],
            $data[0]['id']
        ]);
    
        return  $query;
    }
    public function updateDtealle_Control($data){
;
       
        $sql = "CALL modificar_detalle_control(?,?,?)";

	    $query = $this->db->query($sql, [
            $data['valor'],
            $data['idControl'],
            $data['idCC']
        ]);

        return  $query;
    }
    
    public function getRegistroControles2(){
     
        $sql = "CALL getRegistroControles2()";

        $query = $this->db->query($sql, [
       
        ]);
        return $query->getResultArray();
    }
    public function getControlesRiesgos(){
       
        $sql = "CALL listar_riesgos()";

	    $query = $this->db->query($sql, []);
        return $query->getResultArray();
    }

    public function validaRegistroControl($data){
       
        $sql = "CALL listar_riesgos()";

	    $query = $this->db->query($sql, [
            $data
        ]);
        return $query->getResultArray();
    }
    public function getPlanControl(){
      

        $sql = "CALL getPlanControl()";

	    $query = $this->db->query($sql, [
        
        ]);
        return $query->getResultArray();
    }
   
}