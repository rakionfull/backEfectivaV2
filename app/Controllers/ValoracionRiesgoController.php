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
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Valoracion de Riesgo ya registrada';
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
            $result = $model->updateValoracionRiesgo($input);
        
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
    public function deleteValoracionRiesgo()
    {
        $input = $this->getRequestInput($this->request);
        $model = new MValoracionRiesgo();
        $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($model){
                if($model->delete($input[0]['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $data['id_user_deleted'] = $input[0]['user'];
                    $model->update($input[0]['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Valoracion de riesgo eliminado'
                        ]
                    );
                }
            }else{
                $input['is_deleted'] = 0;
                $input['date_deleted'] = null;
                $input['id_user_deleted'] = null;
                $model->update($input[0]['id'],$input);
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'No se pudo eliminar'
                    ]
                );
            }
            $this->db->transCommit();

        } catch (Exception $ex) {
            $input['is_deleted'] = 0;
            $input['date_deleted'] = null;
            $input['id_user_deleted'] = null;
            $model->update($input[0]['id'],$input);
            return $this->getResponse(
                [
                    'error' => 'Valoracion de Riesgo está asignado, no es posible eliminarlo',
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