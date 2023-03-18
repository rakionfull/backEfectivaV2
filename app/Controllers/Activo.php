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
use App\Models\MPosicion;
use App\Models\MValoracionActivo;
use App\Models\MCatActivo;
use App\Models\MPais;
use App\Models\MUbicActivo;
use App\Models\Mestado;
use App\Models\Mprioridad;
use App\Models\Malerta_seguimiento;


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
            'msg' =>  $msg,
            'error' =>  $error
        ]
    );
   } catch (Exception $ex) {
    return $this->getResponse(
        [
            'error' => $ex->getMessage(),
        ],
        ResponseInterface::HTTP_OK
    );
}
        
      
      
        
    }
    public function updateEmpresa()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mempresa();
        $result = $model->updateEmpresa($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteEmpresa()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Mempresa();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Eliminado Correctamente'
                        ]
                    );
                }else{
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se pudo eliminar'
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
        
            
        } catch (Exception $ex) {
            $data['is_deleted'] = 0;
            $data['date_deleted'] = null;
            $data['id_user_deleted'] = null;
            $model->update($input['id'],$data);
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' => 'Empresa está asignado, no es posible eliminarlo',
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
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Marea();
    
        $valida = $model -> validaArea($input);
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
      
        
    }
    public function updateArea()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Marea();
        $result = $model->updateArea($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteArea()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Marea();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
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
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'Área está asignado, no es posible eliminarlo',
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
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Marea();
        $result = $model->saveAreaEmpresa($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updateAreaEmpresa()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Marea();
        $result = $model->updateAreaEmpresa($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
   
      //------------------------------------------------------------------------------

      
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
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mvaloractivo();
        $result = $model->saveValorActivo($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updateValorActivo()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mvaloractivo();
        $result = $model->updateValorActivo($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteValorActivo()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Mvaloractivo();
        $found = $model->find($input['id']);
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Valor Activo eliminado Correctamente'
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
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'El Valor activo está asignado, no es posible eliminarlo',
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
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mtipoactivo();
        $result = $model->saveTipoActivo($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
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
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new Mtipoactivo();
        $result = $model->updateTipoActivo($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }

    public function deleteTipoActivo()
    {
   
        $input = $this->getRequestInput($this->request);
        $model = new Mtipoactivo();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
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
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'El tipo de activo está asignado, no es posible eliminarlo',
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
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new MclasInformacion();
        $result = $model->saveClasInformacion($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updateClasInformacion()
    {
   
        
        $input = $this->getRequestInput($this->request);

      
        $model = new MclasInformacion();
        $result = $model->updateClasInformacion($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteClasInfo()
    {

        $input = $this->getRequestInput($this->request);
        $model = new MclasInformacion();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
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
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'La clasificación de infromación está asignado, no es posible eliminarlo',
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
           
        $input = $this->getRequestInput($this->request);

      
        $model = new MaspectoSeg();
        $result = $model->saveAspectoSeg($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updateAspectoSeg()
    {
           
        $input = $this->getRequestInput($this->request);

      
        $model = new MaspectoSeg();
        $result = $model->updateAspectoSeg($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteAspectoSeg()
    {
        $input = $this->getRequestInput($this->request);
        $model = new MaspectoSeg();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
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
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'El Apecto de Seguridad está asignado, no es posible eliminarlo',
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
           
        $input = $this->getRequestInput($this->request);

      
        $model = new Munidades();
        
    
        $valida = $model -> validaUnidad($input);
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
        
    }
    public function updateUnidades()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Munidades();
        $result = $model->updateUnidades($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    
    public function deleteUnidad()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Munidades();
        $found = $model->find($input['id']);
        $this->db->transBegin();

        try{
            if($found){
                if($model->delete('id')){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Unidad eliminada'
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
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'Unidad está asignado, no es posible eliminarlo',
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
    
    
    public function addMacroproceso()
    {
           
        $input = $this->getRequestInput($this->request);

      
        $model = new Mmacroprocesos();
      
    
        $valida = $model -> validaMacroproceso($input);
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
      
        
    }
    public function updateMacroproceso()
    {
           
        $input = $this->getRequestInput($this->request);

      
        $model = new Mmacroprocesos();
        $result = $model->updateMacroproceso($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteMacroproceso()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Mmacroprocesos();
        $found = $model->find($input['id']);
        $this->db->transBegin();

        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
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
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se pudo eliminar'
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
            $model->update($input['id'],$data);
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' => 'Macroproceso está asignado, no es posible eliminarlo',
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
           
        $input = $this->getRequestInput($this->request);

      
        $model = new Mproceso();
        $valida = $model->validaProceso($input);
    
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
      
        
    }
    public function updateProceso()
    {
           
        $input = $this->getRequestInput($this->request);

      
        $model = new Mproceso();
        $result = $model->updateProceso($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteProceso()
    {
        $input = $this->getRequestInput($this->request);
        $model = new Mproceso();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
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
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'Proceso está asignado, no es posible eliminarlo',
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
    public function getPosicionByActivo(){

        try {
            $model = new MPosicion();
            $input = $this->getRequestInput($this->request);
                $response = [
                    'data' =>  $model->getPosicionByActivo($input['idempresa'])
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
           
        $input = $this->getRequestInput($this->request);

      
        $model = new MPosicion();
        $result = $model->savePosicion($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updatePosicion()
    {
           
        $input = $this->getRequestInput($this->request);

      
        $model = new MPosicion();
        $result = $model->updatePosicion($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deletePosicion()
    {
        $input = $this->getRequestInput($this->request);
        $model = new MPosicion();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Posicion/Puesto eliminado Correctamente'
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
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'Posicion/Puesto está asignado, no es posible eliminarlo',
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
           
        $input = $this->getRequestInput($this->request);

      
        $model = new MValoracionActivo();
        $result = $model->saveValActivo($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updateValActivo()
    {
           
        $input = $this->getRequestInput($this->request);

      
        $model = new MValoracionActivo();
        $result = $model->updateValActivo($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteValActivo()
    {
   
        $input = $this->getRequestInput($this->request);
        $model = new MValoracionActivo();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
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
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'No es posible eliminarlo, ya que esta siendo usado',
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
           
        $input = $this->getRequestInput($this->request);

      
        $model = new MCatActivo();
        $result = $model->saveCatActivo($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function updateCatActivo()
    {
        
        $input = $this->getRequestInput($this->request);
        $model = new MCatActivo();
        $result = $model->updateCatActivo($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteCatActivo()
    {
        $input = $this->getRequestInput($this->request);
        $model = new MCatActivo();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Eliminado correctamente'
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
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'No es posible eliminarlo, está siendo usado por otra relación',
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
      
        
    }
    public function updateUbiActivo()
    {
           
        $input = $this->getRequestInput($this->request);

      
        $model = new MUbicActivo();
        $result = $model->updateUbiActivo($input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
      
        
    }
    public function deleteUbiActivo()
    {
   
        $input = $this->getRequestInput($this->request);
        $model = new MUbicActivo();
        $found = $model->find($input['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input['id'],$data);
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
                    $model->update($input['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'No es posible eliminarlo, está siendo usado por otra relación',
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
                    'error' => $ex->getMessage(),
                ],
                ResponseInterface::HTTP_OK
        );
        }
    }
    
    public function updateEstado(){
        
        try {
            
            $input = $this->getRequestInput($this->request);
        
            $model = new Mestado();
            $result = $model->updateEstado($input);
        
            return $this->getResponse([
                'msg' => 'Estado actualizado correctamente',
                'error' => 1
            ]);
        
        } catch (Exception $ex) {
            
            return $this->getResponse([
                'error' => $ex->getMessage()
            ], ResponseInterface::HTTP_OK);
        }
        
    }
    
    public function deleteEstado(){
        $input = $this->getRequestInput($this->request);
        $model = new Mestado();
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
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'Estado está asignado, no es posible eliminarlo',
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
                    'error' => $ex->getMessage(),
                ],
                ResponseInterface::HTTP_OK
        );
    }
    }
    
    public function updatePrioridad(){
    
        try {
            
            $input = $this->getRequestInput($this->request);
        
            $model = new Mprioridad();
            $result = $model->updatePrioridad($input);
        
            return $this->getResponse([
                'msg' => 'Prioridad actualizada correctamente',
                'error' => 1
            ]);
        
        } catch (Exception $ex) {
            
            return $this->getResponse([
                'error' => $ex->getMessage()
            ], ResponseInterface::HTTP_OK);
        }
      
        
    }
    
    public function deletePrioridad(){
        $input = $this->getRequestInput($this->request);
        $model = new Mprioridad();
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
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'Prioridad está asignado, no es posible eliminarlo',
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
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
            );
        }
    }
    
    public function updateAlerta_seguimiento(){
       
        try {
            
            $input = $this->getRequestInput($this->request);
        
            $model = new Malerta_seguimiento();
            $result = $model->updateAlerta_seguimiento($input);
        
            return $this->getResponse([
                'msg' => 'Alerta actualizada correctamente',
                'error' => 1
            ]);
        
        } catch (Exception $ex) {
            
            return $this->getResponse([
                'error' => $ex->getMessage()
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
                            'msg' =>  'No se pudo eliminar'
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
                    'msg' => 'Alerta de seguimiento está asignado, no es posible eliminarlo',
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



public function addPlanAccion(){

    try {
        $input = $this->getRequestInput($this->request);

        $model = new MriesgoPlanAccion();
    
        $result = $model->savePlanAccion($input);

        $msg = 'Plan Registrado Correctamente';
        $error = 1;

        return $this->getResponse(
            [
                 'id' => $result,   
                'msg' =>  $msg,
                'error' =>  $error
            ]
        );
    } catch (Exception $ex) {
        return $this->getResponse(
            [
                'error' => $ex->getMessage()." line ".$ex->getLine()." ".$ex->getFile()
            ],
            ResponseInterface::HTTP_OK
        );
    }
}
    

public function updatePlanAccion(){
    
    try {
        
        $input = $this->getRequestInput($this->request);
    
        $model = new MriesgoPlanAccion();
        $result = $model->updatePlanAccion($input);
    
        return $this->getResponse([
            'msg' => 'Estado actualizado correctamente',
            'error' => 1
        ]);
    
    } catch (Exception $ex) {
        
        return $this->getResponse([
            'error' => $ex->getMessage()
        ], ResponseInterface::HTTP_OK);
    }
    
}


public function deletePlanAccion(){
    
    try {
        
        $input = $this->getRequestInput($this->request);       
        $model = new MriesgoPlanAccion();    
        
        $result = $model->deletePlanAccion($input);
    
    
        
        return $this->getResponse([
            'msg' => 'Estado Eliminado correctamente',
            'error' => 0
        ]);
    
    } catch (Exception $ex) {
        
        return $this->getResponse([
            'error' => $ex->getMessage()
        ], ResponseInterface::HTTP_OK);
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
                'error' => $ex->getMessage(),
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
        
        return $this->getResponse([
            'error' => $ex->getMessage()
        ], ResponseInterface::HTTP_OK);
    }
    
}

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
            'error' => $ex->getMessage()
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
                'data' =>  $model->getAlerta()
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

       
}public function getUserByActivo(){

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


}