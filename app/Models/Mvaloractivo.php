<?php

namespace App\Models;

use CodeIgniter\Model;

class Mvaloractivo extends Model
{
    public function validaValorActivo($data){
        
            $query = $this->db->query("SELECT * FROM valor_activo where valor='{$data}'");
            $query->getRow();
            if( $query->getRow()) return true;
            else return false;
    }
    public function getValorActivo(){

        $query = $this->db->query("SELECT * FROM valor_activo");
        return $query->getResultArray();
    }

    public function getValorActivo2(){

        $query = $this->db->query("SELECT * FROM valor_activo");
        return $query->getResultArray();
    }

    public function saveValorActivo($data){       

        $query=$this->db->query("INSERT INTO valor_activo
        (valor,estado) VALUES
        ('{$data['valor']}',{$data['estado']})") ;

        return $query;
    }
    public function updateValorActivo($data){  
        
        $query=$this->db->query("UPDATE valor_activo SET 
        valor = '{$data['valor']}',
        estado = '{$data['estado']}'
        where id = {$data['id']} ") ;
        
        return $query;
    }
    public function deleteValorActivo($data){
        
            
        $query=$this->db->query("DELETE valor_activo 
        where id = {$data} ") ;
        
        return $query;
    }
    public function getValorActivoByActivo(){

        $query = $this->db->query("SELECT * FROM valor_activo where estado='1'");
        return $query->getResultArray();
    }


}