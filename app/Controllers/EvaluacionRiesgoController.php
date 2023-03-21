<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\EvaluacionRiesgo;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class EvaluacionRiesgoController extends BaseController
{
    use ResponseTrait;

    public function index($id){
        try {
            $model = new EvaluacionRiesgo();
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
    public function getListHistorial(){
        try {
            $model = new EvaluacionRiesgo();
            $response = [
                'data' =>  $model->getAllHistoricos(),
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
    public function countByValor(){
        try {
            $model = new EvaluacionRiesgo();
            $response = [
                'data' =>  $model->countByValor(),
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
            $model = new EvaluacionRiesgo();
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

    public function store(){
        try {
            $rules = [
                'id_empresa' => 'required',
                'id_area' => 'required',
                'id_unidad' => 'required',
                'id_macroproceso' => 'required',
                'id_proceso' => 'required',
                'id_activo' => 'required',
                'id_tipo_amenaza' => 'required',
                'id_descripcion_amenaza' => 'required',
                'id_tipo_vulnerabilidad' => 'required',
                'id_descripcion_vulnerabilidad' => 'required',
                'riesgo' => 'required',
                'valor_probabilidad' => 'required',
                // 'probabilidad' => 'required',
                'valor_impacto' => 'required',
                // 'impacto' => 'required',
                'valor' => 'required',
                'id_control' => 'required',
                // 'riesgo_controlado_probabilidad' => 'required',
                // 'riesgo_controlado_impacto' => 'required',
                'riesgo_controlado_valor' => 'required',
                'estado' => 'required'
            ];
            $errors = [
                'id_empresa' => ['required' => 'El campo empresa es requerido'],
                'id_area' =>  ['required' => 'El campo area es requerido'],
                'id_unidad' =>  ['required' => 'El campo unidad es requerido'],
                'id_macroproceso' =>  ['required' => 'El campo macroproceso es requerido'],
                'id_proceso' =>  ['required' => 'El campo proceso es requerido'],
                'id_activo' =>  ['required' => 'El campo activo es requerido'],
                'id_tipo_amenaza' =>  ['required' => 'El campo tipo de amenaza es requerido'],
                'id_descripcion_amenaza' =>  ['required' => 'El campo descripcion de amenaza es requerido'],
                'id_tipo_vulnerabilidad' =>  ['required' => 'El campo tipo de vulnerabilidad es requerido'],
                'id_descripcion_vulnerabilidad' =>  ['required' => 'El campo descripcion de vulnerabilidad es requerido'],
                'riesgo' =>  ['required' => 'El campo riesgo es requerido'],
                'valor_probabilidad' =>  ['required' => 'El campo valo de la probabilidad es requerido'],
                // 'probabilidad' =>  ['required' => 'El campo probabilidad es requerido'],
                'valor_impacto' =>  ['required' => 'El campo valor impacto es requerido'],
                // 'impacto' =>  ['required' => 'El campo impacto es requerido'],
                'valor' =>  ['required' => 'El campo valor es requerido'],
                'id_control' =>  ['required' => 'El campo control es requerido'],
                // 'riesgo_controlado_probabilidad' =>  ['required' => 'El campo riesgo controlado probabilidad es requerido'],
                // 'riesgo_controlado_impacto' =>  ['required' => 'El campo riesgo controlado impacto es requerido'],
                'riesgo_controlado_valor' =>  ['required' => 'El campo riesgo controlado valor es requerido'],
                'estado' =>  ['required' => 'El campo estado es requerido']
            ];

            $input = $this->getRequestInput($this->request);
            if (!$this->validateRequest($input, $rules, $errors)) {
                $error = [
                    'error' => true,
                    'datos' => $this->validator->getErrors()
                ];
                return ($this->getResponse($error,ResponseInterface::HTTP_OK));
            }

            $model = new EvaluacionRiesgo();
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
                        'msg' =>  'Ocurrio un error'
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
    
            $model = new EvaluacionRiesgo();
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
        try {
            $input = $this->getRequestInput($this->request);
            $model = new EvaluacionRiesgo();
            $result = $model->destroy($id,$input);
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

    public function store_historial(){
        try {
            $rules = [
                'id_empresa' => 'required',
                'id_area' => 'required',
                'id_unidad' => 'required',
                'id_macroproceso' => 'required',
                'id_proceso' => 'required',
                'id_activo' => 'required',
                'id_tipo_amenaza' => 'required',
                'id_descripcion_amenaza' => 'required',
                'id_tipo_vulnerabilidad' => 'required',
                'id_descripcion_vulnerabilidad' => 'required',
                'riesgo' => 'required',
                'valor_probabilidad' => 'required',
                // 'probabilidad' => 'required',
                'valor_impacto' => 'required',
                // 'impacto' => 'required',
                'valor' => 'required',
                'id_control' => 'required',
                // 'riesgo_controlado_probabilidad' => 'required',
                // 'riesgo_controlado_impacto' => 'required',
                'riesgo_controlado_valor' => 'required',
                'estado' => 'required'
            ];
            $errors = [
                'id_empresa' => ['required' => 'El campo empresa es requerido'],
                'id_area' =>  ['required' => 'El campo area es requerido'],
                'id_unidad' =>  ['required' => 'El campo unidad es requerido'],
                'id_macroproceso' =>  ['required' => 'El campo macroproceso es requerido'],
                'id_proceso' =>  ['required' => 'El campo proceso es requerido'],
                'id_activo' =>  ['required' => 'El campo activo es requerido'],
                'id_tipo_amenaza' =>  ['required' => 'El campo tipo de amenaza es requerido'],
                'id_descripcion_amenaza' =>  ['required' => 'El campo descripcion de amenaza es requerido'],
                'id_tipo_vulnerabilidad' =>  ['required' => 'El campo tipo de vulnerabilidad es requerido'],
                'id_descripcion_vulnerabilidad' =>  ['required' => 'El campo descripcion de vulnerabilidad es requerido'],
                'riesgo' =>  ['required' => 'El campo riesgo es requerido'],
                'valor_probabilidad' =>  ['required' => 'El campo valo de la probabilidad es requerido'],
                // 'probabilidad' =>  ['required' => 'El campo probabilidad es requerido'],
                'valor_impacto' =>  ['required' => 'El campo valor impacto es requerido'],
                // 'impacto' =>  ['required' => 'El campo impacto es requerido'],
                'valor' =>  ['required' => 'El campo valor es requerido'],
                'id_control' =>  ['required' => 'El campo control es requerido'],
                // 'riesgo_controlado_probabilidad' =>  ['required' => 'El campo riesgo controlado probabilidad es requerido'],
                // 'riesgo_controlado_impacto' =>  ['required' => 'El campo riesgo controlado impacto es requerido'],
                'riesgo_controlado_valor' =>  ['required' => 'El campo riesgo controlado valor es requerido'],
                'estado' =>  ['required' => 'El campo estado es requerido']
            ];

            $input = $this->getRequestInput($this->request);
            if (!$this->validateRequest($input, $rules, $errors)) {
                $error = [
                    'error' => true,
                    'datos' => $this->validator->getErrors()
                ];
                return ($this->getResponse($error,ResponseInterface::HTTP_OK));
            }

            $model = new EvaluacionRiesgo();
            $result = $model->save_historial($input);
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
                    'msg' =>  $th->getMessage()
                ]
            );
        }
    }
}

