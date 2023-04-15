<?php

namespace App\Models;

use CodeIgniter\Model;

class MValoracionActivo extends Model
{
    protected $table = 'valoracion_activo';
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
        'idaspecto1',
        'idaspecto2',
        'idaspecto3',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];
    public function validarValActivo($data){
        
            // $query = $this->db->query("SELECT * FROM valoracion_activo 
            // where idaspecto1='{$data['id_aspecto1']}'
            // and idaspecto2={$data['id_aspecto2']} 
            // and idaspecto3={$data['id_aspecto3']} 
            // and idvalor={$data['id_valor_val']}
            // and valoracion1='{$data['nom_val1']}' 
            // and valoracion2='{$data['nom_val2']}' 
            // and valoracion3='{$data['nom_val3']}'");
           
           $query = $this->db->query("call validaValoracionActivo(?,?,?,?,?,?)",[
            $data['id_aspecto1'],
            $data['id_aspecto2'],
            $data['id_aspecto3'],
           
            $data['nom_val1'],
            $data['nom_val2'],
            $data['nom_val3'],
            // $data['id_valor_val'],
           ]);

            if( $query->getRow()) return true;
            else return false;
    }
    public function getValActivo(){

   
    
        $query = $this->db->query("call listarValoracionActivo()",[
          
        ]);
        return $query->getResultArray();
    }

    
    public function saveValActivo($data){       

        

        $query = $this->db->query("call agregar_valoracionactivo(?,?,?,?,?,?,?,?)",[
            $data[0]['id_aspecto1'],
            $data[0]['id_aspecto2'],
            $data[0]['id_aspecto3'],
            $data[0]['nom_val1'],
            $data[0]['nom_val2'],
            $data[0]['nom_val3'],
            $data[0]['id_valor_val'],
            $data['user']
        ]);
        return $query;
    }
    public function updateValActivo($data){  
        
        
       

        $query = $this->db->query("call editar_valoracionactivo(?,?,?,?,?,?,?,?,?)",[
            $data[0]['id_aspecto1'],
            $data[0]['id_aspecto2'],
            $data[0]['id_aspecto3'],
            $data[0]['nom_val1'],
            $data[0]['nom_val2'],
            $data[0]['nom_val3'],
            $data[0]['id_valor_val'],
            $data[0]['id'],
            $data['user']
        ]);

        return $query;
    }
    // public function deleteValActivo($data){
        
            
    //     $query=$this->db->query("DELETE valoracion_activo 
    //     where id = {$data} ") ;
        
    //     return $query;
    // }


}