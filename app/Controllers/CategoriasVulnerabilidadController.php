<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CategoriasVulnerabilidad;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class CategoriasVulnerabilidadController extends BaseController
{
    use ResponseTrait;

    public function index(){
        try {
            $model = new CategoriasVulnerabilidad();
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
            'categoria' => 'required|is_unique[categoria_vulnerabilidad.categoria]',
            'estado' => 'required',
        ];
        $errors = [
            'categoria' => [
                'required' => 'Debe ingresar la categoria de la vulnerabilidad',
                'is_unique' => 'Esta categoria de vulnerabilidad ya existe en nuestros registros',
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

        $model = new CategoriasVulnerabilidad();
        $result = $model->store($input);
        return $this->getResponse(
            [
                'error' => false,
                'msg' =>  $result
            ]
        );
    }

    public function update($id){
        $rules = [
            'categoria' => 'required|is_unique[categoria_vulnerabilidad.categoria]',
            'estado' => 'required',
        ];
        $errors = [
            'categoria' => [
                'required' => 'Debe ingresar la categoria de la vulnerabilidad',
                'is_unique' => 'Esta categoria de vulnerabilidad ya existe en nuestros registros',
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

        $model = new CategoriasVulnerabilidad();
        $result = $model->edit($id,$input);
        
        return $this->getResponse(
            [
                'error' => false,
                'msg' =>  $result
            ]
        );
    }

    public function destroy($id){
        $input = $this->getRequestInput($this->request);
        $model = new CategoriasVulnerabilidad();
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
                            'msg' =>  'Categoria de vulnerabilidad eliminado'
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
                    'msg' =>  'No se pudo eliminar'
                ]
            );
        
        }
    }
}