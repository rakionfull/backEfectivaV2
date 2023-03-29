<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (is_file(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();

// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
// http://localhost:8080/login
$routes->post('/login', 'Login::index');
// http://localhost:8080/captcha
$routes->get('/newcaptcha', 'Login::newCaptcha');
// http://localhost:8080/captcha
$routes->post('/validaCaptcha', 'Login::validaCaptcha');
// http://localhost:8080/register
$routes->post('/register', 'Register::register', ['filter' => 'authFilter']);
// $routes->post('/register2', 'Register::register');
// $routes->cli('Task','Task::mensaje');

  $routes->get('Task','Task::mensaje');
// http://localhost:8080/api/
$routes->group('/api',['namespace' => 'App\Controllers'], function ($routes) {
    $routes->post('logout/(:num)', 'Login::logout/$1',['filter' => 'authFilter']);
    
    $routes->post('change_pass', 'Login::change_pass',['filter' => 'authFilter']);
    $routes->get('dashboard', 'Home::dashboard',['filter' => 'authFilter']);
    $routes->get('getConfigPass', 'Home::getConfigPass',['filter' => 'authFilter']);
    $routes->post('addConfigPass', 'Home::addConfigPass',['filter' => 'authFilter']);
    $routes->post('addUser', 'Home::addUser',['filter' => 'authFilter']);
    $routes->put('updateEstadoUser', 'Home::updateEstadoUser', ['filter' => 'authFilter']);
    $routes->put('updateUser/(:num)', 'Home::updateUser/$1', ['filter' => 'authFilter']);
    $routes->delete('deleteUser/(:num)', 'Home::deleteUser/$1', ['filter' => 'authFilter']);
    $routes->get('getUsers', 'Home::getUsers',['filter' => 'authFilter']);
    $routes->get('getUser/(:num)', 'Home::getUser/$1',['filter' => 'authFilter']);
    $routes->get('getPerfiles/', 'Home::getPerfiles',['filter' => 'authFilter']);
    $routes->post('addPerfil', 'Home::addPerfil',['filter' => 'authFilter']);
    $routes->post('validarPerfil', 'Home::validarPerfil',['filter' => 'authFilter']);
    $routes->post('updatePerfil', 'Home::updatePerfil',['filter' => 'authFilter']);
    $routes->delete('deletePerfil', 'Home::deletePerfil',['filter' => 'authFilter']);
    $routes->get('getDetPerfil', 'Home::getDetPerfil',['filter' => 'authFilter']);
    $routes->get('getEscenario', 'Home::getEscenario',['filter' => 'authFilter']);

    $routes->get('getPermisos', 'Home::getPermisos',['filter' => 'authFilter']);

    $routes->get('getModulos', 'Home::getModulos',['filter' => 'authFilter']);
    $routes->get('getOpcion', 'Home::getOpcion',['filter' => 'authFilter']);
    $routes->get('getItem', 'Home::getItem',['filter' => 'authFilter']);

    //reportes
    $routes->get('dataUser', 'Home::dataUser',['filter' => 'authFilter']);
   

    $routes->post('updateView', 'Home::updateView',['filter' => 'authFilter']);
    $routes->post('updateCreate', 'Home::updateCreate',['filter' => 'authFilter']);
    $routes->post('updateUpdate', 'Home::updateUpdate',['filter' => 'authFilter']);
    $routes->post('updateDelete', 'Home::updateDelete',['filter' => 'authFilter']);

    //crud de empresa
    $routes->get('getEmpresas', 'Activo::getEmpresas',['filter' => 'authFilter']);
    $routes->get('getEmpresasByActivo', 'Activo::getEmpresasByActivo',['filter' => 'authFilter']);
    $routes->post('addEmpresa', 'Activo::addEmpresa',['filter' => 'authFilter']);
    $routes->post('updateEmpresa', 'Activo::updateEmpresa',['filter' => 'authFilter']);
    $routes->delete('deleteEmpresa', 'Activo::deleteEmpresa',['filter' => 'authFilter']);
    //crud de area
    
    $routes->get('getArea/(:num)', 'Activo::getArea/$1',['filter' => 'authFilter']);
    $routes->post('addArea', 'Activo::addArea',['filter' => 'authFilter']);
    $routes->post('updateArea', 'Activo::updateArea',['filter' => 'authFilter']);
    $routes->get('getAreasByActivo', 'Activo::getAreasByActivo',['filter' => 'authFilter']);
    $routes->delete('deleteArea', 'Activo::deleteArea',['filter' => 'authFilter']);

    $routes->get('getAreasEmpresa/(:num)', 'Activo::getAreasEmpresa/$1',['filter' => 'authFilter']);
    // $routes->post('addAreaEmpresa', 'Activo::addAreaEmpresa',['filter' => 'authFilter']);
    // $routes->post('updateAreaEmpresa', 'Activo::updateAreaEmpresa',['filter' => 'authFilter']);


    //CRUD Valor Activo
    $routes->post('validarValorActivo', 'Activo::validarValorActivo',['filter' => 'authFilter']);
    $routes->get('getValorActivoByActivo', 'Activo::getValorActivoByActivo',['filter' => 'authFilter']);
    $routes->get('getValorActivo', 'Activo::getValorActivo',['filter' => 'authFilter']);
    $routes->post('addValorActivo', 'Activo::addValorActivo',['filter' => 'authFilter']);
    $routes->post('updateValorActivo', 'Activo::updateValorActivo',['filter' => 'authFilter']);
    $routes->delete('deleteValorActivo', 'Activo::deleteValorActivo',['filter' => 'authFilter']);

    //CRUD Tipo Activo
    $routes->post('validarTipoActivo', 'Activo::validarTipoActivo',['filter' => 'authFilter']);
    $routes->get('getTipoActivoByActivo', 'Activo::getTipoActivoByActivo',['filter' => 'authFilter']);
    $routes->get('getTipoActivo', 'Activo::getTipoActivo',['filter' => 'authFilter']);
    $routes->post('addTipoActivo', 'Activo::addTipoActivo',['filter' => 'authFilter']);
    $routes->post('updateTipoActivo', 'Activo::updateTipoActivo',['filter' => 'authFilter']);
    $routes->delete('deleteTipoActivo', 'Activo::deleteTipoActivo',['filter' => 'authFilter']);
    $routes->get('listaCategoriaByActivo', 'Activo::listaCategoriaByActivo',['filter' => 'authFilter']);

    //CRUD Clasificacion de informacion
    $routes->post('validarClasInfo', 'Activo::validarClasInfo',['filter' => 'authFilter']);
    $routes->get('getClasInformacion', 'Activo::getClasInformacion',['filter' => 'authFilter']);
    $routes->post('addClasInformacion', 'Activo::addClasInformacion',['filter' => 'authFilter']);
    $routes->post('updateClasInformacion', 'Activo::updateClasInformacion',['filter' => 'authFilter']);
    $routes->delete('deleteClasInfo', 'Activo::deleteClasInfo',['filter' => 'authFilter']);

    //CRUD Aspectos de Seguridad
    $routes->post('validarApectoSeg', 'Activo::validarApectoSeg',['filter' => 'authFilter']);
    $routes->get('getAspectoByActivo', 'Activo::getAspectoByActivo',['filter' => 'authFilter']);
    $routes->get('getAspectoSeg', 'Activo::getAspectoSeg',['filter' => 'authFilter']);
    $routes->post('addAspectoSeg', 'Activo::addAspectoSeg',['filter' => 'authFilter']);
    $routes->post('updateAspectoSeg', 'Activo::updateAspectoSeg',['filter' => 'authFilter']);
    $routes->delete('deleteAspectoSeg', 'Activo::deleteAspectoSeg',['filter' => 'authFilter']);

    //CRUD Unidades
    $routes->get('getUnidades/(:num)', 'Activo::getUnidades/$1',['filter' => 'authFilter']);
    $routes->get('getUnidadByActivo', 'Activo::getUnidadByActivo',['filter' => 'authFilter']);
    $routes->post('addUnidades', 'Activo::addUnidades',['filter' => 'authFilter']);
    $routes->post('updateUnidades', 'Activo::updateUnidades',['filter' => 'authFilter']);
    $routes->delete('deleteUnidad', 'Activo::deleteUnidad',['filter' => 'authFilter']);
    $routes->get('getEmpresaAreaUnidades', 'Activo::getEmpresaAreaUnidades',['filter' => 'authFilter']);
    

    //CRUD Macroprocesos
    $routes->get('getMacroproceso/(:num)', 'Activo::getMacroproceso/$1',['filter' => 'authFilter']);
    $routes->post('addMacroproceso', 'Activo::addMacroproceso',['filter' => 'authFilter']);
    $routes->post('updateMacroproceso', 'Activo::updateMacroproceso',['filter' => 'authFilter']);
    $routes->get('getMacroprocesoByActivo', 'Activo::getMacroprocesoByActivo',['filter' => 'authFilter']);
    $routes->get('listaProcesoByMacro', 'Activo::listaProcesoByMacro',['filter' => 'authFilter']);
    $routes->delete('deleteMacroproceso', 'Activo::deleteMacroproceso',['filter' => 'authFilter']);

    //CRUD Procesos
    $routes->get('getProceso/(:num)', 'Activo::getProceso/$1',['filter' => 'authFilter']);
    $routes->post('addProceso', 'Activo::addProceso',['filter' => 'authFilter']);
    $routes->post('updateProceso', 'Activo::updateProceso',['filter' => 'authFilter']);
    $routes->get('getProcesoByActivo', 'Activo::getProcesoByActivo',['filter' => 'authFilter']);
    $routes->delete('deleteProceso', 'Activo::deleteProceso',['filter' => 'authFilter']);


    //CRUD Posicion/Puesto
    $routes->post('validarPosicion', 'Activo::validarPosicion',['filter' => 'authFilter']);
    $routes->get('getPosicionByActivo', 'Activo::getPosicionByActivo',['filter' => 'authFilter']);
    $routes->get('getPosicion/(:num)', 'Activo::getPosicion/$1',['filter' => 'authFilter']);
    $routes->get('getPosicionByArea/(:num)', 'Activo::getPosicionByArea/$1',['filter' => 'authFilter']);
    $routes->get('getPosicionByUnidad', 'Activo::getPosicionByUnidad',['filter' => 'authFilter']);
    $routes->post('addPosicion', 'Activo::addPosicion',['filter' => 'authFilter']);
    $routes->post('updatePosicion', 'Activo::updatePosicion',['filter' => 'authFilter']);
    $routes->delete('deletePosicion', 'Activo::deletePosicion',['filter' => 'authFilter']);

    //CRUD Valoracion de activo
    $routes->post('validarValActivo', 'Activo::validarValActivo',['filter' => 'authFilter']);
    $routes->get('getValActivo', 'Activo::getValActivo',['filter' => 'authFilter']);
    $routes->post('addValActivo', 'Activo::addValActivo',['filter' => 'authFilter']);
    $routes->post('updateValActivo', 'Activo::updateValActivo',['filter' => 'authFilter']);
    $routes->delete('deleteValActivo', 'Activo::deleteValActivo',['filter' => 'authFilter']);

    //CRUD Categoria de activo
    $routes->post('validarCatActivo', 'Activo::validarCatActivo',['filter' => 'authFilter']);
    $routes->get('getCatActivo', 'Activo::getCatActivo',['filter' => 'authFilter']);
    $routes->post('addCatActivo', 'Activo::addCatActivo',['filter' => 'authFilter']);
    $routes->post('updateCatActivo', 'Activo::updateCatActivo',['filter' => 'authFilter']);
    $routes->delete('deleteCatActivo', 'Activo::deleteCatActivo',['filter' => 'authFilter']);

      //CRUD Ubicacion de activo
    $routes->post('validarUbiActivo', 'Activo::validarUbiActivo',['filter' => 'authFilter']);
    $routes->get('getUbiActivo', 'Activo::getUbiActivo',['filter' => 'authFilter']);
    $routes->post('addUbiActivo', 'Activo::addUbiActivo',['filter' => 'authFilter']);
    $routes->post('updateUbiActivo', 'Activo::updateUbiActivo',['filter' => 'authFilter']);
    $routes->delete('deleteUbiActivo', 'Activo::deleteUbiActivo',['filter' => 'authFilter']);

    //CONTINENTE
    $routes->get('getContinente', 'Activo::getContinente',['filter' => 'authFilter']);
    $routes->get('getPais', 'Activo::getPais',['filter' => 'authFilter']);
    $routes->get('getCiudad', 'Activo::getCiudad',['filter' => 'authFilter']);


    // CRUD TIPO RIESGOS
    $routes->get('getTipoRiesgos', 'TipoRiesgosController::index',['filter' => 'authFilter']);
    $routes->get('showTipoRiesgo/(:num)','TipoRiesgosController::show/$1',['filter' => 'authFilter']);
    $routes->post('addTipoRiesgo', 'TipoRiesgosController::store',['filter' => 'authFilter']);
    $routes->post('updateTipoRiesgo', 'TipoRiesgosController::update',['filter' => 'authFilter']);
    $routes->post('deleteTipoRiesgo/(:num)', 'TipoRiesgosController::destroy/$1', ['filter' => 'authFilter']);

    // CRUD PROBABILIDAD RIESGOS
    $routes->get('getActives/(:num)','ProbabilidadRiesgoController::getActives/$1',['filter' => 'authFilter']);
    $routes->get('getProbabilidadRiesgo/(:num)','ProbabilidadRiesgoController::index/$1',['filter' => 'authFilter']);
    $routes->post('addProbabilidadRiesgo1','ProbabilidadRiesgoController::store_escenario_1',['filter' => 'authFilter']);
    $routes->post('addProbabilidadRiesgo2','ProbabilidadRiesgoController::store_escenario_2',['filter' => 'authFilter']);
    $routes->post('updateProbabilidadRiesgo1','ProbabilidadRiesgoController::edit_escenario_1',['filter' => 'authFilter']);
    $routes->post('updateProbabilidadRiesgo2','ProbabilidadRiesgoController::edit_escenario_2',['filter' => 'authFilter']);
    $routes->post('deleteProbabilidadRiesgo/(:num)', 'ProbabilidadRiesgoController::destroy/$1', ['filter' => 'authFilter']);

    // CRUD IMPACTO RIESGOS
    $routes->get('getActivesImpacto/(:num)','ImpactoRiesgoController::getActives/$1',['filter' => 'authFilter']);
    $routes->get('getImpactoRiesgo/(:num)','ImpactoRiesgoController::index/$1',['filter' => 'authFilter']);
    $routes->post('addImpactoRiesgo1','ImpactoRiesgoController::store_escenario_1',['filter' => 'authFilter']);
    $routes->post('addImpactoRiesgo2','ImpactoRiesgoController::store_escenario_2',['filter' => 'authFilter']);
    $routes->post('updateImpactoRiesgo1','ImpactoRiesgoController::edit_escenario_1',['filter' => 'authFilter']);
    $routes->post('updateImpactoRiesgo2','ImpactoRiesgoController::edit_escenario_2',['filter' => 'authFilter']);
    $routes->post('deleteImpactoRiesgo/(:num)', 'ImpactoRiesgoController::destroy/$1', ['filter' => 'authFilter']);

    // CRUD NIVEL RIESGO
    $routes->get('getNivelRiesgo','NivelRiesgoController::index',['filter' => 'authFilter']);
    $routes->get('showNivelRiesgo/(:num)','NivelRiesgoController::show/$1',['filter' => 'authFilter']);
    $routes->post('addNivelRiesgo','NivelRiesgoController::store',['filter' => 'authFilter']);
    $routes->post('updateNivelRiesgo/(:num)','NivelRiesgoController::update/$1',['filter' => 'authFilter']);
    $routes->post('deleteNivelRiesgo/(:num)', 'NivelRiesgoController::destroy/$1', ['filter' => 'authFilter']);

    // CRUD TIPO DE AMENAZA
    $routes->get('getTiposAmenaza','TipoAmenazaController::index',['filter' => 'authFilter']);
    $routes->get('showTipoAmenaza/(:num)','TipoAmenazaController::show/$1',['filter' => 'authFilter']);
    $routes->post('addTipoAmenaza','TipoAmenazaController::store',['filter' => 'authFilter']);
    $routes->post('updateTipoAmenaza/(:num)','TipoAmenazaController::update/$1',['filter' => 'authFilter']);
    $routes->post('deleteTipoAmenaza/(:num)', 'TipoAmenazaController::destroy/$1', ['filter' => 'authFilter']);
    
    // CRUD DESC DE AMENAZA
    $routes->get('getDescAmenaza','DescripcionAmenazaController::index',['filter' => 'authFilter']);
    $routes->get('showDescAmenaza/(:num)','DescripcionAmenazaController::show/$1',['filter' => 'authFilter']);
    $routes->post('addDescAmenaza','DescripcionAmenazaController::store',['filter' => 'authFilter']);
    $routes->post('updateDescAmenaza/(:num)','DescripcionAmenazaController::update/$1',['filter' => 'authFilter']);
    $routes->post('deleteDescAmenaza/(:num)', 'DescripcionAmenazaController::destroy/$1', ['filter' => 'authFilter']);
    
    // CRUD CATEGORIAS VULNERABILIDAD
    $routes->get('getCategoriasVulnerabilidad','CategoriasVulnerabilidadController::index',['filter' => 'authFilter']);
    $routes->get('showCategoriasVulnerabilidad/(:num)','CategoriasVulnerabilidadController::show/$1',['filter' => 'authFilter']);
    $routes->post('addCategoriasVulnerabilidad','CategoriasVulnerabilidadController::store',['filter' => 'authFilter']);
    $routes->post('updateCategoriasVulnerabilidad/(:num)','CategoriasVulnerabilidadController::update/$1',['filter' => 'authFilter']);
    $routes->post('deleteCategoriasVulnerabilidad/(:num)', 'CategoriasVulnerabilidadController::destroy/$1', ['filter' => 'authFilter']);
    
     // CRUD DESC VULNERABILIDAD
     $routes->get('getDescVulnerabilidad','DescripcionVulnerabilidadController::index',['filter' => 'authFilter']);
     $routes->post('addDescVulnerabilidad','DescripcionVulnerabilidadController::store',['filter' => 'authFilter']);
     $routes->post('updateDescVulnerabilidad/(:num)','DescripcionVulnerabilidadController::update/$1',['filter' => 'authFilter']);
     $routes->post('deleteDescVulnerabilidad/(:num)', 'DescripcionVulnerabilidadController::destroy/$1', ['filter' => 'authFilter']);
 
     $routes->post('updateScene/(:num)','ProbabilidadRiesgoController::updateScene/$1');
 
 
 
     $routes->post('deleteDescVulnerabilidad/(:num)', 'DescripcionVulnerabilidadController::destroy/$1', ['filter' => 'authFilter']);
 
 
     $routes->post('updateScene/(:num)','ProbabilidadRiesgoController::updateScene/$1');
 
    //controles
    //cobertura
   
    $routes->get('getCobertura', 'CoberturaController::getCobertura',['filter' => 'authFilter']);
    $routes->post('addCobertura', 'CoberturaController::addCobertura',['filter' => 'authFilter']);
    $routes->post('updateCobertura', 'CoberturaController::updateCobertura',['filter' => 'authFilter']);
    $routes->delete('deleteCobertura', 'CoberturaController::deleteCobertura',['filter' => 'authFilter']);

    //caracteristicas de contorl
   
    $routes->get('getOpcionesCaracteristica/(:any)', 'CaractControlController::getOpcionesCaracteristica/$1',['filter' => 'authFilter']);
    $routes->get('getCaractControl/(:any)/(:any)/(:any)', 'CaractControlController::getCaractControl/$1/$2/$3',['filter' => 'authFilter']);
    $routes->post('addCaractControl', 'CaractControlController::addCaractControl',['filter' => 'authFilter']);
    $routes->post('updateCaractControl', 'CaractControlController::updateCaractControl',['filter' => 'authFilter']);
    $routes->delete('deleteCaractControl', 'CaractControlController::deleteCaractControl',['filter' => 'authFilter']);

     //Diseño

     $routes->get('getOpcionesDisenio', 'DisenioController::getOpcionesDisenio',['filter' => 'authFilter']);
     $routes->get('getDisenio', 'DisenioController::getDisenio',['filter' => 'authFilter']);
     $routes->post('addDisenio', 'DisenioController::addDisenio',['filter' => 'authFilter']);
     $routes->post('updateDisenio', 'DisenioController::updateDisenio',['filter' => 'authFilter']);
     $routes->delete('deleteDisenio', 'DisenioController::deleteDisenio',['filter' => 'authFilter']);

    //Definicion

    $routes->get('getDefinicion', 'DefinicionController::getDefinicion',['filter' => 'authFilter']);
    $routes->post('addDefinicion', 'DefinicionController::addDefinicion',['filter' => 'authFilter']);
    $routes->post('updateDefinicion', 'DefinicionController::updateDefinicion',['filter' => 'authFilter']);
    $routes->delete('deleteDefinicion', 'DefinicionController::deleteDefinicion',['filter' => 'authFilter']);

    //Objetivo

    $routes->get('getObjetivo', 'ObjetivoController::getObjetivo',['filter' => 'authFilter']);
    $routes->post('addObjetivo', 'ObjetivoController::addObjetivo',['filter' => 'authFilter']);
    $routes->post('updateObjetivo', 'ObjetivoController::updateObjetivo',['filter' => 'authFilter']);
    $routes->delete('deleteObjetivo', 'ObjetivoController::deleteObjetivo',['filter' => 'authFilter']);

      //Clasificacion Diseño

      $routes->get('getCalificacionDise', 'CalificacionDiseController::getCalificacionDise',['filter' => 'authFilter']);
      $routes->post('addCalificacionDise', 'CalificacionDiseController::addCalificacionDise',['filter' => 'authFilter']);
      $routes->post('updateCalificacionDise', 'CalificacionDiseController::updateCalificacionDise',['filter' => 'authFilter']);
      $routes->delete('deleteCalificacionDise', 'CalificacionDiseController::deleteCalificacionDise',['filter' => 'authFilter']);

      //Operatividad
      $routes->get('getOpcionesOperatividad', 'OperatividadController::getOpcionesOperatividad',['filter' => 'authFilter']);
      $routes->get('getOperatividad', 'OperatividadController::getOperatividad',['filter' => 'authFilter']);
      $routes->post('addOperatividad', 'OperatividadController::addOperatividad',['filter' => 'authFilter']);
      $routes->post('updateOperatividad', 'OperatividadController::updateOperatividad',['filter' => 'authFilter']);
      $routes->delete('deleteOperatividad', 'OperatividadController::deleteOperatividad',['filter' => 'authFilter']);

      //prueba o revision

      $routes->get('getPrueba', 'PruebaController::getPrueba',['filter' => 'authFilter']);
      $routes->post('addPrueba', 'PruebaController::addPrueba',['filter' => 'authFilter']);
      $routes->post('updatePrueba', 'PruebaController::updatePrueba',['filter' => 'authFilter']);
      $routes->delete('deletePrueba', 'PruebaController::deletePrueba',['filter' => 'authFilter']);

      //Automatizacion

      $routes->get('getAutomatizacion', 'AutomatizacionController::getAutomatizacion',['filter' => 'authFilter']);
      $routes->post('addAutomatizacion', 'AutomatizacionController::addAutomatizacion',['filter' => 'authFilter']);
      $routes->post('updateAutomatizacion', 'AutomatizacionController::updateAutomatizacion',['filter' => 'authFilter']);
      $routes->delete('deleteAutomatizacion', 'AutomatizacionController::deleteAutomatizacion',['filter' => 'authFilter']);


    //Clasificacion Operatividad

    $routes->get('getCalificacionOpera', 'CalificacionOperaController::getCalificacionOpera',['filter' => 'authFilter']);
    $routes->post('addCalificacionOpera', 'CalificacionOperaController::addCalificacionOpera',['filter' => 'authFilter']);
    $routes->post('updateCalificacionOpera', 'CalificacionOperaController::updateCalificacionOpera',['filter' => 'authFilter']);
    $routes->delete('deleteCalificacionOpera', 'CalificacionOperaController::deleteCalificacionOpera',['filter' => 'authFilter']);

    //Clasificacion Operatividad

    $routes->get('getCaracteristicaOpera', 'CaracteristicaOperaController::getCaracteristicaOpera',['filter' => 'authFilter']);
    $routes->post('addCaracteristicaOpera', 'CaracteristicaOperaController::addCaracteristicaOpera',['filter' => 'authFilter']);
    $routes->post('updateCaracteristicaOpera', 'CaracteristicaOperaController::updateCaracteristicaOpera',['filter' => 'authFilter']);
    $routes->delete('deleteCaracteristicaOpera', 'CaracteristicaOperaController::deleteCaracteristicaOpera',['filter' => 'authFilter']);

     //Clasificacion Operatividad

     $routes->get('getValoracionRiesgo', 'ValoracionRiesgoController::getValoracionRiesgo',['filter' => 'authFilter']);
     $routes->post('addValoracionRiesgo', 'ValoracionRiesgoController::addValoracionRiesgo',['filter' => 'authFilter']);
     $routes->post('updateValoracionRiesgo', 'ValoracionRiesgoController::updateValoracionRiesgo',['filter' => 'authFilter']);
     $routes->delete('deleteValoracionRiesgo', 'ValoracionRiesgoController::deleteValoracionRiesgo',['filter' => 'authFilter']);
    
     $routes->get('getImpactoRiesgoByActivo', 'ValoracionRiesgoController::getImpactoRiesgoByActivo',['filter' => 'authFilter']);
     $routes->get('getProbabilidadRiesgoByActivo', 'ValoracionRiesgoController::getProbabilidadRiesgoByActivo',['filter' => 'authFilter']);
     $routes->get('getDataMatriz', 'ValoracionRiesgoController::getDataMatriz',['filter' => 'authFilter']);
  //evlauacion de control
     $routes->get('getEvaluacionControl', 'EvaluacionControlController::getEvaluacionControl',['filter' => 'authFilter']);
     $routes->post('addEvaluacionControl', 'EvaluacionControlController::addEvaluacionControl',['filter' => 'authFilter']);
     $routes->post('updateEvaluacionControl', 'EvaluacionControlController::updateEvaluacionControl',['filter' => 'authFilter']);
     $routes->delete('deleteEvaluacionControl', 'EvaluacionControlController::deleteEvaluacionControl',['filter' => 'authFilter']);
     $routes->get('getDetalleEvaluacionControl/(:num)','EvaluacionControlController::getDetalleEvaluacionControl/$1',['filter' => 'authFilter']);
     $routes->get('getDisenioCalificacion', 'EvaluacionControlController::getDisenioCalificacion',['filter' => 'authFilter']);
     $routes->get('getOperatividadCalificacion', 'EvaluacionControlController::getOperatividadCalificacion',['filter' => 'authFilter']);

     $routes->get('getCalificacionSubMenu', 'EvaluacionControlController::getCalificacionSubMenu',['filter' => 'authFilter']);
     $routes->get('getCalificacionOpcion/(:num)', 'EvaluacionControlController::getCalificacionOpcion/$1',['filter' => 'authFilter']);

 
    //Aplicaicon de la probabilidad
     $routes->get('getAplicacionProbabilidad', 'AplicacionProbabilidadController::getAplicacionProbabilidad',['filter' => 'authFilter']);
     $routes->post('addAplicacionProbabilidad', 'AplicacionProbabilidadController::addAplicacionProbabilidad',['filter' => 'authFilter']);
     $routes->post('updateAplicacionProbabilidad', 'AplicacionProbabilidadController::updateAplicacionProbabilidad',['filter' => 'authFilter']);
     $routes->delete('deleteAplicacionProbabilidad', 'AplicacionProbabilidadController::deleteAplicacionProbabilidad',['filter' => 'authFilter']);

     //Aplicaicon del impacto
     $routes->get('getAplicacionImpacto', 'AplicacionImpactoController::getAplicacionImpacto',['filter' => 'authFilter']);
     $routes->post('addAplicacionImpacto', 'AplicacionImpactoController::addAplicacionImpacto',['filter' => 'authFilter']);
     $routes->post('updateAplicacionImpacto', 'AplicacionImpactoController::updateAplicacionImpacto',['filter' => 'authFilter']);
     $routes->delete('deleteAplicacionImpacto', 'AplicacionImpactoController::deleteAplicacionImpacto',['filter' => 'authFilter']);


     $routes->get('getEstado', 'Activo::getEstado',['filter' => 'authFilter']);
    $routes->post('addEstado', 'Activo::addEstado',['filter' => 'authFilter']);    
    $routes->post('updateEstado', 'Activo::updateEstado',['filter' => 'authFilter']);
    $routes->post('deleteEstado', 'Activo::deleteEstado',['filter' => 'authFilter']);


    $routes->get('getPrioridad', 'Activo::getPrioridad',['filter' => 'authFilter']);
    $routes->post('addPrioridad', 'Activo::addPrioridad',['filter' => 'authFilter']);
    $routes->post('updatePrioridad', 'Activo::updatePrioridad',['filter' => 'authFilter']);
    $routes->delete('deletePrioridad', 'Activo::deletePrioridad',['filter' => 'authFilter']);
    


    $routes->get('getAlerta_seguimiento', 'Activo::getAlerta_seguimiento',['filter' => 'authFilter']);
    $routes->post('addAlerta_seguimiento', 'Activo::addAlerta_seguimiento',['filter' => 'authFilter']);
    $routes->post('updateAlerta_seguimiento', 'Activo::updateAlerta_seguimiento',['filter' => 'authFilter']);
    $routes->delete('deleteAlerta_seguimiento', 'Activo::deleteAlerta_seguimiento',['filter' => 'authFilter']);
    


   //    RIESGO PLAN DE ACCIÓN

   $routes->get('getPlanAccion', 'Activo::getPlanAccion',['filter' => 'authFilter']);
   $routes->post('addPlanAccion', 'Activo::addPlanAccion',['filter' => 'authFilter']);
   $routes->post('updatePlanAccion', 'Activo::updatePlanAccion',['filter' => 'authFilter']);
   $routes->delete('deletePlanAccion', 'Activo::deletePlanAccion',['filter' => 'authFilter']);


   $routes->get('getActividadPlan/(:num)', 'Activo::getActividadPlan/$1',['filter' => 'authFilter']);
   $routes->get('getPlan/(:num)', 'Activo::getPlan/$1',['filter' => 'authFilter']);
   $routes->get('getDetallePlan/(:num)', 'Activo::getDetallePlan/$1',['filter' => 'authFilter']);
   $routes->post('getActividadByPlan', 'Activo::getActividadByPlan',['filter' => 'authFilter']);
   $routes->post('addActividadPlan', 'Activo::addActividadPlan',['filter' => 'authFilter']);
   $routes->post('updateActividadPlan', 'Activo::updateActividadPlan',['filter' => 'authFilter']);
   $routes->delete('deleteActividadPlan', 'Activo::deleteActividadPlan',['filter' => 'authFilter']);


   
       //  CRUD INVENTARIO CLASIFICACION ACTIVO
      $routes->get('listInventarioClasificacionActivo/(:num)','InventarioClasificacionActivoController::index/$1');
      $routes->get('getAllHistoricos/(:num)','InventarioClasificacionActivoController::getAllHistoricos/$1');
      $routes->get('getAllHistoricosByUser/(:num)/(:num)','InventarioClasificacionActivoController::getAllHistoricosByUser/$1/$2');
      $routes->get('getInventarioClasificacionActivo/(:num)','InventarioClasificacionActivoController::show/$1');
      $routes->get('getInventarioClasificacionActivoUser/(:num)/(:num)','InventarioClasificacionActivoController::getByUser/$1/$2');
      $routes->post('addInventarioClasificacionActivo','InventarioClasificacionActivoController::store');
      $routes->post('updateInventarioClasificacionActivo/(:num)','InventarioClasificacionActivoController::update/$1');
      $routes->post('deleteInventarioClasificacionActivo/(:num)','InventarioClasificacionActivoController::destroy/$1');
      $routes->post('getValorByValoraciones','InventarioClasificacionActivoController::getValorByValoraciones');
      $routes->post('listByValoraciones','InventarioClasificacionActivoController::listByValoraciones');
      $routes->post('updateStatus/(:num)','InventarioClasificacionActivoController::updateStatus/$1');
  

      // CRUD EVALUACION RIESGO
      $routes->get('listEvaluacionRiesgos/(:num)','EvaluacionRiesgoController::index/$1');
      $routes->get('getListHistorial/(:num)','EvaluacionRiesgoController::getListHistorial/$1');
      $routes->get('getEvaluacionRiesgo/(:num)','EvaluacionRiesgoController::show/$1');
      $routes->get('countByValor','EvaluacionRiesgoController::countByValor');
      $routes->post('addEvaluacionRiesgo','EvaluacionRiesgoController::store');
      $routes->post('addEvaluacionRiesgoHistorial','EvaluacionRiesgoController::store_historial');
      $routes->post('updateEvaluacionRiesgo/(:num)','EvaluacionRiesgoController::update/$1');
      $routes->post('deleteEvaluacionRiesgo/(:num)','EvaluacionRiesgoController::destroy/$1');
      $routes->post('getValoracionByProbabilidadImpacto','ValoracionRiesgoController::getValoracionByProbabilidadImpacto');
      $routes->post('getAplicacionProbabilidadByCaracteristica','AplicacionProbabilidadController::getByCaracteristica');
      $routes->post('getAplicacionImpactoByCaracteristica','AplicacionImpactoController::getByCaracteristica');
      $routes->post('getProbabilidadByDescription','ProbabilidadRiesgoController::getByDescription');
      $routes->post('getImpactoByDescription','ImpactoRiesgoController::getByDescription');
      $routes->get('getEvaluacionRiesgoControlesByEvaluacion/(:num)','EvaluacionRiesgoController::getEvaluacionRiesgoControlesByEvaluacion/$1');


      //DATOS PARA REGISTRO DE CONTROLES
      $routes->get('getControlRiesgo','RegistroControlesController::getControlRiesgo');
      $routes->get('getPlanControl','RegistroControlesController::getPlanControl');
      $routes->get('getRegistroControles','RegistroControlesController::getRegistroControles');
      $routes->get('getRegistroControl/(:num)','RegistroControlesController::getRegistroControl/$1');
      $routes->get('getRegistroDetalleControl/(:num)','RegistroControlesController::getRegistroDetalleControl/$1');
      $routes->get('LastIdControles','RegistroControlesController::LastIdControles');
      $routes->get('getCCMenu','RegistroControlesController::getCCMenu');
      $routes->get('getCCSubMenu','RegistroControlesController::getCCSubMenu');
      $routes->get('getCCOpciones','RegistroControlesController::getCCOpciones');
      $routes->get('getCoberturaByActivo','RegistroControlesController::getCoberturaByActivo');
      $routes->get('getData/(:num)','RegistroControlesController::getData/$1');
      $routes->post('calificarControl/(:num)','RegistroControlesController::calificarControl/$1');
      $routes->post('ejecutarEvaluacion','RegistroControlesController::ejecutarEvaluacion');
      $routes->post('addControles','RegistroControlesController::addControles');
      $routes->post('updateControles','RegistroControlesController::updateControles');
      $routes->delete('deleteControles','RegistroControlesController::deleteControles');

      //consulta especial para vista de tabla contorles
      $routes->get('getRegistroControles2','RegistroControlesController::getRegistroControles2');


      //adicionales
      $routes->get('getCaracteristicaOpcion','EvaluacionControlController::getCaracteristicaOpcion');

      // LLENADO DE COMBOS MODAL ACTIVIDADES
      $routes->post('getUserByActivo', 'Activo::getUserByActivo',['filter' => 'authFilter']);
      $routes->post('getUserByEmpresa', 'Activo::getUserByEmpresa',['filter' => 'authFilter']);
      $routes->post('getEstadoByActivo', 'Activo::getEstadoByActivo',['filter' => 'authFilter']);
      $routes->post('getPrioridadByActivo', 'Activo::getPrioridadByActivo',['filter' => 'authFilter']);
      $routes->post('getAlertaByActivo', 'Activo::getAlertaByActivo',['filter' => 'authFilter']);
      

      // Carga de combos

      $routes->get('getComboAreas', 'Activo::getComboAreas',['filter' => 'authFilter']);
      $routes->get('getComboUnidad', 'Activo::getComboUnidad',['filter' => 'authFilter']);
      $routes->get('getComboPosicion', 'Activo::getComboPosicion',['filter' => 'authFilter']);
      $routes->get('getUserNombreByActivo', 'Activo::getUserNombreByActivo',['filter' => 'authFilter']);
      $routes->get('getAlerta', 'Activo::getAlerta',['filter' => 'authFilter']);
      });

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}