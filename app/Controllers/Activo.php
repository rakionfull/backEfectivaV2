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
use App\Models\Mproceso;
use App\Models\MPosicion;
use App\Models\MValoracionActivo;
use App\Models\MCatActivo;
use App\Models\MPais;
use App\Models\MUbicActivo;
use App\Models\Mestado;
use App\Models\Mprioridad;
use App\Models\Malerta_seguimiento;
use App\Models\EvaluacionRiesgosControles;



use App\Models\MriesgoPlanAccion;
use App\Models\InventarioClasificacionActivo;
use CodeIgniter\HTTP\Response;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;
use App\Libraries\Capcha;

use Exception;
use ReflectionException;

class Activo extends BaseController
{
    use ResponseTrait;


    //activos para nuevo controlador
    public function getEmpresas(){

        try {
            $model = new Mempresa();
                $response = [
                    'data' =>  $model->getEmpresas()
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
    public function getEmpresasByActivo(){

        try {
            $model = new Mempresa();
                $response = [
                    'data' =>  $model->getEmpresasByActivo()
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
    public function addEmpresa()
    {
        try {
                $input = $this->getRequestInput($this->request);

                
                $model = new Mempresa();
             
                 $valida = $model -> validaEmpresa($input[0]);
                if(!$valida){
                    $result = $model->saveEmpresa($input);
                    $msg = 'Registrado Correctamente';
                    $error = 1;
                }else{
                    $msg = 'Empresa ya registrada';
                    $error = 0;
                }
                

            return $this->getResponse(
                [
                    'msg' => $msg,
                'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo Agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
      
      
        
    }
    public function updateEmpresa()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new Mempresa();
            $areaModel = new Marea();
            $macroprocesoModel = new Mmacroprocesos();
            $posicionpuestoModel = new MPosicion();
            $procesoModel = new Mproceso();
            $unidadesModel = new Munidades();
            $found = $model->validateEmpresaModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Empresa ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $model->updateEmpresa($input);
            $areas = $areaModel->where('idempresa',$input[0]['id'])->findAll();
            $macroprocesos = $macroprocesoModel->where('idempresa',$input[0]['id'])->findAll();
            $posiciones = $posicionpuestoModel->where('idempresa',$input[0]['id'])->findAll();
            $procesos = $procesoModel->where('idempresa',$input[0]['id'])->findAll();
            $unidades = $unidadesModel->where('idempresa',$input[0]['id'])->findAll();
            if(count($areas) > 0){
                foreach ($areas as $area) {
                    $areaModel->update($area['id'],[
                        'estado' => $input[0]['estado']
                    ]);
                }
            }
            if(count($macroprocesos) > 0){
                foreach ($macroprocesos as $macroproceso) {
                    $macroprocesoModel->update($macroproceso['id'],[
                        'estado' => $input[0]['estado']
                    ]);
                }
            }
            if(count($posiciones) > 0){
                foreach ($posiciones as $posicion) {
                    $posicionpuestoModel->update($posicion['id'],[
                        'estado' => $input[0]['estado']
                    ]);
                }
            }
            if(count($procesos) > 0){
                foreach ($procesos as $proceso) {
                    $procesoModel->update($proceso['id'],[
                        'estado' => $input[0]['estado']
                    ]);
                }
            }
            if(count($unidades) > 0){
                foreach ($unidades as $unidad) {
                    $unidadesModel->update($unidad['id'],[
                        'estado' => $input[0]['estado']
                    ]);
                }
            }
            return $this->getResponse(
                [
                    'error' => false,
                    'msg' =>  'Empresa modificada correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
       
      
        
    }
    public function deleteEmpresa()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Mempresa();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                   // $result = $model->delete($input[0]['id']);
                   $result = $model->deleteEmpresa('empresa',$input[0]['id']);
                    if($result){
                        // $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
                        // return $this->getResponse(
                        //     [
                        //         'error' => $input[0]['id'],
                        //         'msg' =>  'Eliminado Correctamente'
                        //     ]
                        // );
                    }
                   
                } catch (Exception $ex) {
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }
    public function getArea($dato){

        try {
            $model = new Marea();
                $response = [
                    'data' =>  $model->getArea($dato)
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
    public function getAreasByActivo(){

        try {
            $model = new Marea();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getAreasByActivo($input['idempresa'])
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
    public function addArea()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new Marea();
        
            $valida = $model -> validaArea($input[0]);
            if(!$valida){
                $result = $model->saveArea($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Arera ya registrada';
                $error = 0;
            }
            
        
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
       
      
        
    }
    public function updateArea()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new Marea();
            $macroprocesoModel = new Mmacroprocesos();
            $posicionpuestoModel = new MPosicion();
            $procesoModel = new Mproceso();
            $unidadesModel = new Munidades();
            $found = $model->validateAreaModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Área ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }

            $model->updateArea($input);
        
            $macroprocesos = $macroprocesoModel->where('idarea',$input[0]['id'])->findAll();
            $posiciones = $posicionpuestoModel->where('idarea',$input[0]['id'])->findAll();
            $procesos = $procesoModel->where('idarea',$input[0]['id'])->findAll();
            $unidades = $unidadesModel->where('idarea',$input[0]['id'])->findAll();
            if(count($macroprocesos) > 0){
                foreach ($macroprocesos as $macroproceso) {
                    $macroprocesoModel->update($macroproceso['id'],[
                        'estado' => $input[0]['estado']
                    ]);
                }
            }
            if(count($posiciones) > 0){
                foreach ($posiciones as $posicion) {
                    $posicionpuestoModel->update($posicion['id'],[
                        'estado' => $input[0]['estado']
                    ]);
                }
            }
            if(count($procesos) > 0){
                foreach ($procesos as $proceso) {
                    $procesoModel->update($proceso['id'],[
                        'estado' => $input[0]['estado']
                    ]);
                }
            }
            if(count($unidades) > 0){
                foreach ($unidades as $unidad) {
                    $unidadesModel->update($unidad['id'],[
                        'estado' => $input[0]['estado']
                    ]);
                }
            }

            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente',
                    // 'error' =>  
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => $ex->getMessage(),
                    //'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
      
        
    }
    public function deleteArea()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Marea();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    //$result = $model->delete($input[0]['id']);
                    $result = $model->deleteArea('area',$input[0]['id']);
                    if($result){
                        // $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
                        // return $this->getResponse(
                        //     [
                        //         'error' => false,
                        //         'msg' =>  'Eliminado Correctamente'
                        //     ]
                        // );
                    }
                   
                } catch (Exception $ex) {
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }
    public function getAreasEmpresa(){

        try {
            $model = new Marea();
                $response = [
                    'data' =>  $model->getAreasEmpresa()
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
    public function addAreaEmpresa()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
        $model = new Marea();
        $result = $model->saveAreaEmpresa($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
       
      
        
    }
    public function updateAreaEmpresa()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
        $model = new Marea();
        $result = $model->updateAreaEmpresa($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
       
      
        
    }
   
      
      public function getValorActivo(){

        try {
            $model = new Mvaloractivo();
                $response = [
                    'data' =>  $model->getValorActivo()
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
    public function validarValorActivo(){
        try {
            $model = new Mvaloractivo();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'msg' =>  $model->validaValorActivo($input['valor']),
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
    public function getValorActivoByActivo(){

        try {
            $model = new Mvaloractivo();
                $response = [
                    'data' =>  $model->getValorActivoByActivo()
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
    public function addValorActivo()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
          
            $model = new Mvaloractivo();
            $valida = $model->validarValActivo($input);
    
            if(!$valida){
                $result = $model->saveValorActivo($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Valor de Activo ya registrada';
                $error = 0;
            }
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                     'error' => $ex->getMessage(),
                    //'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
      
        
    }
    public function updateValorActivo()
    {
   
        try {
            
            $input = $this->getRequestInput($this->request);

      
            $model = new Mvaloractivo();
            $found = $model->validateValorActivoModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Valor de activo ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
             }
            $result = $model->updateValorActivo($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
      
      
        
    }
    public function deleteValorActivo()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Mvaloractivo();
        $found = $model->find($input[0]['id']);
        try{
            if($found){
                try {
                    $result = $model->delete($input[0]['id']);
                    if($result){
                        $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
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
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
                        ]
                    );
                }
                // if($model->delete($input['id'])){
                //     $this->db->transRollback();
                //     $data['is_deleted'] = 1;
                //     $model->update($input['id'],$data);
                //     return $this->getResponse(
                //         [
                //             'error' => false,
                //             'msg' =>  'Valor Activo eliminado Correctamente'
                //         ]
                //     );
                // }else{
                //     $data['is_deleted'] = 0;
                //     $data['date_deleted'] = null;
                //     $data['id_user_deleted'] = null;
                //     $model->update($input['id'],$data);
                //     return $this->getResponse(
                //         [
                //             'error' => true,
                //             'msg' =>  'No se pudo eliminar'
                //         ]
                //     );
                // }
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
            $model->update($input['id'],$data);
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }
    public function getTipoActivo(){

        try {
            $model = new Mtipoactivo();
                $response = [
                    'data' =>  $model->getTipoActivo()
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
    public function getTipoActivoByActivo(){

        try {
            $model = new Mtipoactivo();
                $response = [
                    'data' =>  $model->getTipoActivoByActivo()
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
    public function addTipoActivo()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new Mtipoactivo();
            // $result = $model->saveTipoActivo($input);
        
            // return $this->getResponse(
            //     [
            //         'msg' =>  $result
            //     ]
            // );
            $valida = $model -> validarTipoActivo($input);
            if(!$valida){
                $result = $model->saveTipoActivo($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Tipo de Activo ya registrada';
                $error = 0;
            }
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
       
      
        
    }
    public function validarTipoActivo(){
        try {
            $model = new Mtipoactivo();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'msg' =>  $model->validarTipoActivo($input['tipo']),
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
    public function updateTipoActivo()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new Mtipoactivo();
            $categoriaActivoModel = new MCatActivo();
            $found = $model->validateTipoActivoModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Tipo de activo ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
             }
            $result = $model->updateTipoActivo($input);
            $categorias = $categoriaActivoModel->where('idtipo',$input[0]['id'])->findAll();
            if($categorias != null){
                foreach ($categorias as $item) {
                    $categoriaActivoModel->update($item['id'],['estado' => $input[0]['estado']]);
                }
            }
            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente'
                ]
            );
            
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
      
        
    }

    public function deleteTipoActivo()
    {
   
        $input = $this->getRequestInput($this->request);
        $model = new Mtipoactivo();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input[0]['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input[0]['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Eliminado Correctamente'
                        ]
                    );
                }else{
                    $data['is_deleted'] = 0;
                    $data['date_deleted'] = null;
                    $data['id_user_deleted'] = null;
                    $model->update($input[0]['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
    }
    //clasificaicon de informacion
    public function getClasInformacion(){

        try {
            $model = new MclasInformacion();
                $response = [
                    'data' =>  $model->getClasInformacion()
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
    public function validarClasInfo(){
        try {
            $model = new MclasInformacion();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'msg' =>  $model->validarClasInfo($input['clasificacion']),
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
    public function addClasInformacion()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
          
            $model = new MclasInformacion();
        
            $valida = $model -> validarClasInfo($input[0]['clasificacion']);
            if(!$valida){
                $result = $model->saveClasInformacion($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Clasificaicon de información ya registrada';
                $error = 0;
            }
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                     'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    //'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
       
      
        
    }
    public function updateClasInformacion()
    {
   
        try{
        $input = $this->getRequestInput($this->request);

      
        $model = new MclasInformacion();
        $found = $model->validateClasInformacionModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>'Clasificación de información ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
        }
        $result = $model->updateClasInformacion($input);
    
        return $this->getResponse(
            [
                'msg' =>  'Modificado Correctamente'
            ]
        );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
    }
    public function deleteClasInfo()
    {

        $input = $this->getRequestInput($this->request);
        $model = new MclasInformacion();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input[0]['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input[0]['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Eliminado Correctamente'
                        ]
                    );
                }else{
                    $data['is_deleted'] = 0;
                    $data['date_deleted'] = null;
                    $data['id_user_deleted'] = null;
                    $model->update($input[0]['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
        
    }
    //aspecto de seguridad
    public function getAspectoSeg(){

        try {
            $model = new MaspectoSeg();
                $response = [
                    'data' =>  $model->getAspectoSeg()
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
    public function getAspectoByActivo(){

        try {
            $model = new MaspectoSeg();
                $response = [
                    'data' =>  $model->getAspectoByActivo()
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
    public function validarApectoSeg(){
        try {
            $model = new MaspectoSeg();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'msg' =>  $model->validaAspectoSeg($input['aspecto']),
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
    public function addAspectoSeg()
    {
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MaspectoSeg();
            $result = $model->saveAspectoSeg($input);
        
            return $this->getResponse(
                [
                    'msg' =>  true
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
    }
    public function updateAspectoSeg()
    {
        try{   
            $input = $this->getRequestInput($this->request);

        
            $model = new MaspectoSeg();
            $found = $model->validateAspectoSegModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Aspecto de seguridad ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
             }
            $result = $model->updateAspectoSeg($input);
            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
    }
    public function deleteAspectoSeg()
    {
        $input = $this->getRequestInput($this->request);
        $model = new MaspectoSeg();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input[0]['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input[0]['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Apecto de Seguridad eliminado Correctamente'
                        ]
                    );
                }else{
                    $data['is_deleted'] = 0;
                    $data['date_deleted'] = null;
                    $data['id_user_deleted'] = null;
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }
    //Unidades
    public function getUnidades($dato){

        try {
            $model = new Munidades();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getUnidades($dato)
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
    public function getUnidadByActivo(){

        try {
            $model = new Munidades();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getUnidadByActivo($input)
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
    public function addUnidades()
    {
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new Munidades();
            
        
            $valida = $model -> validaUnidad($input[0]);
            if(!$valida){
                $result = $model->saveUnidades($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Unidad ya registrada';
                $error = 0;
            }
            
        
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
        
    }
    public function updateUnidades()
    {
        try{
            $input = $this->getRequestInput($this->request);
            $model = new Munidades();
            $found = $model->validateUnidadModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Unidad ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $model->updateUnidades($input);
            
            $macroprocesoModel = new Mmacroprocesos();
            $posicionpuestoModel = new MPosicion();
            $procesoModel = new Mproceso();
            $macroprocesos = $macroprocesoModel->where('idunidades',$input[0]['id'])->findAll();
            $posiciones = $posicionpuestoModel->where('idunidades',$input[0]['id'])->findAll();
            $procesos = $procesoModel->where('idunidades',$input[0]['id'])->findAll();
            if(count($macroprocesos) > 0){
                foreach ($macroprocesos as $item) {
                    $macroprocesoModel->update($item['id'],['estado'=>$input[0]['estado']]);
                }
            }
            if(count($posiciones) > 0){
                foreach ($posiciones as $item) {
                    $posicionpuestoModel->update($item['id'],['estado'=>$input[0]['estado']]);
                }
            }
            if(count($procesos) > 0){
                foreach ($procesos as $item) {
                    $procesoModel->update($item['id'],['estado'=>$input[0]['estado']]);
                }
            }
            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
    }
    
    public function deleteUnidad()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Munidades();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();

        try{
            if($found){
                try {
                    // $result = $model->delete($input[0]['id']);
                    $result = $model->deleteUnidad('unidades',$input[0]['id']);
                    if($result){
                        // $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
                        // return $this->getResponse(
                        //     [
                        //         'error' => false,
                        //         'msg' =>  'Eliminado Correctamente'
                        //     ]
                        // );
                    }
                   
                } catch (Exception $ex) {
                    return $this->getResponse(
                        [
                            'error' => true,
                            'error' => $ex->getMessage(),
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
                        ]
                    );
                }
            }else{
                return $this->getResponse(
                    [
                        'error' => true,
                        'error' => $ex->getMessage(),
                        'msg' =>  'No existen registros'
                    ]
                );
            }
            $this->db->transCommit();

        } catch (Exception $ex) {
            $data['is_deleted'] = 0;
            $data['date_deleted'] = null;
            $data['id_user_deleted'] = null;
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }
    //macroproceso
    public function getMacroproceso($dato){

        try {
            $model = new Mmacroprocesos();
                $response = [
                    'data' =>  $model->getMacroproceso($dato)
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
    public function getMacroprocesoByActivo(){

        try {
            $model = new Mmacroprocesos();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getMacroprocesoByActivo($input)
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
    public function listaProcesoByMacro(){

        try {
            $model = new Mproceso();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getProcesoByMacro($input)
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
    public function listaCategoriaByActivo(){

        try {
            $model = new Mtipoactivo();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->listaCategoriaByActivo($input)
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
    
    public function addMacroproceso()
    {
        try{ 
            $input = $this->getRequestInput($this->request);

        
            $model = new Mmacroprocesos();
        
        
            $valida = $model -> validaMacroproceso($input[0]);
            if(!$valida){
                $result = $model->saveMacroproceso($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Macroproceso ya registrada';
                $error = 0;
            }
            
        
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
      
        
    }
    public function updateMacroproceso()
    {
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new Mmacroprocesos();
            $found = $model->validateMacroprocesoModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Macroproceso ya registrado'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $result = $model->updateMacroproceso($input);
            $procesoModel = new Mproceso();
            $procesos = $procesoModel->where('idmacroproceso',$input[0]['id'])->findAll();
            if(count($procesos) > 0){
                foreach ($procesos as $item) {
                    $procesoModel->update($item['id'],['estado'=>$input[0]['estado']]);
                }
            }
            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
        
    }
    public function deleteMacroproceso()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Mmacroprocesos();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();

        try{
            if($found){
                try {
                    //$result = $model->join('procesos',"procesos.idmacroproceso=$input[0]['id']")->where('procesos.is_deleted',1)->delete($input[0]['id']);
                    $result  = $model->deleteMacroproceso('macroproceso',$input[0]['id']);
                    // return $this->getResponse(
                    //     [
                    //         'error' => false,
                    //         'msg' =>  $result
                    //     ]
                    // );
                    if($result){
                        //$this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $valor  = $model->update($input[0]['id'],$data);
                       
                            // return $this->getResponse(
                            //     [
                            //         // 'error' => false,
                            //         'msg' =>  'Eliminado Correctamente',
                            //         'dato' => $valor
                            //     ]
                            // );
                     
                       
                    }else{
                        return $this->getResponse(
                            [
                                'error' => true,
                                'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
                            ]
                        );
                    }
                   
                } catch (Exception $ex) {
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
                        ]
                    );
                }
            }else{
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'No existe el macroproceso'
                    ]
                );
            }
            $this->db->transCommit();

        } catch (Exception $ex) {
            $data['is_deleted'] = 0;
            $data['date_deleted'] = null;
            $data['id_user_deleted'] = null;
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [
                    // 'error' => true,
                    'error' =>$ex->getMessage(),
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }

    public function getProcesoByActivo(){

        try {
            $model = new Mproceso();
                $response = [
                    'data' =>  $model->getProcesoByActivo()
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
    
    //proceso
    public function getProceso($dato){

        try {
            $model = new Mproceso();
                $response = [
                    'data' =>  $model->getProceso($dato)
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
    
    //proceos
    public function addProceso()
    {
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new Mproceso();
            $valida = $model->validaProceso($input[0]);
        
            if(!$valida){
                $result = $model->saveProceso($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Proceso ya registrada';
                $error = 0;
            }
            
        
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    //'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }        
    }
    public function updateProceso()
    {
        try{   
            $input = $this->getRequestInput($this->request);

        
            $model = new Mproceso();
            $found = $model->validateProcesoModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Proceso ya registrado'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $result = $model->updateProceso($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    //'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }  
      
        
    }
    public function deleteProceso()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Mproceso();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    $result = $model->deleteProceso('proceso',$input[0]['id']);
                   // $result = $model->delete($input[0]['id']);
                    if($result){
                        //$this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
                        // return $this->getResponse(
                        //     [
                        //         'error' => false,
                        //         'msg' =>  'Eliminado Correctamente'
                        //     ]
                        // );
                    }
                   
                } catch (Exception $ex) {
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
                        ]
                    );
                }
               
            }else{
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'No existe registros'
                    ]
                );
            }
            $this->db->transCommit();

        } catch (Exception $ex) {
            $data['is_deleted'] = 0;
            $data['date_deleted'] = null;
            $data['id_user_deleted'] = null;
            $model->update($input['id'],$data);
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }

    //posicion y puesto
    public function getPosicion($dato){

        try {
            $model = new MPosicion();
                $response = [
                    'data' =>  $model->getPosicion($dato)
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
    public function getPosicionByArea($area_id){
        try {
            
            $model = new MPosicion();
            $response = [
                'data' =>  $model->getPosicionByArea($area_id)
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
    public function getPosicionByUnidad(){
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MPosicion();

            $response = [
                'data' =>  $model->getPosicionByUnidad($input)
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
    public function getPosicionByActivo(){

        try {
            $model = new MPosicion();
            $input = $this->getRequestInput($this->request);
                $response = [
                    // 'data' =>  $model->getPosicionByActivo($input['idempresa'])
                    'data' =>  $model->getPosicionByActivo($input)
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
    public function validarPosicion(){
        try {
            $model = new MPosicion();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'msg' =>  $model->validaPosicion($input),
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
    public function addPosicion()
    {
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MPosicion();
            $valida = $model->validaPosicion($input[0]);
        
            if(!$valida){
                $result = $model->savePosicion($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Posicion ya registrada';
                $error = 0;
            }
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }  
        
    }
    public function updatePosicion()
    {
            try{ 
                $input = $this->getRequestInput($this->request);

            
                $model = new MPosicion();
                $found = $model->validatePosicionModify($input);

                if(count($found) > 0){
                    return $this->getResponse(
                        [
                            'error' =>true,
                            'msg' =>'Posición ya registrado'
                        ],
                        ResponseInterface::HTTP_OK
                    );
                }
                $result = $model->updatePosicion($input);
            
                return $this->getResponse(
                    [
                        'msg' =>  'Modificado Correctamente'
                    ]
                );
            } catch (Exception $ex) {
                return $this->getResponse(
                    [
                        // 'error' => $ex->getMessage(),
                        'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                    ],
                    ResponseInterface::HTTP_OK
                );
            }  
        
    }
    public function deletePosicion()
    {
        $input = $this->getRequestInput($this->request);
        $model = new MPosicion();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    // $result = $model->delete($input[0]['id']);
                    $result = $model->deletePosicion('posicion_puesto',$input[0]['id']);
                    if($result){
                        // $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
                        // return $this->getResponse(
                        //     [
                        //         'error' => false,
                        //         'msg' =>  'Eliminado Correctamente'
                        //     ]
                        // );
                    }
                   
                } catch (Exception $ex) {
                    return $this->getResponse(
                        [
                            'error' => true,
                            
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [
                    'error' => true,
                    
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }

    //valoracion de activo
    public function getValActivo(){

        try {
            $model = new MValoracionActivo();
                $response = [
                    'data' =>  $model->getValActivo()
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
    public function validarValActivo(){
        try {
            $model = new MValoracionActivo();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'msg' =>  $model->validarValActivo($input),
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
    public function addValActivo()
    {
           try{
                $input = $this->getRequestInput($this->request);

            
                $model = new MValoracionActivo();
                $valida = $model->validarValActivo($input[0]);
        
                if(!$valida){
                    $result = $model->saveValActivo($input);
                    $msg = 'Registrado Correctamente';
                    $error = 1;
                }else{
                    $msg = 'Valoracion ya registrada';
                    $error = 0;
                }
                return $this->getResponse(
                    [
                        'msg' =>  $msg,
                        'error' =>  $error
                    ]
                );
              
            } catch (Exception $ex) {
                return $this->getResponse(
                    [
                        //'error' => $ex->getMessage(),
                        'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                    ],
                    ResponseInterface::HTTP_OK
                );
            }  
        
    }
    public function updateValActivo()
    {
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MValoracionActivo();
            $found = $model->validateValActivoModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Valoración de activo ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
             }
            $result = $model->updateValActivo($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }  
        
    }
    public function deleteValActivo()
    {
   
        $input = $this->getRequestInput($this->request);
        $model = new MValoracionActivo();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    $result = $model->delete($input[0]['id']);
                    if($result){
                        $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
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
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
    }
    //categoria de activo
    public function getCatActivo(){

        try {
            $model = new MCatActivo();
                $response = [
                    'data' =>  $model->getCatActivo()
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
    public function validarCatActivo(){
        try {
            $model = new MCatActivo();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'msg' =>  $model->validarCatActivo($input),
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
    public function addCatActivo()
    {
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MCatActivo();
          
          
            $valida = $model -> validarCatActivo($input[0]);
            if(!$valida){
                $result = $model->saveCatActivo($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Categoria ya registrada';
                $error = 0;
            }
            

        return $this->getResponse(
            [
                'msg' =>  $msg,
                'error' =>  $error
            ]
        );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }  
        
    }
    public function updateCatActivo()
    {
        try{
            $input = $this->getRequestInput($this->request);
            $model = new MCatActivo();
            $found = $model->validateCatActivoModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Categoría de activo ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
             }
            $result = $model->updateCatActivo($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }  
        
    }
    public function deleteCatActivo()
    {
        $input = $this->getRequestInput($this->request);
        $model = new MCatActivo();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    $result = $model->delete($input[0]['id']);
                    if($result){
                        $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
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
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
    }

    //Ubicacion de activo
    public function getUbiActivo(){

        try {
            $model = new MUbicActivo();
                $response = [
                    'data' =>  $model->getUbiActivo()
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
    public function validarUbiActivo(){
        try {
            $model = new MUbicActivo();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'msg' =>  $model->validarUbiActivo($input),
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
    public function addUbiActivo()
    {
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MUbicActivo();
        
        
            $valida = $model -> validarUbiActivo($input);
            if(!$valida){
                $result = $model->saveUbiActivo($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Ubicacion de activo registrado ya registrada';
                $error = 0;
            }
            
        
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }  
        
    }
    public function updateUbiActivo()
    {
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MUbicActivo();
            $found = $model->validateUbiActivoModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Ubicacion de activo ya registrado'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $result = $model->updateUbiActivo($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Modificado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }  
        
    }
    public function deleteUbiActivo()
    {
   
        $input = $this->getRequestInput($this->request);
        $model = new MUbicActivo();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    $result = $model->delete($input[0]['id']);
                    if($result){
                        $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
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
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
        
    }
     //continente
     public function getContinente(){

        try {
            $model = new MPais();
                $response = [
                    'data' =>  $model->getContinente()
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
      //Pais
    public function getPais(){

        try {
            $model = new MPais();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getPaises($input['continente'])
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
    //Ciudad
    public function getCiudad(){

        try {
            $model = new MPais();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getCiudad($input['pais'])
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


    public function getEstado(){

        try {
            $model = new Mestado();
                $response = [
                    'data' =>  $model->getEstado()
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
    
    public function addEstado(){
        
        try {
            $input = $this->getRequestInput($this->request);
    
      
            $model = new Mestado();
        
            $valida = $model -> validaEstado($input[0]['estado']);
            if(!$valida){
                $result = $model->saveEstado($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Estado ya registrado';
                $error = 0;
            }
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
        );
        }
    }
    
    public function updateEstado(){
        
        try {
            
            $input = $this->getRequestInput($this->request);
        
            $model = new Mestado();
            $found = $model->validateEstadoModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Estado ya registrado'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $result = $model->updateEstado($input);
        
            return $this->getResponse([
                'msg' => 'Modificado correctamente',
               
            ]);
        
        } catch (Exception $ex) {
            
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
            ResponseInterface::HTTP_OK);
        }
        
    }
    
    public function deleteEstado(){
        $input = $this->getRequestInput($this->request);
        $model = new Mestado();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    $result = $model->delete($input[0]['id']);
                    if($result){
                        $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['id'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
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
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
    }
    
    public function getPrioridad(){
    
        try {
            $model = new Mprioridad();
                $response = [
                    'data' =>  $model->getPrioridad()
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
    
    public function addPrioridad(){
        
        try {
            $input = $this->getRequestInput($this->request);
    
      
            $model = new Mprioridad();
        
            $valida = $model -> validaPrioridad($input[0]['prioridad']);
            if(!$valida){
                $result = $model->savePrioridad($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Prioridad ya registrada';
                $error = 0;
            }
            return $this->getResponse(
                [
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
        );
    }
    }
    
    public function updatePrioridad(){
    
        try {
            
            $input = $this->getRequestInput($this->request);
        
            $model = new Mprioridad();
            $found = $model->validatePriodidadModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Priodidad ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $result = $model->updatePrioridad($input);
        
            return $this->getResponse([
                'msg' => 'Modificado correctamente',
             
            ]);
        
        } catch (Exception $ex) {
            
            return $this->getResponse(
                [
                    // 'error' => $ex->getMessage(),
                    'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ]
            , ResponseInterface::HTTP_OK);
        }
      
        
    }
    
    public function deletePrioridad(){
        $input = $this->getRequestInput($this->request);
        $model = new Mprioridad();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    $result = $model->delete($input[0]['id']);
                    if($result){
                        $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['id'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
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
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }

    }
    
    public function getAlerta_seguimiento(){
    
            try {
                $model = new Malerta_seguimiento();
                    $response = [
                        'data' =>  $model->getAlerta_seguimiento()
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
              
    public function addAlerta_seguimiento(){
       
            
            try {
                $input = $this->getRequestInput($this->request);
        
          
                $model = new Malerta_seguimiento();
            
                $valida = $model -> validaAlerta_seguimiento($input[0]['alerta']);
                if(!$valida){
                    $result = $model->saveAlerta_seguimiento($input);
                    $msg = 'Registrado Correctamente';
                    $error = 1;
                }else{
                    $msg = 'Alerta ya registrada';
                    $error = 0;
                }
                return $this->getResponse(
                    [
                        'msg' =>  $msg,
                        'error' =>  $error
                    ]
                );
            } catch (Exception $ex) {
                return $this->getResponse(
                    [
                        // 'error' => $ex->getMessage(),
                        'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                    ],
                    ResponseInterface::HTTP_OK
            );
        }
    }
    
    public function updateAlerta_seguimiento(){
       
        try {
            
            $input = $this->getRequestInput($this->request);
        
            $model = new Malerta_seguimiento();
            $found = $model->validateAlertaModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Alerta de Seguimiento ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $result = $model->updateAlerta_seguimiento($input);
        
            return $this->getResponse([
                'msg' => 'Modificado correctamente',
               
            ]);
        
        } catch (Exception $ex) {
            
            return $this->getResponse(
                [
                     'error' => $ex->getMessage(),
                    //'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ], ResponseInterface::HTTP_OK);
        }
          
            
    }
    
    public function deleteAlerta_seguimiento()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Malerta_seguimiento();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    $result = $model->delete($input[0]['id']);
                    if($result){
                        $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['id'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
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
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
    }  
    
    
    
   //-----------------------------RIESGO PLAN DE ACCIÓN-------------------------------------------------
    
  // modificar todas las estructuras  
    
    
    
 public function getPlanAccion(){
    
    try {
        $model = new MriesgoPlanAccion();
            $response = [
                'data' =>  $model->getPlanAccion()
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

/*
public function getActividadByPlan($id_planes) {
    try {
        $model = new MriesgoPlanAccion();
        $actividades = $model->where('id_planes', $id_planes)->findAll();
        $response = [
            'data' => $actividades
        ];
        return $this->respond($response, ResponseInterface::HTTP_OK);
    } catch (Exception $ex) {
        return $this->getResponse([
            'error' => $ex->getMessage()
        ], ResponseInterface::HTTP_OK);
    }
}
*/

public function getActividadByPlan($id_plan)
    {
        // Obtener las actividades del plan de acción con el ID proporcionado
        $model = new MriesgoPlanAccion();
        $actividades = $model->getActividadByPlan($id_plan);

        // Enviar las actividades a la vista
        return view('verDetalle', [
            'actividades' => $actividades,
        ]);
}



// public function addPlanAccion(){

//     try {
//         $input = $this->getRequestInput($this->request);

//         $model = new MriesgoPlanAccion();
//         $riesgo = new EvaluacionRiesgosControles();
//         $valida =  $model->validaPlanAccion($input[0]);
//         if(!$valida){
//             //registramos el plan de accion
//             $result = $model->savePlanAccion($input);
//             //registramos riesgo con cada control para detectarlo
//             //sacamos todos los riesgos y controles asociados con split
//             $riesgos = explode(",", $input[0]['id_riesgo']);
//             $controles = explode(",", $input[0]['id_control']);
//             //recorremos y agregamos
//             foreach ($riesgos as $key => $value) {
//                 foreach ($controles as $key => $value2) {
//                     $data = [
//                         'id_evaluacion_riesgo' => $value,
//                         'id_control' => $value2,
//                         'id_user_added' => $input['user'],
                       
//                     ];
//                     $riesgo->store($data);
//                 }
                
//             }
//             $msg = 'Plan Registrado Correctamente';
//             $error = 1;
//         }else{
//             $result = 0;
//             $msg = 'Plan ya registrado';
//             $error = 0;
//         }
       

//         return $this->getResponse(
//             [
//                 'id' => $result,   
//                 'msg' =>  $msg,
//                 'error' =>  $error
//             ]
//         );
//     } catch (Exception $ex) {
//         return $this->getResponse(
//             // [
//             //     'error' => $ex->getMessage()." line ".$ex->getLine()." ".$ex->getFile()
//             // ],
//             [
//                 // 'error' => $ex->getMessage(),
//                 'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
//             ],
//             ResponseInterface::HTTP_OK
//         );
//     }
// }
    

public function updatePlanAccion(){
    
    try {
        
        $input = $this->getRequestInput($this->request);
    
        $model = new MriesgoPlanAccion();
        $model->updatePlanAccion($input);
    
        return $this->getResponse([
            'msg' => 'Actualizado correctamente',
            'error' => 1
        ]);
    
    } catch (Exception $ex) {
        
        return $this->getResponse(
            [
                 //'error' => $ex->getMessage(),
                'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
            ]
        , ResponseInterface::HTTP_OK);
    }
    
}

//revisar
public function deletePlanAccion(){
    
    $input = $this->getRequestInput($this->request);
    $model = new MriesgoPlanAccion();
    $found = $model->find($input[0]['id']);
    $this->db->transBegin();
    try{
        if($found){
            try {
                $result = $model->delete($input[0]['id']);
                if($result){
                    $this->db->transRollback();
                    $data['date_deleted'] = date("Y-m-d H:i:s");
                    $data['id_user_deleted'] = $input['user'];
                    $data['is_deleted'] = 1;
                   
                    $model->update($input[0]['id'],$data);
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
                        'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
        $model->update($input[0]['id'],$data);
        return $this->getResponse(
            [  
                'error' => true,
                'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
            ]
        );
    }
}





public function getActividadPlan($id){
    
    try {
        $model = new MriesgoPlanAccion();
            $response = [
                'data' =>  $model->getActividadPlan($id)
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
public function getPlan($id){
    
    try {
        $model = new MriesgoPlanAccion();
            $response = [
                'data' =>  $model->getPlan($id)
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
public function getDetallePlan($id){
    
    try {
        $model = new MriesgoPlanAccion();
            $response = [
                'data' =>  $model->getDetallePlan($id)
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
public function addActividadPlan(){
    
    try {
        $input = $this->getRequestInput($this->request);

        $model = new MriesgoPlanAccion();
    
        $result = $model->saveActividadPlan($input);
        $msg = 'Actividad Registrada Correctamente';
        $error = 1;

        return $this->getResponse(
            [
                'msg' =>  $msg,
                'error' =>  $error
            ]
        );
    } catch (Exception $ex) {
        return $this->getResponse(
            [
                //  'error' => $ex->getMessage(),
                'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
            ],
            ResponseInterface::HTTP_OK
        );
    }
}

public function updateActividadPlan(){
    
    try {
        
        $input = $this->getRequestInput($this->request);
    
        $model = new MriesgoPlanAccion();
        $result = $model->updateActividadPlan($input);
    
        return $this->getResponse([
            'msg' => 'Actividad actualizada correctamente',
            'error' => 1
        ]);
    
    } catch (Exception $ex) {
        
        return $this->getResponse( [
            // 'error' => $ex->getMessage(),
            'error' =>'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
        ], ResponseInterface::HTTP_OK);
    }
    
}
//revisar
public function deleteActividadPlan(){
    
    try {
        
        $input = $this->getRequestInput($this->request);       
        $model = new MriesgoPlanAccion();    
        
        $result = $model->deleteActividadesPlan($input);
       
            return $this->getResponse([
                'msg' => 'Actividad Eliminado correctamente',
                
                'error' => 0
            ]);
      
        
      
    
    } catch (Exception $ex) {
        
        return $this->getResponse([
            'error' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
        ], ResponseInterface::HTTP_OK);
    }
}
    
public function getComboAreas(){

    try {
        $model = new Marea();
            $response = [
                'data' =>  $model->getComboAreas()
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

public function getComboUnidad(){

    try {
        $model = new Munidades();
            $response = [
                'data' =>  $model->getComboUnidad()
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


public function getComboPosicion(){

    try {
        $model = new MPosicion();
            $response = [
                'data' =>  $model->getComboPosicion()
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


public function getUserNombreByActivo(){

    try {
        $model = new Muser();
            $response = [
                'data' =>  $model->getUserNombreByActivo()
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


public function getAlerta(){

    try {
        $model = new Malerta_seguimiento();
            $response = [
                'data' =>  $model->getAlertaByActivo()
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
public function getUserByActivo(){

    try {
        $model = new Muser();
            $response = [
                'data' =>  $model->getUserByActivo()
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
public function getUserByEmpresa(){

    try {
        $input = $this->getRequestInput($this->request);      
        $model = new Muser();
            $response = [
                'data' =>  $model->getUserByEmpresa($input['idempresa'])
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
public function getEstadoByActivo(){

    try {
        $model = new Mestado();
            $response = [
                'data' =>  $model->getEstadoByActivo()
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


public function getPrioridadByActivo(){

    try {
        $model = new Mprioridad();
            $response = [
                'data' =>  $model->getPrioridadByActivo()
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


public function getAlertaByActivo(){

    try {
        $model = new Malerta_seguimiento();
            $response = [
                'data' =>  $model->getAlertaByActivo()
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
//probando el eliminar
// public function deletePrueba(){

//     try {
//         $model = new Mmacroprocesos();
//             $response = [
//                 'data' =>  $model->deleteMacroproceso()
//             ];
//             return $this->respond($response, ResponseInterface::HTTP_OK);
    
//     } catch (Exception $ex) {
//         return $this->getResponse(
//                 [
//                     'error' => $ex->getMessage()." line ".$ex->getLine()." file ".$ex->getFile()
//                 ],
//                 ResponseInterface::HTTP_OK
//             );
//     }

       
// }


}