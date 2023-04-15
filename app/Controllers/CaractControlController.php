<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MCaractControl;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class CaractControlController extends BaseController
{
    use ResponseTrait;
    public function getCaractControl($a,$b,$c){

        try {
            $model = new MCaractControl();
                $response = [
                    'data' =>  $model->getCaractControl($a,$b,$c)
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
    public function getOpcionesCaracteristica($tipo){

        try {
            $model = new MCaractControl();
                $response = [
                    'data' =>  $model->getOpcionesCaracteristica($tipo)
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
    public function addCaractControl()
    {
   
        try {
            $input = $this->getRequestInput($this->request);

      
            $model = new MCaractControl();
        
            $valida = $model -> validaCaractControl($input);
            if(!$valida){
                $result = $model->saveCaractControl($input);
                $msg = 'Registrado Correctamente';
                $error = 1;
            }else{
                $msg = 'Caracteristica de Control ya registrada';
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
    public function updateCaractControl()
    {
   
        try {
            $input = $this->getRequestInput($this->request);
            $model = new MCaractControl();
            $found = $model->validateCaractControlModify($input);

            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' =>true,
                        'msg' =>'Característica  ya registrada'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $result = $model->updateCaractControl($input);
        
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
    public function deleteCaractControl()
    {
        $input = $this->getRequestInput($this->request);
        $model = new MCaractControl();
        $found = $model->find($input[0]['id_op']);
        $this->db->transBegin();
        try{
            if($found){
                if($model->delete($input[0]['id_op'])){
                    $this->db->transRollback();
                    $data['date_deleted'] = date("Y-m-d H:i:s");
                    $data['id_user_deleted'] = $input['user'];
                    $data['is_deleted'] = 1;
                    $model->update($input[0]['id_op'],$data);
                    $model->updateGeneral($input,$data);
                   // $result = $model->where('idOpcion',1)->update($input[0]['id']);
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
                    $model->update($input[0]['id_op'],$data);
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
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
            $model->update($input[0]['id_op'],$data);
            return $this->getResponse(
                [  
                    'error' => true,
                    'msg' => 'No se puede eliminar el registro porque esta siendo usado en algún proceso.',
                ]
            );
        }
      
        
    }
    
}