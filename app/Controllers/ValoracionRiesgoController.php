<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MValoracionRiesgo;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class ValoracionRiesgoController extends BaseController
{
    use ResponseTrait;
    public function getValoracionRiesgo(){

        try {
            $model = new MValoracionRiesgo();
                $response = [
                    'data' =>  $model->getValoracionRiesgo()
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
    public function addValoracionRiesgo()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MValoracionRiesgo();
        
            $valida = $model -> validaValoracionRiesgo($input[0]);
            if(!$valida){
                $result = $model->saveValoracionRiesgo($input);
                $msg = 'Registrado correctamente';
                $error = 1;
            }else{
                $msg = 'Valoracion de riesgo ya registrada';
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
    public function updateValoracionRiesgo()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MValoracionRiesgo();
            $found = $model->validateValoracionRiesgo($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Valoracion de riesgo ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $result = $model->updateValoracionRiesgo($input);
        
            return $this->getResponse(
                [
                    'error' => false,
                    'msg' =>  'Modificado correctamente'
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
    public function deleteValoracionRiesgo()
    {
        $input = $this->getRequestInput($this->request);
        $model = new MValoracionRiesgo();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                try {
                    $result = $model->delete($input[0]['id']);
                    
                    if($result){
                        $this->db->transRollback();
                        $data['date_deleted'] = date("Y-m-d H:i:s");
                        $data['id_user_deleted'] = $input['user'];
                        $data['is_deleted'] = 1;
                       
                        $model->update($input[0]['id'],$data);
                        return $this->getResponse(
                            [
                                'error' => false,
                                'msg' =>  'Eliminado Correctamente'
                            ]
                        );
                    }
                   
                } catch (Exception $ex) {
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
                        ]
                    );
                }
            }
            $this->db->transCommit();

        } catch (Exception $ex) {
            $input['is_deleted'] = 0;
            $input['date_deleted'] = null;
            $input['id_user_deleted'] = null;
            $model->update($input[0]['id'],$input);
            return $this->getResponse(
                [
                    'error' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }
    public function getImpactoRiesgoByActivo(){

        try {
            $model = new MValoracionRiesgo();
                $response = [
                    'data' =>  $model->getImpactoRiesgoByActivo()
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
    public function getProbabilidadRiesgoByActivo(){

        try {
            $model = new MValoracionRiesgo();
                $response = [
                    'data' =>  $model->getProbabilidadRiesgoByActivo()
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
    public function getDataMatriz(){

        try {
            $model = new MValoracionRiesgo();
                $response = [
                    'data' =>  $model->getDataMatriz()
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
    public function getValoracionByProbabilidadImpacto(){
        try {
            $input = $this->getRequestInput($this->request);

            $model = new MValoracionRiesgo();
            $response = [
                'data' => $model->getByProbabilidadImpacto($input)
            ];
            return $this->respond($response, ResponseInterface::HTTP_OK);

        } catch (\Throwable $th) {
            return $this->getResponse(
                [
                    'error' => $th->getMessage(),
                ],
                ResponseInterface::HTTP_OK
            );
        }
    }
}