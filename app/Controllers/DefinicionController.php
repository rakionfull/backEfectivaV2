<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MDefinicion;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class DefinicionController extends BaseController
{
    use ResponseTrait;
    public function getDefinicion(){

        try {
            $model = new MDefinicion();
                $response = [
                    'data' =>  $model->getDefinicion()
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
    public function addDefinicion()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MDefinicion();
        
            $valida = $model -> validaDefinicion($input[0]);
            if(!$valida){
                $result = $model->saveDefinicion($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Definicion ya registrada';
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
    public function updateDefinicion()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MDefinicion();
            $result = $model->updateDefinicion($input);
        
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
    public function deleteDefinicion()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MDefinicion();
            $result = $model->deleteDefinicion($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'Definicion está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}