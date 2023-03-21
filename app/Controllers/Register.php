<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use App\Controllers\BaseController;
use App\Models\Muser;

class Register extends BaseController
{
    use ResponseTrait;

    public function register()
    {
    
        $rules = [
            'email' => [
                'label' => 'email',
                'rules' => 'required|min_length[4]|max_length[255]|valid_email|is_unique[tb_users.email_us]',
                'errors' => [
                    'is_unique' => 'El campo de {field} debe ser único'
                ]
            ],
            'password' => [
                'rules' => 'required|min_length[8]|max_length[255]'
            ],
            'confirm_password' => [
                'label' => 'Confirmación de Contraseña',
                'rules' => 'matches[password]'
            ]
        ];

        if(!$this->validate($rules)){
            return $this->fail(
                [
                    'message' => 'Datos invalidos',
                    'errors' => $this->validator->getErrors(),
                ],
                ResponseInterface::HTTP_CONFLICT
            );
        }else{
             $Muser = new Muser();

            $data = array(
                'docident_us' => $this->request->getVar('doc_ident'),
                'nombres_us' => $this->request->getVar('nombres'),
                'apepat_us' => $this->request->getVar('apepat'),
                'apemat_us' => $this->request->getVar('apemat'),
                'email_us' => $this->request->getVar('email'),
                // 'password' => password_hash($this->request->getVar('password'), PASSWORD_DEFAULT)
                'usuario_us' => $this->request->getVar('usuario'),
                'perfil_us' => $this->request->getVar('perfil_us'),
                'id_empresa' => $this->request->getVar('idempresa'),
                'id_puesto' => $this->request->getVar('idposicion'),
                'id_area' => $this->request->getVar('idarea'),
                'id_unidad' => $this->request->getVar('idunidad'),
                'creacion_us' => date('Y-m-d H:i:s'),
                'estado_us' => '1',
                'change_pass' => '0',
                
            );
            $user = $Muser->saveUser($data);
           if($user){
        
            $datos = array(
                'creacion_cl' => date('Y-m-d H:i:s'),
                'pass_cl' => hashPass($this->request->getVar('password')),
                'expiracion_cl' => time() + (24*3600*45),
                'id_us' =>$Muser->lastid(),
            );
                $result = $Muser->savePass($datos);
           }
          
           if($result){
            return $this->respond(
                [
                    'message' => 'Regristro completado correctamente',
                    'user' => $result
                ],
                ResponseInterface::HTTP_OK // 200
            );
           }
           
        }
    }
}