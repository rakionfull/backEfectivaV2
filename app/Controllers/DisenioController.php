<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MDisenio;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class DisenioController extends BaseController
{
    use ResponseTrait;
    public function getDisenio(){

        try {
            $model = new MDisenio();
                $response = [
                    'data' =>  $model->getDisenio()
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
    public function getOpcionesDisenio(){

        try {
            $model = new MDisenio();
                $response = [
                    'data' =>  $model->getOpcionesDisenio()
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
    public function addDisenio()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MDisenio();
        
            $valida = $model -> validaDisenio($input[0]['caracteristica']);
            if(!$valida){
                $result = $model->saveDisenio($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Disenio ya registrada';
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
    public function updateDisenio()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MDisenio();
            $result = $model->updateDisenio($input);
        
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
    public function deleteDisenio()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MDisenio();
            $result = $model->deleteDisenio($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'Disenio está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}