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
            'tipo' => 'required|is_unique[tipo_amenaza.tipo]',
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
            'tipo' => 'required|is_unique[tipo_amenaza.tipo]',
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
        $result = $model->edit($id,$input);
        return $this->getResponse(
            [
                'error' => false,
                'msg' =>  $result
            ]
        );
    }

    public function destroy($id){
        try {
            $input = $this->getRequestInput($this->request);
            $model = new TipoAmenaza();
            $result = $model->destroy($id,$input);
            return $this->getResponse(
                [
                    'msg' =>  $result
                ]
            );
        } catch (\Throwable $th) {
            return $this->getResponse(
                [
                    'msg' =>  'Ocurrio un error '.$th->getMessage()
                ]
            );
        }
    }
}