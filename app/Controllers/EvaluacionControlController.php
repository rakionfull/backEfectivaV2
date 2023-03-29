<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MEvaluacionControl;
use App\Models\MRegistroControles;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class EvaluacionControlController extends BaseController
{
    use ResponseTrait;
    public function getEvaluacionControl(){

        try {
            $model = new MEvaluacionControl();
            $result = $model->getEvaluacionControl();
            for ($i=0; $i < 1 ; $i++) { 
            
                if($result){
                    $header = (array_keys(($result[$i])));
                }else{
                    $header = '';
                }
               
              }
                $response = [
                    'data' =>  $result,
                    'header' =>  $header,
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
    public function getOpcionesEvaluacionControl(){

        try {
            $model = new MEvaluacionControl();
                $response = [
                    'data' =>  $model->getOpcionesEvaluacionControl()
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
    public function getDetalleEvaluacionControl($dato){

        try {
            $model = new MRegistroControles();
                $response = [
                    'data' =>  $model->getDetalleEvaluacionControl($dato)
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
    public function addEvaluacionControl()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MEvaluacionControl();
            
            //VALIDAR COMBINACION
            
            $datos = validar_evaluacion_control($input[0]['valores']);
            if(!$datos){
                $result = $model->saveEvaluacionControl($input);
                    if($result){
                        foreach ($input[0]['valores'] as $key => $value) {
                            $array = [
                                'id' => $result,
                                'valor' => $value
                            ];
                            $model->saveDetalleEvaluacionControl($array);
                        }
                    }
                    $msg = 'Registrado Correctamente';
                    $error = 1;
            }else{
                $msg = 'Ya registrado';
                $error = 0;
            }
            // $valida = $model -> validaEvaluacionControl($input[0]);
            // if(!$valida){
          
            //     }
              
            // }else{
            //     $msg = 'Ya registrada';
            //     $error = 0;
            // }
            return $this->getResponse(
                [
                    'result' => $datos,
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
    public function updateEvaluacionControl()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MEvaluacionControl();
            $result = $model->updateEvaluacionControl($input);
            if($result){
                
                $delete=$model->deleteDetalleEvaluacionControl($input);
                if($delete){
                    foreach ($input[0]['valores'] as $key => $value) {
                        $array = [
                            'id' => $input[0]['id'],
                            'valor' => $value
                        ];
                        $model->saveDetalleEvaluacionControl($array);
                    }
                }
            }
            return $this->getResponse(
                [
                    'msg' =>  true
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
    public function deleteEvaluacionControl()
    {
   
        // try{
        //     $input = $this->getRequestInput($this->request);

        
        //     $model = new MEvaluacionControl();
        //     $result = $model->deleteEvaluacionControl($input);
        
        //     return $this->getResponse(
        //         [
        //             'msg' =>  'Eliminado Correctamente'
        //         ]
        //     );
        // } catch (Exception $ex) {
        //     return $this->getResponse(
        //         [
        //             'error' => 'Evaluacion Control está asignado, no es posible eliminarlo',
        //         ]
        //     );
        // }
        $input = $this->getRequestInput($this->request);
        $model = new MEvaluacionControl();
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
            $model->update($input[0]['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'Evaluacion de Control está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
    public function getDisenioCalificacion(){

        try {
            $model = new MEvaluacionControl();
                $response = [
                    'data' =>  $model->getDisenioCalificacion()
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
    public function getOperatividadCalificacion(){

        try {
            $model = new MEvaluacionControl();
                $response = [
                    'data' =>  $model->getOperatividadCalificacion()
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

    public function getCalificacionSubMenu(){

        try {
            $model = new MEvaluacionControl();
                $response = [
                    'data' =>  $model->getCalificacionSubMenu()
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
    public function getCalificacionOpcion($id){

        try {
            $model = new MEvaluacionControl();
                $response = [
                    'data' =>  $model->getCalificacionOpcion($id)
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
    public function getCaracteristicaOpcion(){
        try {
            $model = new MEvaluacionControl();
            $response = [
                'data' =>  $model->getCaracteristicaOpcion()
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