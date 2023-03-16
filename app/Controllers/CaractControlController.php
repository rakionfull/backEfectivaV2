<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MCaractControl;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class CaractControlController extends BaseController
{
    use ResponseTrait;
    public function getCaractControl($a,$b,$c){

        try {
            $model = new MCaractControl();
                $response = [
                    'data' =>  $model->getCaractControl($a,$b,$c)
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
    public function getOpcionesCaracteristica($tipo){

        try {
            $model = new MCaractControl();
                $response = [
                    'data' =>  $model->getOpcionesCaracteristica($tipo)
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
    public function addCaractControl()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MCaractControl();
        
            $valida = $model -> validaCaractControl($input);
            if(!$valida){
                $result = $model->saveCaractControl($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Caracteristica de Control ya registrada';
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
    public function updateCaractControl()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MCaractControl();
            $result = $model->updateCaractControl($input);
        
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
    public function deleteCaractControl()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MCaractControl();
            $result = $model->deleteCaractControl($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'Caracteristiva de Control está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
    
}