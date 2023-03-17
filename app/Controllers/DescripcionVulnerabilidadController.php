<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\DescripcionVulnerabilidad;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class DescripcionVulnerabilidadController extends BaseController
{
    use ResponseTrait;

    public function index(){
        try {
            $model = new DescripcionVulnerabilidad();
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
            'idcategoria' => 'required',
            'vulnerabilidad' => 'required',
        ];
        $errors = [
            'idcategoria' => [
                'required' => 'Debe ingresar el id de la categoria de vulnerabilidad',
            ],
            'vulnerabilidad' => [
                'required' => 'Debe ingresar la vulnerabilidad'
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

        $model = new DescripcionVulnerabilidad();
        $result = $model->store($input);
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
    }

    public function update($id){
        $input = $this->getRequestInput($this->request);

        $model = new DescripcionVulnerabilidad();
        $result = $model->edit($id,$input);
    
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
    }

    public function destroy($id){
        $input = $this->getRequestInput($this->request);
        $model = new DescripcionVulnerabilidad();
        $model->find($id);

        $this->db->transBegin();

        try {
            if($model){
                // Si se puede eliminar por llave foranea
                if($model->delete($id)){
                    $this->db->transRollback();
                    $input['is_deleted'] = 1;
                    $model->update($id,$input);
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Descripcion de Vulnerabilidad eliminado'
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
        } catch (\Throwable $th) {
            $input['is_deleted'] = 0;
            $input['date_deleted'] = null;
            $input['id_user_deleted'] = null;
            $model->update($id,$input);
            return $this->getResponse(
                [
                    'msg' =>  'Ocurrio un error '.$th->getMessage()
                ]
            );
        
        }
    }
}