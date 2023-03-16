<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MCaracteristicaOpera;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class CaracteristicaOperaController extends BaseController
{
    use ResponseTrait;
    public function getCaracteristicaOpera(){

        try {
            $model = new MCaracteristicaOpera();
                $response = [
                    'data' =>  $model->getCaracteristicaOpera()
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
    public function addCaracteristicaOpera()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MCaracteristicaOpera();
        
            $valida = $model -> validaCaracteristicaOpera($input[0]);
            if(!$valida){
                $result = $model->saveCaracteristicaOpera($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'CaracteristicaOpera ya registrada';
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
    public function updateCaracteristicaOpera()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MCaracteristicaOpera();
            $result = $model->updateCaracteristicaOpera($input);
        
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
    public function deleteCaracteristicaOpera()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MCaracteristicaOpera();
            $result = $model->deleteCaracteristicaOpera($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'CaracteristicaOpera está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}