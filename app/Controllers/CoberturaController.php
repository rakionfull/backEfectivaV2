<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MCobertura;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class CoberturaController extends BaseController
{
    use ResponseTrait;
    public function getCobertura(){

        try {
            $model = new MCobertura();
                $response = [
                    'data' =>  $model->getCobertura()
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
    public function addCobertura()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MCobertura();
        
            $valida = $model -> validaCobertura($input[0]['cobertura']);
            if(!$valida){
                $result = $model->saveCobertura($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Cobertura ya registrada';
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
    public function updateCobertura()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MCobertura();
            $result = $model->updateCobertura($input);
        
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
    public function deleteCobertura()
    {
   
        try{
            $input = $this->getRequestInput($this->request);

        
            $model = new MCobertura();
            $result = $model->deleteCobertura($input);
        
            return $this->getResponse(
                [
                    'msg' =>  'Eliminado Correctamente'
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => 'Cobertura está asignado, no es posible eliminarlo',
                ]
            );
        }
      
        
    }
}