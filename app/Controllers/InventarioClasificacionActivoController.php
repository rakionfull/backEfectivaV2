<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\EvaluacionRiesgo;
use App\Models\InventarioClasificacionActivo;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class InventarioClasificacionActivoController extends BaseController
{
    use ResponseTrait;

    public function getAllHistoricos($id){
        try {
            $model = new InventarioClasificacionActivo();
            $response = [
                'data' =>  $model->getAllHistoricos($id),
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
    public function getAllHistoricosByUser($user_id,$id){
        try {
            $model = new InventarioClasificacionActivo();
            $response = [
                'data' =>  $model->getAllHistoricosByUser($user_id,$id),
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
    public function getValorByValoraciones(){
        try {
            $input = $this->getRequestInput($this->request);
            $model = new InventarioClasificacionActivo();
            $response = [
                'data' =>  $model->getValorByValoraciones($input),
            ];
            return $this->respond($response, ResponseInterface::HTTP_OK);
        } catch (Exception $ex) {
            log_message('error',$ex->getMessage()." linea ".$ex->getLine()." file ".$ex->getFile());

            return $this->getResponse(
                    [
                        'error' => $ex->getMessage(),
                    ],
                    ResponseInterface::HTTP_OK
                );
        }
    }
    public function listByValoraciones(){
        try {
            $input = $this->getRequestInput($this->request);
            $model = new InventarioClasificacionActivo();
            $response = [
                'data' =>  $model->listByValoraciones($input),
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
    public function index($id){
        try {
            $model = new InventarioClasificacionActivo();
            $response = [
                'data' =>  $model->getAll($id),
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
    public function show($id){
        try {
            $model = new InventarioClasificacionActivo();
            $response = [
                'data' =>  $model->getById($id),
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

    public function getByUser($user_id,$empresa){
        try {
            $model = new InventarioClasificacionActivo();
            $response = [
                'data' =>  $model->getByUser($user_id,$empresa),
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
    public function store(){
        try {
            $rules = [
                'idempresa' => 'required',
                'idarea' => 'required',
                'idunidad' => 'required',
                'idmacroproceso' => 'required',
                'idproceso' => 'required',
                'activo' => 'required',
                'desc_activo' => 'required',
                'idtipo_activo' => 'required',
                'idcategoria_activo' => 'required',
                'idubicacion' => 'required',
                'idpropietario' => 'required',
                'idcustodio' => 'required',
                'val_c' => 'required',
                'val_i' => 'required',
                'val_d' => 'required',
                'idvalor' => 'required',
                'estado' => 'required',
                'comentario' => 'required',
            ];
            $errors = [
                'idempresa' => [
                    'required' => 'Debe ingresar la empresa',
                ],
                'idarea' => [
                    'required' => 'Debe ingresar el area',
                ],
                'idunidad' => [
                    'required' => 'Debe ingresar la unidad',
                ],
                'idmacroproceso' => [
                    'required' => 'Debe ingresar el macroproceso',
                ],
                'idproceso' => [
                    'required' => 'Debe ingresar el proceso',
                ],
                'activo' => [
                    'required' => 'Debe ingresar el activo',
                ],
                'desc_activo' => [
                    'required' => 'Debe ingresar la descripcion del activo',
                ],
                'idtipo_activo' => [
                    'required' => 'Debe ingresar el tipo de activo',
                ],
                'idcategoria_activo' => [
                    'required' => 'Debe ingresar la categoria del activo',
                ],
                'idubicacion' => [
                    'required' => 'Debe ingresar la ubicacion',
                ],
                'idpropietario' => [
                    'required' => 'Debe ingresar el propietario',
                ],
                'val_c' => [
                    'required' => 'Debe ingresar la valoracion de confidencialidad',
                ],
                'val_i' => [
                    'required' => 'Debe ingresar la valoracion de integridad',
                ],
                'val_d' => [
                    'required' => 'Debe ingresar la valoracion de disponibilidad',
                ],
                'idvalor' => [
                    'required' => 'Debe ingresar el valor',
                ],
                'estado' => [
                    'required' => 'Debe ingresar el estado',
                ],
                'comentario' => [
                    'required' => 'Debe ingresar el comentario',
                ],
            ];

            $input = $this->getRequestInput($this->request);
            if (!$this->validateRequest($input, $rules, $errors)) {
                $error = [
                    'error' => true,
                    'datos' => $this->validator->getErrors()
                ];
                return ($this->getResponse($error,ResponseInterface::HTTP_OK));
            }

            $model = new InventarioClasificacionActivo();
            $result = $model->store($input);
            if($result){
                return $this->getResponse(
                    [
                        'error' => false,
                        'msg' =>  $result
                    ]
                );
               
            }else{
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'Ocurrio un error',
                       
                    ]
                );
            }
        } catch (\Throwable $th) {
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>  $th->getMessage()
                ]
            );
        }
    }

    public function update($id){
        try {
            //code...
            $input = $this->getRequestInput($this->request);
    
            $model = new InventarioClasificacionActivo();
            $modelEvaluarionRiesgo = new EvaluacionRiesgo();
            $ica = $model->find($id);
            if($ica['estado'] != $input['estado']){
                $input['id_user_added'] = $input['id_user_updated'];
                $input['date_add'] = $input['date_modify'];
                $model->store_historial($id,$input);
            }
            if( $input['estado'] == "7"){
                $data['id_activo'] = $id;
                $data['estado'] = "2";
                $modelEvaluarionRiesgo->update_status_riesgo($data);
            }

            $result = $model->edit($id,$input);
            
            if($result){
                return $this->getResponse(
                    [
                        'error' => false,
                        'msg' =>  $result
                    ]
                );
            }else{
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'Ocurrio un error'
                    ]
                );
            }
        } catch (\Throwable $th) {
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>  $th->getMessage()." line ".$th->getLine()." file ".$th->getFile()
                ]
            );
        }
    }

    public function destroy($id){
        $input = $this->getRequestInput($this->request);
        $model = new InventarioClasificacionActivo();
        $model->find($id);
        $this->db->transBegin();
        try {

            if($model){
                if($model->delete($id)){
                    $this->db->transRollback();
                    $input['is_deleted'] = 1;
                    $model->update($id,$input);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Inventario de clasificacion de activo eliminado'
                        ]
                    );
                }else{
                    $input['is_deleted'] = 0;
                    $input['date_deleted'] = null;
                    $input['id_user_deleted'] = null;
                    $model->update($id,$input);
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
                        'msg' =>  'No existe el inventario de clasificacion de activo'
                    ]
                );
            }
            $this->db->transCommit();
        } catch (\Throwable $th) {
            $input['is_deleted'] = 0;
            $input['date_deleted'] = null;
            $input['id_user_deleted'] = null;
            $model->update($id,$input);
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>  'No se puede eliminar el registro porque esta siendo usado en algún proceso.'
                ]
            );
        
        }
    }
    public function updateStatus($id){
        try {
            $input = $this->getRequestInput($this->request);
            $model = new InventarioClasificacionActivo();
            $ica = $model->find($id);
            if($input['estado'] != $ica['estado']){
                $model->store_historial($id,$ica);
            }
            $result = $model->update_estado_ica($id,$input);
            return $this->getResponse(
                [
                    'error' => false,
                    'msg' =>  $result
                ]
            );
        } catch (\Throwable $th) {
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>  $th->getMessage()." line ".$th->getLine()." file ".$th->getFile()
                ]
            );
        
        }
    }
}