<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MAplicacionImpacto;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class AplicacionImpactoController extends BaseController
{
    use ResponseTrait;
    public function getAplicacionImpacto(){
        $input = $this->getRequestInput($this->request);
        try {
            $model = new MAplicacionImpacto();
                $response = [
                    'data' =>  $model->getAplicacionImpacto($input['escenario'])
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
    
    public function addAplicacionImpacto()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MAplicacionImpacto();
        
            $valida = $model -> validaAplicacionImpacto($input[0]);
            if(!$valida){
                $result = $model->saveAplicacionImpacto($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Ya registrada';
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
    public function updateAplicacionImpacto()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MAplicacionImpacto();
            $result = $model->updateAplicacionImpacto($input);
        
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
    public function deleteAplicacionImpacto()
    {
   
        // try{
        //     $input = $this->getRequestInput($this->request);

        
        //     $model = new MAplicacionImpacto();
        //     $result = $model->deleteAplicacionImpacto($input);
        
        //     return $this->getResponse(
        //         [
        //             'msg' =>  'Eliminado Correctamente'
        //         ]
        //     );
        // } catch (Exception $ex) {
        //     return $this->getResponse(
        //         [
        //             'error' => 'AplicacionImpacto está asignado, no es posible eliminarlo',
        //         ]
        //     );
        // }
        $input = $this->getRequestInput($this->request);
        $model = new MAplicacionImpacto();
        $found = $model->find($input[0]['id']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input[0]['id'])){
                    $this->db->transRollback();
                    $data['is_deleted'] = 1;
                    $model->update($input[0]['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Eliminado Correctamente'
                        ]
                    );
                }else{
                    $data['is_deleted'] = 0;
                    $data['date_deleted'] = null;
                    $data['id_user_deleted'] = null;
                    $model->update($input[0]['id'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se pudo eliminar'
                        ]
                    );
                }
            }else{
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'No existen registros'
                    ]
                );
            }
            $this->db->transCommit();

        } catch (Exception $ex) {
            $data['is_deleted'] = 0;
            $data['date_deleted'] = null;
            $data['id_user_deleted'] = null;
            $model->update($input['id'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'Aplicacion de Impacto está asignado, no es posible eliminarlo',
                ]
            );
        }
        
    }
    public function getByCaracteristica(){
        try{
            $input = $this->getRequestInput($this->request);
            $model = new MAplicacionImpacto();
            $response = [
                'data' =>  $model->getByCaracteristica($input)
            ];
            return $this->respond($response, ResponseInterface::HTTP_OK);
        } catch (Exception $ex) {
            return $this->getResponse(
                [
                    'error' => $ex->getMessage(),
                ]
            );
        }
      
    }
}