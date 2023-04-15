<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\EvaluacionRiesgo;
use App\Models\MriesgoPlanAccion;
use App\Models\EvaluacionRiesgosControles;
use App\Models\ImpactoRiesgo;
use App\Models\MAplicacionImpacto;
use App\Models\MAplicacionProbabilidad;
use App\Models\MEvaluacionControl;
use App\Models\MRegistroControles;
use App\Models\Muser;
use App\Models\MValoracionRiesgo;
use App\Models\NivelRiesgo;
use App\Models\ProbabilidadRiesgo;
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
    public function getListHistorial($id){
        try {
            $model = new EvaluacionRiesgo();
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
                // 'id_control' => 'required',
                // 'riesgo_controlado_probabilidad' => 'required',
                // 'riesgo_controlado_impacto' => 'required',
                // 'riesgo_controlado_valor' => 'required',
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
                // 'id_control' =>  ['required' => 'El campo control es requerido'],
                // 'riesgo_controlado_probabilidad' =>  ['required' => 'El campo riesgo controlado probabilidad es requerido'],
                // 'riesgo_controlado_impacto' =>  ['required' => 'El campo riesgo controlado impacto es requerido'],
                // 'riesgo_controlado_valor' =>  ['required' => 'El campo riesgo controlado valor es requerido'],
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
            $modelERC = new EvaluacionRiesgosControles();
            $result = $model->store($input);
            if($result){
                $id = $model->get_last_id()[0];
                // foreach ($input['controles'] as $control) {
                //     # code...
                //     $data = [
                //         'id_evaluacion_riesgo' => $id,
                //         'id_control' => $control,
                //         'id_user_added' => $input['id_user_added'],
                //         'date_add' => $input['date_add']
                //     ];
                //     $modelERC->store($data);
                // }
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
                $modelERC = new EvaluacionRiesgosControles();
                $modelERC->where('id_evaluacion_riesgo',$id)->update(null,[
                    'is_deleted' => '1'
                ]);
                $modelERC->where('id_evaluacion_riesgo',$id)->delete();
                if(isset($input['controles'])){
                    if(count($input['controles']) > 0){
                        foreach ($input['controles'] as $control) {
                            $data = [
                                'id_evaluacion_riesgo' => $id,
                                'id_control' => $control,
                                'id_user_added' => $input['id_user_added'],
                                'date_add' => $input['date_add']
                            ];
                            $modelERC->store($data);
                        }
                    }
                }
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
        $model = new EvaluacionRiesgo();
        $found = $model->find($id);
        $this->db->transBegin();
        try {
            if($found){
                if($model->delete($id)){
                    $this->db->transRollback();
                    $input['is_deleted'] = 1;
                    $model->update($id,$input);
                    $modelERC = new EvaluacionRiesgosControles();
                    $modelERC->where('id_evaluacion_riesgo',$id)->update(null,[
                        'is_deleted' => '1'
                    ]);
                    $modelERC->where('id_evaluacion_riesgo',$id)->delete();
                    return $this->getResponse(
                        [
                            'error' => false,
                            'msg' =>  'Evaluacion de riesgo eliminado'
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
                        'msg' =>  'No existen datos'
                    ]
                ); 
            }
            $this->db->transCommit();
           
        } catch (\Throwable $th) {
            $input['estado'] = 1;
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

    public function getEvaluacionRiesgoControlesByEvaluacion($id){
        try {
            $model = new EvaluacionRiesgosControles();
            $response = [
                'data' =>  $model->getByEvaluacionRiesgoId($id)
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
     //agregar los planes de accion
     public function addPlanAccion(){

        try {
            $input = $this->getRequestInput($this->request);
    
            $model = new MriesgoPlanAccion();
            $riesgo = new EvaluacionRiesgosControles();
            $valida =  $model->validaPlanAccion($input[0]);
            if(!$valida){
                //registramos el plan de accion
                $result = $model->savePlanAccion($input);
                //registramos riesgo con cada control para detectarlo
                //sacamos todos los riesgos y controles asociados con split
                $riesgos = explode(",", $input[0]['id_riesgo']);
                $controles = explode(",", $input[0]['id_control']);
                //recorremos y agregamos
                foreach ($riesgos as $key => $value) {
                    foreach ($controles as $key => $value2) {
                        $data = [
                            'id_evaluacion_riesgo' => $value,
                            'id_control' => $value2,
                            'id_user_added' => $input['user'],
                           
                        ];
                        $riesgo->store($data);
                      
                    }
                    $result = $this->updateRiesgosControlados($value);
                }
                $msg = 'Plan Registrado Correctamente';
                $error = 1;
            }else{
                $result = 0;
                $msg = 'Plan ya registrado';
                $error = 0;
            }
           
    
            return $this->getResponse(
                [
                    'id' => $result,   
                    'msg' =>  $msg,
                    'error' =>  $error
                ]
            );
        } catch (Exception $ex) {
            return $this->getResponse(
                // [
                //     'error' => $ex->getMessage()." line ".$ex->getLine()." ".$ex->getFile()
                // ],
                [
                    'error' => $ex->getMessage(),
                    //'error' =>'No se pudo agregar, intente de nuevo. Si el problema persiste, contacte con el administrador del sistema',
                ],
                ResponseInterface::HTTP_OK
            );
        }
    }
    //preguntar tengo que elegir el control mas fuerte?
    public function updateRiesgosControlados($id_riesgo){
        try {
            //code...
            $evaluacionRiesgoModel = new EvaluacionRiesgo();
            $riesgo = $evaluacionRiesgoModel->find($id_riesgo);
            if($riesgo['is_deleted'] == "1"){
                return $this->getResponse(
                    [
                        'error' => true,
                        'message' => 'Esta evaluacion de riesgo está eliminado'
                    ],
                    ResponseInterface::HTTP_OK
                );
            }
            $posiciones_probabilidad = [];
            $posiciones_impacto = [];
            $probabilidadModel = new ProbabilidadRiesgo();
            $impactoModel = new ImpactoRiesgo();
            $user = new Muser();
            $escenario = $user->getEscenario();
            $evaluacionControl = new MEvaluacionControl();
            $caracteristicas = $evaluacionControl->getCaracteristicaOpcion($escenario);
            $posiciones_control = array();
            $caracteristicas_controles = array();
            $pp = $probabilidadModel->getAll($escenario);
            $pi = $impactoModel->getAll($escenario);
            $riesgo_controlado_impacto = $riesgo['riesgo_controlado_impacto'];
            $riesgo_controlado_probabilidad = $riesgo['riesgo_controlado_probabilidad'];
            $riesgo_controlado_valor = $riesgo['riesgo_controlado_valor'];
            foreach ($pp as $item) {
                array_push($posiciones_probabilidad,$item['descripcion']);
            }

            foreach ($pi as $item) {
                array_push($posiciones_impacto,$item['descripcion']);
            }

            if(count($caracteristicas) > 0){
                foreach ($caracteristicas as $item) {

                    $posicion = intval(explode("%",$item['posicion'])[0]);
                    array_push($posiciones_control,$posicion);
                    array_push($caracteristicas_controles,strtoupper($item['caracteristica']));
                }

                for ($i = 1; $i < count($posiciones_control); $i++) {
                    for ($j = 0; $j < (count($posiciones_control) - $i); $j++) {
                        if($posiciones_control[$j] <= $posiciones_control[$j+1]){
                            $aux = $posiciones_control[$j];
                            $posiciones_control[$j] = $posiciones_control[$j+1];
                            $posiciones_control[$j+1] = $aux;
        
                            $aux_caracteristica = $caracteristicas_controles[$j];
                            $caracteristicas_controles[$j] =$caracteristicas_controles[$j+1];
                            $caracteristicas_controles[$j+1] = $aux_caracteristica;
        
                        }
                    }
                }

                foreach ($caracteristicas_controles as $caracteristica_control) {
                    $evaluacionRiesgosControles = new EvaluacionRiesgosControles();
                    $controles = $evaluacionRiesgosControles->getByEvaluacionRiesgoId($id_riesgo);
                    
                    if(count($controles) > 0){
                        foreach ($controles as $control) {
                            $control_id = intval($control['id_control']);
                            // el control seleccionado = $control_id
                            $found = false;
                            if(!$found){
                                $registroControlModel = new MRegistroControles();
                                $registroControl = $registroControlModel->getRegistroControl($control_id);

                                $cobertura = $registroControl->idCobertura;
                                $evaluacion = strtolower($registroControl->evaluacion);
                                $firstLetter = strtoupper(substr($evaluacion,0,1));
                                $caracteristica = $firstLetter.substr($evaluacion,1,strlen($evaluacion));
                                $caracteristica_upper = strtoupper($caracteristica);
                                $caracteristica_control_1 = strtoupper($caracteristica_control);
                                
                                if($caracteristica_upper == $caracteristica_control_1){
                                    $found = true;
                                    $cobertura = intval($cobertura);
                                    $control_selected = $control_id;
                                    switch ($cobertura) {
                                        case 1:
                                            $riesgo_controlado_probabilidad = $this->getAplicacionProbabilidad($caracteristica,$escenario,$posiciones_probabilidad,$riesgo);
                                            $riesgo_controlado_valor = $this->getRiesgoControladoValor($riesgo['valor_probabilidad'],$riesgo['valor_impacto'],$riesgo_controlado_probabilidad,$riesgo['riesgo_controlado_impacto'],$escenario);
                                            break;
                                        case 2:
                                            $riesgo_controlado_impacto = $this->getAplicacionImpacto($caracteristica,$escenario,$posiciones_impacto,$riesgo);
                                            $riesgo_controlado_valor = $this->getRiesgoControladoValor($riesgo['valor_probabilidad'],$riesgo['valor_impacto'],$riesgo['riesgo_controlado_probabilidad'],$riesgo_controlado_impacto,$escenario);
                                            
                                            break;
                                        case 3:
                                            $riesgo_controlado_probabilidad = $this->getAplicacionProbabilidad($caracteristica,$escenario,$posiciones_probabilidad,$riesgo);
                                            $riesgo_controlado_impacto = $this->getAplicacionImpacto($caracteristica,$escenario,$posiciones_impacto,$riesgo);
                                            
                                            $riesgo_controlado_valor = $this->getRiesgoControladoValor($riesgo['valor_probabilidad'],$riesgo['valor_impacto'],$riesgo_controlado_probabilidad,$riesgo_controlado_impacto,$escenario);
                                            break;
                                        default:
                                            break;
                                    }
                                }
                            }
                        }
                        $riesgo['id_control'] = $control_selected;
                        $riesgo['riesgo_controlado_probabilidad'] = $riesgo_controlado_probabilidad;
                        $riesgo['riesgo_controlado_impacto'] = $riesgo_controlado_impacto;
                        $riesgo['riesgo_controlado_valor'] = $riesgo_controlado_valor;
                        $evaluacionRiesgoModel->update($id_riesgo,$riesgo);
                        return $this->getResponse(
                            [
                                'error' => false,
                                'message' => 'Valores de riesgos controlados actualizados en evaluación de riesgo',
                                'data' => $riesgo
                            ],
                            ResponseInterface::HTTP_OK
                        );
                    }
                }
            }
        } catch (\Throwable $th) {
            return $this->getResponse(
                [
                    'error' => true,
                    'message' => $th->getMessage(),
                    'line' => $th->getLine(),
                    'file' => $th->getFile()
                ],
                ResponseInterface::HTTP_OK
            );
        }
    }

    public function getAplicacionProbabilidad($caracteristica,$escenario,$posiciones_probabilidad,$riesgo){
        $MAplicacionProbabilidad = new MAplicacionProbabilidad();
        $respuestaCaracteristica = $MAplicacionProbabilidad->getByCaracteristica(['caracteristica' => $caracteristica,'escenario' => $escenario])[0];
        // var_dump($respuestaCaracteristica);die();
        
        if(intval($escenario) == 2){
            $probabilidad_actual = $riesgo['probabilidad'];
            foreach ($posiciones_probabilidad as $key => $value) {
                if($value == $probabilidad_actual){
                    $index = $key;
                }
            }
            $posicion = intval($index) - intval($respuestaCaracteristica['posicion']);
            if($posicion <= 0){
                $posicion = 0;
            }else{
                $posicion = $posicion;
            }
            $new_posicion = $posiciones_probabilidad[$posicion];
            $riesgo_controlado_probabilidad = $new_posicion;
        }else if(intval($escenario) == 1){
            $value = intval(explode("%",$respuestaCaracteristica['posicion'])[0])/100;
            $probabilidad_actual = $riesgo['valor_probabilidad'];
            $new_probabilidad = $probabilidad_actual - ($probabilidad_actual * $value);
            $riesgo_controlado_probabilidad = $new_probabilidad;
        }
        return $riesgo_controlado_probabilidad;
    }

    public function getAplicacionImpacto($caracteristica,$escenario,$posiciones_impacto,$riesgo){
        $MAplicacionImpacto = new MAplicacionImpacto();
        $respuestaCaracteristica = $MAplicacionImpacto->getByCaracteristica(['caracteristica' => $caracteristica,'escenario' => $escenario]);
        var_dump($respuestaCaracteristica);
        if(intval($escenario) == 2){
            $impacto_actual = $riesgo['impacto'];
            foreach ($posiciones_impacto as $key => $value) {
                if($value == $impacto_actual){
                    $index = $key;
                }
            }
            $posicion = intval($index) - intval($respuestaCaracteristica['posicion']);
            if($posicion <= 0){
                $posicion = 0;
            }else{
                $posicion = $posicion;
            }
            $new_posicion = $posiciones_impacto[$posicion];
            $riesgo_controlado_impacto = $new_posicion;
        }else if(intval($escenario) == 1){
            $value = intval(explode("%",$respuestaCaracteristica['posicion'])[0])/100;
            $impacto_actual = $riesgo['valor_impacto'];
            $new_impacto = $impacto_actual - ($impacto_actual * $value);
            $riesgo_controlado_impacto = $new_impacto;
        }
        return $riesgo_controlado_impacto;
    }

    public function getRiesgoControladoValor($valorProb = 0,$valorImp = 0,$descripcionProb = "",$descripcionImp = "",$escenario = 0){
        if(intval($escenario) == 2){
            $probabilidadModel = new ProbabilidadRiesgo();
            $p1 = $probabilidadModel->getByDescription(['descripcion'=>$descripcionProb])[0];
            $idProbabilidad = $p1['id'];
            $impactoModel = new ImpactoRiesgo();
            $p2 = $impactoModel->getByDescription(['descripcion'=>$descripcionImp])[0];
            $idImpacto = $p2['id'];
            $MValoracionRiesgo = new MValoracionRiesgo();
            $respuesta = $MValoracionRiesgo->getByProbabilidadImpacto(['id_probabilidad' => $idProbabilidad,'id_impacto' => $idImpacto])[0];
            return $respuesta['valor'];
        }else if(intval($escenario) == 1){
            $value = $valorProb * $valorImp;
            $model = new NivelRiesgo();
            $niveles = $model->getAll();
            $found_nivel = false;
            foreach ($niveles as $nivel) {
                if(!$found_nivel){
                    if($nivel->operador1 == ">"){
                        if($nivel->operador2 == "<"){
                            if($value>$nivel->valor1 && $value<$nivel->valor2){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                        if($nivel->operador2 == "<="){
                            if($value>$nivel->valor1 && $value<=$nivel->valor2){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                    }
                    if($nivel->operador1 == ">="){
                        if($nivel->operador2 == "<"){
                            if($value>=$nivel->valor1 && $value<$nivel->valor2){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                        if($nivel->operador2 == "<="){
                            if($value>=$nivel->valor1 && $value<=$nivel->valor2){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                    }
                    if($nivel->operador1 == "<"){
                        if($nivel->operador2 == ">"){
                            if($value<$nivel->valor1 && $value>$nivel->valor2){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                        if($nivel->operador2 == ">="){
                            if($value<$nivel->valor1 && $value>=$nivel->valor2){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                    }
                    if($nivel->operador1 == "<="){
                        if($nivel->operador2 == ">"){
                            if($value<=$nivel->valor1 && $value>$nivel->valor2){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                        if($nivel->operador2 == ">="){
                            if($value<=$nivel->valor1 && $value>=$nivel->valor2){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                    }
                    // OPERADOR 2
                    if($nivel->operador2 == ">"){
                        if($nivel->operador1 == "<"){
                            if($value > $nivel->valor2 && $value<$nivel->valor1){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                        if($nivel->operador1 == "<="){
                            if($value>$nivel->valor && $value<=$nivel->valor1){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                    }
                    if($nivel->operador2 == ">="){
                        if($nivel->operador1 == "<"){
                            if($value >= $nivel->valor2 && $value<$nivel->valor1){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                        if($nivel->operador1 == "<="){
                            if($value>=$nivel->valor && $value<=$nivel->valor1){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                    }
                    if($nivel->operador2 == "<"){
                        if($nivel->operador1 == "<"){
                            if($value < $nivel->valor2 && $value<$nivel->valor1){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                        if($nivel->operador1 == "<="){
                            if($value<$nivel->valor && $value<=$nivel->valor1){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                    }
                    if($nivel->operador2 == "<="){
                        if($nivel->operador1 == "<"){
                            if($value <= $nivel->valor2 && $value<$nivel->valor1){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                        if($nivel->operador1 == "<="){
                            if($value <= $nivel->valor && $value<=$nivel->valor1){
                                $found_nivel = true;
                                $descripcion = $nivel->descripcion;
                            }
                        }
                    }
                }
            }
            return $descripcion;
        }
    }

   
     
}

