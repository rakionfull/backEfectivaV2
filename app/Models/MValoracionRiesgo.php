<?php

namespace App\Models;

use CodeIgniter\Model;

class MValoracionRiesgo extends Model
{

    protected $table            = 'valoracion_riesgo';
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

    
    public function validaValoracionRiesgo($data){
        
        $query = $this->db->query("EXEC valida_ValoracionRiesgo 
      @probabilidad='".$data['probabilidad']."' ,@impacto='".$data['impacto']."'");
        $query->getRow();
        if( $query->getRow()) return true;
        else return false;
    }
    public function getValoracionRiesgo(){
        
        $query = $this->db->query("EXEC listar_ValoracionRiesgo");
        return $query->getResultArray();
    }


    public function saveValoracionRiesgo($data){       

        $query=$this->db->query("EXEC agregar_ValoracionRiesgo @valor='{$data[0]['valor']}',
        @probabilidad='{$data[0]['probabilidad']}', @impacto='{$data[0]['impacto']}',@idUserAdd= {$data['user']}") ;

        return $query;
    }
    public function updateValoracionRiesgo($data){  
        
        $query= $this->db->query("EXEC modificar_ValoracionRiesgo @valor='{$data[0]['valor']}',
        @probabilidad='{$data[0]['probabilidad']}', @impacto='{$data[0]['impacto']}'
        ,@idUserAdd= {$data['user']},@idValoracionRiesgo={$data[0]['id']}") ;
        return $query;
    }
    public function deleteValoracionRiesgo($data){
            
        $query=$this->db->query("EXEC eliminar_ValoracionRiesgo @idUserAdd={$data['user']}, 
        @idValoracionRiesgo={$data[0]['id']}") ;
        
        return $query;
    }

    public function getImpactoRiesgoByActivo(){
        
        $query = $this->db->query("EXEC listar_ImpactoRiesgoByActivo");
        return $query->getResultArray();
    }
    public function getProbabilidadRiesgoByActivo(){
        
        $query = $this->db->query("EXEC listar_ProbabilidadRiesgoByActivo");
        return $query->getResultArray();
    }
   
    public function getDataMatriz(){
        
  
          $query = $this->db->query("SELECT  concat(PR.valor1,' - ',PR.valor2) as valorProbabilidad 
          ,concat(IR.valor1,' - ',IR.valor2) as  valorImpacto,VR.id,VR.idProbabilidad,VR.idImpacto,VR.valor, 
           PR.descripcion as probabilidad, IR.descripcion as impacto
           from valoracion_riesgo as VR inner join probabilidad_riesgo as PR 
           on VR.idProbabilidad = PR.id inner join impacto_riesgo as IR on VR.idImpacto=IR.id
          where VR.is_deleted=0 and PR.estado=1  and  IR.estado=1  and PR.tipo_regla='2 Valores' 
          and IR.tipo_regla='2 Valores' order by valorProbabilidad DESC ");
        return $query->getResultArray();
    }
    public function getByProbabilidadImpacto($data){
        $query = $this->db->query("EXEC sp_get_valoracion_riesgo ?,?",[
            $data['id_probabilidad'],
            $data['id_impacto']
        ]);
        return $query->getResultArray();;
    }
    
}