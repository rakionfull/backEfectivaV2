<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Muser;
use App\Models\Mperfil;
use App\Models\Msesiones;
use App\Models\Mempresa;
use App\Models\MconfigPass;
use App\Models\Mcaptcha;
use CodeIgniter\HTTP\Response;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;
use App\Libraries\Capcha;
use Exception;
use ReflectionException;

class Login extends BaseController
{
    use ResponseTrait;
 
    public function index()
    {
        //        return $this->getResponse(
        //     ['hola'], ResponseInterface::HTTP_OK
        //     // ResponseInterface::HTTP_BAD_REQUEST
        // );
        $rules = [
            'username' => 'required|min_length[3]|max_length[50]',
            'password' => 'required|min_length[6]|max_length[255]|validateUser[username, password]'
        ];

        $errors = [
            // 'username' => [
            //     'validateUser' => 'Usuario Incorrecto'
            // ],
           
            'password' => [
                'min_length' => 'La contraseña debe ser mayor a 6 caracteres',
                'validateUser' => 'Credenciales incorrectas',
                
            ]
        ];

                
                    $input = $this->getRequestInput($this->request);
                
                    $modelsUser = new Muser();
                
                    $intento =  $modelsUser -> getIntento($input['username']);
                    
                
                    $time_actual = time();
                
                   

                   
                        if($intento -> bloqueo_us != 1){
                            if (!$this->validateRequest($input, $rules, $errors)) {
                            
                    
                                $intento =  $modelsUser -> getIntento($input['username']);
                                $dato = $intento->intentos_us;
                                if($intento->intentos_us == 4) $dato = 0;
                                $modelsUser -> setIntento($input['username'],$dato);
                        
                                $modelConfigPass = new MconfigPass();
                    
                                $configuracion = $modelConfigPass -> getConfigPass();
                    
                                if($intento->intentos_us  >= $configuracion[0]['intentos']){
                                    //si llega al maximo de intentos mandar error y actualizar tb_user con el tiempo para desabilitar
                                    // $modelsUser -> setTimeIntento($input['username']);
                                    $modelsUser -> setTimeIntento($input['username']);
                                    // $error = new  \stdClass;
                                    // $error->password = 'Se ha intentato '.$configuracion[0]['intentos'].' veces, el usuario se dabilitará por 
                                    // 2 min';
                                    $error = ['password' => 'Se ha intentado '.$configuracion[0]['intentos'].' veces, el usuario se deshabilitará por 
                                    2 min'];
                                    $error = ['password' => 'Se ha intentado '.$configuracion[0]['intentos'].' veces, el usuario se deshabilitará. Por favor contactar con su administrador
                                    del sistema'];
                                }else{
                                    $error = $this->validator->getErrors();
                                }
                            
                    
                                    return $this->getResponse(
                                        $error, ResponseInterface::HTTP_OK
                                        // ResponseInterface::HTTP_BAD_REQUEST
                                    );
                                
                            }
                            
                        return $this->getJWTForUser($input["username"],$input["ip"],$input["terminal"]);
                        }else{
                            // $error = new  \stdClass;
                            $modelsUser -> setIntento($input['username'],0);
                        
                            // $error->password = 'El usuario esta dabilitado por 2 min';
                            $error = ['password' => 'El usuario esta Bloqueado, Contactar con su administrador de sistema'];
                            return $this->getResponse(
                                $error, ResponseInterface::HTTP_OK
                                // ResponseInterface::HTTP_BAD_REQUEST
                            );
                        }
                    
                
                
                        
        

        
        
        
    
       

    }
 
    
   
    public function change_pass(){
        // $rules = [
        //     'passw' => 'required|min_length[8]|validatePass[passw]',
        //     'repassw' => 'required|min_length[8]|validatePass[repassw]'
        // ];

        // $errors = [
        //     // 'username' => [
        //     //     'validateUser' => 'Usuario Incorrecto'
        //     // ],
        //     'passw' => [
        //         'required' => 'Debe ingresar Contraseña',     
        //         'min_length' => 'La clave debe tener como minimo 8 carácteres',  
        //         'validatePass' => 'La clave debe contener 1 May, 1 Min , 1 Núm y 1 Caract. especial',  
        
        //     ],
        //     'repassw' => [
        //         'required' => 'Debe confirmar Contraseña',     
        //         'min_length' => 'La clave debe tener como minimo 8 carácteres',  
        //         'validatePass' => 'La clave debe contener 1 May, 1 Min , 1 Núm y 1 Caract. especial',  
        
        //     ]
        // ];

        $input = $this->getRequestInput($this->request);
        // if (!$this->validateRequest($input, $rules, $errors)) {

        //     $error = [
        //         'error' => 'valida',
        //         'datos' => $this->validator->getErrors()
        //     ];
        //     return ($this->getResponse($error,ResponseInterface::HTTP_OK));
          
        // }
        // creo un helper de validacion de claves
      
        $resultado =  validacionPassword($input);
        if($resultado == 1){
            
                //guardo la nueva clave
            $userModel = new Muser();
            if(isset($input['id_us'])){
                $existe_pass = veriPass($input['passw'],$input['id_us']);
                if(!$existe_pass){
                    $datos = array(
                        'pass_cl' =>password_hash($input['passw'], PASSWORD_DEFAULT),
                        'id_us' =>$input['id_us'],
                    );
                    $userModel->savePass($datos);
                    $result=$userModel->changePass($input['id_us']);
                    log_acciones('change_pass2',$input['terminal'],$input['ip'],$input['id'],$input['id_us'],$input['username']);
                    $response = [
                        'dato' => $result,
                    ];
                }else{
                    $response = [
                        'error' => 'Ya ha utilizado esta contraseña, debe elegir otra',
                        // 'error' =>  'esto .'.$existe_pass,
                    ];
                }
            }else{
                $existe_pass = veriPass($input['passw'],$input['id']);
                if(!$existe_pass){
                    $datos = array(
                        'pass_cl' => hashPass($input['passw']),
                        'id_us' =>$input['id'],
                    );
                    $userModel->savePass($datos);
                    $result=$userModel->changePass($input['id']);
                    log_acciones('change_pass',$input['terminal'],$input['ip'],$input['id'],0,$input['username']);
                    $response = [
                        'dato' => $result,
                    ];
                }else{
                    $response = [
                        'error' => 'Ya ha utilizado esta contraseña, debe elegir otra',
                        // 'error' =>  'esto .'.$existe_pass,
                    ];
                }
            }
           

           
        }else{
            $response = [
                'error' => $resultado,
                
            ];
        }
          
       
        // }else{
            
        //}
        
       
        return $this->respond($response, ResponseInterface::HTTP_OK);
    }
    private function getJWTForUser(string $username,string $ip,string $terminal ,int $responseCode = ResponseInterface::HTTP_OK) 
    {
        //validamos si existe otra sesion activa en otro ordenador
        try {
            $model = new Muser();
            $modelPerfil = new Mperfil();
            

            $user = $model->getUserByDatos($username);
            if($user){
                unset($user->pass_cl);
                $iat = time();
                $modelSesion = new Msesiones();
                
                $sesion = $modelSesion->getByIdSesion($user->id_us,$iat);
                $modelConfig = new MconfigPass();
                $configuracion = $modelConfig ->getConfigPass();
                $model -> setIntento($username,0);
            
                if($sesion){
                    $error = ['password' => 'Hay otra sesión activa'];
                    return $this->getResponse(
                        $error, ResponseInterface::HTTP_OK
                        // ResponseInterface::HTTP_BAD_REQUEST
                    );
                    
                }else{
                    $recordatorio =  false;
                    $fecha_actual = date('Y-m-d');
                    $fecha_creacion = $user->creacion_cl;
                    //sumo 10 dias ejem día
                    $fecha_exp =  date("Y-m-d",strtotime($fecha_creacion."+ ".$configuracion[0]['duracion']." days")); 
                    $fecha_recordatorio= date("Y-m-d",strtotime($fecha_exp."- ".$configuracion[0]['recordatorio']." days")); 
                   
                    $msg=1;
                    $mensaje = '';
                    
                   
                    helper('jwt');
                    //cambiar aqui
                    $token = [];
                    $permisos = [];
                    $escenario=$model->getEscenario();
                    if($user->change_pass == 0){
                        $token = getSignedJWTForUser($username);
                        $msg=0;
                        $mensaje = 'Cambio de contraseña 1er logueo obligatorio';
                      
                    }else{
                        $token = getSignedJWTForUser($username);
                       
                        if($fecha_actual >= $fecha_exp){
                            $msg = 0;
                            $mensaje = 'Contraseña expirada, se redireccionará para cambio';
                        }else{
                                $modelSesion->saveSesion($token, $user->id_us);
                                $permisos=$modelPerfil->getPermisos($user->perfil_us);
                                if($fecha_actual >= $fecha_recordatorio){
                                    if($fecha_exp  > $fecha_recordatorio){
                                   
                                        $mensaje = 'Recordatorio: Su contraseña está a punto expirar';
                                    }
                                }
                        }
                       
                       

                        // $escenario=$model->getEscenario();
                        
                       
                        log_acciones('login',$terminal,$ip,$user->id_us,0,$username);
                    }
                    return $this->getResponse(
                            [
                                'password' => false,
                                // 'recordatorio' => $recordatorio,
                                'msg' => $mensaje,
                                'change' => $msg,
                                'user' => $user->usuario_us,
                                'perfil' => $user->perfil,
                                'id' => $user->id_us,
                                'escenario' => $escenario,
                                'sesion' => $configuracion[0]['sesion'],
                                'tiempo' => $configuracion[0]['inactividad'],
                                'permisos' => $permisos,
                                'access_token' => $token,
                                'is_user_negocio' => $user->negocio,
                                'idempresa' => $user->idempresa,
                                'idposicion' => $user->idposicion,
                                'idarea' => $user->idarea,
                                'idunidad' => $user->idunidad
                            ]
                    );
                   
                }
            }else{
                $error = ['password' => 'El usuario se encuentra no registrado o inactivo'];
                return $this->getResponse(
                    $error, ResponseInterface::HTTP_OK
                    // ResponseInterface::HTTP_BAD_REQUEST
                );
            }
          
           
        } catch (Exception $ex) {
            return $this->getResponse(
                    [
                        'error'  => 'No se pudo iniciar sesión, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                        'error2' => $ex->getMessage(),
                    ],
                    $responseCode
                );
        }
    }
    public function logout($id_us){
        $modelSesion = new Msesiones();
        $input = $this->getRequestInput($this->request);
        log_acciones('logout',$input['terminal'],$input['ip'],$id_us,0,$input['username']);
        $result=$modelSesion->updateLoged($id_us);
        
        $response = [
            'dato' => $result,
        ];

        return $this->respond($response, ResponseInterface::HTTP_OK);
    
    }
}

