<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MCalificacionOpera;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class CalificacionOperaController extends BaseController
{
    use ResponseTrait;
    public function getCalificacionOpera(){

        try {
            $model = new MCalificacionOpera();
                $response = [
                    'data' =>  $model->getCalificacionOpera()
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
    public function addCalificacionOpera()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MCalificacionOpera();
        
            $valida = $model -> validaCalificacionOpera($input[0]);
            if(!$valida){
                $result = $model->saveCalificacionOpera($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'CalificacionOpera ya registrada';
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
    public function updateCalificacionOpera()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MCalificacionOpera();
            $result = $model->updateCalificacionOpera($input);
        
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
    public function deleteCalificacionOpera()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MCalificacionOpera();
            $result = $model->deleteCalificacionOpera($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'CalificacionOpera está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}