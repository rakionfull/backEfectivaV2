<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;
use App\Controllers\BaseController;
use Daycry\CronJob\Scheduler;
use App\Models\MriesgoPlanAccion;

class CronJob extends \Daycry\CronJob\Config\CronJob
{
    /**
     * Set true if you want save logs
     */
    public bool $logPerformance = true;

    /*
    |--------------------------------------------------------------------------
    | Log Saving Method
    |--------------------------------------------------------------------------
    |
    | Set to specify the REST API requires to be logged in
    |
    | 'file'   Save in files
    | 'database'  Save in database
    |
    */
    public string $logSavingMethod = 'file';

    /**
     * Directory
     */
    public string $filePath = WRITEPATH . 'cronJob/';

    /**
     * File Name in folder jobs structure
     */
    public string $fileName = 'jobs';

    /**
     * --------------------------------------------------------------------------
     * Maximum performance logs
     * --------------------------------------------------------------------------
     *
     * The maximum number of logs that should be saved per Job.
     * Lower numbers reduced the amount of database required to
     * store the logs.
     *
     * If you write 0 it is unlimited
     */
    public int $maxLogsPerJob = 3;

    /*
    |--------------------------------------------------------------------------
    | Database Group
    |--------------------------------------------------------------------------
    |
    | Connect to a database group for logging, etc.
    |
    */
    public string $databaseGroup = 'default';

    /*
    |--------------------------------------------------------------------------
    | Cronjob Table Name
    |--------------------------------------------------------------------------
    |
    | The table name in your database that stores cronjobs
    |
    */
    public string $tableName = 'cronjob';

    /*
    |--------------------------------------------------------------------------
    | Cronjob Notification
    |--------------------------------------------------------------------------
    |
    | Notification of each task
    |
    */
    public bool $notification = false;
    public string $from = 'email@example.com';
    public string $fromName = 'CronJob';
    public string $to = 'email@example.com';
    public string $toName = 'User';

    /*
    |--------------------------------------------------------------------------
    | Views
    |--------------------------------------------------------------------------
    |
    | Notification of each task
    |
    */
    public array $views = [
        'login'                       => '\Daycry\CronJob\Views\login',
        'dashboard'                   => '\Daycry\CronJob\Views\dashboard',
        'layout'                      => '\Daycry\CronJob\Views\layout',
        'logs'                        => '\Daycry\CronJob\Views\logs'
    ];

    /*
    |--------------------------------------------------------------------------
    | Dashboard login
    |--------------------------------------------------------------------------
    */
    public bool $enableDashboard = false;
    public string $username = 'admin';
    public string $password = 'admin';

    /*
    |--------------------------------------------------------------------------
    | Cronjobs
    |--------------------------------------------------------------------------
    |
    | Register any tasks within this method for the application.
    | Called by the TaskRunner.
    |
    | @param Scheduler $schedule
    */
    public function init(Scheduler $schedule)
    {
        // $schedule->command('foo:bar')->everyMinute();
        //
        // $schedule->command('foo:bar')->everyMinute();
       
        //$schedule->shell('cp foo bar')->daily( '02:00 pm' );
        $schedule->call(function() { 
           log_message('debug','Hola mundo');
         //ejecutar todo el codigo
    //crear funcion de alerta de seguimiento
    //alerta por plan de accion

            $model = new MriesgoPlanAccion();
            $result = $model->getCorreoPlan() ;
            
            foreach ($result as $key => $value) {
              
                $idplan = $value['id'];
                $idusuario = $value['usuario'];
                $correo_plan = $model->getCorreoPlanEnviados($idplan);
                if(!$correo_plan){
                    //Como no hay registros entonces hacemos la primera alerta desde la fecha inicio
                    $fecha_alerta = $value['fecha_ini']; 
                 
                    $fecha_fin = $value['fecha_fin'];
                    $fecha_actual = date("Y-m-d");
                    
                        if($fecha_alerta <= $fecha_fin){
                        
                            if($fecha_actual == $fecha_alerta ){
        
                                echo ("Es hora de la alerta inciial de Plan de Accion");
                                    //realizo el registro de la primera alerta 
                                    $insert = $model -> insertCorreoPlan($idplan,$fecha_actual,$idusuario);
                                   echo ($insert);
                                    if($insert){
                                        echo ("Correo registrado y enviado");
                                        // enviar al correo  $value['email_us']
                                        // nombre sy apellidos $value['nombre_us']  $value['apepat_us']  $value['apemat_us']
                                        // el nombvre del plan $value['plan_accion]
                                        // el estado: ah inciado
                                        //aleta $value['alerta] tipo de alerta

                                        $email = \Config\Services::email();
                                        $email->setTo($value['email_us']);
                                        $email->setFrom('noreply@gmail.com', 'Ejecucion Job');
                                        $email->setSubject('Prueba Job');
                                        $email->setMessage(
                                           view('mail/plan_accion',[
                                                
                                                    'fullname' => $value['nombres_us'].' '.$value['apepat_us'].' '.$value['apemat_us'],
                                                    'plan' => $value['plan_accion'],
                                                    'estado' => 'Ha Iniciado',
                                                    'alerta' => $value['alerta']
                                                
                                            ])
                                        );
                                        $email->send();
                                    }
                            }
                        }
               
                
                   
                    
                
                }else{
                    
                     //Si encuentro registros en la tabla envio sumo los dias del ultimo envio segun el valor de la alerta
                     $fecha_alerta = (date("Y-m-d",strtotime($correo_plan->fecha_envio."+ ".$value['valor']." days"))); 
                     $fecha_fin = $value['fecha_fin'];
                     $fecha_actual = date("Y-m-d");
                     // echo $fecha_actual;
                     if($fecha_alerta <= $fecha_fin){
                    
                         if($fecha_actual == $fecha_alerta ){
     
                             echo ("Es hora de la alerta con envios anteriores del plan de accion");
                                 $insert = $model -> insertCorreoPlan($idplan,$fecha_actual,$idusuario);
                                 if($insert){
                                     echo ("Correo registrado y enviado");
                                     // enviar al correo  $row['email_us']
                                          // nombre sy apellidos $row['nombre_us']  $row['apepat_us']  $row['apemat_us']
                                     // el nombvre del plan $row['plan_accion]
                                      // el estado: ah inciado
                                      //aleta $row['alerta] tipo de alerta

                                    $email = \Config\Services::email();
                                    $email->setTo($value['email_us']);
                                    $email->setFrom('noreply@gmail.com', 'Ejecucion Job');
                                    $email->setSubject('Prueba Job');
                                    $email->setMessage(
                                        view('mail/plan_accion',[
                                            
                                                'fullname' => $value['nombres_us'].' '.$value['apepat_us'].' '.$value['apemat_us'],
                                                'plan' => $value['plan_accion'],
                                                'estado' => 'Ha Iniciado',
                                                'alerta' => $value['alerta']
                                            
                                        ])
                                    );
                                    $email->send();
                                 }
                         }
                     
                   }
                }
              
            }
    


            $result2= $model->getCorreoActividad() ;
            
            foreach ($result2 as $key => $value) {
              
                $idactividad = $value['id_act'];
                $idusuario = $value['id_us'];
                $correo_plan = $model->getCorreoActividadesEnviados($idactividad);
                if(!$correo_plan){
                    //Como no hay registros entonces hacemos la primera alerta desde la fecha inicio
                    $fecha_alerta = $value['fecha_ini']; 
                 
                    $fecha_fin = $value['fecha_fin'];
                    $fecha_actual = date("Y-m-d");
                    
                        if($fecha_alerta <= $fecha_fin){
                        
                            if($fecha_actual == $fecha_alerta ){
        
                                echo ("Es hora de la alerta inicial de actividad");
                                    //realizo el registro de la primera alerta 
                                    $insert = $model -> insertCorreoActividad($idactividad,$fecha_actual,$idusuario);
                                 
                                    if($insert){
                                        echo ("Correo registrado y enviado");
                                        // enviar al correo  $value['email_us']
                                        // nombre sy apellidos $value['nombre_us']  $value['apepat_us']  $value['apemat_us']
                                        // el nombvre del plan $value['plan_accion]
                                        // el estado: ah inciado
                                        //aleta $value['alerta] tipo de alerta

                                        $email = \Config\Services::email();
                                        $email->setTo($value['email_us']);
                                        $email->setFrom('noreply@gmail.com', 'Ejecucion Job');
                                        $email->setSubject('Prueba Job');
                                        $email->setMessage(
                                            view('mail/plan_accion',[
                                                
                                                    'fullname' => $value['nombres_us'].' '.$value['apepat_us'].' '.$value['apemat_us'],
                                                    'plan' => $value['plan_accion'],
                                                    'estado' => 'Ha Iniciado',
                                                 'alerta' => $value['alerta']
                                                
                                            ])
                                        );
                                        $email->send();
                                        
                                    }
                            }
                        }
               
                
                   
                    
                
                }else{
                    
                     //Si encuentro registros en la tabla envio sumo los dias del ultimo envio segun el valor de la alerta
                     $fecha_alerta = (date("Y-m-d",strtotime($correo_plan->fecha_envio."+ ".$value['valor']." days"))); 
                     $fecha_fin = $value['fecha_fin'];
                     $fecha_actual = date("Y-m-d");
                     // echo $fecha_actual;
                     if($fecha_alerta <= $fecha_fin){
                    
                         if($fecha_actual == $fecha_alerta ){
     
                             echo ("Es hora de la alerta con datos de la actividad");
                                 $insert = $model -> insertCorreoActividad($idplan,$fecha_actual,$idusuario);
                                 if($insert){
                                     echo ("Correo registrado y enviado");
                                     // enviar al correo  $row['email_us']
                                          // nombre sy apellidos $row['nombre_us']  $row['apepat_us']  $row['apemat_us']
                                     // el nombvre del plan $row['plan_accion]
                                      // el estado: ah inciado
                                      //aleta $row['alerta] tipo de alerta
                                      $email = \Config\Services::email();
                                      $email->setTo($value['email_us']);
                                      $email->setFrom('noreply@gmail.com', 'Ejecucion Job');
                                      $email->setSubject('Prueba Job');
                                      $email->setMessage(
                                          view('mail/plan_accion',[
                                              
                                                  'fullname' => $value['nombres_us'].' '.$value['apepat_us'].' '.$value['apemat_us'],
                                                  'plan' => $value['plan_accion'],
                                                  'estado' => 'Ha Iniciado',
                                                  'alerta' => $value['alerta']
                                              
                                          ])
                                      );
                                      $email->send();
                                 }
                         }
                     
                   }
                }
              
            }
   
     
       
        })->everyMinute();
       
    }
}
