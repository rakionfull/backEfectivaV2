<?php

namespace App\Models;

use CodeIgniter\Model;

class Muser extends Model
{
    protected $table            = 'tb_users';
    protected $primaryKey       = 'id_us';
    protected $useSoftDeletes   = false;
    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'date_add';
    protected $updatedField  = 'date_modify';
    protected $deletedField  = 'date_deleted';
    protected $allowedFields    = [
        'id_us',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_updated',
        'id_user_deleted',
        'is_deleted'
    ];
    public function saveUser($data){
      
        
        $creacion_us = date('Y-m-d H:i:s');
        $estado_us = '1';
        $change_pass = '0';
      
        $query=$this->db->query("INSERT INTO tb_users 
        (docident_us,nombres_us,apepat_us,apemat_us,email_us,
        usuario_us,creacion_us,estado_us,change_pass,perfil_us,idempresa,idposicion,idarea,idunidad) VALUES
        ('{$data['docident_us']}','{$data['nombres_us']}',
        '{$data['apepat_us']}','{$data['apemat_us']}',
        '{$data['email_us']}','{$data['usuario_us']}',
        '{$creacion_us}','{$estado_us}','{$change_pass}','{$data['perfil_us']}',
        '{$data['id_empresa']}','{$data['id_puesto']}','{$data['id_area']}','{$data['id_unidad']}'); ") ;
         
        return $query;

    }
    public function lastid(){
     
        $maxID = $this->db->query('SELECT @@identity as maxid FROM tb_users');

        return $maxID->getRow()->maxid;
    }
    public function savePass($data){
       
        $creacion_cl = date('Y-m-d H:i:s');
        $expiracion_cl = time() + (24*3600*45);
        $query=$this->db->query("INSERT INTO tb_historial_claves 
        (pass_cl,id_us,creacion_cl,expiracion_cl) VALUES
        ('{$data['pass_cl']}','{$data['id_us']}',
        '{$creacion_cl}','{$expiracion_cl}'); ") ;
    
    
        return $query;
    }
    public function getUser($username){

        $Usuario = $this->db->query("SELECT * FROM  tb_users as TU INNER JOIN tb_historial_claves AS TH
        on TU.id_us=TH.id_us WHERE TU.usuario_us= '{$username}'  ORDER BY TH.id_cl DESC LIMIT 1");
       
        return $Usuario->getRow();
    }
   
    public function getPass($idPost){

        $query = $this->db->query("SELECT * FROM  tb_users as TU INNER JOIN tb_historial_claves AS TH
        on TU.id_us=TH.id_us WHERE TU.id_us= {$idPost} ORDER BY TH.id_cl DESC LIMIT 10");
       
        return $query->getResultArray();
    }
    public function getUserbyId($id){

        $Usuario = $this->db->query("SELECT * FROM  tb_users as TU INNER JOIN tb_historial_claves AS TH
        on TU.id_us=TH.id_us WHERE TU.id_us= '{$id}' ORDER BY TH.id_cl DESC LIMIT 1");
       
        return $Usuario->getRow();
    }
    public function getUserUpdate($id){

        $Usuario = $this->db->query("SELECT * FROM  tb_users as TU WHERE TU.id_us= '{$id}'");
       
        return $Usuario->getRow();
    }
    public function getUserByDatos($username){

        $sql = "CALL getUserByDatos(?)";

		$result = $this->db->query($sql, [$username]);

        //$Usuario = $this->db->query("CALL getUserByDatos user = {$username}");
       
        return $result->getRow();
    }
   
    public function changePass($data){
        // return $data;
        $query=$this->db->query("UPDATE tb_users SET change_pass = 1 
        where id_us = $data") ;
            
        return $query;
    }
    //retorna todos los usuarios
    public function getUsers($data){
        $consulta = "";
   
        if($data['estado'] == 'all') {
            $consulta = "SELECT  *,TU.id_us as id,(select loged from tb_sesiones where id_us=TU.id_us  ORDER BY loged DESC LIMIT 1) as loged FROM tb_users as TU  ORDER BY TU.id_us;";
        }
        else { $consulta = "SELECT  *,TU.id_us as id,(select loged from tb_sesiones where id_us=TU.id_us  ORDER BY loged DESC LIMIT 1) as loged FROM tb_users as TU  
            where TU.estado_us={$data['estado'] } ORDER BY TU.id_us;"; }

        $Usuario = $this->db->query($consulta);
        return $Usuario->getResultArray();
    }

   
    //actualiza el usuario
    public function updateUser($data,$id){
      
        $actualizacion_us = date('Y-m-d H:i:s');
        $query=$this->db->query("UPDATE tb_users SET nombres_us = '{$data['nombres_us']}', docident_us = '{$data['docident_us']}',
        apepat_us = '{$data['apepat_us']}',apemat_us= '{$data['apemat_us']}',perfil_us= '{$data['perfil_us']}',
        estado_us= '{$data['estado_us']}',
        email_us= '{$data['email_us']}' ,actualizacion_us='{$actualizacion_us}',idempresa='{$data['id_empresa']}'
        ,idarea='{$data['id_area']}',idposicion='{$data['id_puesto']}',idunidad='{$data['id_unidad']}'
       
        where id_us = {$id} ") ;
           
        return $query;
        // idarea='{$data['id_area']}',idposicion='{$data['id_puesto']}',idunidad='{$data['id_unidad']}'
    }
        //actualiza solo el estado 
    public function updateEstadoUser($data){
        // $query=$this->db->query("UPDATE tb_users SET 
        // estado_us= '{$data['estado_us']}'
        // where id_us = {$data['id_us']} ") ;
           $query=$this->db->query("UPDATE tb_users SET 
           bloqueo_us= '{$data['estado_us']}'
           where id_us = {$data['id_us']} ") ;
        return $query;
    }
    // public function deleteUser($id){
    //     $this->db->query("DELETE FROM tb_historial_claves
    //     where id_us = {$id} ") ;
    //     $query=$this->db->query("DELETE FROM tb_users
    //     where id_us = {$id} ") ;
    //     return $query;
    // }
    public function findUser($username){

        $Usuario = $this->db->query("SELECT  * FROM  tb_users where usuario_us= '{$username}' ");
       
        return $Usuario->getRow();
    }
    public function getIntento($username){
        $Usuario = $this->db->query("SELECT  intentos_us,bloqueo_time,bloqueo_us FROM  tb_users where usuario_us= '{$username}' ");
       
        return $Usuario->getRow();
    }
    public function setIntento($username,$intento){
        $newIntento = $intento + 1 ;
        $Usuario = $this->db->query("UPDATE  tb_users SET intentos_us= $newIntento where usuario_us= '{$username}' ");
       
        return $Usuario;
    }
    public function setTimeIntento($username){
        // $time =  time() + 60*2;
       // $Usuario = $this->db->query("UPDATE  tb_users SET bloqueo_time= $time  where usuario_us= '{$username}' ");
        $Usuario = $this->db->query("UPDATE  tb_users SET bloqueo_us=1  where usuario_us= '{$username}' ");
       
        return $Usuario;
    }

    //reportes
    public function getCamposUser(){
        $consulta = "SELECT COLUMN_NAME
        FROM Information_Schema.Columns
        WHERE TABLE_NAME = 'tb_users'
        ORDER BY COLUMN_NAME";
        $Usuario = $this->db->query($consulta);
        return $Usuario->getResultArray();
    }
    public function getDatosUser(){
        $consulta = "SELECT TU.usuario_us,TU.docident_us,TU.nombres_us, TU.apepat_us,TU.apemat_us,TP.perfil,TU.creacion_us,
        IF(TU.estado_us=1, 'Activo', 'Inactivo') as estado, IF(bloqueo_us=0, 'Desbloqueado', 'Bloqueado') as bloqueo,
        (SELECT last_activity FROM tb_sesiones WHERE id_us = TU.id_us ORDER by last_activity DESC LIMIT 1 ) AS ultimo_acceso
         FROM tb_users as TU inner join tb_perfiles as TP on TU.perfil_us=TP.id_perfil; ";
        $Usuario = $this->db->query($consulta);
        return $Usuario->getResultArray();
    }
    
    public function getUserByActivo(){

        $query = $this->db->query("SELECT * FROM tb_users where estado_us='1'");
        return $query->getResultArray();
    }
    public function getUserByEmpresa($data){

        $query = $this->db->query("SELECT * FROM tb_users where estado_us='1' and idempresa={$data}");
        return $query->getResultArray();
    }
    public function getUserByArea($id_area){

        $query = $this->db->query("SELECT * FROM tb_users where estado_us='1' and idarea={$id_area}");
        return $query->getResultArray();
    }
    public function getUserNombreByActivo(){

        $query = $this->db->query("SELECT * FROM tb_users where estado_us='1'");
        return $query->getResultArray();
    }
    public function getEscenario(){
        $query = $this->db->query("SELECT escenario FROM escenario_active");
        return $query->getRow()->escenario;
        // return $queryc->escenario;
    }

}

