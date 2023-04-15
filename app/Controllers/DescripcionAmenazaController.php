<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\DescripcionAmenaza;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class DescripcionAmenazaController extends BaseController
{
    use ResponseTrait;

    public function index(){
        try {
            $model = new DescripcionAmenaza();
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
            'idtipo_amenaza' => 'required',
            'amenaza' => 'required',
        ];
        $errors = [
            'idtipo_amenaza' => [
                'required' => 'Debe ingresar el id del tipo de amenaza',
            ],
            'amenaza' => [
                'required' => 'Debe ingresar la amenaza'
            ]
        ];

        $input = $this->getRequestInput($this->request);
        if (!$this->validateRequest($input, $rules, $errors)) {
            $error = [
                'error' => 'validar',
                'datos' => $this->validator->getErrors()
            ];
            return ($this->getResponse($error,ResponseInterface::HTTP_OK));
        }

        $model = new DescripcionAmenaza();
        $found = $model->where('amenaza',$input['amenaza'])->where('idtipo_amenaza',$input['idtipo_amenaza'])->where('is_deleted',0)->findAll();
        if(count($found) > 0){
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>  'Descripción de amenaza ya registrada'
                ]
            );
        }
        $result = $model->store($input);
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
    }

    public function update($id){
        try {
            $input = $this->getRequestInput($this->request);

            $model = new DescripcionAmenaza();
            $input['id'] = $id;
            $found = $model->validateModify($input);
            if(count($found) > 0){
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'Descripcion de Amenaza ya registrada'
                    ]
                );
            }
            $model->edit($id,$input);
        
            return $this->getResponse(
                [
                    'error' => false,
                    'msg' =>  'Descripcion de amenaza modificada correctamente'
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
        $model = new DescripcionAmenaza();
        $model->find($id);

        try {
            if($model){
                if($model->delete($id)){
                    $this->db->transRollback();
                    $input['is_deleted'] = 1;
                    $model->update($id,$input);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Descripcion de amenaza eliminado'
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