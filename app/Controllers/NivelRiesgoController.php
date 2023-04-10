<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\NivelRiesgo;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;

class NivelRiesgoController extends BaseController
{
    use ResponseTrait;

    public function index()
    {
        try {
            $model = new NivelRiesgo();
            $response = [
                'data' => $model->getAll()
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

    public function store(){
        $rules = [
            "operador1" => 'required',
            "valor1" => 'required',
            "operador2" => 'required',
            "valor2" => 'required',
            'descripcion' => 'required',
            'color' => 'required',
            'estado' => 'required',
            'comentario' => 'required'
        ];
        $errors = [
            "operador1" => [
                'required' => 'Debe ingrear el operador 1'
            ],
            "operador2" => [
                'required' => 'Debe ingrear el operador 2'
            ],
            "valor1" => [
                'required' => 'Debe ingrear el valor 1'
            ],
            "valor2" => [
                'required' => 'Debe ingrear el valor 2'
            ],
            "color" => [
                'required' => 'Debe ingrear el color'
            ],
            'descripcion' => [
                'required' => 'Debe ingresar la descripcion'
            ],
            'estado' => [
                'required' => 'Debe ingresar el estado'
            ],
            'comentario' => [
                'required' => 'Debe ingresar el comentario'
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
        $model = new NivelRiesgo();
        $existeCombinatoria = $model->where('operador1',$input['operador1'])->where('operador2',$input['operador2'])
        ->where('valor1',$input['valor1'])->where('valor2',$input['valor2'])
        ->where('estado',1)->where('is_deleted',0)->findAll();
        if(count($existeCombinatoria) > 0){
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>  'Esta combinatoria ya existe'
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
        $rules = [
            "operador1" => 'required',
            "valor1" => 'required',
            "operador2" => 'required',
            "valor2" => 'required',
            'descripcion' => 'required',
            'color' => 'required',
            'estado' => 'required',
            'comentario' => 'required'
        ];
        $errors = [
            "operador1" => [
                'required' => 'Debe ingrear el operador 1'
            ],
            "operador2" => [
                'required' => 'Debe ingrear el operador 2'
            ],
            "valor1" => [
                'required' => 'Debe ingrear el valor 1'
            ],
            "valor2" => [
                'required' => 'Debe ingrear el valor 2'
            ],
            "color" => [
                'required' => 'Debe ingrear el color'
            ],
            'descripcion' => [
                'required' => 'Debe ingresar la descripcion'
            ],
            'estado' => [
                'required' => 'Debe ingresar el estado'
            ],
            'comentario' => [
                'required' => 'Debe ingresar el comentario'
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
        $model = new NivelRiesgo();
        $result = $model->edit($id,$input);
        return $this->getResponse(
            [
                'msg' =>  $result
            ]
        );
    }

    public function destroy($id){
        $input = $this->getRequestInput($this->request);
        $model = new NivelRiesgo();
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
                            'msg' =>  'Nivel de riesgo eliminado'
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
                        'msg' =>  'No existe el nivel de riesgo'
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