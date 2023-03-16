<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MAutomatizacion;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class AutomatizacionController extends BaseController
{
    use ResponseTrait;
    public function getAutomatizacion(){

        try {
            $model = new MAutomatizacion();
                $response = [
                    'data' =>  $model->getAutomatizacion()
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
    public function addAutomatizacion()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MAutomatizacion();
        
            $valida = $model -> validaAutomatizacion($input[0]);
            if(!$valida){
                $result = $model->saveAutomatizacion($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Automatizacion ya registrada';
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
    public function updateAutomatizacion()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MAutomatizacion();
            $result = $model->updateAutomatizacion($input);
        
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
    public function deleteAutomatizacion()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MAutomatizacion();
            $result = $model->deleteAutomatizacion($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'Automatizacion está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}