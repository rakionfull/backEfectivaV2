<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MCalificacionDise;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class CalificacionDiseController extends BaseController
{
    use ResponseTrait;
    public function getCalificacionDise(){

        try {
            $model = new MCalificacionDise();
                $response = [
                    'data' =>  $model->getCalificacionDise()
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
    public function addCalificacionDise()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MCalificacionDise();
        
            $valida = $model -> validaCalificacionDise($input[0]);
            if(!$valida){
                $result = $model->saveCalificacionDise($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'CalificacionDise ya registrada';
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
    public function updateCalificacionDise()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MCalificacionDise();
            $result = $model->updateCalificacionDise($input);
        
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
    public function deleteCalificacionDise()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MCalificacionDise();
            $result = $model->deleteCalificacionDise($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'CalificacionDise está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}