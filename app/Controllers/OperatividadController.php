<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MOperatividad;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class OperatividadController extends BaseController
{
    use ResponseTrait;
    public function getOperatividad(){

        try {
            $model = new MOperatividad();
                $response = [
                    'data' =>  $model->getOperatividad()
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
    public function getOpcionesOperatividad(){

        try {
            $model = new MOperatividad();
                $response = [
                    'data' =>  $model->getOpcionesOperatividad()
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
    public function addOperatividad()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MOperatividad();
        
            $valida = $model -> validaOperatividad($input[0]['caracteristica']);
            if(!$valida){
                $result = $model->saveOperatividad($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Operatividad ya registrada';
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
    public function updateOperatividad()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MOperatividad();
            $result = $model->updateOperatividad($input);
        
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
    public function deleteOperatividad()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MOperatividad();
            $result = $model->deleteOperatividad($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'Operatividad está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}