<?php

namespace App\Models;

use CodeIgniter\Model;

class MPosicion extends Model
{
    protected $table            = 'posicion_puesto';
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
    public function validaPosicion($data){
        
            // $query = $this->db->query("SELECT * FROM posicion_puesto 
            // where posicion_puesto='{$data['posicion']}'
            // and idempresa={$data['idempresa']} and
            //  idarea={$data['idarea']} and 
            //  idunidad={$data['idunidad']}");
            $query = $this->db->query("EXEC validaPosicion
            @area = {$data[0]['idarea']},
            @empresa= {$data[0]['idempresa']},
            @unidad= {$data[0]['idunidad']},
            @posicion = '{$data[0]['posicion']}' ");
            $query->getRow();
            if( $query->getRow()) return true;
            else return false;
    }
   
    public function getPosicion($dato){

        if($dato == 0){
            // $query = $this->db->query("SELECT PP.id as id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
            // E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto as PP inner join empresa as E
            // on PP.idempresa=E.id inner join area as A on PP.idarea=A.id 
            // inner join unidades as U on PP.idunidad=U.id where PP.is_deleted=0");
            $query = $this->db->query("EXEC listarPosicion");
        }else{
            // $query = $this->db->query("SELECT PP.id as id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
            // E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto as PP inner join empresa as E
            // on PP.idempresa=E.id inner join area as A on PP.idarea=A.id 
            // inner join unidades as U 
			// on PP.idunidad=U.id where E.id={$dato} 
            // and PP.is_deleted=0");
              $query = $this->db->query("EXEC listarPosicionEmpresa @dato={$dato}");
        }
       
        return $query->getResultArray();
    }

    
    public function savePosicion($data){       

        // $query=$this->db->query("INSERT INTO posicion_puesto
        // (posicion_puesto,idempresa,idarea,idunidad,estado) VALUES
        // ('{$data['posicion']}',{$data['idempresa']},{$data['idarea']},{$data['idunidad']},{$data['estado']})") ;
        $query = $this->db->query("EXEC agregar_posicion 
        @area ={$data[0]['idarea']},
        @empresa ={$data[0]['idempresa']},
        @unidad = {$data[0]['idunidad']},
        @posicion = '{$data[0]['posicion']}',
        @estado ={$data[0]['estado']},
        @idUserAdd ={$data['user']}");
        return $query;
    }
    public function updatePosicion($data){  
        
        // $query=$this->db->query("UPDATE posicion_puesto SET 
        // posicion_puesto = '{$data['posicion']}',
        // idempresa = '{$data['idempresa']}',
        // idarea = '{$data['idarea']}',
        // idunidad = '{$data['idunidad']}',  estado = '{$data['estado']}'
        // where id = {$data['id']} ") ;
        $query = $this->db->query("EXEC editar_posicion 
        @area ={$data[0]['idarea']},
        @empresa ={$data[0]['idempresa']},
        @unidad = {$data[0]['idunidad']},
        @posicion = '{$data[0]['posicion']}',
        @idposicion ={$data[0]['id']},
        @estado ={$data[0]['estado']},
        @idUserAdd ={$data['user']}");
        return $query;
    }
    // public function deletePosicion($data){
        
            
    //     $query=$this->db->query("DELETE posicion_puesto 
    //     where id = {$data} ") ;
        
    //     return $query;
    // }
    public function getPosicionByArea($area_id){
        // $query = $this->db->query("SELECT PP.id as id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
        // E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto as PP inner join empresa as E
        // on PP.idempresa=E.id inner join area as A on PP.idarea=A.id 
        // inner join unidades as U on PP.idunidad=U.id
        // where pp.idarea=$area_id");
        $query = $this->db->query("EXEC getPosicionByArea @idarea={$area_id}");
        return $query->getResultArray();
    }
    public function getComboPosicion(){

        //$query = $this->db->query("SELECT * FROM posicion_puesto where estado='1'");
        $query = $this->db->query("EXEC getComboPosicion");
        return $query->getResultArray();
    }
    public function getPosicionByActivo($data){

       // $query = $this->db->query("SELECT * FROM posicion_puesto where estado='1' and idempresa={$data}");
      
      $query = $this->db->query("EXEC listarPosicionEmpresa @dato={$data}");
       return $query->getResultArray();
    }

}