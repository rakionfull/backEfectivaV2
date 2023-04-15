<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\TipoAmenaza;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class TipoAmenazaController extends BaseController
{
    use ResponseTrait;

    public function index(){
        try {
            $model = new TipoAmenaza();
            $response = [
                'data' =>  $model->getAll(),
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
        $rules = [
            'tipo' => 'required',
            'estado' => 'required'
        ];
        $errors = [
            'tipo' => [
                'required' => 'Debe ingresar el tipo',
                'is_unique' => 'Este tipo de amenaza ya existe en nuestros registros'
            ],
            'estado' => [
                'required' => 'Debe ingresar el estado'
            ]
        ];

        $input = $this->getRequestInput($this->request);
        if (!$this->validateRequest($input, $rules, $errors)) {
            $error = [
                'error' => true,
                'msg' => $this->validator->getErrors()
            ];
            return ($this->getResponse($error,ResponseInterface::HTTP_OK));
        }

        $model = new TipoAmenaza();
        $found = $model->where('tipo',$input['tipo'])->where('is_deleted','0')->findAll();
        if(count($found) > 0){
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>  'Ya existe este tipo de amenaza'
                ]
            );
        }
        $result = $model->store($input);
        return $this->getResponse(
            [
                'error' => false,
                'msg' =>  $result
            ]
        );
    }

    public function update($id){
        try {
            $rules = [
                'tipo' => 'required',
                'estado' => 'required'
            ];
            $errors = [
                'tipo' => [
                    'required' => 'Debe ingresar el tipo'
                ],
                'estado' => [
                    'required' => 'Debe ingresar el estado'
                ]
            ];
    
            $input = $this->getRequestInput($this->request);
            if (!$this->validateRequest($input, $rules, $errors)) {
                $error = [
                    'error' => true,
                    'msg' => $this->validator->getErrors()
                ];
                return ($this->getResponse($error,ResponseInterface::HTTP_OK));
            }
    
            $model = new TipoAmenaza();
            $input['id'] = $id;
            $found = $model->validateModify($input);
            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'Tipo de amenaza ya registrado'
                    ]
                );
            }
            $model->edit($id,$input);
            return $this->getResponse(
                [
                    'error' => false,
                    'msg' =>  'Tipo de amenaza actualizado correctamente'
                ]
            );
        } catch (\Throwable $th) {
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>  'No se pudo editar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema.'
                ]
            );
        }
        
    }

    public function destroy($id){
        $input = $this->getRequestInput($this->request);
        $model = new TipoAmenaza();
        $found = $model->find($id);
        $this->db->transBegin();
        try {
            if($found){
                if($model->delete($id)){
                    $this->db->transRollback();
                    $input['is_deleted'] = 1;
                    $model->update($id,$input);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Tipo de amenaza eliminado'
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
                        'msg' =>  'No existen registros'
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
}