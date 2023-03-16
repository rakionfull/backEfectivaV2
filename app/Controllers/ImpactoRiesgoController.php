<?php

namespace App\Controllers;

use App\Models\ImpactoRiesgo;
use App\Models\Muser;
use App\Models\ProbabilidadRiesgo;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class ImpactoRiesgoController extends BaseController
{
    use ResponseTrait;

    public function getByDescription(){
        try {
            $input = $this->getRequestInput($this->request);
            $model = new ImpactoRiesgo();
            $response = [
                'data' =>  $model->getByDescription($input)
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

    public function getActives($scene){
        try {
            $model = new ImpactoRiesgo();
            $response = [
                'data' =>  $model->where('estado','1')->where('escenario',$scene)->findAll(),
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

    public function index($scene)
    {
        try {
            $model = new ImpactoRiesgo();
            $response = [
                'data' =>  $model->getAll($scene),
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
    public function store_escenario_1(){
        $rules = [
            'descripcion' => 'required',
            'tipo_regla' => 'required',
            'tipo_valor' => 'required',
            'estado' => 'required',
            'comentario' => 'required'
        ];
        $errors = [
            'descripcion' => [
                'required' => 'Debe ingresar la descripcion'
            ],
            'tipo_regla' => [
                'required' => 'Debe ingresar el tipo de regla'
            ],
            'tipo_valor' => [
                'required' => 'Debe ingresar el tipo de valor'
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
        $model = new ImpactoRiesgo();
        $user = new Muser();
        $userData = $user->getUserbyId($input['id_user']);
       
        if($userData->escenario == 2){
            return $this->getResponse(
                [
                    'error' => true,
                    'msg' =>  "No se pude ingresar registros a otro escenario distinto"
                ]
            );
        }else{
            $activesScene1 = $model->getActivesScene1();
            if(count($activesScene1) > 0){
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  'Ya hay un escenario configurado'
                    ]
                );
            }else{
                $result = $model->store_1($input);
    
                $modelProbabilidad= new ProbabilidadRiesgo();
                $registrosProbabilidad = count($modelProbabilidad->where('estado','1')->findAll());
                $registrosImpacto = count($model->where('estado','1')->findAll());
    
                if($registrosProbabilidad == 0 && $registrosImpacto == 0){
                    $modelProbabilidad->updateScene($input,null);
                }else{
                    $modelProbabilidad->updateScene($input,1);
                }
    
                return $this->getResponse(
                    [
                        'error' => false,
                        'msg' =>  $result
                    ]
                );

            }
        }
    }
    public function store_escenario_2(){
        try {
            $rules = [
                'descripcion' => 'required',
                'tipo_regla' => 'required',
                'tipo_valor' => 'required',
                'operador1' => 'required',
                'valor1' => 'required',
                'operador2' => 'required',
                'valor2' => 'required',
                'estado' => 'required',
                'comentario' => 'required'
            ];
            $errors = [
                'descripcion' => [
                    'required' => 'Debe ingresar la descripcion'
                ],
                'tipo_regla' => [
                    'required' => 'Debe ingresar el tipo de regla'
                ],
                'tipo_valor' => [
                    'required' => 'Debe ingresar el tipo de valor'
                ],
                'operador1' => [
                    'required' => 'Debe ingresar el operador 1'
                ],
                'valor1' => [
                    'required' => 'Debe ingresar el valor 1'
                ],
                'operador2' => [
                    'required' => 'Debe ingresar el operador 2'
                ],
                'valor2' => [
                    'required' => 'Debe ingresar el valor 2'
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
                    'msg' => $this->validator->getErrors()
                ];
                return ($this->getResponse($error,ResponseInterface::HTTP_OK));
            }

            $model = new ImpactoRiesgo();
            $user = new Muser();
            $userData = $user->getUserbyId($input['id_user']);
            if($userData->escenario == 1){
                return $this->getResponse(
                    [
                        'error' => true,
                        'msg' =>  "No se puede ingresar registros a otro escenario distinto"
                    ]
                );
            }else{
                $existeCombinatoria = $model->validateCombinatoria($input);
                if(count($existeCombinatoria) > 0){
                    return $this->getResponse(
                        [
                            'error' => true,
                            'msg' =>  'Esta combinatoria ya existe'
                        ]
                    );
                }else{
                    $result = $model->store_2($input,false);
    
                    $modelProbabilidad= new ProbabilidadRiesgo();
                    $registrosProbabilidad = count($modelProbabilidad->where('estado','1')->findAll());
                    $registrosImpacto = count($model->where('estado','1')->findAll());
    
                    if($registrosProbabilidad == 0 && $registrosImpacto == 0){
                        $modelProbabilidad->updateScene($input,null);
                    }else{
                        $modelProbabilidad->updateScene($input,2);
                    }
                    
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  $result
                        ]
                    );
                }
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

    public function edit_escenario_1(){
        try {
            $input = $this->getRequestInput($this->request);

            $model = new ImpactoRiesgo();
            $result = $model->edit_1($input);
        
            $modelProbabilidad= new ProbabilidadRiesgo();
            $registrosProbabilidad = count($modelProbabilidad->where('estado','1')->findAll());
            $registrosImpacto = count($model->where('estado','1')->findAll());

            if($registrosProbabilidad == 0 && $registrosImpacto == 0){
                $modelProbabilidad->updateScene($input,null);
            }else{
                $modelProbabilidad->updateScene($input,1);
            }

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
                    'msg' =>  $th->getMessage()
                ]
            );
        }
        
    }
    public function edit_escenario_2(){
        try {
            $input = $this->getRequestInput($this->request);
            $model = new ImpactoRiesgo();
            $result = $model->edit_2($input);

            $modelProbabilidad= new ProbabilidadRiesgo();
            $registrosProbabilidad = count($modelProbabilidad->where('estado','1')->findAll());
            $registrosImpacto = count($model->where('estado','1')->findAll());

            if($registrosProbabilidad == 0 && $registrosImpacto == 0){
                $modelProbabilidad->updateScene($input,null);
            }else{
                $modelProbabilidad->updateScene($input,2);
            }

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
                    'msg' =>  $th->getMessage()
                ]
            );
        }
    }

    public function destroy($id){
        try {
            $input = $this->getRequestInput($this->request);
            $model = new ImpactoRiesgo();
            $result = $model->destroy($id,$input);

            $modelProbabilidad= new ProbabilidadRiesgo();
            $registrosProbabilidad = count($modelProbabilidad->where('estado','1')->findAll());
            $registrosImpacto = count($model->where('estado','1')->findAll());

            if($registrosProbabilidad == 0 && $registrosImpacto == 0){
                $modelProbabilidad->updateScene($input,null);
            }
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
                    'msg' =>  'Ocurrio un error '.$th->getMessage()
                ]
            );
        }
    }

}