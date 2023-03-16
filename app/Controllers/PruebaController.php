<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MPrueba;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class PruebaController extends BaseController
{
    use ResponseTrait;
    public function getPrueba(){

        try {
            $model = new MPrueba();
                $response = [
                    'data' =>  $model->getPrueba()
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
    public function addPrueba()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MPrueba();
        
            $valida = $model -> validaPrueba($input[0]);
            if(!$valida){
                $result = $model->savePrueba($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Prueba ya registrada';
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
    public function updatePrueba()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MPrueba();
            $result = $model->updatePrueba($input);
        
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
    public function deletePrueba()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MPrueba();
            $result = $model->deletePrueba($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'Prueba está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}