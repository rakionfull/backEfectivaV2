<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MObjetivo;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class ObjetivoController extends BaseController
{
    use ResponseTrait;
    public function getObjetivo(){

        try {
            $model = new MObjetivo();
                $response = [
                    'data' =>  $model->getObjetivo()
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
    public function addObjetivo()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MObjetivo();
        
            $valida = $model -> validaObjetivo($input[0]);
            if(!$valida){
                $result = $model->saveObjetivo($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Objetivo ya registrada';
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
    public function updateObjetivo()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MObjetivo();
            $result = $model->updateObjetivo($input);
        
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
    public function deleteObjetivo()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MObjetivo();
            $result = $model->deleteObjetivo($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'Objetivo está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}