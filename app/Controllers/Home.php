<?php

namespace App\Controllers;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Muser;
use App\Models\MconfigPass;
use App\Models\Mperfil;
use App\Models\Mcaptcha;
use App\Models\Mempresa;
use App\Models\Marea;
use App\Models\MclasInformacion;
use App\Models\Mtipoactivo;
use App\Models\Mvaloractivo;
use App\Models\MaspectoSeg;
use App\Models\Munidades;
use App\Models\Mmacroprocesos;
use App\Models\MProceso;
use CodeIgniter\HTTP\Response;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;
use App\Libraries\Capcha;

use Exception;
use ReflectionException;

class Home extends BaseController
{
    use ResponseTrait;
    public function index()
    {
        return view('welcome_message');
    }
    public function dashboard(){
        $response = [
            'msg' => 'BIENVENIDOS AL SISTEMA DE GESTIÓN DE RIESGOS SI-C',
        ];
        return $this->respond($response, ResponseInterface::HTTP_OK);

    }
    public function getPermisos(){
        try {
            $modelPerfil = new Mperfil();
            $input = $this->getRequestInput($this->request);
             $permisos = $modelPerfil->getPermisosByPerfil($input);
            $response = [
                    
                'data' =>  $permisos,
            ];

            return $this->respond($response, ResponseInterface::HTTP_OK);

        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => $ex->getMessage(),
                ],
                ResponseInterface::HTTP_OK
            );
        }
    }
    public function getUsers(){

        try {
            $model = new Muser();
            $input = $this->getRequestInput($this->request);
                $response = [
                    
                    'data' =>  $model->getUsers($input),
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }

           
    }
    public function getUser($id){

        try {
            $model = new Muser();
                $response = [
                    'msg' => 'estos son los usuarios',
                    'datos' =>  $model->getUserbyId($id),
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }

           
    }
    public function getEscenario(){

        try {
            $model = new Muser();
                $response = [
                  
                    'datos' =>  $model->getEscenario()
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }

           
    }
    public function addUser()
    {
        $rules = [
            'docident_us' => 'required|min_length[8]|max_length[8]|is_unique[tb_users.docident_us]',
            'nombres_us' => 'required|min_length[2]|max_length[50]',
            'apepat_us' => 'required|min_length[2]|max_length[50]',
            'apemat_us' => 'required|min_length[2]|max_length[50]',
            'email_us' => 'min_length[2]|max_length[50]|valid_email',
            'usuario_us' => 'required|min_length[5]|max_length[50]|is_unique[tb_users.usuario_us]',
            'passw' => 'required|min_length[8]|validatePass[passw]',
            'perfil_us' => 'required',
            'estado_us' => 'required',
        ];
        $errors = [
            'docident_us' => [
                'required' => 'Debe ingresar DNI',
                'is_unique' => 'El campo DNI debe ser único'
            ],
            'nombres_us' => [
                'required' => 'Debe ingresar Nombres',
              
            ],
            'apemat_us' => [
                'required' => 'Debe ingresar Apellido Paterno',
              
            ],
            'apepat_us' => [
                'required' => 'Debe ingresar Apellido Paterno',
              
            ],
            'email_us' => [
                'required' => 'Debe ingresar Correo',
                // 'is_unique' => 'El campo correo debe ser único'
            ],
            'estado_us' => [
                'required' => 'Debe seleccionar el estado',
                // 'is_unique' => 'El campo correo debe ser único'
            ],
            'usuario_us' => [
                'required' => 'Debe ingresar Usuario',
                'is_unique' => 'El campo usuario debe ser único'
            ],
            'perfil_us' => [
                'required' => 'Debe Seleccionar una opcion',
                
            ],
            'passw' => [
                'required' => 'Debe ingresar Contraseña',     
                'min_length' => 'La clave debe tener como minimo 8 carácteres',  
                'validatePass' => 'La clave debe contener 1 May, 1 Min , 1 Núm y 1 Caract. especial',  
            ]
        ];
        
        $input = $this->getRequestInput($this->request);

        if (!$this->validateRequest( $input['data'], $rules, $errors)) {
            $error = [
                'error' => 'valida',
                'datos' => $this->validator->getErrors()
            ];
            return ($this->getResponse($error,ResponseInterface::HTTP_OK));
            // return $this->getResponse(
            //         $this->validator->getErrors(),
            //         ResponseInterface::HTTP_OK
            //     );
        }

        $model = new Muser();
        $modelPerfil = new Mperfil();
        $result = $model->saveUser($input['data']);
        $id=$model->lastid();
        $datos = array(
            'pass_cl' => hashPass($input['data']['passw']),
            'id_us' =>$id,
        );
       
        $model->savePass($datos);
        $perfil = $modelPerfil -> getPerfilById($input['data']['perfil_us']);
        log_acciones(
            'El usuario '.$input['username'].' ah creado el usuario: '.$input['data']['usuario_us'].' y se le asignó el perfil : '.$perfil->perfil
            ,$input['terminal'],$input['ip'],$input['id'],$id,$input['username']);

        return $this->getResponse(
            [
                'user' =>  $result
            ]
        );
      
        
    }
    public function updateUser($id)
    {
        
        // $rules = [
        //     'docident_us' => 'required|min_length[8]|max_length[8]',
        //     'nombres_us' => 'required|min_length[2]|max_length[50]',
        //     'apepat_us' => 'required|min_length[2]|max_length[50]',
        //     'apemat_us' => 'required|min_length[2]|max_length[50]',
        //     'email_us' => 'min_length[2]|max_length[50]|valid_email',
        //     'usuario_us' => 'required|min_length[5]|max_length[50]',
        //     // 'passw' => 'required|min_length[8]|validatePass[passw]',
        //     'perfil_us' => 'required',
        //     'estado_us' => 'required',
        // ];
        // $errors = [
        //     'docident_us' => [
        //         'required' => 'Debe ingresar DNI',
                
        //     ],
        //     'nombres_us' => [
        //         'required' => 'Debe ingresar Nombres',
              
        //     ],
        //     'apemat_us' => [
        //         'required' => 'Debe ingresar Apellido Paterno',
              
        //     ],
        //     'apepat_us' => [
        //         'required' => 'Debe ingresar Apellido Paterno',
              
        //     ],
        //     'email_us' => [
        //         'required' => 'Debe ingresar Correo',
                
        //     ],
        //     'usuario_us' => [
        //         'required' => 'Debe ingresar Usuario',
                
        //     ],
        //     'perfil_us' => [
        //         'required' => 'Debe Seleccionar una opcion',
                
        //     ],
        //     'estado_us' => [
        //         'required' => 'Debe Seleccionar una opcion',
                
        //     ],
        //     // 'passw' => [
        //     //     'required' => 'Debe ingresar Contraseña',     
        //     //     'min_length' => 'La clave debe tener como minimo 8 carácteres',  
        //     //     'validatePass' => 'La clave debe contener 1 May, 1 Min , 1 Núm y 1 Caract. especial',  
        //     // ]
        // ];
        
        $input = $this->getRequestInput($this->request);

        // if (!$this->validateRequest($input, $rules)) {
        //     $error = [
        //         'error' => 'valida',
        //         'datos' => $this->validator->getErrors()
        //     ];
        //     return ($this->getResponse($error,ResponseInterface::HTTP_OK));
        // }

        $model = new Muser();
        $modelPerfil = new Mperfil();

        $perfilBefore = $modelPerfil -> getUserbyIdPerfil($id);

        $result = $model->updateUser($input['data'],$id);

        $perfilAfter = $modelPerfil -> getPerfilById($input['data']['perfil_us']);
        $texto = '';
        if($perfilBefore-> perfil != $perfilAfter-> perfil) $texto = ", Se modifico el perfil ".$perfilBefore -> perfil . " por ".$perfilAfter  -> perfil;
        log_acciones(
            'El usuario '.$input['username'].' ah modificado los datos del usuario: '.$input['data']['usuario_us'].$texto
            ,$input['terminal'],$input['ip'],$input['id'],$id,$input['username']);

        return $this->getResponse(
            [
                'user' =>  $result
            ]
        );
      
        
    }
    public function addConfigPass()
    {
        $rules = [
            'duracion' => 'required|is_natural',
            'sesion' => 'required|is_natural',
            'inactividad' => 'required|is_natural',
            'intentos' => 'required|is_natural',
            'tama_min' => 'required|is_natural',
            'tama_max' => 'required|is_natural',
                       
        ];
        $errors = [
            'duracion' => [
                'required' => 'Debe ingresar valor',
               
            ],
            'sesion' => [
                'required' =>'Debe ingresar valor',
              
            ],
            'inactividad' => [
                'required' =>'Debe ingresar valor',
              
            ],
            
            'intentos' => [
                'required' => 'Debe ingresar valor',
             
            ],
            'tama_min' => [
                'required' => 'Debe ingresar valor',
             
            ],
            'tama_max' => [
                'required' => 'Debe ingresar valor',
             
            ],
        
            
        ];
        
        $input = $this->getRequestInput($this->request);

        if (!$this->validateRequest($input, $rules, $errors)) {
            $error = [
                'error' => 'valida',
                'datos' => $this->validator->getErrors()
            ];
            return ($this->getResponse($error,ResponseInterface::HTTP_OK));
          
        }

        $model = new MconfigPass();
        $result = $model->updateConfigPass($input);
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function getConfigPass(){

        try {
            $model = new MconfigPass();
                $response = [
                    'data' =>  $model->getConfigPass()
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }

           
    }
    public function updateEstadoUser(){
        $input = $this->getRequestInput($this->request);

    
        $model = new Muser();
        $result = $model->updateEstadoUser($input['data']);

        $estado = "Desabilitado";

        if($input['data']['estado_us'] == 1){
            $estado = "Habilitado";
        } 
       $user =  $model->getUserUpdate($input['data']['id_us']);
        log_acciones(
            'El usuario '.$input['username'].' a '.$estado.' al usuario: '.$user->usuario_us
            ,$input['terminal'],$input['ip'],$input['id'],$input['data']['id_us'],$input['username']);
            
        return $this->getResponse(
            [
                'user' =>  $result
            ]
        );
    }
    public function deleteUser($id){
        // $model = new Muser();

        // $input = $this->getRequestInput($this->request);

        // $user =  $model->getUserbyId($id);

        // $result = $model->deleteUser($id);
       
        // log_acciones(
        //     'El usuario '.$input['username'].' ah eliminado al usuario : '.$user->usuario_us
        //     ,$input['terminal'],$input['ip'],$input['id'],$id,$input['username']);

        // return $this->getResponse(
        //     [
        //         'user' =>  $result
        //     ]
        // );

        $input = $this->getRequestInput($this->request);
        $model = new Muser();
        $found = $model->find($id);
        $user =  $model->getUserbyId($id);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    $result = $model->delete($id);
                    if($result){
                        $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['username'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($id,$data);
                        log_acciones(
                            'El usuario '.$input['username'].' ah eliminado al usuario : '.$user->usuario_us
                            ,$input['terminal'],$input['ip'],$input['id'],$id,$input['username']);

                        return $this->getResponse(
                            [
                                'error' => false,
                                'msg' =>  'Eliminado Correctamente'
                            ]
                        );
                    }
                   
                } catch (Exception $ex) {
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'El Usuario esta asignado y no se pudo eliminar'
                        ]
                    );
                }
              
            }else{
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'No existen registros'
                    ]
                );
            }
            $this->db->transCommit();
            
        } catch (Exception $ex) {
            $data['is_deleted'] = 0;
            $data['date_deleted'] = null;
            $data['id_user_deleted'] = null;
            $model->update($id,$data);
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' => 'El Usuario está asignado, no es posible eliminarlo',
                ]
            );
        }


    }
    public function getPerfiles(){

        try {
            $model = new Mperfil();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getPerfiles($input)
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }

           
    }
    public function validarPerfil(){
        try {
            $model = new Mperfil();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'msg' =>  $model->validaPerfil($input['perfil']),
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }
    }
    public function addPerfil()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mperfil();
        $result = $model->savePerfil($input['data']);
        $modulos = $model->getAllModulos();
        $opciones = $model->getAllOpciones();
        $items = $model->getAllItems();
        $idperfil = $model->lastIdPerfil();

        //creo todas las opciones de modulos

        foreach ($modulos as $key => $value) {
            $data = [
                'id_perfil' =>  $idperfil,
                'tabla' =>  'tb_modulo',
                'id' =>  $value['id_mod'],
            ];
            $model->saveDetPerfil($data);
        }
         //creo todas las opciones de submodulos
         foreach ($opciones as $key => $value2) {
            $data = [
                'id_perfil' =>  $idperfil,
                'tabla' =>  'tb_opcion',
                'id' =>  $value2['id_op'],
            ];
            $model->saveDetPerfil($data);
        }
          //creo todas las opciones de opciones
          foreach ($items as $key => $value3) {
            $data = [
                'id_perfil' =>  $idperfil,
                'tabla' =>  'tb_item',
                'id' =>  $value3['id_item'],
            ];
            $model->saveDetPerfil($data);
        }

        log_acciones(
            'El usuario '.$input['username'].' ah creado el perfil : '.$input['data']['perfil']
            ,$input['terminal'],$input['ip'],$input['id'],0,$input['username']);

        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updatePerfil()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mperfil();
        $result = $model->updatePerfil($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deletePerfil()
    {

      try {
        $model = new Mperfil();
        $input = $this->getRequestInput($this->request);
        $result = $model->deletePerfil($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      } catch (Exception $ex) {
        return $this->getResponse(
            [
                'error' => 'El perfil está asignado a usuario, no es posible eliminarlo',
            ]
        );
      }
        
      
      
        
    }
    public function getDetPerfil(){

        try {
            $model = new Mperfil();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getDetPerfil($input)
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }

           
    }
    public function getModulos(){

        try {
            $model = new Mperfil();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getModulo($input)
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }

           
    }
    public function getOpcion(){

        try {
            $model = new Mperfil();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getOpcion($input)
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }

           
    }
    public function getItem(){

        try {
            $model = new Mperfil();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getItem($input)
                ];
                return $this->respond($response, ResponseInterface::HTTP_OK);
        
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }

           
    }
    public function updateView()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mperfil();

       

        $detalle = $model->getDetPerById($input['data']['id_op']);

        $opcion = $model->getPerfilOpcion($detalle-> tabla,$detalle->id);

        $result = $model->updateDetPer($input['data'],'view_det');
        $estado = 'Desactivo';
        if($input['data']['estado']==1){$estado = 'Activo';}
        //acion para guardar el log dle detealle perfil, opcion X agregada a perfil X
        log_acciones(
            'El usuario '.$input['username'].' '.$estado.' al perfil:'.$detalle->perfil.' : Ver en opcion '.$opcion->opcion
            ,$input['terminal'],$input['ip'],$input['id'],0,$input['username']);
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updateCreate()
    {
   
    try {
        $input = $this->getRequestInput($this->request);

      
        $model = new Mperfil();
       
        $detalle = $model->getDetPerById($input['data']['id_op']);

        $opcion = $model->getPerfilOpcion($detalle-> tabla,$detalle->id);

        $result = $model->updateDetPer($input['data'],'create_det');
        $estado = 'Desactivo';
        if($input['data']['estado']==1){$estado = 'Activo';}
        //acion para guardar el log dle detealle perfil, opcion X agregada a perfil X
        log_acciones(
            'El usuario '.$input['username'].' '.$estado.' al perfil:'.$detalle->perfil.' : Crear en opcion '.$opcion->opcion
            ,$input['terminal'],$input['ip'],$input['id'],0,$input['username']);
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
    } catch (Exception $ex) {
        return $this->getResponse(
            [
                'error' => $ex->getMessage(),
            ]
        );
    }
       
      
        
    }
    public function updateUpdate()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mperfil();
       
    
        $detalle = $model->getDetPerById($input['data']['id_op']);

        $opcion = $model->getPerfilOpcion($detalle-> tabla,$detalle->id);

        $result = $model->updateDetPer($input['data'],'update_det');
        $estado = 'Desactivo';
        if($input['data']['estado']==1){$estado = 'Activo';}
        //acion para guardar el log dle detealle perfil, opcion X agregada a perfil X
        log_acciones(
            'El usuario '.$input['username'].' '.$estado.' al perfil:'.$detalle->perfil.' : Editar en opcion '.$opcion->opcion
            ,$input['terminal'],$input['ip'],$input['id'],0,$input['username']);
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updateDelete()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mperfil();
       
    
        $detalle = $model->getDetPerById($input['data']['id_op']);

        $opcion = $model->getPerfilOpcion($detalle-> tabla,$detalle->id);

        $result = $model->updateDetPer($input['data'],'delete_det');
        $estado = 'Desactivo';
        if($input['data']['estado']==1){$estado = 'Activo';}
        //acion para guardar el log dle detealle perfil, opcion X agregada a perfil X
        log_acciones(
            'El usuario '.$input['username'].' '.$estado.' al perfil:'.$detalle->perfil.' : Eliminar en  opcion '.$opcion->opcion
            ,$input['terminal'],$input['ip'],$input['id'],0,$input['username']);
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
      
        
    }
    public function dataUser()
    {
   
        $model = new Muser();
            
            
                return $this->getResponse(
                    [
                        'campos' =>  $model->getCamposUser(),
                        'datos' =>  $model->getDatosUser(),
                    ]
                );
            
            
                
    }



}
