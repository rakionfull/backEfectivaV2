-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2023 a las 01:48:59
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_efectiva1`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_evaluacion_riesgos_controles` (IN `id_evaluacion_riesgo` INT, IN `id_control` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO evaluacion_riesgos_controles(id_evaluacion_riesgo,id_control,id_user_added,DATE_ADD) VALUES (id_evaluacion_riesgo,id_control,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_actividades_plan` (IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idposicion` INT, IN `idusuario` INT, IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATETIME, IN `fecha_fin` DATETIME, IN `idalerta` INT, IN `progreso` INT, IN `idUserAdd` INT, IN `idplan` INT)   BEGIN
	INSERT INTO actividades_plan (
        idempresa, idarea, idunidad, idposicion, idusuario, descripcion, 
		fecha_inicio,
        fecha_fin, 
		idalerta, progreso, id_user_added, DATE_ADD,id_planes)
    VALUES (
        idempresa, idarea, idunidad, idposicion, idusuario, descripcion,
        CONVERT(fecha_inicio,DATETIME),
		CONVERT(fecha_fin,DATETIME),
		idalerta, progreso, idUserAdd, CURRENT_DATE(),idplan);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_AlertSeguimiento` (IN `alerta` VARCHAR(100), IN `valor` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
  INSERT INTO alert_seguimiento(alerta, valor, descripcion, id_user_added, DATE_ADD)
  VALUES (alerta, valor, descripcion, idUserAdd, NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_AplicacionImpacto` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
	INSERT INTO aplicacion_impacto(
	   idclasificacion,
	   posicion,descripcion,escenario,id_user_added,DATE_ADD)
    VALUES (
	   disenio,
	   posicion,descripcion,escenario,idUserAdd,CURRENT_DATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_AplicacionProbabilidad` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
	INSERT INTO aplicacion_probailidad(
	   idclasificacion,
	   posicion,descripcion,escenario,id_user_added,DATE_ADD)
    VALUES (
	   disenio,
	   posicion,descripcion,escenario,idUserAdd,CURRENT_DATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_area` (IN `area` VARCHAR(150), IN `empresa` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO area (area,idempresa,estado,id_user_added,DATE_ADD) VALUES(area,empresa,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_aspecto` (IN `aspecto` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO aspectos_seguridad(aspecto,estado,
id_user_added,DATE_ADD) VALUES(aspecto,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_caractControl` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `estado` INT, IN `peso` VARCHAR(50), IN `valor` VARCHAR(50), IN `condicion` VARCHAR(50), IN `tipo` VARCHAR(50), IN `idOpcion` INT, IN `calificacion` INT, IN `check_tabla` INT, IN `nom_tabla` VARCHAR(100), IN `seleccionable` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO caracteristica_control(
	   caracteristica,
	   descripcion,estado,peso,valor,condicion,tipo,idOpcion,clasificacion,check_tabla,nom_tabla,seleccionable,
	   id_user_added,DATE_ADD)
    VALUES (caracteristica,descripcion,estado,peso,valor,condicion,tipo,idOpcion,calificacion,check_tabla,
	   nom_tabla,seleccionable,idUserAdd,CURRENT_DATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_catactivo` (IN `categoria` VARCHAR(150), IN `tipo` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO categoria_activo
(categoria,estado,idtipo,id_user_added,DATE_ADD)
VALUES
(categoria,estado,tipo,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_clasinfo` (IN `clasificacion` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO clasificacion_informacion
(clasificacion,descripcion,estado,id_user_added,DATE_ADD)
VALUES
(clasificacion,descripcion,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_cobertura` (IN `cobertura` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
	INSERT INTO cobertura  (cobertura,descripcion,id_user_added,DATE_ADD)
    VALUES (cobertura,descripcion,idUserAdd,CURRENT_DATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_detalle_control` (IN `idControl` INT, IN `idCC` INT, IN `nom_tabla` INT, IN `valor` VARCHAR(50))   BEGIN
	INSERT INTO detalle_controles(idControles, idCC, nom_tabla,valor)
	VALUES (idControl,idCC,nom_tabla,valor);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_detalle_Evaluacion_Control` (IN `IEC` INT, IN `IDCC` INT)   BEGIN
	INSERT INTO detalle_evaluacion_control(IEC,ID_CC)
    VALUES (IEC,IDCC);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_empresa` (IN `empresa` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO empresa	(empresa,estado,id_user_added,DATE_ADD) VALUES(empresa,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_estado` (IN `estado` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `idUserAdd` INT)   BEGIN
	INSERT INTO estado  (estado,descripcion,id_user_added,DATE_ADD)
    VALUES (estado, descripcion,idUserAdd,CURRENT_DATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Evaluacion_Control` (IN `calificacion` VARCHAR(50), IN `idUserAdd` INT)   BEGIN
	INSERT INTO evaluacion_control2(calificacion,id_user_added,DATE_ADD)
    VALUES (calificacion,idUserAdd,CURRENT_DATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_macroproceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO macroproceso(macroproceso,
idunidad,idempresa,idarea,estado,
id_user_added,DATE_ADD) VALUES(macroproceso,unidad,empresa,area,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_plan_accion` (IN `id_riesgo` VARCHAR(150), IN `id_control` VARCHAR(150), IN `plan_accion` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATE, IN `fecha_fin` DATE, IN `id_user_added` INT, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idposicion` INT, IN `idusuario` INT, IN `idprioridad` INT, IN `idestado` INT, IN `idalerta` INT)   BEGIN
	 INSERT INTO plan_accion (
        id_riesgo, id_control, plan_accion, descripcion, fecha_inicio, fecha_fin, id_user_added, DATE_ADD,
        idempresa, idarea, idunidad, idposicion, idusuario, idprioridad, idestado, idalerta)
    VALUES (
        id_riesgo, id_control, plan_accion, descripcion, fecha_inicio, fecha_fin, id_user_added, CURRENT_DATE(),
        idempresa, idarea, idunidad, idposicion, idusuario, idprioridad, idestado, idalerta);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_posicion` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `posicion` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO posicion_puesto(posicion_puesto,
idempresa,idarea,idunidad,estado,
id_user_added,DATE_ADD) VALUES(posicion,empresa,area,unidad,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_prioridad` (IN `prioridad` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
	INSERT INTO prioridad(prioridad, decripcion,id_user_added,DATE_ADD)
	VALUES (prioridad,descripcion,idUserAdd,CURRENT_DATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_proceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` INT, IN `proceso` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO proceso(proceso,idmacroproceso,
idunidad,idempresa,idarea,estado,
id_user_added,DATE_ADD) VALUES(proceso,macroproceso,unidad,
                               empresa,area,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Registro_Controles` (IN `IDR` VARCHAR(100), IN `riesgo` VARCHAR(100), IN `IDC` VARCHAR(100), IN `control` VARCHAR(100), IN `cobertura` INT, IN `evaluacion` VARCHAR(100), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO registro_controles(IDR,riesgo,IDC,nom_control,idCobertura,evaluacion,estado,id_user_added,DATE_ADD)
    VALUES (IDR,riesgo,IDC,control,cobertura,evaluacion,estado,idUserAdd,CURRENT_DATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_tipoactivo` (IN `tipo` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO tipo_activo (tipo,estado,id_user_added,DATE_ADD)
VALUES (tipo,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_ubiactivo` (IN `continente` VARCHAR(50), IN `pais` VARCHAR(50), IN `ciudad` VARCHAR(50), IN `direccion` VARCHAR(300), IN `descripcion` VARCHAR(300), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO ubicacion_activo
(continente,pais,ciudad,direccion,descripcion,estado,id_user_added,DATE_ADD)
VALUES
(continente,pais,ciudad,direccion,descripcion,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_unidad` (IN `area` INT, IN `empresa` INT, IN `unidad` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO unidades(unidad,idempresa,idarea,estado,
id_user_added,DATE_ADD) VALUES(unidad,empresa,area,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_valoracionactivo` (IN `aspecto1` INT, IN `aspecto2` INT, IN `aspecto3` INT, IN `valoracion1` INT, IN `valoracion2` INT, IN `valoracion3` INT, IN `idvalor` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO valoracion_activo
        (idaspecto1,idaspecto2,idaspecto3,
		valoracion1,valoracion2,valoracion3,
		idvalor,estado,id_user_added,DATE_ADD) 
		VALUES(aspecto1,aspecto2,aspecto3,valoracion1,
valoracion2,valoracion3,idvalor,1,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_ValoracionRiesgo` (IN `valor` VARCHAR(100), IN `probabilidad` INT, IN `impacto` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO valoracion_riesgo(valor,idProbabilidad,idImpacto,id_user_added,DATE_ADD)
    VALUES (valor,probabilidad,impacto,idUserAdd,CURRENT_DATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_valoractivo` (IN `valor` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO valor_activo(valor,estado,
id_user_added,DATE_ADD) VALUES(valor,estado,idUserAdd,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_area` (IN `area` VARCHAR(150), IN `empresa` INT, IN `estado` INT, IN `idarea` INT, IN `idUserAdd` INT)   BEGIN
	UPDATE area  
	SET area=area,idempresa=empresa,estado=estado,
    id_user_updated=idUserAdd,
    date_modify = NOW()
	WHERE id=idarea;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_aspecto` (IN `aspecto` VARCHAR(150), IN `idaspecto` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	UPDATE aspectos_seguridad SET
aspecto=aspecto,
estado=estado,
id_user_updated=iduserAdd,
date_modify=NOW()
WHERE id=idaspecto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_catactivo` (IN `categoria` VARCHAR(150), IN `idcategoria` INT, IN `tipo` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
UPDATE categoria_activo SET
categoria=categoria,
idtipo = tipo,
estado = estado ,
id_user_updated=iduserAdd,
date_modify=NOW()
WHERE id=idcategoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_clasinfo` (IN `idclasi` INT, IN `clasificacion` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
UPDATE clasificacion_informacion SET
clasificacion=clasificacion,
descripcion=descripcion,
estado = estado ,
id_user_updated=iduserAdd,
date_modify=NOW()
WHERE id=idclasi;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_empresa` (IN `empresa` VARCHAR(150), IN `estado` INT, IN `idempresa` INT, IN `idUserAdd` INT)   BEGIN
	UPDATE empresa 
	SET empresa=empresa,estado=estado,
    id_user_updated=idUserAdd,
    date_modify = NOW()
	WHERE id=idempresa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_macroproceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` VARCHAR(150), IN `estado` INT, IN `idmacroproceso` INT, IN `idUserAdd` INT)   BEGIN
	UPDATE macroproceso   
	SET 
    idarea=AREA,
    idempresa=empresa,
    idunidad=unidad,
    macroproceso=macroproceso,
    estado=estado,
    id_user_updated=idUserAdd,
    date_modify = NOW()
	WHERE id=idmacroproceso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_plan_accion` (IN `id` INT, IN `id_riesgo` VARCHAR(150), IN `id_control` VARCHAR(150), IN `plan_accion` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATE, IN `fecha_fin` DATE, IN `id_user_updated` INT)   BEGIN
	UPDATE plan_accion
    SET id_riesgo = id_riesgo,
	id_control = id_control,
	plan_accion = plan_accion,
	descripcion = descripcion,
	fecha_inicio = fecha_inicio,
	fecha_fin = fecha_fin,
	id_user_updated = id_user_updated,
	date_modify = CURRENT_DATE()
    WHERE id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_posicion` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `posicion` VARCHAR(150), IN `idposicion` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	UPDATE posicion_puesto SET
idarea=AREA,
idempresa=empresa,
idunidad=unidad,
posicion_puesto=posicion,
estado=estado,
id_user_updated=iduserAdd,
date_modify=NOW()
WHERE id=idposicion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_proceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` INT, IN `proceso` VARCHAR(150), IN `idproceso` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	UPDATE proceso   
	SET 
    idarea=AREA,
idempresa=empresa,
idunidad=unidad,
idmacroproceso=macroproceso,
proceso=proceso,
estado=estado,
id_user_updated=iduserAdd,
date_modify=NOW()
WHERE id=idproceso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_tipoactivo` (IN `tipo` VARCHAR(150), IN `idtipo` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
UPDATE tipo_activo SET
tipo = tipo,
estado = estado ,
id_user_updated=iduserAdd,
date_modify=NOW()
WHERE id=idtipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_ubiactivo` (IN `idubiactivo` INT, IN `continente` VARCHAR(50), IN `pais` VARCHAR(50), IN `ciudad` VARCHAR(50), IN `direccion` VARCHAR(300), IN `descripcion` VARCHAR(300), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
UPDATE ubicacion_activo SET
continente=continente,
pais=pais,
ciudad=ciudad,
direccion=direccion,
descripcion=descripcion,
estado = estado ,
id_user_updated=iduserAdd,
date_modify=NOW()
WHERE id=idubiactivo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_unidad` (IN `area` INT, IN `empresa` INT, IN `unidad` VARCHAR(150), IN `estado` INT, IN `idunidad` INT, IN `idUserAdd` INT)   BEGIN
	UPDATE unidades  
	SET idarea=AREA,
    idempresa=empresa,
    unidad=unidad,
    estado=estado,
    id_user_updated=idUserAdd,
    date_modify = NOW()
	WHERE id=idunidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_valoracionactivo` (IN `aspecto1` INT, IN `aspecto2` INT, IN `aspecto3` INT, IN `valoracion1` INT, IN `valoracion2` INT, IN `valoracion3` INT, IN `idvalor` INT, IN `idvaloracion` INT, IN `idUserAdd` INT)   BEGIN
	UPDATE valoracion_activo SET
	 idaspecto1=aspecto1,
	 idaspecto2=aspecto2,
	 idaspecto3=aspecto3,
		valoracion1=valoracion1,
		valoracion2=valoracion2,
		valoracion3=valoracion3,
		idvalor=idvalor,	
id_user_updated=iduserAdd,
date_modify=NOW()
WHERE id=idvaloracion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_valoractivo` (IN `valor` VARCHAR(150), IN `idvalor` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	UPDATE valor_activo  SET
valor=valor,
estado=estado,
id_user_updated=iduserAdd,
date_modify=NOW()
WHERE id=idvalor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_actividades_plan` (IN `id` INT, IN `idUserDel` INT)   BEGIN
	UPDATE actividades_plan SET 
	id_user_deleted = idUserDel,
	date_deleted = CURRENT_DATE(),
	is_deleted = 1
    WHERE id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_alertSeguimiento` (IN `idUserAdd` INT, IN `idAlerta` INT)   BEGIN
	UPDATE alert_seguimiento  SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id=idAlerta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_AplicacionImpacto` (IN `idUserAdd` INT, IN `idAplicacionImpacto` INT)   BEGIN
	UPDATE aplicacion_probailidad  SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id= idAplicacionImpacto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_AplicacionProbabilidad` (IN `idUserAdd` INT, IN `idAplicacionProbabilidad` INT)   BEGIN
	UPDATE aplicacion_probailidad  SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id= idAplicacionProbabilidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_caractControl` (IN `idUserAdd` INT, IN `idCaractControl` INT)   BEGIN
	UPDATE caracteristica_control  SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id=idCaractControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cobertura` (IN `idUserAdd` INT, IN `idCobertura` INT)   BEGIN
	UPDATE cobertura  SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id=idCobertura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_estado` (IN `idUserAdd` INT, IN `idEstado` INT)   BEGIN
	UPDATE estado  SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id=idEstado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Evaluacion_Control` (IN `idUserAdd` INT, IN `idEvaluacionControl` INT)   BEGIN
	UPDATE evaluacion_control2  SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id= idEvaluacionControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_plan_accion` (IN `id` INT, IN `id_user_deleted` INT)   BEGIN
	UPDATE plan_accion
    SET id_user_deleted = id_user_deleted,
	is_deleted = 1,
	date_deleted = CURRENT_DATE()
    WHERE id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_prioridad` (IN `idUserAdd` INT, IN `idPrioridad` INT)   BEGIN
	UPDATE prioridad  SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id=idPrioridad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Registro_Controles` (IN `idUserAdd` INT, IN `idControl` INT)   BEGIN
	UPDATE  registro_controles SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id=idControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_ValoracionRiesgo` (IN `idUserAdd` INT, IN `idValoracionRiesgo` INT)   BEGIN
	UPDATE valoracion_riesgo  SET
	id_user_deleted=idUserAdd,
	date_deleted=CURRENT_DATE(),
	is_deleted=1
	WHERE id= idValoracionRiesgo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAspectoByActivo` ()   BEGIN
	SELECT * FROM aspectos_seguridad WHERE estado='1' AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getById` (IN `idid` INT)   begin
SELECT id from caracteristica_control 
        where is_deleted=0 and clasificacion =1 and idOpcion=idid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getByIdSesion` (IN `id` INT, IN `iat` VARCHAR(100))   begin
	SELECT  * from tb_sesiones
         where id_us=id and expi > iat and loged='1' ORDER BY id_se LIMIT 1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCaractControl` ()   begin
	SELECT * FROM caracteristica_control where tipo='menu' and is_deleted=0 ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCaractControlById` (IN `id` INT)   begin
	SELECT * FROM caracteristica_control 
                    where is_deleted=0  and idOpcion=id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCCMenu` ()   begin
select * from caracteristica_control where tipo = 'menu' and is_deleted=0 and estado= 1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCCOpciones` ()   begin
  select * from caracteristica_control where tipo =
         'opcion' and is_deleted=0 and estado= 1 and clasificacion=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCCSubMenu` ()   begin
select *
         from caracteristica_control where 
         tipo = 'submenu' and is_deleted=0 and estado= 1 and clasificacion=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCiudad` (IN `dato` VARCHAR(30))   begin
SELECT * FROM ciudad where ubicacionpaisid=dato;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCoberturaByActivo` ()   begin
  select * from cobertura where is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getComboPosicion` ()   BEGIN
	SELECT * FROM posicion_puesto WHERE estado='1' AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getConfigPass` ()   begin
SELECT * FROM  config_pass;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getContinente` ()   begin
SELECT * FROM continente where ContinenteCodigo='América';
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCorreoActividad` ()   begin
	SELECT AP.progreso as progreso,AP.id as id_act,PA.plan_accion,AP.descripcion as descripcion,TU.id_us,TU.email_us,A.valor,AP.fecha_inicio as 
        fecha_ini,
        AP.fecha_fin as fecha_fin,TU.nombres_us,TU.apepat_us,TU.apemat_us ,A.alerta as alerta
        from actividades_plan as AP  inner join alert_seguimiento as A on AP.idalerta=A.id
        inner join tb_users as TU on AP.idusuario = TU.id_us  inner join plan_accion as PA on PA.id=AP.id_planes
        where AP.is_deleted = 0 and PA.idestado   = 2;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCorreoActividadesEnviados` (IN `id` INT)   begin
	SELECT * FROM correo_actividad where idactividad= id ORDER BY id DESC LIMIT 1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCorreoPlan` ()   begin
	SELECT PA.id,TU.id_us as usuario, E.id as estado ,
         PA.plan_accion,TU.email_us,E.estado,A.valor,PA.fecha_inicio as fecha_ini,
         PA.fecha_fin as fecha_fin,TU.nombres_us,TU.apepat_us,TU.apemat_us ,A.alerta as alerta
        FROM plan_accion as PA inner join tb_users as TU on PA.idusuario = TU.id_us 
        inner join alert_seguimiento as A on A.id=PA.idalerta inner join estado as E on PA.idestado = E.id
        where PA.is_deleted = 0 ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCorreoPlanEnviados` (IN `id` INT)   begin
	SELECT * FROM correo_plan where idplan= id ORDER BY id DESC LIMIT 1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getData2` (IN `tabla` VARCHAR(150))   begin
 SELECT * FROM tabla where is_deleted=0 and estado=1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDataMatriz` ()   begin
SELECT  concat(PR.valor1,' - ',PR.valor2) as valorProbabilidad 
          ,concat(IR.valor1,' - ',IR.valor2) as  valorImpacto,VR.id,VR.idProbabilidad,VR.idImpacto,VR.valor, 
           PR.descripcion as probabilidad, IR.descripcion as impacto
           from valoracion_riesgo as VR inner join probabilidad_riesgo as PR 
           on VR.idProbabilidad = PR.id inner join impacto_riesgo as IR on VR.idImpacto=IR.id
          where VR.is_deleted=0 and PR.estado=1  and  IR.estado=1  and PR.tipo_regla='2 Valores' 
          and IR.tipo_regla='2 Valores' order by valorProbabilidad DESC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDetalleEvaluacionControl` (IN `idid` INT)   begin
select DET.id as IDET,DET.ID_CC,
        CC.idOpcion,CC.caracteristica as caracteristica,EC.id as id, 
        EC.calificacion as calificacion from evaluacion_control2 as 
        EC inner join detalle_evaluacion_control as DET on 
        EC.id=DET.IEC
        inner join caracteristica_control as CC on CC.id=DET.ID_CC 
        where EC.id=idid order by CC.idOpcion;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getEvaluacionControl` ()   begin
select * from 
        evaluacion_control2 where is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getOpcionesCaracteristica` (IN `idtipo` VARCHAR(150))   begin
SELECT * from caracteristica_control where is_deleted=0 and estado=1 and tipo=idtipo order by date_add;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPaises` (IN `dato` VARCHAR(30))   begin
SELECT * FROM pais where continente=dato;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlanControl` ()   begin
select * from 
        registro_controles where is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPosicionByArea` (IN `idarea` INT)   BEGIN
	SELECT PP.id AS id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
        E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto AS PP INNER JOIN empresa AS E
        ON PP.idempresa=E.id INNER JOIN area AS A ON PP.idarea=A.id 
        INNER JOIN unidades AS U ON PP.idunidad=U.id
        WHERE pp.idarea=idarea;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPosicionByUnidad` (IN `empresa` INT, IN `area` INT, IN `unidad` INT)   BEGIN
	SELECT PP.id AS id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
        E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto AS PP INNER JOIN empresa AS E
        ON PP.idempresa=E.id INNER JOIN area AS A ON PP.idarea=A.id 
        INNER JOIN unidades AS U ON PP.idunidad=U.id
        WHERE PP.idarea=area AND PP.idempresa=empresa AND PP.idunidad=unidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getRegistroControl` (IN `idid` INT)   begin
select * from registro_controles 
        where id=idid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getRegistroControles` ()   begin
select * from 
        registro_controles where is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getRegistroControles2` ()   begin
SELECT *,RC.id as IDRC ,RC.estado as RCEstado,DC.valor as RCValor from registro_controles  as RC 
        inner join detalle_controles as DC on RC.id=DC.idControles inner join caracteristica_control as CC 
        on DC.idCC=CC.id where RC.is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getRegistroDetalleControl` (IN `idid` INT)   begin
select * from 
        detalle_controles where idControles=idid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getTabla` (IN `idid` INT)   begin
 SELECT nom_tabla FROM catalogo_tabla where id=idid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getTipoActivoByActivo` ()   BEGIN
	SELECT * FROM tipo_activo 
         WHERE estado='1' AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByDatos` (IN `user_pass` VARCHAR(50))   BEGIN
	SELECT *,TP.is_user_negocio AS negocio FROM  tb_users AS TU INNER JOIN tb_historial_claves AS TH
        ON TU.id_us=TH.id_us INNER JOIN tb_perfiles AS TP ON TP.id_perfil=TU.perfil_us
		WHERE TU.usuario_us=user_pass AND estado_us='1'  ORDER BY TH.id_cl DESC LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getValorActivoByActivo` ()   BEGIN
	SELECT * FROM valor_activo WHERE estado='1' AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_Plan_Control` (IN `id` INT)   BEGIN
	SELECT PA.id,(SELECT COUNT(*) FROM actividades_plan WHERE id_planes = PA.id) AS actividades,PA.*
	FROM plan_accion AS PA   WHERE PA.is_deleted=0 AND PA.id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCorreoPlan` (IN `id` INT, IN `fecha` DATETIME, IN `usuario` INT)   begin
	INSERT INTO correo_plan (idplan,fecha_envio,idusuario) 
        VALUES (id,fecha,usuario);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LastIdControles` ()   begin
SELECT MAX(id) as last_id from registro_controles;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `last_id_Evaluacion_Control` ()   BEGIN
	SELECT  id AS maxid FROM evaluacion_control2 ORDER BY id DESC LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `last_id_Registro_Proceso` ()   BEGIN
	SELECT  id AS maxid FROM registro_controles ORDER BY id DESC LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaCategoriaByActivo` (IN `idactivo` INT)   BEGIN
	SELECT * FROM categoria_activo WHERE idtipo=idactivo AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaProcesoByEstado` ()   BEGIN
	SELECT * FROM proceso 
            WHERE estado='1' ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaProcesoByMacro` (IN `empresa` INT, IN `area` INT, IN `unidad` INT, IN `macroproceso` INT)   BEGIN
	SELECT * FROM proceso WHERE idempresa=empresa AND idarea=area AND
    idunidad=unidad AND idmacroproceso=macroproceso AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarArea` ()   BEGIN
	SELECT A.id,A.idempresa,E.empresa,A.area,A.estado
                FROM empresa AS E INNER JOIN area AS A ON A.idempresa = E.id WHERE A.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAreaByActivo` (IN `empresa` INT)   BEGIN
	SELECT * FROM area
            WHERE estado=1 and idempresa=empresa AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAreaEmpresa` (IN `dato` INT)   BEGIN
	SELECT A.id,A.idempresa,E.empresa,A.area,A.estado
            FROM empresa AS E INNER JOIN area AS A 
			ON A.idempresa = E.id WHERE A.idempresa=dato and A.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAspecto` ()   BEGIN
	SELECT * FROM 
        aspectos_seguridad WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarcatactivo` ()   BEGIN
	SELECT CA.id,CA.categoria,CA.estado,CA.idtipo,
TA.tipo FROM categoria_activo AS CA INNER JOIN 
tipo_activo AS TA ON CA.idtipo=TA.id 
WHERE CA.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarclasinfo` ()   BEGIN
	SELECT * FROM clasificacion_informacion WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEmpresa` ()   BEGIN
	SELECT * FROM empresa WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEmpresaByAcivo` ()   BEGIN
	SELECT * FROM empresa WHERE estado='1' AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMacroEmpresa` (IN `dato` INT)   BEGIN
	SELECT M.id, M.macroproceso,E.empresa,A.area,U.unidad,M.estado,M.idempresa,
            M.idarea,M.idunidad
            FROM macroproceso AS M INNER JOIN empresa AS E ON M.idempresa=E.id
                                    INNER JOIN area AS A ON M.idarea=A.id
                                    INNER JOIN unidades AS U ON M.idunidad=U.id WHERE E.id = dato AND M.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMacroproceso` ()   BEGIN
	SELECT M.id, M.macroproceso,E.empresa,A.area,U.unidad,M.estado,M.idempresa,
            M.idarea,M.idunidad
            FROM macroproceso AS M INNER JOIN empresa AS E ON M.idempresa=E.id
                                    INNER JOIN area AS A ON M.idarea=A.id
                                    INNER JOIN unidades AS U ON M.idunidad=U.id AND M.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMacroprocesoByActivo` (IN `empresa` INT, IN `area` INT, IN `unidad` INT)   BEGIN
	SELECT * FROM macroproceso  
            WHERE estado='1' 
			AND idempresa=empresa
			AND idarea=area
            AND idunidad=unidad and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarPosicion` ()   BEGIN
	SELECT PP.id AS id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
            E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto AS PP INNER JOIN empresa AS E
            ON PP.idempresa=E.id INNER JOIN area AS A ON PP.idarea=A.id 
            INNER JOIN unidades AS U ON PP.idunidad=U.id WHERE PP.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarPosicionEmpresa` (IN `dato` INT)   BEGIN
	SELECT PP.id AS id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
            E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto AS PP INNER JOIN empresa AS E
            ON PP.idempresa=E.id INNER JOIN area AS A ON PP.idarea=A.id 
            INNER JOIN unidades AS U 
			ON PP.idunidad=U.id WHERE E.id=dato 
            AND PP.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProceso` ()   BEGIN
	SELECT P.id,P.proceso,E.empresa,A.area,U.unidad,M.macroproceso,P.estado,
            P.idempresa,P.idarea,P.idunidad,P.idmacroproceso
            FROM proceso AS P INNER JOIN empresa AS E ON P.idempresa=E.id
                                    INNER JOIN area AS A ON P.idarea=A.id
                                    INNER JOIN unidades AS U ON P.idunidad=U.id												   
                                    INNER JOIN macroproceso AS M ON P.idmacroproceso = M.id AND P.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProcesoEmpresa` (IN `dato` INT)   BEGIN
	SELECT P.id,P.proceso,E.empresa,A.area,U.unidad,M.macroproceso,P.estado,
            P.idempresa,P.idarea,P.idunidad,P.idmacroproceso
            FROM proceso AS P INNER JOIN empresa AS E ON P.idempresa=E.id
                                    INNER JOIN area AS A ON P.idarea=A.id
                                    INNER JOIN unidades AS U ON P.idunidad=U.id												   
                                    INNER JOIN macroproceso AS M ON P.idmacroproceso = M.id 
									WHERE E.id = dato AND P.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listartipoactivo` ()   BEGIN
	SELECT * FROM tipo_activo WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarubiactivo` ()   BEGIN
	SELECT UA.id,UA.continente,UA.pais,UA.ciudad,UA.estado,UA.direccion,
        UA.descripcion,C.PaisContinente,P.paisnombre ,CI.estadonombre FROM ubicacion_activo AS UA 
        INNER JOIN continente AS C ON UA.continente=C.ContinenteCodigo INNER JOIN
        pais AS P ON UA.pais=P.id INNER JOIN ciudad AS CI 
        ON UA.ciudad=CI.id WHERE UA.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUnidadByActivo` (IN `empresa` INT(12), IN `area` INT(12))   BEGIN
	SELECT * FROM unidades 
            WHERE estado=1 and
			 idempresa=empresa
			AND idarea=area
			AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUnidadByEstado` ()   BEGIN
SELECT * FROM unidades WHERE estado='1';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUnidadEmpresa` (IN `dato` INT)   BEGIN
	SELECT U.id,U.unidad,E.empresa,A.area,U.estado,U.idempresa,U.idarea
            FROM unidades AS U INNER JOIN empresa AS E ON U.idempresa = E.id
                               INNER JOIN area AS A ON U.idarea = A.id 
							   WHERE E.id  = dato AND U.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUnidades` ()   BEGIN
	SELECT U.id,U.unidad,E.empresa,A.area,U.estado,U.idempresa,U.idarea
            FROM unidades AS U INNER JOIN empresa AS E ON U.idempresa = E.id
                               INNER JOIN area AS A ON U.idarea = A.id AND U.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarValoracionActivo` ()   BEGIN
	SELECT VA.id AS id_valActivo,(SELECT aspecto FROM aspectos_seguridad WHERE id=VA.idaspecto1) AS aspecto1,
        (SELECT aspecto FROM aspectos_seguridad WHERE id=VA.idaspecto2) AS aspecto2, 
        (SELECT aspecto FROM aspectos_seguridad WHERE id=VA.idaspecto3) AS aspecto3,VA.idaspecto1,VA.idaspecto2
        ,VA.idaspecto3,VA.estado,A.valor,VA.idvalor ,VA.valoracion1,VA.valoracion2,VA.valoracion3
        FROM valoracion_activo  AS VA INNER JOIN valor_activo AS A ON VA.idvalor=A.id
        WHERE VA.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarValorActivo` ()   BEGIN
	SELECT * FROM 
        valor_activo WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_actividadesByPlan` (IN `id_planes` INT)   BEGIN
	SELECT PA.id, 
		(SELECT empresa FROM empresa WHERE idempresa=id) AS empresa,
		(SELECT AREA FROM AREA WHERE idarea=id) AS AREA,
		(SELECT unidad FROM unidades WHERE idunidad=id) AS unidad,
		(SELECT posicion_puesto FROM posicion_puesto WHERE idposicion=id) AS posicion,
		(SELECT nombres_us FROM tb_users WHERE id_us=idusuario) AS nombre,
		descripcion,
		fecha_inicio,
		fecha_fin	
	FROM actividades_plan AS PA
	WHERE is_deleted=0 AND id_planes = id_planes;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_actividades_plan` (IN `idid` INT)   BEGIN
	SELECT AP.id,AP.idempresa,AP.idarea,AP.idunidad,AP.idposicion,AP.idusuario,AP.idalerta,
	(SELECT empresa FROM empresa WHERE id=AP.idempresa) AS empresa,
	(SELECT area FROM area WHERE id=AP.idarea) AS area,
	(SELECT unidad FROM unidades WHERE id=AP.idunidad) AS unidad,
	(SELECT posicion_puesto FROM posicion_puesto WHERE id=AP.idposicion) AS posicion,
	(SELECT nombres_us FROM tb_users WHERE id_us=AP.idusuario) AS nombre,
	AP.descripcion,
	AP.fecha_inicio,
	AP.fecha_fin,AP.progreso
	FROM plan_accion AS PA INNER JOIN actividades_plan AS AP ON PA.id=AP.id_planes
	WHERE AP.is_deleted=0 AND PA.id = idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_alert_seguimiento` ()   BEGIN
	SELECT * FROM alert_seguimiento WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_AplicacionImpacto` (IN `idescenario` INT)   BEGIN
	SELECT id,idclasificacion,(SELECT caracteristica FROM caracteristica_control WHERE id=idclasificacion) AS disenio,
	posicion,descripcion,escenario
	FROM aplicacion_impacto  WHERE is_deleted=0 AND escenario=idescenario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_AplicacionProbabilidad` (IN `idescenario` INT)   BEGIN
	SELECT id,idclasificacion,(SELECT caracteristica FROM caracteristica_control WHERE id=idclasificacion) AS disenio,
	posicion,descripcion,escenario
	FROM aplicacion_probailidad 
	WHERE is_deleted=0 AND escenario=idescenario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_caractControl` ()   BEGIN
	SELECT * FROM caracteristica_control WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_cobertura` ()   BEGIN
	SELECT * FROM cobertura where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_detalle_plan` (IN `id` INT)   BEGIN
	SELECT COUNT(*) AS actividades FROM actividades_plan WHERE id_planes= id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_estado` ()   BEGIN
	SELECT * FROM estado WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Evaluacion_Control` ()   BEGIN
	SELECT id,idDisenio,(SELECT caracteristica FROM caracteristica_control WHERE id=idDisenio) AS disenio,
	idOperatividad,(SELECT caracteristica FROM caracteristica_control WHERE id=idOperatividad) AS operatividad,calificacion
	FROM evaluacion_control AS EC 
	WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ImpactoRiesgoByActivo` ()   BEGIN
	SELECT *
	FROM impacto_riesgo
    WHERE is_deleted=0 AND estado=1 AND tipo_regla='2 Valores'  ORDER BY valor1 ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_plan_accion` ()   BEGIN
	SELECT id,plan_accion, 
	(SELECT COUNT(*) FROM actividades_plan WHERE id_planes = PA.id and is_deleted=0) AS actividades,	
	descripcion,idarea,(SELECT area FROM area WHERE id = idarea) AS responsable, idestado,
	(SELECT estado FROM estado WHERE id=idestado) AS estado,
	idprioridad,(SELECT prioridad FROM prioridad WHERE id=idprioridad) AS prioridad, fecha_inicio, fecha_fin 
	FROM plan_accion AS PA
	WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_prioridad` ()   BEGIN
	SELECT *
	FROM prioridad WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ProbabilidadRiesgoByActivo` ()   BEGIN
	SELECT *
	FROM probabilidad_riesgo WHERE is_deleted=0 AND estado=1 AND tipo_regla='2 Valores'  ORDER BY valor1 DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_riesgos` ()   BEGIN
	SELECT * FROM evaluacion_riesgo WHERE is_deleted=0 AND estado = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ValoracionRiesgo` ()   BEGIN
	SELECT VR.id,VR.idProbabilidad,VR.idImpacto,VR.valor, 
	PR.descripcion AS probabilidad, IR.descripcion AS impacto
	FROM valoracion_riesgo AS VR INNER JOIN probabilidad_riesgo AS PR 
	ON VR.idProbabilidad = PR.id INNER JOIN impacto_riesgo AS IR ON VR.idImpacto=IR.id
	WHERE VR.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_actividades_plan` (IN `idid` INT, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idposicion` INT, IN `idusuario` INT, IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATETIME, IN `fecha_fin` DATETIME, IN `idalerta` INT, IN `progreso` INT, IN `idUserModify` INT)   BEGIN
	UPDATE actividades_plan SET 
        idempresa = idempresa,
        idarea = idarea,
        idunidad = idunidad,
        idposicion = idposicion,
        idusuario = idusuario,
        descripcion = descripcion,
        fecha_inicio = fecha_inicio,
        fecha_fin = fecha_fin,
        idalerta = idalerta,
        progreso = progreso,        
        id_user_updated = idUserModify,
        date_modify = CURRENT_DATE()
		WHERE id = idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_AlertSeguimiento` (IN `alerta` VARCHAR(150), IN `valor` INT, IN `descripcion` VARCHAR(150), IN `idUserAdd` INT, IN `idAlerta` INT)   BEGIN
	UPDATE alert_seguimiento  SET
	alerta=alerta,
	valor=valor,
	descripcion= descripcion,
	id_user_updated=idUserAdd,
	date_modify=CURRENT_DATE() WHERE id=idAlerta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_AplicacionImpacto` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT, IN `idAplicacionImpacto` INT)   BEGIN
	UPDATE aplicacion_impacto  SET
	idclasificacion=disenio,
	posicion= posicion,
	descripcion= descripcion,
	escenario= escenario,
	id_user_updated=idUserAdd,
	date_modify=CURRENT_DATE() WHERE id=idAplicacionImpacto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_AplicacionProbabilidad` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT, IN `idAplicacionProbabilidad` INT)   BEGIN
	UPDATE aplicacion_probailidad  SET
	idclasificacion=disenio,
	posicion= posicion,
	descripcion= descripcion,
	escenario= escenario,
	id_user_updated=idUserAdd,
	date_modify=CURRENT_DATE() WHERE id=idAplicacionProbabilidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_caractControl` (IN `idcaracteristica` VARCHAR(100), IN `iddescripcion` VARCHAR(100), IN `idestado` INT, IN `idpeso` VARCHAR(50), IN `idvalor` VARCHAR(50), IN `idcondicion` VARCHAR(50), IN `idcheck_tabla` INT, IN `idnom_tabla` VARCHAR(100), IN `idcalificacion` INT, IN `idseleccionable` INT, IN `idUserAdd` INT, IN `idCaractControl` INT)   BEGIN
	UPDATE caracteristica_control  SET
	   caracteristica=idcaracteristica,
	   descripcion= iddescripcion,
	   estado= idestado,
	   peso = idpeso,
	   valor = idvalor,
	   condicion = idcondicion,
	   check_tabla=idcheck_tabla,
	   nom_tabla=idnom_tabla,
	   clasificacion=idcalificacion,
	   seleccionable=idseleccionable,
	   id_user_updated=idUserAdd,
	   date_modify=CURRENT_DATE() WHERE id=idCaractControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_cobertura` (IN `cobertura` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `idUserAdd` INT, IN `idCobertura` INT)   BEGIN
	UPDATE cobertura  SET
	cobertura=cobertura,
	descripcion= descripcion,
	id_user_updated=idUserAdd,
	date_modify=CURRENT_DATE() WHERE id=idCobertura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_detalle_control` (IN `idvalor` VARCHAR(50), IN `idControl` INT, IN `ididCC` INT)   BEGIN
	UPDATE  detalle_controles SET
	valor=idvalor WHERE idControles=idControl AND idCC=ididCC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_estado` (IN `estado` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `idUserAdd` INT, IN `idEstado` INT)   BEGIN
	UPDATE estado  SET
	   estado=estado,
	   descripcion= descripcion,
	   id_user_updated=idUserAdd,
	   date_modify=CURRENT_DATE() WHERE id=idEstado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Evaluacion_Control` (IN `calificacion` VARCHAR(50), IN `idUserAdd` INT, IN `idEvaluacionControl` INT)   BEGIN
	UPDATE evaluacion_control2  SET
	calificacion= calificacion,
	id_user_updated=idUserAdd,
	date_modify=CURRENT_DATE() WHERE id=@idEvaluacionControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_plan_accion` (IN `id` INT, IN `plan` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `fecha_ini` DATETIME, IN `fecha_fin` DATETIME, IN `empresa` INT, IN `area` INT, IN `unidad` INT, IN `posicion` INT, IN `usuario` INT, IN `prioridad` INT, IN `estado` INT, IN `alerta` INT, IN `idUserAdd` INT, IN `idriesgo` VARCHAR(150), IN `idcontrol` VARCHAR(150))   BEGIN
	UPDATE plan_accion SET
	plan_accion = plan,
	descripcion = descripcion,
	fecha_inicio = fecha_ini,
	fecha_fin = fecha_fin,
	idempresa = empresa,
	idarea = AREA,
	idunidad = unidad,
	idposicion = posicion,
	idusuario = usuario,
	idprioridad = prioridad,
	idestado = estado,
	idalerta=alerta,
	id_riesgo = idriesgo,
	id_control = idcontrol,
	id_user_updated = idUserAdd,
	date_modify = CURRENT_DATE()
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_prioridad` (IN `prioridad` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `idUserAdd` INT, IN `idPrioridad` INT)   BEGIN
	UPDATE prioridad  SET
	prioridad=prioridad,
	decripcion= descripcion,
	id_user_updated=idUserAdd,
	date_modify=CURRENT_DATE() WHERE id=idPrioridad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Registro_Controles` (IN `idIDR` VARCHAR(100), IN `idriesgo` VARCHAR(100), IN `idIDC` VARCHAR(100), IN `control` VARCHAR(100), IN `cobertura` INT, IN `idevaluacion` VARCHAR(100), IN `idestado` INT, IN `idUserAdd` INT, IN `idControl` INT)   BEGIN
	UPDATE  registro_controles SET
	IDR= idIDR,
	riesgo=idriesgo,
	IDC=idIDC,
	nom_control=control,
	idCobertura=cobertura,
	evaluacion=idevaluacion,
	estado=idestado,
	id_user_added=idUserAdd,
	DATE_ADD=CURRENT_DATE() WHERE id=idControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_ValoracionRiesgo` (IN `valor` VARCHAR(100), IN `probabilidad` INT, IN `impacto` INT, IN `idUserAdd` INT, IN `idValoracionRiesgo` INT)   BEGIN
	UPDATE valoracion_riesgo
    SET valor=valor,
	idProbabilidad= probabilidad,
	idImpacto= impacto,
	id_user_updated=idUserAdd,
	date_modify=CURRENT_DATE() WHERE id=idValoracionRiesgo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPeso` (IN `idid` INT)   begin
select peso from caracteristica_control where id=idid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `saveLog` (IN `idterminal` VARCHAR(150), IN `idip_addres` VARCHAR(150), IN `idu_ejecutor` VARCHAR(150), IN `idu_afectado` VARCHAR(150), IN `idaccion` VARCHAR(150), IN `idfecha` DATETIME)   begin
INSERT INTO log_acciones(terminal,ip_addres,u_ejecutor,u_afectado,accion,fecha) 
VALUES (idterminal,idip_addres,idu_ejecutor,idu_afectado,idaccion,idfecha);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `saveSesion` (IN `id` INT, IN `iat` VARCHAR(150), IN `exp` VARCHAR(150), IN `activity` VARCHAR(150))   begin
	INSERT INTO tb_sesiones 
        (id_us,iat,expi,last_activity,loged) VALUES
        (id,iat,
        exp,activity,'1');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_categoria_vulnerabilidad` (IN `categoria` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO categoria_vulnerabilidad(categoria,estado,id_user_added,DATE_ADD)
	VALUES (categoria,estado,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_desc_amenaza` (IN `idtipo_amenaza` INT, IN `amenaza` VARCHAR(150), IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO desc_amenaza(idtipo_amenaza,amenaza,id_user_added,DATE_ADD)
	VALUES (idtipo_amenaza,amenaza,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_desc_vulnerabilidad` (IN `idcategoria` INT, IN `vulnerabilidad` VARCHAR(150), IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO desc_vulnerabilidad(idcategoria,vulnerabilidad,id_user_added,DATE_ADD)
	VALUES (idcategoria,vulnerabilidad,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_evaluacion_riesgo` (IN `id_tipo_riesgo` INT, IN `id_empresa` INT, IN `id_area` INT, IN `id_unidad` INT, IN `id_macroproceso` INT, IN `id_proceso` INT, IN `id_activo` INT, IN `id_tipo_amenaza` INT, IN `id_descripcion_amenaza` INT, IN `id_tipo_vulnerabilidad` INT, IN `id_descripcion_vulnerabilidad` INT, IN `riesgo` VARCHAR(150), IN `valor_probabilidad` INT, IN `probabilidad` VARCHAR(150), IN `valor_impacto` VARCHAR(150), IN `impacto` VARCHAR(150), IN `valor` VARCHAR(150), IN `id_control` INT, IN `riesgo_controlado_probabilidad` VARCHAR(150), IN `riesgo_controlado_impacto` VARCHAR(150), IN `riesgo_controlado_valor` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO evaluacion_riesgo(
	id_tipo_riesgo,
	id_empresa,
	id_area,
	id_unidad,
	id_macroproceso,
	id_proceso,
	id_activo,
	id_tipo_amenaza,
	id_descripcion_amenaza,
	id_tipo_vulnerabilidad,
	id_descripcion_vulnerabilidad,
	riesgo,
	valor_probabilidad,
	probabilidad,
	valor_impacto,
	impacto,
	valor,
	id_control,
	riesgo_controlado_probabilidad,
	riesgo_controlado_impacto,
	riesgo_controlado_valor,
	estado,
	id_user_added,
	DATE_ADD
	) VALUES (
		id_tipo_riesgo,
		id_empresa,
		id_area,
		id_unidad,
		id_macroproceso,
		id_proceso,
		id_activo,
		id_tipo_amenaza,
		id_descripcion_amenaza,
		id_tipo_vulnerabilidad,
		id_descripcion_vulnerabilidad,
		riesgo,
		valor_probabilidad,
		probabilidad,
		valor_impacto,
		impacto,
		valor,
		id_control,
		riesgo_controlado_probabilidad,
		riesgo_controlado_impacto,
		riesgo_controlado_valor,
		estado,
		id_user_added,
		DATE_ADD
	);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_evaluacion_riesgo_historial` (IN `id_tipo_riesgo` INT, IN `id_empresa` INT, IN `id_area` INT, IN `id_unidad` INT, IN `id_macroproceso` INT, IN `id_proceso` INT, IN `id_activo` INT, IN `id_tipo_amenaza` INT, IN `id_descripcion_amenaza` INT, IN `id_tipo_vulnerabilidad` INT, IN `id_descripcion_vulnerabilidad` INT, IN `riesgo` VARCHAR(150), IN `valor_probabilidad` INT, IN `probabilidad` VARCHAR(150), IN `valor_impacto` VARCHAR(150), IN `impacto` VARCHAR(150), IN `valor` VARCHAR(150), IN `id_control` INT, IN `riesgo_controlado_probabilidad` VARCHAR(150), IN `riesgo_controlado_impacto` VARCHAR(150), IN `riesgo_controlado_valor` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO evaluacion_riesgo_historial(
	id_tipo_riesgo,
	id_empresa,
	id_area,
	id_unidad,
	id_macroproceso,
	id_proceso,
	id_activo,
	id_tipo_amenaza,
	id_descripcion_amenaza,
	id_tipo_vulnerabilidad,
	id_descripcion_vulnerabilidad,
	riesgo,
	valor_probabilidad,
	probabilidad,
	valor_impacto,
	impacto,
	valor,
	id_control,
	riesgo_controlado_probabilidad,
	riesgo_controlado_impacto,
	riesgo_controlado_valor,
	estado,
	id_user_added,
	DATE_ADD
	) VALUES (
		id_tipo_riesgo,
		id_empresa,
		id_area,
		id_unidad,
		id_macroproceso,
		id_proceso,
		id_activo,
		id_tipo_amenaza,
		id_descripcion_amenaza,
		id_tipo_vulnerabilidad,
		id_descripcion_vulnerabilidad,
		riesgo,
		valor_probabilidad,
		probabilidad,
		valor_impacto,
		impacto,
		valor,
		id_control,
		riesgo_controlado_probabilidad,
		riesgo_controlado_impacto,
		riesgo_controlado_valor,
		estado,
		id_user_added,
		DATE_ADD
	);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_impacto_1` (IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `escenario` INT, IN `formula` VARCHAR(150), IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO impacto_riesgo(descripcion,tipo_regla,tipo_valor,formula,comentario,estado,escenario,id_user_added,DATE_ADD)
	VALUES (descripcion,tipo_regla,tipo_valor,formula,comentario,estado,escenario,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_impacto_2` (IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `comentario` VARCHAR(150), IN `estado` INT, IN `escenario` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO impacto_riesgo(descripcion,tipo_regla,tipo_valor,operador1,valor1,operador2,valor2,comentario,estado,escenario,id_user_added,DATE_ADD)
	VALUES (descripcion,tipo_regla,tipo_valor,operador1,valor1,operador2,valor2,comentario,estado,escenario,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_inventario_clasificacion_activo` (IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idmacroproceso` INT, IN `idproceso` INT, IN `activo` VARCHAR(150), IN `desc_activo` VARCHAR(500), IN `idtipo_activo` INT, IN `idcategoria_activo` INT, IN `idubicacion` INT, IN `idpropietario` INT, IN `idcustodio` INT, IN `val_c` INT, IN `val_i` INT, IN `val_d` INT, IN `idvalor` INT, IN `estado` INT, IN `comentario` VARCHAR(500), IN `id_user_added` INT, IN `date_add` DATETIME, IN `estado_2_param` INT)   BEGIN
	insert into inventario_clasificacion_activo(
	idempresa,
	idarea,
	idunidad,
	idmacroproceso,
	idproceso,
	activo,
	desc_activo,
	idtipo_activo,
	idcategoria_activo,
	idubicacion,
	idpropietario,
	idcustodio,
	val_c,
	val_i,
	val_d,
	idvalor,
	estado,
	comentario,
	id_user_added,
	date_add,
    estado_2
	) values(
		idempresa,
		idarea,
		idunidad,
		idmacroproceso,
		idproceso,
		activo,
		desc_activo,
		idtipo_activo,
		idcategoria_activo,
		idubicacion,
		idpropietario,
		idcustodio,
		val_c,
		val_i,
		val_d,
		idvalor,
		estado,
		comentario,
		id_user_added,
		date_add,
        estado_2_param
	);



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_inventario_clasificacion_activo_historial` (IN `id_ica` INT, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idmacroproceso` INT, IN `idproceso` INT, IN `activo` VARCHAR(150), IN `desc_activo` VARCHAR(500), IN `idtipo_activo` INT, IN `idcategoria_activo` INT, IN `idubicacion` INT, IN `idpropietario` INT, IN `idcustodio` INT, IN `val_c` INT, IN `val_i` INT, IN `val_d` INT, IN `idvalor` INT, IN `estado` INT, IN `comentario` VARCHAR(500), IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO inventario_clasificacion_activo_historial(
	id_ica,
	idempresa,
	idarea,
	idunidad,
	idmacroproceso,
	idproceso,
	activo,
	desc_activo,
	idtipo_activo,
	idcategoria_activo,
	idubicacion,
	idpropietario,
	idcustodio,
	val_c,
	val_i,
	val_d,
	idvalor,
	estado,
	comentario,
	id_user_added,
	DATE_ADD
	) VALUES(
		id_ica,
		idempresa,
		idarea,
		idunidad,
		idmacroproceso,
		idproceso,
		activo,
		desc_activo,
		idtipo_activo,
		idcategoria_activo,
		idubicacion,
		idpropietario,
		idcustodio,
		val_c,
		val_i,
		val_d,
		idvalor,
		estado,
		comentario,
		id_user_added,
		DATE_ADD
	);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_nivel_riesgo` (IN `descripcion` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `color` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO nivel_riesgo(descripcion,operador1,valor1,operador2,valor2,color,comentario,estado,id_user_added,DATE_ADD)
	VALUES (descripcion,operador1,valor1,operador2,valor2,color,comentario,estado,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_probabilidad_1` (IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `escenario` INT, IN `formula` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO probabilidad_riesgo(formula,descripcion,tipo_regla,tipo_valor,comentario,estado,escenario,id_user_added,DATE_ADD)
	VALUES (formula,descripcion,tipo_regla,tipo_valor,comentario,estado,escenario,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_probabilidad_2` (IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `comentario` VARCHAR(150), IN `estado` INT, IN `escenario` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO probabilidad_riesgo(descripcion,tipo_regla,tipo_valor,operador1,valor1,operador2,valor2,comentario,estado,escenario,id_user_added,DATE_ADD)
	VALUES (descripcion,tipo_regla,tipo_valor,operador1,valor1,operador2,valor2,comentario,estado,escenario,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_tipo_amenaza` (IN `tipo` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO tipo_amenaza(tipo,estado,id_user_added,DATE_ADD)
	VALUES (tipo,estado,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_plan_accion` (IN `plan_accion` VARCHAR(150), IN `actividades` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATETIME, IN `fecha_fin` DATETIME, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idposicion` INT, IN `id_user` INT)   BEGIN
	SET @fecha_actual = CURRENT_DATE();
    
    INSERT INTO plan_accion
    (
        plan_accion,
        actividades,
        descripcion,
        fecha_inicio,
        fecha_fin,
        idempresa,
        idarea,
        idunidad,
        idposicion,
        id_user_added,
        DATE_ADD
    )
    VALUES
    (
        plan_accion,
        actividades,
        descripcion,
        fecha_inicio,
        fecha_fin,
        idempresa,
        idarea,
        idunidad,
        idposicion,
        id_user,
        @fecha_actual
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_change_status_riesgo_by_activo` (IN `id_activo_param` INT, IN `status` INT)   begin
update evaluacion_riesgo set estado=status where id_activo=id_activo_param;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_count_evaluacion_by_valor` ()   BEGIN
	SELECT COUNT(*) AS cantidad,er.valor
	FROM evaluacion_riesgo er
	INNER JOIN inventario_clasificacion_activo ica ON ica.id=er.id_activo
	WHERE er.estado=1 AND er.is_deleted=0 AND ica.is_deleted=0
	GROUP BY er.valor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_categoria_vulnerabilidad` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE categoria_vulnerabilidad
	SET is_deleted=1,
	estado=2,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_desc_amenaza` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE desc_amenaza
	SET is_deleted=1,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_desc_vulnerabilidad` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE desc_vulnerabilidad
	SET is_deleted=1,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_evaluacion_riesgo` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE evaluacion_riesgo
	SET is_deleted=1,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_impacto` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE impacto_riesgo
	SET is_deleted=1,estado=2,id_user_deleted=id_user_deleted,date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_inventario_clasificacion_activo` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE inventario_clasificacion_activo
	SET is_deleted=1,id_user_deleted=id_user_deleted,date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_nivel_riesgo` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE nivel_riesgo
	SET is_deleted=1,
	estado=2,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_probabilidad` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE probabilidad_riesgo
	SET is_deleted=1,estado=2,id_user_deleted=id_user_deleted,date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_tipo_amenaza` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE tipo_amenaza
	SET is_deleted=1,
	estado=2,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_tipo_riesgo` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	UPDATE tipo_riesgo
	SET estado=2,is_deleted=1,id_user_deleted=id_user_deleted,date_deleted=date_deleted
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_plan_accion` (IN `id` INT, IN `plan_accion` VARCHAR(150), IN `actividades` INT, IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATETIME, IN `fecha_fin` DATETIME, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idposicion` INT, IN `id_user` INT)   BEGIN
	SET @fecha_actual = CURRENT_DATE();
    
    UPDATE plan_accion SET
        plan_accion = plan_accion,
        actividades = actividades,
        descripcion = descripcion,
        fecha_inicio = fecha_inicio,
        fecha_fin = fecha_fin,
        idempresa = idempresa,
        idarea = idarea,
        idunidad = idunidad,
        idposicion = idposicion,
        id_user_updated = id_user,
        date_modify = @fecha_actual
    WHERE id = id AND is_deleted = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_categoria_vulnerabilidad` (IN `idid` INT, IN `categoria` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	UPDATE categoria_vulnerabilidad
	SET categoria=categoria,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	WHERE id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_desc_amenaza` (IN `idid` INT, IN `idtipo_amenaza` INT, IN `amenaza` VARCHAR(150), IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	UPDATE desc_amenaza
	SET idtipo_amenaza=idtipo_amenaza,
	amenaza=amenaza,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	WHERE id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_desc_vulnerabilidad` (IN `idid` INT, IN `idcategoria` INT, IN `vulnerabilidad` VARCHAR(150), IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	UPDATE desc_vulnerabilidad
	SET idcategoria=idcategoria,
	vulnerabilidad=vulnerabilidad,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	WHERE id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_impacto_1` (IN `idir` INT, IN `iddescripcion` VARCHAR(150), IN `idtipo_regla` VARCHAR(150), IN `idtipo_valor` VARCHAR(150), IN `idcomentario` VARCHAR(150), IN `idestado` INT, IN `idformula` VARCHAR(150), IN `idid_user_updated` INT, IN `iddate_modify` DATETIME)   BEGIN
	UPDATE impacto_riesgo
	SET formula=idformula,
    descripcion=iddescripcion,
    tipo_regla=idtipo_regla,
    tipo_valor=idtipo_valor,
    comentario=idcomentario,
    estado=idestado,
    id_user_updated=
    idid_user_updated,
    date_modify=iddate_modify
	WHERE id=idir;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_impacto_2` (IN `idir` INT, IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `comentario` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	UPDATE impacto_riesgo
	SET descripcion=descripcion,
	tipo_regla=tipo_regla,
	tipo_valor=tipo_valor,
	operador1=operador1,
	operador2=operador2,
	valor1=valor1,
	valor2=valor2,
	comentario=comentario,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	WHERE id=idir;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_inventario_clasificacion_activo` (IN `idid` INT, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idmacroproceso` INT, IN `idproceso` INT, IN `activo` VARCHAR(150), IN `desc_activo` VARCHAR(500), IN `idtipo_activo` INT, IN `idcategoria_activo` INT, IN `idubicacion` INT, IN `idpropietario` INT, IN `idcustodio` INT, IN `val_c` INT, IN `val_i` INT, IN `val_d` INT, IN `idvalor` INT, IN `estado` INT, IN `comentario` VARCHAR(500), IN `id_user_updated` INT, IN `date_modify` DATETIME, IN `observacion` VARCHAR(200), IN `estado_2_param` INT)   BEGIN
	UPDATE inventario_clasificacion_activo
	SET idempresa=idempresa,
	idarea=idarea,
	idunidad=idunidad,
	idmacroproceso=idmacroproceso,
	idproceso=idproceso,
	activo=activo,
	desc_activo=desc_activo,
	idtipo_activo=idtipo_activo,
	idcategoria_activo=idcategoria_activo,
	idubicacion=idubicacion,
	idpropietario=idpropietario,
	idcustodio=idcustodio,
	val_c=val_c,
	val_i=val_i,
	val_d=val_d,
	idvalor=idvalor,
	estado=estado,
	comentario=comentario,
	id_user_updated=id_user_updated,
	date_modify=date_modify,
	observacion=observacion,
    estado_2=estado_2_param where id=idid;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_nivel_riesgo` (IN `idid` INT, IN `descripcion` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `color` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	UPDATE nivel_riesgo
	SET descripcion=descripcion,
	operador1=operador1,
	operador2=operador2,
	valor1=valor1,
	valor2=valor2,
	color=color,
	comentario=comentario,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	WHERE id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_probabilidad_1` (IN `idpr` INT, IN `iddescripcion` VARCHAR(150), IN `idtipo_regla` VARCHAR(150), IN `idtipo_valor` VARCHAR(150), IN `idcomentario` VARCHAR(150), IN `idestado` INT, IN `idformula` VARCHAR(150), IN `idid_user_updated` INT, IN `iddate_modify` DATETIME)   BEGIN
	UPDATE probabilidad_riesgo
	SET formula=idformula,
    descripcion=iddescripcion,
    tipo_regla=idtipo_regla,
    tipo_valor=idtipo_valor,
    comentario=idcomentario,
    estado=idestado,
    id_user_updated=idid_user_updated,
    date_modify=iddate_modify
	WHERE id=idpr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_probabilidad_2` (IN `idpr` INT, IN `iddescripcion` VARCHAR(150), IN `idtipo_regla` VARCHAR(150), IN `idtipo_valor` VARCHAR(150), IN `idoperador1` VARCHAR(150), IN `idvalor1` INT, IN `idoperador2` VARCHAR(150), IN `idvalor2` INT, IN `idcomentario` VARCHAR(150), IN `idestado` INT, IN `idid_user_updated` INT, IN `iddate_modify` DATETIME)   BEGIN
	UPDATE probabilidad_riesgo
	SET descripcion=iddescripcion,
	tipo_regla=idtipo_regla,
	tipo_valor=idtipo_valor,
	operador1=idoperador1,
	operador2=idoperador2,
	valor1=idvalor1,
	valor2=idvalor2,
	comentario=idcomentario,
	estado=idestado,
	id_user_updated=idid_user_updated,
	date_modify=iddate_modify
	WHERE id=idpr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_tipo_amenaza` (IN `idid` INT, IN `tipo` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	UPDATE tipo_amenaza
	SET tipo=tipo,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	WHERE id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_active_escenario_1` ()   BEGIN
	SELECT * FROM probabilidad_riesgo WHERE estado=1 AND is_deleted=0 AND escenario=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_active_impacto_escenario_1` ()   BEGIN
	SELECT * FROM impacto_riesgo WHERE estado=1 AND is_deleted=0 AND escenario=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_aplicacion_impacto_by_caracteristica` (IN `caracteristica` VARCHAR(50), IN `escene` INT)   BEGIN
	SELECT ai.*,cc.caracteristica
	FROM aplicacion_impacto ai
	INNER JOIN caracteristica_control cc ON cc.id = ai.idclasificacion
	WHERE cc.caracteristica=caracteristica AND ai.is_deleted=0 AND escenario=escene;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_aplicacion_probabilidad_by_caracteristica` (IN `idcaracteristica` VARCHAR(50), IN `escene` INT)   BEGIN
	SELECT ap.*,cc.caracteristica
	FROM aplicacion_probailidad ap
	INNER JOIN caracteristica_control cc ON cc.id = ap.idclasificacion
	WHERE cc.caracteristica=idcaracteristica AND ap.is_deleted=0 AND escenario=escene;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_caracteristica_control_opcion` (IN `scene` INT)   begin
	select ap.id,cc.caracteristica,ap.posicion,ap.escenario
	from aplicacion_probailidad as ap
	inner join caracteristica_control as cc on cc.id = ap.idclasificacion where ap.escenario=scene;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_evaluacion_riesgo_by_id` (IN `id_param` INT)   BEGIN
	SELECT * FROM evaluacion_riesgo WHERE id=id_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_evaluacion_riesgo_controles_by_evaluacion_riesgo_id` (IN `id_evaluacion_riesgo_pass` INT)   BEGIN
	select * from evaluacion_riesgos_controles where id_evaluacion_riesgo = id_evaluacion_riesgo_pass and is_deleted=0;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impacto_by_description` (IN `iddescription` VARCHAR(50))   BEGIN
	SELECT * FROM impacto_riesgo
	WHERE descripcion=iddescription AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_info_to_email` (IN `idid` INT)   BEGIN
	SELECT
	ica.id AS ica_id,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario AS propietario,
	pp.posicion_puesto AS des_propietario,
	ica.idcustodio AS custodio,
	ica.observacion AS observacion,
	pp1.posicion_puesto AS des_custodio,
	ica.val_c AS val_c,
	ica.val_i AS val_i,
	ica.val_d AS val_d,
	ica.estado AS ica_estado,
	ica.comentario AS ica_comentario,
	e.id AS id_empresa,
	e.empresa AS empresa,
	a.id AS id_area,
	a.area AS area,
	u.id AS id_unidad,
	u.unidad AS unidad,
	m.id AS id_macroproceso,
	m.macroproceso AS macroproceso,
	p.id AS id_proceso,
	p.proceso AS proceso,
	ta.id AS id_tipo_activo,
	ta.tipo AS tipo_activo,
	ca.id AS id_categoria_activo,
	ca.categoria AS categoria_activo,
	ua.id AS ubicacion_id,
	ua.continente AS ubicacion_continente,
	ua.pais AS ubicacion_pais,
	ua.ciudad AS ubicacion_ciudad,
	ua.direccion AS ubicacion_direccion,
	ua.descripcion AS ubicacion_descripcion,
	va.id AS id_valor,
	va.valor AS valor
	FROM inventario_clasificacion_activo AS ica
	INNER JOIN empresa AS e ON e.id=ica.idempresa
	INNER JOIN area AS a ON a.id=ica.idarea
	INNER JOIN unidades AS u ON u.id=ica.idunidad
	INNER JOIN macroproceso AS m ON m.id=ica.idmacroproceso
	INNER JOIN proceso AS p ON p.id=ica.idproceso
	INNER JOIN tipo_activo AS ta ON ta.id=ica.idtipo_activo
	INNER JOIN categoria_activo AS ca ON ca.id=ica.idcategoria_activo
	INNER JOIN ubicacion_activo AS ua ON ua.id=ica.idubicacion
	INNER JOIN valor_activo AS va ON va.id=ica.idvalor
	INNER JOIN posicion_puesto AS pp ON pp.id=ica.idpropietario
	INNER JOIN posicion_puesto AS pp1 ON pp1.id=ica.idcustodio
	WHERE ica.id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_inventario_clasificacion_activo` (IN `idid` INT)   BEGIN
	SELECT * FROM inventario_clasificacion_activo WHERE id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_last_evaluacion_riesgo` ()   BEGIN
	SELECT id FROM evaluacion_riesgo ORDER BY id DESC LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_last_id` ()   BEGIN
	SELECT * FROM inventario_clasificacion_activo ORDER BY id DESC LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_probabilidad_by_description` (IN `iddescription` VARCHAR(50))   BEGIN
	SELECT * FROM probabilidad_riesgo
	WHERE descripcion=iddescription AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_valoracion_riesgo` (IN `idid_probabilidad` INT, IN `idid_impacto` INT)   BEGIN
	SELECT * FROM valoracion_riesgo WHERE idProbabilidad=idid_probabilidad AND idImpacto=idid_impacto AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_valor_combinacion_valoracion` (IN `val_c` INT, IN `val_i` INT, IN `val_d` INT)   BEGIN
	SELECT vac.id,vac.valor FROM valoracion_activo va
	INNER JOIN valor_activo vac ON va.idvalor=vac.id
	WHERE va.valoracion1=val_c AND va.valoracion2=val_i AND valoracion3=val_d;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tipo_riesgo` (IN `tipo_riesgo` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	INSERT INTO tipo_riesgo(tipo_riesgo,descripcion,estado,id_user_added,DATE_ADD) VALUES(tipo_riesgo,descripcion,estado,id_user_added,DATE_ADD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_categoria_vulnerabilidad` ()   BEGIN
	SELECT * FROM categoria_vulnerabilidad WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_desc_amenaza` ()   BEGIN
	select da.id as id,ta.tipo as tipo_amenaza,da.amenaza as amenaza from desc_amenaza as da inner join tipo_amenaza as ta on da.idtipo_amenaza = ta.id WHERE da.is_deleted=0;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_desc_vulnerabilidad` ()   BEGIN
	SELECT * FROM desc_vulnerabilidad WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_evaluacion_riesgo` ()   BEGIN
	SELECT * FROM evaluacion_riesgo WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_evaluacion_riesgo_historial` (IN `idid` INT)   BEGIN
	SELECT
		erh.id AS id,
		tipo_riesgo.tipo_riesgo AS tipo_riesgo,
		empresa.empresa AS empresa,
		area.area AS area,
		unidades.unidad AS unidad,
		macroproceso.macroproceso AS macroproceso,
		proceso.proceso AS proceso,
		erh.id_activo AS activo,
		ta.tipo AS tipo_amenaza,
		da.amenaza AS descripcion_amenaza,
		ca.categoria AS tipo_vulnerabilidad,
		dv.vulnerabilidad AS descripcion_vulnerabilidad,
		erh.riesgo AS riesgo,
		erh.valor_probabilidad AS valor_probabilidad,
		erh.probabilidad AS probabilidad,
		erh.valor_impacto AS valor_impacto,
		erh.impacto AS impacto,
		erh.valor AS valor,
		erh.id_control AS control,
		erh.riesgo_controlado_probabilidad AS riesgo_controlado_probabilidad,
		erh.riesgo_controlado_impacto AS riesgo_controlado_impacto,
		erh.riesgo_controlado_valor AS riesgo_controlado_valor,
		erh.date_add AS DATE_ADD
	FROM evaluacion_riesgo_historial erh
	INNER JOIN empresa ON empresa.id=erh.id_empresa
	INNER JOIN tipo_riesgo ON tipo_riesgo.id=erh.id_tipo_riesgo
	INNER JOIN AREA ON area.id=erh.id_area
	INNER JOIN unidades ON unidades.id=erh.id_unidad
	INNER JOIN macroproceso ON macroproceso.id=erh.id_macroproceso
	INNER JOIN proceso ON proceso.id = erh.id_proceso
	INNER JOIN inventario_clasificacion_activo AS iva ON iva.id=erh.id_activo
	INNER JOIN tipo_amenaza ta ON ta.id=erh.id_tipo_amenaza
	INNER JOIN desc_amenaza da ON da.id=erh.id_descripcion_amenaza
	INNER JOIN categoria_vulnerabilidad ca ON ca.id=erh.id_tipo_vulnerabilidad
	INNER JOIN desc_vulnerabilidad dv ON dv.id=erh.id_descripcion_vulnerabilidad
	WHERE erh.is_deleted=0 AND empresa.id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_ica_by_valoracion` (IN `val_c` INT, IN `val_i` INT, IN `val_d` INT)   BEGIN
	SELECT ica.* FROM inventario_clasificacion_activo ica
	WHERE ica.val_c=val_c AND ica.val_i=val_i AND ica.val_d=val_d;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_impacto` (IN `idescenario` INT)   BEGIN
	SELECT * FROM impacto_riesgo WHERE escenario=idescenario AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo` (IN `empresa` INT)   BEGIN
	SELECT
	ica.id AS ica_id,
    ica.estado_2 as ica_estado_2,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario AS propietario,
	pp.posicion_puesto AS des_propietario,
	ica.idcustodio AS custodio,
	ica.observacion AS observacion,
	pp1.posicion_puesto AS des_custodio,
	ica.val_c AS val_c,
	ica.val_i AS val_i,
	ica.val_d AS val_d,
	ica.estado AS ica_estado,
	ica.comentario AS ica_comentario,
	e.id AS id_empresa,
	e.empresa AS empresa,
	a.id AS id_area,
	a.area AS area,
	u.id AS id_unidad,
	u.unidad AS unidad,
	m.id AS id_macroproceso,
	m.macroproceso AS macroproceso,
	p.id AS id_proceso,
	p.proceso AS proceso,
	ta.id AS id_tipo_activo,
	ta.tipo AS tipo_activo,
	ca.id AS id_categoria_activo,
	ca.categoria AS categoria_activo,
	ua.id AS ubicacion_id,
	ua.continente AS ubicacion_continente,
	ua.pais AS ubicacion_pais,
	ua.ciudad AS ubicacion_ciudad,
	ua.direccion AS ubicacion_direccion,
	ua.descripcion AS ubicacion_descripcion,
	va.id AS id_valor,
	va.valor AS valor
	FROM inventario_clasificacion_activo AS ica
	INNER JOIN empresa AS e ON e.id=ica.idempresa
	INNER JOIN area AS a ON a.id=ica.idarea
	INNER JOIN unidades AS u ON u.id=ica.idunidad
	INNER JOIN macroproceso AS m ON m.id=ica.idmacroproceso
	INNER JOIN proceso AS p ON p.id=ica.idproceso
	INNER JOIN tipo_activo AS ta ON ta.id=ica.idtipo_activo
	INNER JOIN categoria_activo AS ca ON ca.id=ica.idcategoria_activo
	INNER JOIN ubicacion_activo AS ua ON ua.id=ica.idubicacion
	INNER JOIN valor_activo AS va ON va.id=ica.idvalor
	INNER JOIN posicion_puesto AS pp ON pp.id=ica.idpropietario
	INNER JOIN posicion_puesto AS pp1 ON pp1.id=ica.idcustodio
	WHERE ica.is_deleted=0 AND e.id=empresa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo_by_user` (IN `id_user` INT, IN `empresa` INT)   BEGIN
	SELECT
	ica.id AS ica_id,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario AS propietario,
	pp.posicion_puesto AS des_propietario,
	ica.idcustodio AS custodio,
	ica.observacion AS observacion,
	pp1.posicion_puesto AS des_custodio,
	ica.val_c AS val_c,
	ica.val_i AS val_i,
	ica.val_d AS val_d,
	ica.estado AS ica_estado,
	ica.comentario AS ica_comentario,
	e.id AS id_empresa,
	e.empresa AS empresa,
	a.id AS id_area,
	a.area AS area,
	u.id AS id_unidad,
	u.unidad AS unidad,
	m.id AS id_macroproceso,
	m.macroproceso AS macroproceso,
	p.id AS id_proceso,
	p.proceso AS proceso,
	ta.id AS id_tipo_activo,
	ta.tipo AS tipo_activo,
	ca.id AS id_categoria_activo,
	ca.categoria AS categoria_activo,
	ua.id AS ubicacion_id,
	ua.continente AS ubicacion_continente,
	ua.pais AS ubicacion_pais,
	ua.ciudad AS ubicacion_ciudad,
	ua.direccion AS ubicacion_direccion,
	ua.descripcion AS ubicacion_descripcion,
	va.id AS id_valor,
    ica.estado_2 as ica_estado_2,
	va.valor AS valor
	FROM inventario_clasificacion_activo AS ica
	INNER JOIN empresa AS e ON e.id=ica.idempresa
	INNER JOIN area AS a ON a.id=ica.idarea
	INNER JOIN unidades AS u ON u.id=ica.idunidad
	INNER JOIN macroproceso AS m ON m.id=ica.idmacroproceso
	INNER JOIN proceso AS p ON p.id=ica.idproceso
	INNER JOIN tipo_activo AS ta ON ta.id=ica.idtipo_activo
	INNER JOIN categoria_activo AS ca ON ca.id=ica.idcategoria_activo
	INNER JOIN ubicacion_activo AS ua ON ua.id=ica.idubicacion
	INNER JOIN valor_activo AS va ON va.id=ica.idvalor
	INNER JOIN posicion_puesto AS pp ON pp.id=ica.idpropietario
	INNER JOIN posicion_puesto AS pp1 ON pp1.id=ica.idcustodio
	WHERE ica.is_deleted=0 AND ica.id_user_added=id_user AND e.id=empresa
;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo_historial` (IN `idid` INT)   BEGIN
	SELECT
	ica.id_ica AS ica_id,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario AS propietario,
	pp.posicion_puesto AS des_propietario,
	ica.idcustodio AS custodio,
	ica.observacion AS observacion,
	ica.date_add AS date_created,
	pp1.posicion_puesto AS des_custodio,
	ica.val_c AS val_c,
	ica.val_i AS val_i,
	ica.val_d AS val_d,
	ica.estado AS ica_estado,
	ica.comentario AS ica_comentario,
	e.id AS id_empresa,
	e.empresa AS empresa,
	a.id AS id_area,
	a.area AS area,
	u.id AS id_unidad,
	u.unidad AS unidad,
     ica.estado_2 as ica_estado_2,
	m.id AS id_macroproceso,
	m.macroproceso AS macroproceso,
	p.id AS id_proceso,
	p.proceso AS proceso,
	ta.id AS id_tipo_activo,
	ta.tipo AS tipo_activo,
	ca.id AS id_categoria_activo,
	ca.categoria AS categoria_activo,
	ua.id AS ubicacion_id,
	ua.continente AS ubicacion_continente,
	ua.pais AS ubicacion_pais,
	ua.ciudad AS ubicacion_ciudad,
	ua.direccion AS ubicacion_direccion,
	ua.descripcion AS ubicacion_descripcion,
	va.id AS id_valor,
	va.valor AS valor
	FROM inventario_clasificacion_activo_historial AS ica
	INNER JOIN empresa AS e ON e.id=ica.idempresa
	INNER JOIN area AS a ON a.id=ica.idarea
	INNER JOIN unidades AS u ON u.id=ica.idunidad
	INNER JOIN macroproceso AS m ON m.id=ica.idmacroproceso
	INNER JOIN proceso AS p ON p.id=ica.idproceso
	INNER JOIN tipo_activo AS ta ON ta.id=ica.idtipo_activo
	INNER JOIN categoria_activo AS ca ON ca.id=ica.idcategoria_activo
	INNER JOIN ubicacion_activo AS ua ON ua.id=ica.idubicacion
	INNER JOIN valor_activo AS va ON va.id=ica.idvalor
	INNER JOIN posicion_puesto AS pp ON pp.id=ica.idpropietario
	INNER JOIN posicion_puesto AS pp1 ON pp1.id=ica.idcustodio
	WHERE ica.is_deleted=0 AND e.id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo_historial_by_user` (IN `id_user` INT, IN `idid` INT)   BEGIN
	SELECT
	ica.id_ica AS ica_id,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario AS propietario,
	ica.date_add AS date_created,
	pp.posicion_puesto AS des_propietario,
	ica.idcustodio AS custodio,
	ica.observacion AS observacion,
	pp1.posicion_puesto AS des_custodio,
	ica.val_c AS val_c,
	ica.val_i AS val_i,
	ica.val_d AS val_d,
	ica.estado AS ica_estado,
	ica.comentario AS ica_comentario,
	e.id AS id_empresa,
	e.empresa AS empresa,
	a.id AS id_area,
	a.area AS area,
	u.id AS id_unidad,
     ica.estado_2 as ica_estado_2,
	u.unidad AS unidad,
	m.id AS id_macroproceso,
	m.macroproceso AS macroproceso,
	p.id AS id_proceso,
	p.proceso AS proceso,
	ta.id AS id_tipo_activo,
	ta.tipo AS tipo_activo,
	ca.id AS id_categoria_activo,
	ca.categoria AS categoria_activo,
	ua.id AS ubicacion_id,
	ua.continente AS ubicacion_continente,
	ua.pais AS ubicacion_pais,
	ua.ciudad AS ubicacion_ciudad,
	ua.direccion AS ubicacion_direccion,
	ua.descripcion AS ubicacion_descripcion,
	va.id AS id_valor,
	va.valor AS valor
	FROM inventario_clasificacion_activo_historial AS ica
	INNER JOIN empresa AS e ON e.id=ica.idempresa
	INNER JOIN area AS a ON a.id=ica.idarea
	INNER JOIN unidades AS u ON u.id=ica.idunidad
	INNER JOIN macroproceso AS m ON m.id=ica.idmacroproceso
	INNER JOIN proceso AS p ON p.id=ica.idproceso
	INNER JOIN tipo_activo AS ta ON ta.id=ica.idtipo_activo
	INNER JOIN categoria_activo AS ca ON ca.id=ica.idcategoria_activo
	INNER JOIN ubicacion_activo AS ua ON ua.id=ica.idubicacion
	INNER JOIN valor_activo AS va ON va.id=ica.idvalor
	INNER JOIN posicion_puesto AS pp ON pp.id=ica.idpropietario
	INNER JOIN posicion_puesto AS pp1 ON pp1.id=ica.idcustodio
	INNER JOIN inventario_clasificacion_activo AS ic ON ic.id=ica.id_ica
	WHERE ica.is_deleted=0 AND ic.id_user_added=id_user 
    AND e.id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_nivel_riesgo` ()   BEGIN
	SELECT * FROM nivel_riesgo WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_probabilidad` (IN `idescenario` INT)   BEGIN
	SELECT * FROM probabilidad_riesgo WHERE escenario=idescenario AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_tipo_amenaza` ()   BEGIN
	SELECT * FROM tipo_amenaza WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_tipo_riesgo` ()   BEGIN
	SELECT * FROM tipo_riesgo WHERE is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_evaluacion_riesgo` (IN `idid` INT, IN `idid_tipo_riesgo` INT, IN `idid_empresa` INT, IN `idid_area` INT, IN `idid_unidad` INT, IN `idid_macroproceso` INT, IN `idid_proceso` INT, IN `idid_activo` INT, IN `idid_tipo_amenaza` INT, IN `idid_descripcion_amenaza` INT, IN `idid_tipo_vulnerabilidad` INT, IN `idid_descripcion_vulnerabilidad` INT, IN `idriesgo` VARCHAR(150), IN `idvalor_probabilidad` INT, IN `idprobabilidad` VARCHAR(150), IN `idvalor_impacto` VARCHAR(150), IN `idimpacto` VARCHAR(150), IN `idvalor` VARCHAR(150), IN `idid_control` INT, IN `idriesgo_controlado_probabilidad` VARCHAR(150), IN `idriesgo_controlado_impacto` VARCHAR(150), IN `idriesgo_controlado_valor` VARCHAR(150), IN `idestado` INT, IN `idid_user_updated` INT, IN `iddate_modify` DATETIME)   BEGIN
	UPDATE evaluacion_riesgo
	SET 
	id_tipo_riesgo=idid_tipo_riesgo,
	id_empresa=idid_empresa,
	id_area=idid_area,
	id_unidad=idid_unidad,
	id_macroproceso=idid_macroproceso,
	id_proceso=idid_proceso,
	id_activo=idid_activo,
	id_tipo_amenaza=idid_tipo_amenaza,
	id_descripcion_amenaza=idid_descripcion_amenaza,
	id_tipo_vulnerabilidad=idid_tipo_vulnerabilidad,
	id_descripcion_vulnerabilidad=idid_descripcion_vulnerabilidad,
	riesgo=idriesgo,
	valor_probabilidad=idvalor_probabilidad,
	probabilidad=idprobabilidad,
	valor_impacto=idvalor_impacto,
	impacto=idimpacto,
	valor=idvalor,
	id_control=idid_control,
	riesgo_controlado_probabilidad=idriesgo_controlado_probabilidad,
	riesgo_controlado_impacto=idriesgo_controlado_impacto,
	riesgo_controlado_valor=idriesgo_controlado_valor,
	estado=idestado,
	id_user_updated=idid_user_updated,
	date_modify=iddate_modify
	WHERE id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_scene_probabilidad_user` (IN `user_id` INT, IN `idscene` INT)   BEGIN
	UPDATE escenario_active SET escenario=idscene;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_tipo_riesgo` (IN `idid` INT, IN `tipo_riesgo` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	UPDATE tipo_riesgo
	SET tipo_riesgo=tipo_riesgo,descripcion=descripcion,estado=estado,id_user_updated=id_user_updated,date_modify=date_modify
	WHERE id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validate_combinatoria_impacto` (IN `idoperador1` VARCHAR(150), IN `idvalor1` INT, IN `idoperador2` VARCHAR(150), IN `idvalor2` INT)   BEGIN
	SELECT * FROM impacto_riesgo
	WHERE operador1=idoperador1 AND valor1=idvalor1
	AND operador2=idoperador2 AND valor2=idvalor2 AND estado=1 AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validate_combinatoria_probabilidad` (IN `idoperador1` VARCHAR(150), IN `idvalor1` INT, IN `idoperador2` VARCHAR(150), IN `idvalor2` INT)   BEGIN
	SELECT * FROM probabilidad_riesgo
	WHERE operador1=idoperador1 AND valor1=idvalor1
	AND operador2=idoperador2 AND valor2=idvalor2 AND estado=1
    AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateConfigPass` (IN `idduracion` INT, IN `idinactividad` INT, IN `idsesion` INT, IN `idtama_min` INT, IN `idtama_max` INT, IN `idletras` INT, IN `idnumeros` INT, IN `idcaracteres` INT, IN `last_activity` INT, IN `idintentos` INT)   begin
UPDATE config_pass SET
        duracion=idduracion,
        inactividad=idinactividad,
        sesion=idsesion,
        tama_min=idtama_min,
        tama_max=idtama_max,
        letras=idletras,
        numeros=idnumeros,
        caracteres=idcaracteres,
        fecha_actualizacion=last_activity,
        intentos=idintentos;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEstadoPLan` (IN `idid` INT)   begin
	UPDATE plan_accion SET idestado=2 where id = idid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLoged` (IN `dato` INT)   begin
	DELETE FROM tb_sesiones 
        where id_us = dato;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_status_ica` (IN `idid` INT, IN `estado` INT, IN `date_modify` DATETIME, IN `id_user_updated` INT)   BEGIN
	UPDATE inventario_clasificacion_activo
	SET estado=estado,id_user_updated=id_user_updated,date_modify=date_modify
	WHERE id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_valor_ica` (IN `id` INT, IN `id_valor` INT)   BEGIN
	UPDATE inventario_clasificacion_activo
	SET idvalor=id_valor
	WHERE id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaAlerta_seguimiento` (IN `idalert` VARCHAR(50))   BEGIN
	  SELECT * FROM alert_seguimiento WHERE alerta=idalert and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaArea` (IN `idarea` VARCHAR(150), IN `empresa` INT)   BEGIN
	SELECT * FROM area   WHERE idempresa =empresa
    AND area=idarea;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaAspecto` (IN `idaspecto` VARCHAR(150))   BEGIN
	 SELECT * FROM aspectos_seguridad WHERE 
         aspecto=idaspecto AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaCatActivo` (IN `idcategoria` VARCHAR(150), IN `ididtipo` INT)   BEGIN
	SELECT * FROM categoria_activo 
            WHERE idtipo=ididtipo AND 
			categoria=idcategoria AND
            is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaClasInfo` (IN `idclasificacion` VARCHAR(150))   BEGIN
SELECT * FROM clasificacion_informacion 
            WHERE clasificacion=idclasificacion AND
            is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaEmpresa` (IN `ïdempresa` VARCHAR(150))   BEGIN
	SELECT * FROM empresa  WHERE empresa =idempresa AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaEstado` (IN `idestado` VARCHAR(50))   BEGIN
	  SELECT * FROM estado WHERE estado=idestado and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaMacroproceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `idmacroproceso` VARCHAR(150))   BEGIN
	SELECT * FROM macroproceso WHERE 
          idempresa=empresa AND
		idarea = area AND idunidad=unidad
		AND macroproceso=idmacroproceso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaPlanAccion` (IN `idplan_accion` VARCHAR(150))   BEGIN
	  SELECT * FROM plan_accion WHERE plan_accion=idplan_accion AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaPosicion` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `posicion` VARCHAR(150))   BEGIN
	SELECT * FROM posicion_puesto WHERE 
          idempresa=empresa AND
		idarea = AREA AND idunidad=unidad
		AND posicion_puesto=posicion AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaPrioridad` (IN `idprioridad` VARCHAR(150))   BEGIN
	SELECT * FROM prioridad WHERE prioridad=idprioridad AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaProceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` INT, IN `idproceso` VARCHAR(150))   BEGIN
	SELECT * FROM proceso WHERE 
		idmacroproceso=macroproceso AND
          idempresa=empresa AND
		idarea = area AND idunidad=unidad
		AND proceso=idproceso AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaRegistroControl` (IN `dato` VARCHAR(500))   begin
select * from registro_controles 
        where is_deleted=0 and nom_control=dato;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaTipoActivo` (IN `idtipo` VARCHAR(150))   BEGIN
	SELECT * FROM tipo_activo 
            WHERE tipo=idtipo AND
            is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaUbiActivo` (IN `idcontinente` VARCHAR(50), IN `idpais` VARCHAR(50), IN `idciudad` VARCHAR(50), IN `iddireccion` VARCHAR(300), IN `iddescripcion` VARCHAR(300))   BEGIN
	SELECT * FROM ubicacion_activo 
            WHERE continente=idcontinente AND 
			pais=idpais AND
			ciudad= idciudad AND
			direccion=iddireccion AND
			descripcion = iddescripcion AND
            is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaUnidad` (IN `ididarea` INT, IN `ididempresa` INT, IN `idunidad` VARCHAR(150))   BEGIN
	SELECT * FROM unidades WHERE 
          idempresa=ididempresa AND
		idarea = ididarea AND unidad=idunidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaValoracionActivo` (IN `ididaspecto1` INT, IN `ididaspecto2` INT, IN `ididaspecto3` INT, IN `ididvaloracion1` INT, IN `ididvaloracion2` INT, IN `ididvaloracion3` INT)   BEGIN
	SELECT * FROM valoracion_activo 
            WHERE idaspecto1=ididaspecto1
            AND idaspecto2= ididaspecto2
            AND idaspecto3=ididaspecto3
           
            AND valoracion1=ididvaloracion1
            AND valoracion2=ididvaloracion2
            AND valoracion3=ididvaloracion3 AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaValorActivo` (IN `idvalor` VARCHAR(150))   BEGIN
	 SELECT * FROM valor_activo WHERE 
         valor=idvalor AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_AplicacionImpacto` (IN `disenio` INT, IN `idposicion` VARCHAR(50), IN `idescenario` INT)   BEGIN
	 SELECT *
	FROM aplicacion_impacto WHERE idclasificacion=disenio AND 
	posicion=idposicion AND escenario=idescenario AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_AplicacionProbabilidad` (IN `disenio` INT, IN `idposicion` VARCHAR(50), IN `idescenario` INT)   BEGIN
	SELECT *
	FROM aplicacion_probailidad WHERE idclasificacion=disenio AND 
	posicion=idposicion AND escenario=idescenario AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_caractControl` (IN `idcaracteristica` VARCHAR(50), IN `ididOpcion` INT)   BEGIN
	SELECT *
	FROM caracteristica_control WHERE caracteristica=idcaracteristica AND idOpcion=ididOpcion AND is_deleted=0 ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_cobertura` (IN `idcobertura` VARCHAR(150))   BEGIN
	SELECT * FROM cobertura WHERE cobertura=idcobertura AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_Evaluacion_Control` (IN `disenio` INT, IN `operatividad` INT, IN `calificacion` VARCHAR(50))   BEGIN
	SELECT *
	FROM evaluacion_control
    WHERE idDisenio=disenio AND 
	idOperatividad=operatividad AND calificacion=calificacion AND is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_ValoracionRiesgo` (IN `probabilidad` INT, IN `impacto` INT)   BEGIN
	  SELECT *
	  FROM valoracion_riesgo WHERE 
	  idProbabilidad=probabilidad AND IdImpacto=impacto;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades_plan`
--

CREATE TABLE `actividades_plan` (
  `id` int(11) NOT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idunidad` int(11) DEFAULT NULL,
  `idposicion` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `idalerta` int(11) DEFAULT NULL,
  `progreso` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `id_planes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alert_seguimiento`
--

CREATE TABLE `alert_seguimiento` (
  `id` int(11) NOT NULL,
  `alerta` varchar(150) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alert_seguimiento`
--

INSERT INTO `alert_seguimiento` (`id`, `alerta`, `descripcion`, `valor`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(8, 'Alerta Diaria', 'Alerta Diaria', 1, 5, '2023-04-10 17:02:31.000000', NULL, NULL, NULL, NULL, 0),
(9, 'Alerta Semanal', 'Alerta Semanal', 7, 5, '2023-04-10 17:02:48.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion_impacto`
--

CREATE TABLE `aplicacion_impacto` (
  `id` int(11) NOT NULL,
  `idclasificacion` int(11) DEFAULT NULL,
  `posicion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `escenario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aplicacion_impacto`
--

INSERT INTO `aplicacion_impacto` (`id`, `idclasificacion`, `posicion`, `descripcion`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`, `escenario`) VALUES
(8, 118, '10%', 'Disminuye 10%', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 1),
(9, 119, '25%', 'Disminuye 25%', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 1),
(10, 120, '80%', 'Disminuye 80%', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion_probailidad`
--

CREATE TABLE `aplicacion_probailidad` (
  `id` int(11) NOT NULL,
  `idclasificacion` int(11) DEFAULT NULL,
  `posicion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `escenario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aplicacion_probailidad`
--

INSERT INTO `aplicacion_probailidad` (`id`, `idclasificacion`, `posicion`, `descripcion`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`, `escenario`) VALUES
(10, 118, '10%', 'Disminuye 10%', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 1),
(11, 119, '25%', 'Disminuye 25%', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 1),
(12, 120, '80%', 'Disminuye 80%', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `area` varchar(250) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `area`, `estado`, `idempresa`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(27, 'SN', 1, 26, 5, '2023-04-10 16:37:25.000000', 5, '2023-04-10 16:44:32.000000', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspectos_seguridad`
--

CREATE TABLE `aspectos_seguridad` (
  `id` int(11) NOT NULL,
  `aspecto` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aspectos_seguridad`
--

INSERT INTO `aspectos_seguridad` (`id`, `aspecto`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(1, 'Confidencialidad', 1, 5, '2023-03-24 02:43:56.000000', 5, '2023-04-09 10:47:58.000000', NULL, NULL, 0),
(2, 'Integridad', 1, 5, '2023-03-24 02:44:12.000000', 12, '2023-04-05 13:13:12.000000', NULL, NULL, 0),
(3, 'Disponibilidad', 1, 5, '2023-03-24 02:44:20.000000', 12, '2023-04-05 13:13:36.000000', NULL, NULL, 0),
(4, 'Nuevo prueba', 1, 11, '2023-03-30 12:40:49.000000', 11, '2023-03-30 11:41:52.000000', NULL, NULL, 1),
(5, 'Confidencialidad', 1, 5, '2023-04-01 03:44:58.000000', NULL, '2023-04-01 02:45:03.000000', NULL, NULL, 1),
(6, 'Sostenibilidad', 2, 11, '2023-04-04 15:42:30.000000', 11, '2023-04-04 14:46:51.000000', NULL, NULL, 1),
(7, 'PRUEBA', 1, 11, '2023-04-04 15:55:38.000000', NULL, '2023-04-04 14:55:41.000000', NULL, NULL, 1),
(8, 'Sostenibildad', 1, 11, '2023-04-04 16:20:20.000000', NULL, '2023-04-04 15:20:37.000000', NULL, NULL, 1),
(9, 'Confidencialidad', 1, 4, '2023-04-05 03:03:17.000000', NULL, '2023-04-05 02:03:20.000000', NULL, NULL, 1),
(10, 'Confidencialidad', 1, 4, '2023-04-05 03:05:42.000000', NULL, '2023-04-05 02:05:48.000000', NULL, NULL, 1),
(11, 'ConfidencialidadA', 1, 4, '2023-04-05 03:07:09.000000', NULL, '2023-04-05 02:07:11.000000', NULL, NULL, 1),
(12, 'Sostenibilidad', 2, 11, '2023-04-05 12:05:38.000000', 11, '2023-04-05 11:06:02.000000', NULL, NULL, 1),
(13, 'asdf', 2, 11, '2023-04-05 12:07:03.000000', NULL, '2023-04-05 11:07:05.000000', NULL, NULL, 1),
(14, 'Autenticación', 1, 10, '2023-04-05 12:21:31.000000', 12, '2023-04-07 19:25:05.000000', NULL, NULL, 1),
(15, 'AutenticaciónAA', 2, 5, '2023-04-07 19:24:56.000000', 5, '2023-04-07 19:25:02.000000', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica_control`
--

CREATE TABLE `caracteristica_control` (
  `id` int(11) NOT NULL,
  `caracteristica` varchar(150) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `valor` varchar(30) DEFAULT NULL,
  `condicion` varchar(2) DEFAULT NULL,
  `peso` varchar(30) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `idOpcion` int(11) DEFAULT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  `check_tabla` int(11) DEFAULT NULL,
  `nom_tabla` varchar(100) DEFAULT NULL,
  `seleccionable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `caracteristica_control`
--

INSERT INTO `caracteristica_control` (`id`, `caracteristica`, `descripcion`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`, `valor`, `condicion`, `peso`, `tipo`, `idOpcion`, `clasificacion`, `check_tabla`, `nom_tabla`, `seleccionable`) VALUES
(108, 'Diseño', 'Diseño', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'menu', 0, 0, 0, '', 0),
(109, 'Operatividad', 'Operatividad', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'menu', 0, 0, 0, '', 1),
(110, 'Definición', 'Definición', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'submenu', 108, 0, 0, '', 0),
(111, 'Objetivo', 'Objetivo', 1, 5, '2023-04-10 00:00:00.000000', 5, '2023-04-10 00:00:00.000000', NULL, NULL, 0, '', '', '', 'submenu', 108, 0, 0, '', 1),
(112, 'Calificación de Diseño', 'Calificación de Diseño', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'submenu', 108, 1, 0, '', 0),
(113, 'Responsable', 'Responsable', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '0.5', 'opcion', 110, 0, 1, '1', 0),
(114, 'Periodicidad', 'Periodicidad', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '0.5', 'opcion', 110, 0, 0, '', 0),
(115, 'Evidencia', 'Evidencia', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '0.5', 'opcion', 110, 0, 0, '', 0),
(116, 'No cumple', 'No cumple', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '0.5', 'opcion', 111, 0, 0, '', 0),
(117, 'Cumple Parcial', 'Cumple Parcial', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '0.5', 'opcion', 111, 0, 0, '', 0),
(118, 'Débil', 'Débil', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '1', '<=', '', 'opcion', 112, 1, 0, '', 0),
(119, 'Moderado', 'Moderado', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '2', '=', '', 'opcion', 112, 1, 0, '', 0),
(120, 'Fuerte', 'Fuerte', 1, 5, '2023-04-10 00:00:00.000000', 5, '2023-04-10 00:00:00.000000', NULL, NULL, 0, '2', '>', '', 'opcion', 112, 1, 0, '', 0),
(121, 'Prueba o revisión', 'Prueba o revisión', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'submenu', 109, 0, 0, '', 0),
(122, 'Automatización', 'Objetivo', 1, 5, '2023-04-10 00:00:00.000000', 5, '2023-04-10 00:00:00.000000', NULL, NULL, 0, '', '', '', 'submenu', 109, 0, 0, '', 0),
(123, 'Calificación de Operatividad', 'Calificación de Operatividad', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'submenu', 109, 1, 0, '', 0),
(124, 'Caracteristicas de Operatividad', 'Caracteristicas de Operatividad', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'submenu', 109, 0, 0, '', 1),
(125, 'El control es débil', 'El control es débil', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '0', 'opcion', 121, 0, 0, '', 0),
(126, 'El control es moderado', 'El control es moderado\n', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '1', 'opcion', 121, 0, 0, '', 0),
(127, 'El control es fuerte', 'El control es fuerte', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '2', 'opcion', 121, 0, 0, '', 0),
(128, 'Es manual', 'Es manual', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '0', 'opcion', 122, 0, 0, '', 0),
(129, 'El semi-automático', 'El semi-automático', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '1', 'opcion', 122, 0, 0, '', 0),
(130, 'Es automático', 'Es automático', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '2', 'opcion', 122, 0, 0, '', 0),
(131, 'Débil', 'Débil', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '1', '<=', '', 'opcion', 123, 1, 0, '', 0),
(132, 'Moderado', 'Moderado', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '2', '=', '', 'opcion', 123, 1, 0, '', 0),
(133, 'Fuerte', 'Fuerte', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '2', '>', '', 'opcion', 123, 1, 0, '', 0),
(134, 'Preventivo', 'Preventivo', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'opcion', 124, 0, 0, '', 0),
(135, 'Detectivo', 'Detectivo', 1, 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'opcion', 124, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_tabla`
--

CREATE TABLE `catalogo_tabla` (
  `id` int(11) NOT NULL,
  `nom_tabla` varchar(100) DEFAULT NULL,
  `desc_tabla` varchar(150) DEFAULT NULL,
  `dato` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catalogo_tabla`
--

INSERT INTO `catalogo_tabla` (`id`, `nom_tabla`, `desc_tabla`, `dato`) VALUES
(1, 'posicion_puesto', 'Posicion y Puesto', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_activo`
--

CREATE TABLE `categoria_activo` (
  `id` int(11) NOT NULL,
  `categoria` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_activo`
--

INSERT INTO `categoria_activo` (`id`, `categoria`, `estado`, `idtipo`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(11, 'TI', 1, 11, 5, '2023-04-10 17:01:18.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_vulnerabilidad`
--

CREATE TABLE `categoria_vulnerabilidad` (
  `id` int(11) NOT NULL,
  `categoria` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_vulnerabilidad`
--

INSERT INTO `categoria_vulnerabilidad` (`id`, `categoria`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(11, 'Cat A', 1, 5, '2023-04-10 18:02:00.000000', NULL, NULL, NULL, NULL, 0),
(12, 'Cat B', 1, 5, '2023-04-10 18:02:05.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `ubicacionpaisid` int(11) DEFAULT NULL,
  `estadonombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `ubicacionpaisid`, `estadonombre`) VALUES
(1, 3, 'Azerbaijan'),
(2, 3, 'Nargorni Karabakh'),
(3, 3, 'Nakhichevanskaya Region'),
(4, 4, 'Anguilla'),
(5, 7, 'Brestskaya obl.'),
(6, 7, 'Vitebskaya obl.'),
(7, 7, 'Gomelskaya obl.'),
(8, 7, 'Grodnenskaya obl.'),
(9, 7, 'Minskaya obl.'),
(10, 7, 'Mogilevskaya obl.'),
(11, 8, 'Belize'),
(12, 10, 'Hamilton'),
(13, 15, 'Dong Bang Song Cuu Long'),
(14, 15, 'Dong Bang Song Hong'),
(15, 15, 'Dong Nam Bo'),
(16, 15, 'Duyen Hai Mien Trung'),
(17, 15, 'Khu Bon Cu'),
(18, 15, 'Mien Nui Va Trung Du'),
(19, 15, 'Thai Nguyen'),
(20, 16, 'Artibonite'),
(21, 16, 'Grand&#039;Anse'),
(22, 16, 'North West'),
(23, 16, 'West'),
(24, 16, 'South'),
(25, 16, 'South East'),
(26, 17, 'Grande-Terre'),
(27, 17, 'Basse-Terre'),
(28, 21, 'Abkhazia'),
(29, 21, 'Ajaria'),
(30, 21, 'Georgia'),
(31, 21, 'South Ossetia'),
(32, 23, 'Al QÄhira'),
(33, 23, 'Aswan'),
(34, 23, 'Asyut'),
(35, 23, 'Beni Suef'),
(36, 23, 'Gharbia'),
(37, 23, 'Damietta'),
(38, 24, 'Southern District'),
(39, 24, 'Central District'),
(40, 24, 'Northern District'),
(41, 24, 'Haifa'),
(42, 24, 'Tel Aviv'),
(43, 24, 'Jerusalem'),
(44, 25, 'Bangala'),
(45, 25, 'Chhattisgarh'),
(46, 25, 'Karnataka'),
(47, 25, 'Uttaranchal'),
(48, 25, 'Andhara Pradesh'),
(49, 25, 'Assam'),
(50, 25, 'Bihar'),
(51, 25, 'Gujarat'),
(52, 25, 'Jammu and Kashmir'),
(53, 25, 'Kerala'),
(54, 25, 'Madhya Pradesh'),
(55, 25, 'Manipur'),
(56, 25, 'Maharashtra'),
(57, 25, 'Megahalaya'),
(58, 25, 'Orissa'),
(59, 25, 'Punjab'),
(60, 25, 'Pondisheri'),
(61, 25, 'Rajasthan'),
(62, 25, 'Tamil Nadu'),
(63, 25, 'Tripura'),
(64, 25, 'Uttar Pradesh'),
(65, 25, 'Haryana'),
(66, 25, 'Chandigarh'),
(67, 26, 'Azarbayjan-e Khavari'),
(68, 26, 'Esfahan'),
(69, 26, 'Hamadan'),
(70, 26, 'Kordestan'),
(71, 26, 'Markazi'),
(72, 26, 'Sistan-e Baluches'),
(73, 26, 'Yazd'),
(74, 26, 'Kerman'),
(75, 26, 'Kermanshakhan'),
(76, 26, 'Mazenderan'),
(77, 26, 'Tehran'),
(78, 26, 'Fars'),
(79, 26, 'Horasan'),
(80, 26, 'Husistan'),
(81, 30, 'Aktyubinskaya obl.'),
(82, 30, 'Alma-Atinskaya obl.'),
(83, 30, 'Vostochno-Kazahstanskaya obl.'),
(84, 30, 'Gurevskaya obl.'),
(85, 30, 'Zhambylskaya obl. (Dzhambulskaya obl.)'),
(86, 30, 'Dzhezkazganskaya obl.'),
(87, 30, 'Karagandinskaya obl.'),
(88, 30, 'Kzyl-Ordinskaya obl.'),
(89, 30, 'Kokchetavskaya obl.'),
(90, 30, 'Kustanaiskaya obl.'),
(91, 30, 'Mangystauskaya (Mangyshlakskaya obl.)'),
(92, 30, 'Pavlodarskaya obl.'),
(93, 30, 'Severo-Kazahstanskaya obl.'),
(94, 30, 'Taldy-Kurganskaya obl.'),
(95, 30, 'Turgaiskaya obl.'),
(96, 30, 'Akmolinskaya obl. (Tselinogradskaya obl.)'),
(97, 30, 'Chimkentskaya obl.'),
(98, 31, 'Littoral'),
(99, 31, 'Southwest Region'),
(100, 31, 'North'),
(101, 31, 'Central'),
(102, 33, 'Government controlled area'),
(103, 33, 'Turkish controlled area'),
(104, 34, 'Issik Kulskaya Region'),
(105, 34, 'Kyrgyzstan'),
(106, 34, 'Narinskaya Region'),
(107, 34, 'Oshskaya Region'),
(108, 34, 'Tallaskaya Region'),
(109, 37, 'al-Jahra'),
(110, 37, 'al-Kuwait'),
(111, 38, 'Latviya'),
(112, 39, 'Tarabulus'),
(113, 39, 'Bengasi'),
(114, 40, 'Litva'),
(115, 43, 'Moldova'),
(116, 45, 'Auckland'),
(117, 45, 'Bay of Plenty'),
(118, 45, 'Canterbury'),
(119, 45, 'Gisborne'),
(120, 45, 'Hawke&#039;s Bay'),
(121, 45, 'Manawatu-Wanganui'),
(122, 45, 'Marlborough'),
(123, 45, 'Nelson'),
(124, 45, 'Northland'),
(125, 45, 'Otago'),
(126, 45, 'Southland'),
(127, 45, 'Taranaki'),
(128, 45, 'Tasman'),
(129, 45, 'Waikato'),
(130, 45, 'Wellington'),
(131, 45, 'West Coast'),
(132, 49, 'Saint-Denis'),
(133, 50, 'Altaiskii krai'),
(134, 50, 'Amurskaya obl.'),
(135, 50, 'Arhangelskaya obl.'),
(136, 50, 'Astrahanskaya obl.'),
(137, 50, 'Bashkiriya obl.'),
(138, 50, 'Belgorodskaya obl.'),
(139, 50, 'Bryanskaya obl.'),
(140, 50, 'Buryatiya'),
(141, 50, 'Vladimirskaya obl.'),
(142, 50, 'Volgogradskaya obl.'),
(143, 50, 'Vologodskaya obl.'),
(144, 50, 'Voronezhskaya obl.'),
(145, 50, 'Nizhegorodskaya obl.'),
(146, 50, 'Dagestan'),
(147, 50, 'Evreiskaya obl.'),
(148, 50, 'Ivanovskaya obl.'),
(149, 50, 'Irkutskaya obl.'),
(150, 50, 'Kabardino-Balkariya'),
(151, 50, 'Kaliningradskaya obl.'),
(152, 50, 'Tverskaya obl.'),
(153, 50, 'Kalmykiya'),
(154, 50, 'Kaluzhskaya obl.'),
(155, 50, 'Kamchatskaya obl.'),
(156, 50, 'Kareliya'),
(157, 50, 'Kemerovskaya obl.'),
(158, 50, 'Kirovskaya obl.'),
(159, 50, 'Komi'),
(160, 50, 'Kostromskaya obl.'),
(161, 50, 'Krasnodarskii krai'),
(162, 50, 'Krasnoyarskii krai'),
(163, 50, 'Kurganskaya obl.'),
(164, 50, 'Kurskaya obl.'),
(165, 50, 'Lipetskaya obl.'),
(166, 50, 'Magadanskaya obl.'),
(167, 50, 'Marii El'),
(168, 50, 'Mordoviya'),
(169, 50, 'Moscow &amp; Moscow Region'),
(170, 50, 'Murmanskaya obl.'),
(171, 50, 'Novgorodskaya obl.'),
(172, 50, 'Novosibirskaya obl.'),
(173, 50, 'Omskaya obl.'),
(174, 50, 'Orenburgskaya obl.'),
(175, 50, 'Orlovskaya obl.'),
(176, 50, 'Penzenskaya obl.'),
(177, 50, 'Permskiy krai'),
(178, 50, 'Primorskii krai'),
(179, 50, 'Pskovskaya obl.'),
(180, 50, 'Rostovskaya obl.'),
(181, 50, 'Ryazanskaya obl.'),
(182, 50, 'Samarskaya obl.'),
(183, 50, 'Saint-Petersburg and Region'),
(184, 50, 'Saratovskaya obl.'),
(185, 50, 'Saha (Yakutiya)'),
(186, 50, 'Sahalin'),
(187, 50, 'Sverdlovskaya obl.'),
(188, 50, 'Severnaya Osetiya'),
(189, 50, 'Smolenskaya obl.'),
(190, 50, 'Stavropolskii krai'),
(191, 50, 'Tambovskaya obl.'),
(192, 50, 'Tatarstan'),
(193, 50, 'Tomskaya obl.'),
(195, 50, 'Tulskaya obl.'),
(196, 50, 'Tyumenskaya obl. i Hanty-Mansiiskii AO'),
(197, 50, 'Udmurtiya'),
(198, 50, 'Ulyanovskaya obl.'),
(199, 50, 'Uralskaya obl.'),
(200, 50, 'Habarovskii krai'),
(201, 50, 'Chelyabinskaya obl.'),
(202, 50, 'Checheno-Ingushetiya'),
(203, 50, 'Chitinskaya obl.'),
(204, 50, 'Chuvashiya'),
(205, 50, 'Yaroslavskaya obl.'),
(206, 51, 'Ahuachapán'),
(207, 51, 'Cuscatlán'),
(208, 51, 'La Libertad'),
(209, 51, 'La Paz'),
(210, 51, 'La Unión'),
(211, 51, 'San Miguel'),
(212, 51, 'San Salvador'),
(213, 51, 'Santa Ana'),
(214, 51, 'Sonsonate'),
(215, 54, 'Paramaribo'),
(216, 56, 'Gorno-Badakhshan Region'),
(217, 56, 'Kuljabsk Region'),
(218, 56, 'Kurgan-Tjube Region'),
(219, 56, 'Sughd Region'),
(220, 56, 'Tajikistan'),
(221, 57, 'Ashgabat Region'),
(222, 57, 'Krasnovodsk Region'),
(223, 57, 'Mary Region'),
(224, 57, 'Tashauz Region'),
(225, 57, 'Chardzhou Region'),
(226, 58, 'Grand Turk'),
(227, 59, 'Bartin'),
(228, 59, 'Bayburt'),
(229, 59, 'Karabuk'),
(230, 59, 'Adana'),
(231, 59, 'Aydin'),
(232, 59, 'Amasya'),
(233, 59, 'Ankara'),
(234, 59, 'Antalya'),
(235, 59, 'Artvin'),
(236, 59, 'Afion'),
(237, 59, 'Balikesir'),
(238, 59, 'Bilecik'),
(239, 59, 'Bursa'),
(240, 59, 'Gaziantep'),
(241, 59, 'Denizli'),
(242, 59, 'Izmir'),
(243, 59, 'Isparta'),
(244, 59, 'Icel'),
(245, 59, 'Kayseri'),
(246, 59, 'Kars'),
(247, 59, 'Kodjaeli'),
(248, 59, 'Konya'),
(249, 59, 'Kirklareli'),
(250, 59, 'Kutahya'),
(251, 59, 'Malatya'),
(252, 59, 'Manisa'),
(253, 59, 'Sakarya'),
(254, 59, 'Samsun'),
(255, 59, 'Sivas'),
(256, 59, 'Istanbul'),
(257, 59, 'Trabzon'),
(258, 59, 'Corum'),
(259, 59, 'Edirne'),
(260, 59, 'Elazig'),
(261, 59, 'Erzincan'),
(262, 59, 'Erzurum'),
(263, 59, 'Eskisehir'),
(264, 60, 'Jinja'),
(265, 60, 'Kampala'),
(266, 61, 'Andijon Region'),
(267, 61, 'Buxoro Region'),
(268, 61, 'Jizzac Region'),
(269, 61, 'Qaraqalpaqstan'),
(270, 61, 'Qashqadaryo Region'),
(271, 61, 'Navoiy Region'),
(272, 61, 'Namangan Region'),
(273, 61, 'Samarqand Region'),
(274, 61, 'Surxondaryo Region'),
(275, 61, 'Sirdaryo Region'),
(276, 61, 'Tashkent Region'),
(277, 61, 'Fergana Region'),
(278, 61, 'Xorazm Region'),
(279, 62, 'Vinnitskaya obl.'),
(280, 62, 'Volynskaya obl.'),
(281, 62, 'Dnepropetrovskaya obl.'),
(282, 62, 'Donetskaya obl.'),
(283, 62, 'Zhitomirskaya obl.'),
(284, 62, 'Zakarpatskaya obl.'),
(285, 62, 'Zaporozhskaya obl.'),
(286, 62, 'Ivano-Frankovskaya obl.'),
(287, 62, 'Kievskaya obl.'),
(288, 62, 'Kirovogradskaya obl.'),
(289, 62, 'Krymskaya obl.'),
(290, 62, 'Luganskaya obl.'),
(291, 62, 'Lvovskaya obl.'),
(292, 62, 'Nikolaevskaya obl.'),
(293, 62, 'Odesskaya obl.'),
(294, 62, 'Poltavskaya obl.'),
(295, 62, 'Rovenskaya obl.'),
(296, 62, 'Sumskaya obl.'),
(297, 62, 'Ternopolskaya obl.'),
(298, 62, 'Harkovskaya obl.'),
(299, 62, 'Hersonskaya obl.'),
(300, 62, 'Hmelnitskaya obl.'),
(301, 62, 'Cherkasskaya obl.'),
(302, 62, 'Chernigovskaya obl.'),
(303, 62, 'Chernovitskaya obl.'),
(304, 68, 'Estoniya'),
(305, 69, 'Cheju'),
(306, 69, 'Chollabuk'),
(307, 69, 'Chollanam'),
(308, 69, 'Chungcheongbuk'),
(309, 69, 'Chungcheongnam'),
(310, 69, 'Incheon'),
(311, 69, 'Kangweon'),
(312, 69, 'Kwangju'),
(313, 69, 'Kyeonggi'),
(314, 69, 'Kyeongsangbuk'),
(315, 69, 'Kyeongsangnam'),
(316, 69, 'Pusan'),
(317, 69, 'Seoul'),
(318, 69, 'Taegu'),
(319, 69, 'Taejeon'),
(320, 69, 'Ulsan'),
(321, 70, 'Aichi'),
(322, 70, 'Akita'),
(323, 70, 'Aomori'),
(324, 70, 'Wakayama'),
(325, 70, 'Gifu'),
(326, 70, 'Gunma'),
(327, 70, 'Ibaraki'),
(328, 70, 'Iwate'),
(329, 70, 'Ishikawa'),
(330, 70, 'Kagawa'),
(331, 70, 'Kagoshima'),
(332, 70, 'Kanagawa'),
(333, 70, 'Kyoto'),
(334, 70, 'Kochi'),
(335, 70, 'Kumamoto'),
(336, 70, 'Mie'),
(337, 70, 'Miyagi'),
(338, 70, 'Miyazaki'),
(339, 70, 'Nagano'),
(340, 70, 'Nagasaki'),
(341, 70, 'Nara'),
(342, 70, 'Niigata'),
(343, 70, 'Okayama'),
(344, 70, 'Okinawa'),
(345, 70, 'Osaka'),
(346, 70, 'Saga'),
(347, 70, 'Saitama'),
(348, 70, 'Shiga'),
(349, 70, 'Shizuoka'),
(350, 70, 'Shimane'),
(351, 70, 'Tiba'),
(352, 70, 'Tokyo'),
(353, 70, 'Tokushima'),
(354, 70, 'Tochigi'),
(355, 70, 'Tottori'),
(356, 70, 'Toyama'),
(357, 70, 'Fukui'),
(358, 70, 'Fukuoka'),
(359, 70, 'Fukushima'),
(360, 70, 'Hiroshima'),
(361, 70, 'Hokkaido'),
(362, 70, 'Hyogo'),
(363, 70, 'Yoshimi'),
(364, 70, 'Yamagata'),
(365, 70, 'Yamaguchi'),
(366, 70, 'Yamanashi'),
(368, 73, 'Hong Kong'),
(369, 74, 'Indonesia'),
(370, 75, 'Jordan'),
(371, 76, 'Malaysia'),
(372, 77, 'Singapore'),
(373, 78, 'Taiwan'),
(374, 30, 'Kazahstan'),
(375, 62, 'Ukraina'),
(376, 25, 'India'),
(377, 23, 'Egypt'),
(378, 106, 'Damascus'),
(379, 131, 'Isle of Man'),
(380, 30, 'Zapadno-Kazahstanskaya obl.'),
(381, 50, 'Adygeya'),
(382, 50, 'Hakasiya'),
(383, 93, 'Dubai'),
(384, 50, 'Chukotskii AO'),
(385, 99, 'Beirut'),
(386, 137, 'Tegucigalpa'),
(387, 138, 'Santo Domingo'),
(388, 139, 'Ulan Bator'),
(389, 23, 'Sinai'),
(390, 140, 'Baghdad'),
(391, 140, 'Basra'),
(392, 140, 'Mosul'),
(393, 141, 'Johannesburg'),
(394, 104, 'Morocco'),
(395, 104, 'Tangier'),
(396, 50, 'Yamalo-Nenetskii AO'),
(397, 122, 'Tunisia'),
(398, 92, 'Thailand'),
(399, 117, 'Mozambique'),
(400, 84, 'Korea'),
(401, 87, 'Pakistan'),
(402, 142, 'Aruba'),
(403, 80, 'Bahamas'),
(404, 69, 'South Korea'),
(405, 132, 'Jamaica'),
(406, 93, 'Sharjah'),
(407, 93, 'Abu Dhabi'),
(409, 24, 'Ramat Hagolan'),
(410, 115, 'Nigeria'),
(411, 64, 'Ain'),
(412, 64, 'Haute-Savoie'),
(413, 64, 'Aisne'),
(414, 64, 'Allier'),
(415, 64, 'Alpes-de-Haute-Provence'),
(416, 64, 'Hautes-Alpes'),
(417, 64, 'Alpes-Maritimes'),
(418, 64, 'Ard&egrave;che'),
(419, 64, 'Ardennes'),
(420, 64, 'Ari&egrave;ge'),
(421, 64, 'Aube'),
(422, 64, 'Aude'),
(423, 64, 'Aveyron'),
(424, 64, 'Bouches-du-Rh&ocirc;ne'),
(425, 64, 'Calvados'),
(426, 64, 'Cantal'),
(427, 64, 'Charente'),
(428, 64, 'Charente Maritime'),
(429, 64, 'Cher'),
(430, 64, 'Corr&egrave;ze'),
(431, 64, 'Dordogne'),
(432, 64, 'Corse'),
(433, 64, 'C&ocirc;te d&#039;Or'),
(434, 64, 'Sa&ocirc;ne et Loire'),
(435, 64, 'C&ocirc;tes d&#039;Armor'),
(436, 64, 'Creuse'),
(437, 64, 'Doubs'),
(438, 64, 'Dr&ocirc;me'),
(439, 64, 'Eure'),
(440, 64, 'Eure-et-Loire'),
(441, 64, 'Finist&egrave;re'),
(442, 64, 'Gard'),
(443, 64, 'Haute-Garonne'),
(444, 64, 'Gers'),
(445, 64, 'Gironde'),
(446, 64, 'Hérault'),
(447, 64, 'Ille et Vilaine'),
(448, 64, 'Indre'),
(449, 64, 'Indre-et-Loire'),
(450, 64, 'Isère'),
(451, 64, 'Jura'),
(452, 64, 'Landes'),
(453, 64, 'Loir-et-Cher'),
(454, 64, 'Loire'),
(455, 64, 'Rh&ocirc;ne'),
(456, 64, 'Haute-Loire'),
(457, 64, 'Loire Atlantique'),
(458, 64, 'Loiret'),
(459, 64, 'Lot'),
(460, 64, 'Lot-et-Garonne'),
(461, 64, 'Loz&egrave;re'),
(462, 64, 'Maine et Loire'),
(463, 64, 'Manche'),
(464, 64, 'Marne'),
(465, 64, 'Haute-Marne'),
(466, 64, 'Mayenne'),
(467, 64, 'Meurthe-et-Moselle'),
(468, 64, 'Meuse'),
(469, 64, 'Morbihan'),
(470, 64, 'Moselle'),
(471, 64, 'Ni&egrave;vre'),
(472, 64, 'Nord'),
(473, 64, 'Oise'),
(474, 64, 'Orne'),
(475, 64, 'Pas-de-Calais'),
(476, 64, 'Puy-de-D&ocirc;me'),
(477, 64, 'Pyrénées-Atlantiques'),
(478, 64, 'Hautes-Pyrénées'),
(479, 64, 'Pyrénées-Orientales'),
(480, 64, 'Bas Rhin'),
(481, 64, 'Haut Rhin'),
(482, 64, 'Haute-Sa&ocirc;ne'),
(483, 64, 'Sarthe'),
(484, 64, 'Savoie'),
(485, 64, 'Paris'),
(486, 64, 'Seine-Maritime'),
(487, 64, 'Seine-et-Marne'),
(488, 64, 'Yvelines'),
(489, 64, 'Deux-S&egrave;vres'),
(490, 64, 'Somme'),
(491, 64, 'Tarn'),
(492, 64, 'Tarn-et-Garonne'),
(493, 64, 'Var'),
(494, 64, 'Vaucluse'),
(495, 64, 'Vendée'),
(496, 64, 'Vienne'),
(497, 64, 'Haute-Vienne'),
(498, 64, 'Vosges'),
(499, 64, 'Yonne'),
(500, 64, 'Territoire de Belfort'),
(501, 64, 'Essonne'),
(502, 64, 'Hauts-de-Seine'),
(503, 64, 'Seine-Saint-Denis'),
(504, 64, 'Val-de-Marne'),
(505, 64, 'Val-d&#039;Oise'),
(506, 29, 'Piemonte - Torino'),
(507, 29, 'Piemonte - Alessandria'),
(508, 29, 'Piemonte - Asti'),
(509, 29, 'Piemonte - Biella'),
(510, 29, 'Piemonte - Cuneo'),
(511, 29, 'Piemonte - Novara'),
(512, 29, 'Piemonte - Verbania'),
(513, 29, 'Piemonte - Vercelli'),
(514, 29, 'Valle d&#039;Aosta - Aosta'),
(515, 29, 'Lombardia - Milano'),
(516, 29, 'Lombardia - Bergamo'),
(517, 29, 'Lombardia - Brescia'),
(518, 29, 'Lombardia - Como'),
(519, 29, 'Lombardia - Cremona'),
(520, 29, 'Lombardia - Lecco'),
(521, 29, 'Lombardia - Lodi'),
(522, 29, 'Lombardia - Mantova'),
(523, 29, 'Lombardia - Pavia'),
(524, 29, 'Lombardia - Sondrio'),
(525, 29, 'Lombardia - Varese'),
(526, 29, 'Trentino Alto Adige - Trento'),
(527, 29, 'Trentino Alto Adige - Bolzano'),
(528, 29, 'Veneto - Venezia'),
(529, 29, 'Veneto - Belluno'),
(530, 29, 'Veneto - Padova'),
(531, 29, 'Veneto - Rovigo'),
(532, 29, 'Veneto - Treviso'),
(533, 29, 'Veneto - Verona'),
(534, 29, 'Veneto - Vicenza'),
(535, 29, 'Friuli Venezia Giulia - Trieste'),
(536, 29, 'Friuli Venezia Giulia - Gorizia'),
(537, 29, 'Friuli Venezia Giulia - Pordenone'),
(538, 29, 'Friuli Venezia Giulia - Udine'),
(539, 29, 'Liguria - Genova'),
(540, 29, 'Liguria - Imperia'),
(541, 29, 'Liguria - La Spezia'),
(542, 29, 'Liguria - Savona'),
(543, 29, 'Emilia Romagna - Bologna'),
(544, 29, 'Emilia Romagna - Ferrara'),
(545, 29, 'Emilia Romagna - Forlì-Cesena'),
(546, 29, 'Emilia Romagna - Modena'),
(547, 29, 'Emilia Romagna - Parma'),
(548, 29, 'Emilia Romagna - Piacenza'),
(549, 29, 'Emilia Romagna - Ravenna'),
(550, 29, 'Emilia Romagna - Reggio Emilia'),
(551, 29, 'Emilia Romagna - Rimini'),
(552, 29, 'Toscana - Firenze'),
(553, 29, 'Toscana - Arezzo'),
(554, 29, 'Toscana - Grosseto'),
(555, 29, 'Toscana - Livorno'),
(556, 29, 'Toscana - Lucca'),
(557, 29, 'Toscana - Massa Carrara'),
(558, 29, 'Toscana - Pisa'),
(559, 29, 'Toscana - Pistoia'),
(560, 29, 'Toscana - Prato'),
(561, 29, 'Toscana - Siena'),
(562, 29, 'Umbria - Perugia'),
(563, 29, 'Umbria - Terni'),
(564, 29, 'Marche - Ancona'),
(565, 29, 'Marche - Ascoli Piceno'),
(566, 29, 'Marche - Macerata'),
(567, 29, 'Marche - Pesaro - Urbino'),
(568, 29, 'Lazio - Roma'),
(569, 29, 'Lazio - Frosinone'),
(570, 29, 'Lazio - Latina'),
(571, 29, 'Lazio - Rieti'),
(572, 29, 'Lazio - Viterbo'),
(573, 29, 'Abruzzo - L´Aquila'),
(574, 29, 'Abruzzo - Chieti'),
(575, 29, 'Abruzzo - Pescara'),
(576, 29, 'Abruzzo - Teramo'),
(577, 29, 'Molise - Campobasso'),
(578, 29, 'Molise - Isernia'),
(579, 29, 'Campania - Napoli'),
(580, 29, 'Campania - Avellino'),
(581, 29, 'Campania - Benevento'),
(582, 29, 'Campania - Caserta'),
(583, 29, 'Campania - Salerno'),
(584, 29, 'Puglia - Bari'),
(585, 29, 'Puglia - Brindisi'),
(586, 29, 'Puglia - Foggia'),
(587, 29, 'Puglia - Lecce'),
(588, 29, 'Puglia - Taranto'),
(589, 29, 'Basilicata - Potenza'),
(590, 29, 'Basilicata - Matera'),
(591, 29, 'Calabria - Catanzaro'),
(592, 29, 'Calabria - Cosenza'),
(593, 29, 'Calabria - Crotone'),
(594, 29, 'Calabria - Reggio Calabria'),
(595, 29, 'Calabria - Vibo Valentia'),
(596, 29, 'Sicilia - Palermo'),
(597, 29, 'Sicilia - Agrigento'),
(598, 29, 'Sicilia - Caltanissetta'),
(599, 29, 'Sicilia - Catania'),
(600, 29, 'Sicilia - Enna'),
(601, 29, 'Sicilia - Messina'),
(602, 29, 'Sicilia - Ragusa'),
(603, 29, 'Sicilia - Siracusa'),
(604, 29, 'Sicilia - Trapani'),
(605, 29, 'Sardegna - Cagliari'),
(606, 29, 'Sardegna - Nuoro'),
(607, 29, 'Sardegna - Oristano'),
(608, 29, 'Sardegna - Sassari'),
(609, 28, 'Las Palmas'),
(610, 28, 'Soria'),
(611, 28, 'Palencia'),
(612, 28, 'Zamora'),
(613, 28, 'Cádiz'),
(614, 28, 'Navarra'),
(615, 28, 'Ourense'),
(616, 28, 'Segovia'),
(617, 28, 'Guip&uacute;zcoa'),
(618, 28, 'Ciudad Real'),
(619, 28, 'Vizcaya'),
(620, 28, 'álava'),
(621, 28, 'A Coruña'),
(622, 28, 'Cantabria'),
(623, 28, 'Almería'),
(624, 28, 'Zaragoza'),
(625, 28, 'Santa Cruz de Tenerife'),
(626, 28, 'Cáceres'),
(627, 28, 'Guadalajara'),
(628, 28, 'ávila'),
(629, 28, 'Toledo'),
(630, 28, 'Castellón'),
(631, 28, 'Tarragona'),
(632, 28, 'Lugo'),
(633, 28, 'La Rioja'),
(634, 28, 'Ceuta'),
(635, 28, 'Murcia'),
(636, 28, 'Salamanca'),
(637, 28, 'Valladolid'),
(638, 28, 'Jaén'),
(639, 28, 'Girona'),
(640, 28, 'Granada'),
(641, 28, 'Alacant'),
(642, 28, 'Córdoba'),
(643, 28, 'Albacete'),
(644, 28, 'Cuenca'),
(645, 28, 'Pontevedra'),
(646, 28, 'Teruel'),
(647, 28, 'Melilla'),
(648, 28, 'Barcelona'),
(649, 28, 'Badajoz'),
(650, 28, 'Madrid'),
(651, 28, 'Sevilla'),
(652, 28, 'Val&egrave;ncia'),
(653, 28, 'Huelva'),
(654, 28, 'Lleida'),
(655, 28, 'León'),
(656, 28, 'Illes Balears'),
(657, 28, 'Burgos'),
(658, 28, 'Huesca'),
(659, 28, 'Asturias'),
(660, 28, 'Málaga'),
(661, 144, 'Afghanistan'),
(662, 210, 'Niger'),
(663, 133, 'Mali'),
(664, 156, 'Burkina Faso'),
(665, 136, 'Togo'),
(666, 151, 'Benin'),
(667, 119, 'Angola'),
(668, 102, 'Namibia'),
(669, 100, 'Botswana'),
(670, 134, 'Madagascar'),
(671, 202, 'Mauritius'),
(672, 196, 'Laos'),
(673, 158, 'Cambodia'),
(674, 90, 'Philippines'),
(675, 88, 'Papua New Guinea'),
(676, 228, 'Solomon Islands'),
(677, 240, 'Vanuatu'),
(678, 176, 'Fiji'),
(679, 223, 'Samoa'),
(680, 206, 'Nauru'),
(681, 168, 'Cote D&#039;Ivoire'),
(682, 198, 'Liberia'),
(683, 187, 'Guinea'),
(684, 189, 'Guyana'),
(685, 98, 'Algeria'),
(686, 147, 'Antigua and Barbuda'),
(687, 127, 'Bahrain'),
(688, 149, 'Bangladesh'),
(689, 128, 'Barbados'),
(690, 152, 'Bhutan'),
(691, 155, 'Brunei'),
(692, 157, 'Burundi'),
(693, 159, 'Cape Verde'),
(694, 130, 'Chad'),
(695, 164, 'Comoros'),
(696, 112, 'Congo (Brazzaville)'),
(697, 169, 'Djibouti'),
(698, 171, 'East Timor'),
(699, 173, 'Eritrea'),
(700, 121, 'Ethiopia'),
(701, 180, 'Gabon'),
(702, 181, 'Gambia'),
(703, 105, 'Ghana'),
(704, 197, 'Lesotho'),
(705, 125, 'Malawi'),
(706, 200, 'Maldives'),
(707, 205, 'Myanmar (Burma)'),
(708, 107, 'Nepal'),
(709, 213, 'Oman'),
(710, 217, 'Rwanda'),
(711, 91, 'Saudi Arabia'),
(712, 120, 'Sri Lanka'),
(713, 232, 'Sudan'),
(714, 234, 'Swaziland'),
(715, 101, 'Tanzania'),
(716, 236, 'Tonga'),
(717, 239, 'Tuvalu'),
(718, 242, 'Western Sahara'),
(719, 243, 'Yemen'),
(720, 116, 'Zambia'),
(721, 96, 'Zimbabwe'),
(722, 66, 'Aargau'),
(723, 66, 'Appenzell Innerrhoden'),
(724, 66, 'Appenzell Ausserrhoden'),
(725, 66, 'Bern'),
(726, 66, 'Basel-Landschaft'),
(727, 66, 'Basel-Stadt'),
(728, 66, 'Fribourg'),
(729, 66, 'Gen&egrave;ve'),
(730, 66, 'Glarus'),
(731, 66, 'Graubünden'),
(732, 66, 'Jura'),
(733, 66, 'Luzern'),
(734, 66, 'Neuch&acirc;tel'),
(735, 66, 'Nidwalden'),
(736, 66, 'Obwalden'),
(737, 66, 'Sankt Gallen'),
(738, 66, 'Schaffhausen'),
(739, 66, 'Solothurn'),
(740, 66, 'Schwyz'),
(741, 66, 'Thurgau'),
(742, 66, 'Ticino'),
(743, 66, 'Uri'),
(744, 66, 'Vaud'),
(745, 66, 'Valais'),
(746, 66, 'Zug'),
(747, 66, 'Zürich'),
(749, 48, 'Aveiro'),
(750, 48, 'Beja'),
(751, 48, 'Braga'),
(752, 48, 'Braganca'),
(753, 48, 'Castelo Branco'),
(754, 48, 'Coimbra'),
(755, 48, 'Evora'),
(756, 48, 'Faro'),
(757, 48, 'Madeira'),
(758, 48, 'Guarda'),
(759, 48, 'Leiria'),
(760, 48, 'Lisboa'),
(761, 48, 'Portalegre'),
(762, 48, 'Porto'),
(763, 48, 'Santarem'),
(764, 48, 'Setubal'),
(765, 48, 'Viana do Castelo'),
(766, 48, 'Vila Real'),
(767, 48, 'Viseu'),
(768, 48, 'Azores'),
(769, 55, 'Armed Forces Americas'),
(770, 55, 'Armed Forces Europe'),
(771, 55, 'Alaska'),
(772, 55, 'Alabama'),
(773, 55, 'Armed Forces Pacific'),
(774, 55, 'Arkansas'),
(775, 55, 'American Samoa'),
(776, 55, 'Arizona'),
(777, 55, 'California'),
(778, 55, 'Colorado'),
(779, 55, 'Connecticut'),
(780, 55, 'District of Columbia'),
(781, 55, 'Delaware'),
(782, 55, 'Florida'),
(783, 55, 'Federated States of Micronesia'),
(784, 55, 'Georgia'),
(786, 55, 'Hawaii'),
(787, 55, 'Iowa'),
(788, 55, 'Idaho'),
(789, 55, 'Illinois'),
(790, 55, 'Indiana'),
(791, 55, 'Kansas'),
(792, 55, 'Kentucky'),
(793, 55, 'Louisiana'),
(794, 55, 'Massachusetts'),
(795, 55, 'Maryland'),
(796, 55, 'Maine'),
(797, 55, 'Marshall Islands'),
(798, 55, 'Michigan'),
(799, 55, 'Minnesota'),
(800, 55, 'Missouri'),
(801, 55, 'Northern Mariana Islands'),
(802, 55, 'Mississippi'),
(803, 55, 'Montana'),
(804, 55, 'North Carolina'),
(805, 55, 'North Dakota'),
(806, 55, 'Nebraska'),
(807, 55, 'New Hampshire'),
(808, 55, 'New Jersey'),
(809, 55, 'New Mexico'),
(810, 55, 'Nevada'),
(811, 55, 'New York'),
(812, 55, 'Ohio'),
(813, 55, 'Oklahoma'),
(814, 55, 'Oregon'),
(815, 55, 'Pennsylvania'),
(816, 246, 'Puerto Rico'),
(817, 55, 'Palau'),
(818, 55, 'Rhode Island'),
(819, 55, 'South Carolina'),
(820, 55, 'South Dakota'),
(821, 55, 'Tennessee'),
(822, 55, 'Texas'),
(823, 55, 'Utah'),
(824, 55, 'Virginia'),
(825, 55, 'Virgin Islands'),
(826, 55, 'Vermont'),
(827, 55, 'Washington'),
(828, 55, 'West Virginia'),
(829, 55, 'Wisconsin'),
(830, 55, 'Wyoming'),
(831, 94, 'Greenland'),
(832, 18, 'Brandenburg'),
(833, 18, 'Baden-Württemberg'),
(834, 18, 'Bayern'),
(835, 18, 'Hessen'),
(836, 18, 'Hamburg'),
(837, 18, 'Mecklenburg-Vorpommern'),
(838, 18, 'Niedersachsen'),
(839, 18, 'Nordrhein-Westfalen'),
(840, 18, 'Rheinland-Pfalz'),
(841, 18, 'Schleswig-Holstein'),
(842, 18, 'Sachsen'),
(843, 18, 'Sachsen-Anhalt'),
(844, 18, 'Thüringen'),
(845, 18, 'Berlin'),
(846, 18, 'Bremen'),
(847, 18, 'Saarland'),
(848, 13, 'Scotland North'),
(849, 13, 'England - East'),
(850, 13, 'England - West Midlands'),
(851, 13, 'England - South West'),
(852, 13, 'England - North West'),
(853, 13, 'England - Yorks &amp; Humber'),
(854, 13, 'England - South East'),
(855, 13, 'England - London'),
(856, 13, 'Northern Ireland'),
(857, 13, 'England - North East'),
(858, 13, 'Wales South'),
(859, 13, 'Wales North'),
(860, 13, 'England - East Midlands'),
(861, 13, 'Scotland Central'),
(862, 13, 'Scotland South'),
(863, 13, 'Channel Islands'),
(864, 13, 'Isle of Man'),
(865, 2, 'Burgenland'),
(866, 2, 'Kärnten'),
(867, 2, 'Niederösterreich'),
(868, 2, 'Oberösterreich'),
(869, 2, 'Salzburg'),
(870, 2, 'Steiermark'),
(871, 2, 'Tirol'),
(872, 2, 'Vorarlberg'),
(873, 2, 'Wien'),
(874, 9, 'Bruxelles'),
(875, 9, 'West-Vlaanderen'),
(876, 9, 'Oost-Vlaanderen'),
(877, 9, 'Limburg'),
(878, 9, 'Vlaams Brabant'),
(879, 9, 'Antwerpen'),
(880, 9, 'LiÄge'),
(881, 9, 'Namur'),
(882, 9, 'Hainaut'),
(883, 9, 'Luxembourg'),
(884, 9, 'Brabant Wallon'),
(887, 67, 'Blekinge Lan'),
(888, 67, 'Gavleborgs Lan'),
(890, 67, 'Gotlands Lan'),
(891, 67, 'Hallands Lan'),
(892, 67, 'Jamtlands Lan'),
(893, 67, 'Jonkopings Lan'),
(894, 67, 'Kalmar Lan'),
(895, 67, 'Dalarnas Lan'),
(897, 67, 'Kronobergs Lan'),
(899, 67, 'Norrbottens Lan'),
(900, 67, 'Orebro Lan'),
(901, 67, 'Ostergotlands Lan'),
(903, 67, 'Sodermanlands Lan'),
(904, 67, 'Uppsala Lan'),
(905, 67, 'Varmlands Lan'),
(906, 67, 'Vasterbottens Lan'),
(907, 67, 'Vasternorrlands Lan'),
(908, 67, 'Vastmanlands Lan'),
(909, 67, 'Stockholms Lan'),
(910, 67, 'Skane Lan'),
(911, 67, 'Vastra Gotaland'),
(913, 46, 'Akershus'),
(914, 46, 'Aust-Agder'),
(915, 46, 'Buskerud'),
(916, 46, 'Finnmark'),
(917, 46, 'Hedmark'),
(918, 46, 'Hordaland'),
(919, 46, 'More og Romsdal'),
(920, 46, 'Nordland'),
(921, 46, 'Nord-Trondelag'),
(922, 46, 'Oppland'),
(923, 46, 'Oslo'),
(924, 46, 'Ostfold'),
(925, 46, 'Rogaland'),
(926, 46, 'Sogn og Fjordane'),
(927, 46, 'Sor-Trondelag'),
(928, 46, 'Telemark'),
(929, 46, 'Troms'),
(930, 46, 'Vest-Agder'),
(931, 46, 'Vestfold'),
(933, 63, '&ETH;&bull;land'),
(934, 63, 'Lapland'),
(935, 63, 'Oulu'),
(936, 63, 'Southern Finland'),
(937, 63, 'Eastern Finland'),
(938, 63, 'Western Finland'),
(940, 22, 'Arhus'),
(941, 22, 'Bornholm'),
(942, 22, 'Frederiksborg'),
(943, 22, 'Fyn'),
(944, 22, 'Kobenhavn'),
(945, 22, 'Staden Kobenhavn'),
(946, 22, 'Nordjylland'),
(947, 22, 'Ribe'),
(948, 22, 'Ringkobing'),
(949, 22, 'Roskilde'),
(950, 22, 'Sonderjylland'),
(951, 22, 'Storstrom'),
(952, 22, 'Vejle'),
(953, 22, 'Vestsjalland'),
(954, 22, 'Viborg'),
(956, 65, 'Hlavni Mesto Praha'),
(957, 65, 'Jihomoravsky Kraj'),
(958, 65, 'Jihocesky Kraj'),
(959, 65, 'Vysocina'),
(960, 65, 'Karlovarsky Kraj'),
(961, 65, 'Kralovehradecky Kraj'),
(962, 65, 'Liberecky Kraj'),
(963, 65, 'Olomoucky Kraj'),
(964, 65, 'Moravskoslezsky Kraj'),
(965, 65, 'Pardubicky Kraj'),
(966, 65, 'Plzensky Kraj'),
(967, 65, 'Stredocesky Kraj'),
(968, 65, 'Ustecky Kraj'),
(969, 65, 'Zlinsky Kraj'),
(971, 114, 'Berat'),
(972, 114, 'Diber'),
(973, 114, 'Durres'),
(974, 114, 'Elbasan'),
(975, 114, 'Fier'),
(976, 114, 'Gjirokaster'),
(977, 114, 'Korce'),
(978, 114, 'Kukes'),
(979, 114, 'Lezhe'),
(980, 114, 'Shkoder'),
(981, 114, 'Tirane'),
(982, 114, 'Vlore'),
(984, 145, 'Canillo'),
(985, 145, 'Encamp'),
(986, 145, 'La Massana'),
(987, 145, 'Ordino'),
(988, 145, 'Sant Julia de Loria'),
(989, 145, 'Andorra la Vella'),
(990, 145, 'Escaldes-Engordany'),
(992, 6, 'Aragatsotn'),
(993, 6, 'Ararat'),
(994, 6, 'Armavir'),
(995, 6, 'Geghark&#039;unik&#039;'),
(996, 6, 'Kotayk&#039;'),
(997, 6, 'Lorri'),
(998, 6, 'Shirak'),
(999, 6, 'Syunik&#039;'),
(1000, 6, 'Tavush'),
(1001, 6, 'Vayots&#039; Dzor'),
(1002, 6, 'Yerevan'),
(1004, 79, 'Federation of Bosnia and Herzegovina'),
(1005, 79, 'Republika Srpska'),
(1007, 11, 'Mikhaylovgrad'),
(1008, 11, 'Blagoevgrad'),
(1009, 11, 'Burgas'),
(1010, 11, 'Dobrich'),
(1011, 11, 'Gabrovo'),
(1012, 11, 'Grad Sofiya'),
(1013, 11, 'Khaskovo'),
(1014, 11, 'Kurdzhali'),
(1015, 11, 'Kyustendil'),
(1016, 11, 'Lovech'),
(1017, 11, 'Montana'),
(1018, 11, 'Pazardzhik'),
(1019, 11, 'Pernik'),
(1020, 11, 'Pleven'),
(1021, 11, 'Plovdiv'),
(1022, 11, 'Razgrad'),
(1023, 11, 'Ruse'),
(1024, 11, 'Shumen'),
(1025, 11, 'Silistra'),
(1026, 11, 'Sliven'),
(1027, 11, 'Smolyan'),
(1028, 11, 'Sofiya'),
(1029, 11, 'Stara Zagora'),
(1030, 11, 'Turgovishte'),
(1031, 11, 'Varna'),
(1032, 11, 'Veliko Turnovo'),
(1033, 11, 'Vidin'),
(1034, 11, 'Vratsa'),
(1035, 11, 'Yambol'),
(1037, 71, 'Bjelovarsko-Bilogorska'),
(1038, 71, 'Brodsko-Posavska'),
(1039, 71, 'Dubrovacko-Neretvanska'),
(1040, 71, 'Istarska'),
(1041, 71, 'Karlovacka'),
(1042, 71, 'Koprivnicko-Krizevacka'),
(1043, 71, 'Krapinsko-Zagorska'),
(1044, 71, 'Licko-Senjska'),
(1045, 71, 'Medimurska'),
(1046, 71, 'Osjecko-Baranjska'),
(1047, 71, 'Pozesko-Slavonska'),
(1048, 71, 'Primorsko-Goranska'),
(1049, 71, 'Sibensko-Kninska'),
(1050, 71, 'Sisacko-Moslavacka'),
(1051, 71, 'Splitsko-Dalmatinska'),
(1052, 71, 'Varazdinska'),
(1053, 71, 'Viroviticko-Podravska'),
(1054, 71, 'Vukovarsko-Srijemska'),
(1055, 71, 'Zadarska'),
(1056, 71, 'Zagrebacka'),
(1057, 71, 'Grad Zagreb'),
(1059, 143, 'Gibraltar'),
(1060, 20, 'Evros'),
(1061, 20, 'Rodhopi'),
(1062, 20, 'Xanthi'),
(1063, 20, 'Drama'),
(1064, 20, 'Serrai'),
(1065, 20, 'Kilkis'),
(1066, 20, 'Pella'),
(1067, 20, 'Florina'),
(1068, 20, 'Kastoria'),
(1069, 20, 'Grevena'),
(1070, 20, 'Kozani'),
(1071, 20, 'Imathia'),
(1072, 20, 'Thessaloniki'),
(1073, 20, 'Kavala'),
(1074, 20, 'Khalkidhiki'),
(1075, 20, 'Pieria'),
(1076, 20, 'Ioannina'),
(1077, 20, 'Thesprotia'),
(1078, 20, 'Preveza'),
(1079, 20, 'Arta'),
(1080, 20, 'Larisa'),
(1081, 20, 'Trikala'),
(1082, 20, 'Kardhitsa'),
(1083, 20, 'Magnisia'),
(1084, 20, 'Kerkira'),
(1085, 20, 'Levkas'),
(1086, 20, 'Kefallinia'),
(1087, 20, 'Zakinthos'),
(1088, 20, 'Fthiotis'),
(1089, 20, 'Evritania'),
(1090, 20, 'Aitolia kai Akarnania'),
(1091, 20, 'Fokis'),
(1092, 20, 'Voiotia'),
(1093, 20, 'Evvoia'),
(1094, 20, 'Attiki'),
(1095, 20, 'Argolis'),
(1096, 20, 'Korinthia'),
(1097, 20, 'Akhaia'),
(1098, 20, 'Ilia'),
(1099, 20, 'Messinia'),
(1100, 20, 'Arkadhia'),
(1101, 20, 'Lakonia'),
(1102, 20, 'Khania'),
(1103, 20, 'Rethimni'),
(1104, 20, 'Iraklion'),
(1105, 20, 'Lasithi'),
(1106, 20, 'Dhodhekanisos'),
(1107, 20, 'Samos'),
(1108, 20, 'Kikladhes'),
(1109, 20, 'Khios'),
(1110, 20, 'Lesvos'),
(1112, 14, 'Bacs-Kiskun'),
(1113, 14, 'Baranya'),
(1114, 14, 'Bekes'),
(1115, 14, 'Borsod-Abauj-Zemplen'),
(1116, 14, 'Budapest'),
(1117, 14, 'Csongrad'),
(1118, 14, 'Debrecen'),
(1119, 14, 'Fejer'),
(1120, 14, 'Gyor-Moson-Sopron'),
(1121, 14, 'Hajdu-Bihar'),
(1122, 14, 'Heves'),
(1123, 14, 'Komarom-Esztergom'),
(1124, 14, 'Miskolc'),
(1125, 14, 'Nograd'),
(1126, 14, 'Pecs'),
(1127, 14, 'Pest'),
(1128, 14, 'Somogy'),
(1129, 14, 'Szabolcs-Szatmar-Bereg'),
(1130, 14, 'Szeged'),
(1131, 14, 'Jasz-Nagykun-Szolnok'),
(1132, 14, 'Tolna'),
(1133, 14, 'Vas'),
(1134, 14, 'Veszprem'),
(1135, 14, 'Zala'),
(1136, 14, 'Gyor'),
(1150, 14, 'Veszprem'),
(1152, 126, 'Balzers'),
(1153, 126, 'Eschen'),
(1154, 126, 'Gamprin'),
(1155, 126, 'Mauren'),
(1156, 126, 'Planken'),
(1157, 126, 'Ruggell'),
(1158, 126, 'Schaan'),
(1159, 126, 'Schellenberg'),
(1160, 126, 'Triesen'),
(1161, 126, 'Triesenberg'),
(1162, 126, 'Vaduz'),
(1163, 41, 'Diekirch'),
(1164, 41, 'Grevenmacher'),
(1165, 41, 'Luxembourg'),
(1167, 85, 'Aracinovo'),
(1168, 85, 'Bac'),
(1169, 85, 'Belcista'),
(1170, 85, 'Berovo'),
(1171, 85, 'Bistrica'),
(1172, 85, 'Bitola'),
(1173, 85, 'Blatec'),
(1174, 85, 'Bogdanci'),
(1175, 85, 'Bogomila'),
(1176, 85, 'Bogovinje'),
(1177, 85, 'Bosilovo'),
(1179, 85, 'Cair'),
(1180, 85, 'Capari'),
(1181, 85, 'Caska'),
(1182, 85, 'Cegrane'),
(1184, 85, 'Centar Zupa'),
(1187, 85, 'Debar'),
(1188, 85, 'Delcevo'),
(1190, 85, 'Demir Hisar'),
(1191, 85, 'Demir Kapija'),
(1195, 85, 'Dorce Petrov'),
(1198, 85, 'Gazi Baba'),
(1199, 85, 'Gevgelija'),
(1200, 85, 'Gostivar'),
(1201, 85, 'Gradsko'),
(1204, 85, 'Jegunovce'),
(1205, 85, 'Kamenjane'),
(1207, 85, 'Karpos'),
(1208, 85, 'Kavadarci'),
(1209, 85, 'Kicevo'),
(1210, 85, 'Kisela Voda'),
(1211, 85, 'Klecevce'),
(1212, 85, 'Kocani'),
(1214, 85, 'Kondovo'),
(1217, 85, 'Kratovo'),
(1219, 85, 'Krivogastani'),
(1220, 85, 'Krusevo'),
(1223, 85, 'Kumanovo'),
(1224, 85, 'Labunista'),
(1225, 85, 'Lipkovo'),
(1228, 85, 'Makedonska Kamenica'),
(1229, 85, 'Makedonski Brod'),
(1234, 85, 'Murtino'),
(1235, 85, 'Negotino'),
(1238, 85, 'Novo Selo'),
(1240, 85, 'Ohrid'),
(1242, 85, 'Orizari'),
(1245, 85, 'Petrovec'),
(1248, 85, 'Prilep'),
(1249, 85, 'Probistip'),
(1250, 85, 'Radovis'),
(1252, 85, 'Resen'),
(1253, 85, 'Rosoman'),
(1256, 85, 'Saraj'),
(1260, 85, 'Srbinovo'),
(1262, 85, 'Star Dojran'),
(1264, 85, 'Stip'),
(1265, 85, 'Struga'),
(1266, 85, 'Strumica'),
(1267, 85, 'Studenicani'),
(1268, 85, 'Suto Orizari'),
(1269, 85, 'Sveti Nikole'),
(1270, 85, 'Tearce'),
(1271, 85, 'Tetovo'),
(1273, 85, 'Valandovo'),
(1275, 85, 'Veles'),
(1277, 85, 'Vevcani'),
(1278, 85, 'Vinica'),
(1281, 85, 'Vrapciste'),
(1286, 85, 'Zelino'),
(1289, 85, 'Zrnovci'),
(1291, 86, 'Malta'),
(1292, 44, 'La Condamine'),
(1293, 44, 'Monaco'),
(1294, 44, 'Monte-Carlo'),
(1295, 47, 'Biala Podlaska'),
(1296, 47, 'Bialystok'),
(1297, 47, 'Bielsko'),
(1298, 47, 'Bydgoszcz'),
(1299, 47, 'Chelm'),
(1300, 47, 'Ciechanow'),
(1301, 47, 'Czestochowa'),
(1302, 47, 'Elblag'),
(1303, 47, 'Gdansk'),
(1304, 47, 'Gorzow'),
(1305, 47, 'Jelenia Gora'),
(1306, 47, 'Kalisz'),
(1307, 47, 'Katowice'),
(1308, 47, 'Kielce'),
(1309, 47, 'Konin'),
(1310, 47, 'Koszalin'),
(1311, 47, 'Krakow'),
(1312, 47, 'Krosno'),
(1313, 47, 'Legnica'),
(1314, 47, 'Leszno'),
(1315, 47, 'Lodz'),
(1316, 47, 'Lomza'),
(1317, 47, 'Lublin'),
(1318, 47, 'Nowy Sacz'),
(1319, 47, 'Olsztyn'),
(1320, 47, 'Opole'),
(1321, 47, 'Ostroleka'),
(1322, 47, 'Pila'),
(1323, 47, 'Piotrkow'),
(1324, 47, 'Plock'),
(1325, 47, 'Poznan'),
(1326, 47, 'Przemysl'),
(1327, 47, 'Radom'),
(1328, 47, 'Rzeszow'),
(1329, 47, 'Siedlce'),
(1330, 47, 'Sieradz'),
(1331, 47, 'Skierniewice'),
(1332, 47, 'Slupsk'),
(1333, 47, 'Suwalki'),
(1335, 47, 'Tarnobrzeg'),
(1336, 47, 'Tarnow'),
(1337, 47, 'Torun'),
(1338, 47, 'Walbrzych'),
(1339, 47, 'Warszawa'),
(1340, 47, 'Wloclawek'),
(1341, 47, 'Wroclaw'),
(1342, 47, 'Zamosc'),
(1343, 47, 'Zielona Gora'),
(1344, 47, 'Dolnoslaskie'),
(1345, 47, 'Kujawsko-Pomorskie'),
(1346, 47, 'Lodzkie'),
(1347, 47, 'Lubelskie'),
(1348, 47, 'Lubuskie'),
(1349, 47, 'Malopolskie'),
(1350, 47, 'Mazowieckie'),
(1351, 47, 'Opolskie'),
(1352, 47, 'Podkarpackie'),
(1353, 47, 'Podlaskie'),
(1354, 47, 'Pomorskie'),
(1355, 47, 'Slaskie'),
(1356, 47, 'Swietokrzyskie'),
(1357, 47, 'Warminsko-Mazurskie'),
(1358, 47, 'Wielkopolskie'),
(1359, 47, 'Zachodniopomorskie'),
(1361, 72, 'Alba'),
(1362, 72, 'Arad'),
(1363, 72, 'Arges'),
(1364, 72, 'Bacau'),
(1365, 72, 'Bihor'),
(1366, 72, 'Bistrita-Nasaud'),
(1367, 72, 'Botosani'),
(1368, 72, 'Braila'),
(1369, 72, 'Brasov'),
(1370, 72, 'Bucuresti'),
(1371, 72, 'Buzau'),
(1372, 72, 'Caras-Severin'),
(1373, 72, 'Cluj'),
(1374, 72, 'Constanta'),
(1375, 72, 'Covasna'),
(1376, 72, 'Dambovita'),
(1377, 72, 'Dolj'),
(1378, 72, 'Galati'),
(1379, 72, 'Gorj'),
(1380, 72, 'Harghita'),
(1381, 72, 'Hunedoara'),
(1382, 72, 'Ialomita'),
(1383, 72, 'Iasi'),
(1384, 72, 'Maramures'),
(1385, 72, 'Mehedinti'),
(1386, 72, 'Mures'),
(1387, 72, 'Neamt'),
(1388, 72, 'Olt'),
(1389, 72, 'Prahova'),
(1390, 72, 'Salaj'),
(1391, 72, 'Satu Mare'),
(1392, 72, 'Sibiu'),
(1393, 72, 'Suceava'),
(1394, 72, 'Teleorman'),
(1395, 72, 'Timis'),
(1396, 72, 'Tulcea'),
(1397, 72, 'Vaslui'),
(1398, 72, 'Valcea'),
(1399, 72, 'Vrancea'),
(1400, 72, 'Calarasi'),
(1401, 72, 'Giurgiu'),
(1404, 224, 'Acquaviva'),
(1405, 224, 'Chiesanuova'),
(1406, 224, 'Domagnano'),
(1407, 224, 'Faetano'),
(1408, 224, 'Fiorentino'),
(1409, 224, 'Borgo Maggiore'),
(1410, 224, 'San Marino'),
(1411, 224, 'Monte Giardino'),
(1412, 224, 'Serravalle'),
(1413, 52, 'Banska Bystrica'),
(1414, 52, 'Bratislava'),
(1415, 52, 'Kosice'),
(1416, 52, 'Nitra'),
(1417, 52, 'Presov'),
(1418, 52, 'Trencin'),
(1419, 52, 'Trnava'),
(1420, 52, 'Zilina'),
(1423, 53, 'Beltinci'),
(1425, 53, 'Bohinj'),
(1426, 53, 'Borovnica'),
(1427, 53, 'Bovec'),
(1428, 53, 'Brda'),
(1429, 53, 'Brezice'),
(1430, 53, 'Brezovica'),
(1432, 53, 'Cerklje na Gorenjskem'),
(1434, 53, 'Cerkno'),
(1436, 53, 'Crna na Koroskem'),
(1437, 53, 'Crnomelj'),
(1438, 53, 'Divaca'),
(1439, 53, 'Dobrepolje'),
(1440, 53, 'Dol pri Ljubljani'),
(1443, 53, 'Duplek'),
(1447, 53, 'Gornji Grad'),
(1450, 53, 'Hrastnik'),
(1451, 53, 'Hrpelje-Kozina'),
(1452, 53, 'Idrija'),
(1453, 53, 'Ig'),
(1454, 53, 'Ilirska Bistrica'),
(1455, 53, 'Ivancna Gorica'),
(1462, 53, 'Komen'),
(1463, 53, 'Koper-Capodistria'),
(1464, 53, 'Kozje'),
(1465, 53, 'Kranj'),
(1466, 53, 'Kranjska Gora'),
(1467, 53, 'Krsko'),
(1469, 53, 'Lasko'),
(1470, 53, 'Ljubljana'),
(1471, 53, 'Ljubno'),
(1472, 53, 'Logatec'),
(1475, 53, 'Medvode'),
(1476, 53, 'Menges'),
(1478, 53, 'Mezica'),
(1480, 53, 'Moravce'),
(1482, 53, 'Mozirje'),
(1483, 53, 'Murska Sobota'),
(1487, 53, 'Nova Gorica'),
(1489, 53, 'Ormoz'),
(1491, 53, 'Pesnica'),
(1494, 53, 'Postojna'),
(1497, 53, 'Radece'),
(1498, 53, 'Radenci'),
(1500, 53, 'Radovljica'),
(1502, 53, 'Rogaska Slatina'),
(1505, 53, 'Sencur'),
(1506, 53, 'Sentilj'),
(1508, 53, 'Sevnica'),
(1509, 53, 'Sezana'),
(1511, 53, 'Skofja Loka'),
(1513, 53, 'Slovenj Gradec'),
(1514, 53, 'Slovenske Konjice'),
(1515, 53, 'Smarje pri Jelsah'),
(1521, 53, 'Tolmin'),
(1522, 53, 'Trbovlje'),
(1524, 53, 'Trzic'),
(1526, 53, 'Velenje'),
(1528, 53, 'Vipava'),
(1531, 53, 'Vrhnika'),
(1532, 53, 'Vuzenica'),
(1533, 53, 'Zagorje ob Savi'),
(1535, 53, 'Zelezniki'),
(1536, 53, 'Ziri'),
(1537, 53, 'Zrece'),
(1539, 53, 'Domzale'),
(1540, 53, 'Jesenice'),
(1541, 53, 'Kamnik'),
(1542, 53, 'Kocevje'),
(1544, 53, 'Lenart'),
(1545, 53, 'Litija'),
(1546, 53, 'Ljutomer'),
(1550, 53, 'Maribor'),
(1552, 53, 'Novo Mesto'),
(1553, 53, 'Piran'),
(1554, 53, 'Preddvor'),
(1555, 53, 'Ptuj'),
(1556, 53, 'Ribnica'),
(1558, 53, 'Sentjur pri Celju'),
(1559, 53, 'Slovenska Bistrica'),
(1560, 53, 'Videm'),
(1562, 53, 'Zalec'),
(1564, 109, 'Seychelles'),
(1565, 108, 'Mauritania'),
(1566, 135, 'Senegal'),
(1567, 154, 'Road Town'),
(1568, 165, 'Congo'),
(1569, 166, 'Avarua'),
(1570, 172, 'Malabo'),
(1571, 175, 'Torshavn'),
(1572, 178, 'Papeete'),
(1573, 184, 'St George&#039;s'),
(1574, 186, 'St Peter Port'),
(1575, 188, 'Bissau'),
(1576, 193, 'Saint Helier'),
(1577, 201, 'Fort-de-France'),
(1578, 207, 'Willemstad'),
(1579, 208, 'Noumea'),
(1580, 212, 'Kingston'),
(1581, 215, 'Adamstown'),
(1582, 216, 'Doha'),
(1583, 218, 'Jamestown'),
(1584, 219, 'Basseterre'),
(1585, 220, 'Castries'),
(1586, 221, 'Saint Pierre'),
(1587, 222, 'Kingstown'),
(1588, 225, 'San Tome'),
(1589, 226, 'Belgrade'),
(1590, 227, 'Freetown'),
(1591, 229, 'Mogadishu'),
(1592, 235, 'Fakaofo'),
(1593, 237, 'Port of Spain'),
(1594, 241, 'Mata-Utu'),
(1596, 89, 'Amazonas'),
(1597, 89, 'Ancash'),
(1598, 89, 'Apurímac'),
(1599, 89, 'Arequipa'),
(1600, 89, 'Ayacucho'),
(1601, 89, 'Cajamarca'),
(1602, 89, 'Callao'),
(1603, 89, 'Cusco'),
(1604, 89, 'Huancavelica'),
(1605, 89, 'Huánuco'),
(1606, 89, 'Ica'),
(1607, 89, 'Junín'),
(1608, 89, 'La Libertad'),
(1609, 89, 'Lambayeque'),
(1610, 89, 'Lima'),
(1611, 89, 'Loreto'),
(1612, 89, 'Madre de Dios'),
(1613, 89, 'Moquegua'),
(1614, 89, 'Pasco'),
(1615, 89, 'Piura'),
(1616, 89, 'Puno'),
(1617, 89, 'San Martín'),
(1618, 89, 'Tacna'),
(1619, 89, 'Tumbes'),
(1620, 89, 'Ucayali'),
(1622, 110, 'Alto Paraná'),
(1623, 110, 'Amambay'),
(1624, 110, 'Boquerón'),
(1625, 110, 'Caaguaz&uacute;'),
(1626, 110, 'Caazapá'),
(1627, 110, 'Central'),
(1628, 110, 'Concepción'),
(1629, 110, 'Cordillera'),
(1630, 110, 'Guairá'),
(1631, 110, 'Itap&uacute;a'),
(1632, 110, 'Misiones'),
(1633, 110, 'Neembuc&uacute;'),
(1634, 110, 'Paraguarí'),
(1635, 110, 'Presidente Hayes'),
(1636, 110, 'San Pedro'),
(1637, 110, 'Alto Paraguay'),
(1638, 110, 'Canindey&uacute;'),
(1639, 110, 'Chaco'),
(1642, 111, 'Artigas'),
(1643, 111, 'Canelones'),
(1644, 111, 'Cerro Largo'),
(1645, 111, 'Colonia'),
(1646, 111, 'Durazno'),
(1647, 111, 'Flores'),
(1648, 111, 'Florida'),
(1649, 111, 'Lavalleja'),
(1650, 111, 'Maldonado'),
(1651, 111, 'Montevideo'),
(1652, 111, 'Paysand&uacute;'),
(1653, 111, 'Río Negro'),
(1654, 111, 'Rivera'),
(1655, 111, 'Rocha'),
(1656, 111, 'Salto'),
(1657, 111, 'San José'),
(1658, 111, 'Soriano'),
(1659, 111, 'Tacuarembó'),
(1660, 111, 'Treinta y Tres'),
(1662, 81, 'Región de Tarapacá'),
(1663, 81, 'Región de Antofagasta'),
(1664, 81, 'Región de Atacama'),
(1665, 81, 'Región de Coquimbo'),
(1666, 81, 'Región de Valparaíso'),
(1667, 81, 'Región del Libertador General Bernardo O&#039;Higgins'),
(1668, 81, 'Región del Maule'),
(1669, 81, 'Región del Bío Bío'),
(1670, 81, 'Región de La Araucanía'),
(1671, 81, 'Región de Los Lagos'),
(1672, 81, 'Región Aisén del General Carlos Ibáñez del Campo'),
(1673, 81, 'Región de Magallanes y de la Antártica Chilena'),
(1674, 81, 'Región Metropolitana de Santiago'),
(1676, 185, 'Alta Verapaz'),
(1677, 185, 'Baja Verapaz'),
(1678, 185, 'Chimaltenango'),
(1679, 185, 'Chiquimula'),
(1680, 185, 'El Progreso'),
(1681, 185, 'Escuintla'),
(1682, 185, 'Guatemala'),
(1683, 185, 'Huehuetenango'),
(1684, 185, 'Izabal'),
(1685, 185, 'Jalapa'),
(1686, 185, 'Jutiapa'),
(1687, 185, 'Petén'),
(1688, 185, 'Quetzaltenango'),
(1689, 185, 'Quiché'),
(1690, 185, 'Retalhuleu'),
(1691, 185, 'Sacatepéquez'),
(1692, 185, 'San Marcos'),
(1693, 185, 'Santa Rosa'),
(1694, 185, 'Sololá'),
(1695, 185, 'Suchitepequez'),
(1696, 185, 'Totonicapán'),
(1697, 185, 'Zacapa'),
(1699, 82, 'Amazonas'),
(1700, 82, 'Antioquia'),
(1701, 82, 'Arauca'),
(1702, 82, 'Atlántico'),
(1703, 82, 'Caquetá'),
(1704, 82, 'Cauca'),
(1705, 82, 'César'),
(1706, 82, 'Chocó'),
(1707, 82, 'Córdoba'),
(1708, 82, 'Guaviare'),
(1709, 82, 'Guainía'),
(1710, 82, 'Huila'),
(1711, 82, 'La Guajira'),
(1712, 82, 'Meta'),
(1713, 82, 'Narino'),
(1714, 82, 'Norte de Santander'),
(1715, 82, 'Putumayo'),
(1716, 82, 'Quindío'),
(1717, 82, 'Risaralda'),
(1718, 82, 'San Andrés y Providencia'),
(1719, 82, 'Santander'),
(1720, 82, 'Sucre'),
(1721, 82, 'Tolima'),
(1722, 82, 'Valle del Cauca'),
(1723, 82, 'Vaupés'),
(1724, 82, 'Vichada'),
(1725, 82, 'Casanare'),
(1726, 82, 'Cundinamarca'),
(1727, 82, 'Distrito Especial'),
(1730, 82, 'Caldas'),
(1731, 82, 'Magdalena'),
(1733, 42, 'Aguascalientes'),
(1734, 42, 'Baja California'),
(1735, 42, 'Baja California Sur'),
(1736, 42, 'Campeche'),
(1737, 42, 'Chiapas'),
(1738, 42, 'Chihuahua'),
(1739, 42, 'Coahuila de Zaragoza'),
(1740, 42, 'Colima'),
(1741, 42, 'Distrito Federal'),
(1742, 42, 'Durango'),
(1743, 42, 'Guanajuato'),
(1744, 42, 'Guerrero'),
(1745, 42, 'Hidalgo'),
(1746, 42, 'Jalisco'),
(1747, 42, 'México'),
(1748, 42, 'Michoacán de Ocampo'),
(1749, 42, 'Morelos'),
(1750, 42, 'Nayarit'),
(1751, 42, 'Nuevo León'),
(1752, 42, 'Oaxaca'),
(1753, 42, 'Puebla'),
(1754, 42, 'Querétaro de Arteaga'),
(1755, 42, 'Quintana Roo'),
(1756, 42, 'San Luis Potosí'),
(1757, 42, 'Sinaloa'),
(1758, 42, 'Sonora'),
(1759, 42, 'Tabasco'),
(1760, 42, 'Tamaulipas'),
(1761, 42, 'Tlaxcala'),
(1762, 42, 'Veracruz-Llave'),
(1763, 42, 'Yucatán'),
(1764, 42, 'Zacatecas'),
(1766, 124, 'Bocas del Toro'),
(1767, 124, 'Chiriquí'),
(1768, 124, 'Coclé'),
(1769, 124, 'Colón'),
(1770, 124, 'Darién'),
(1771, 124, 'Herrera'),
(1772, 124, 'Los Santos'),
(1773, 124, 'Panamá'),
(1774, 124, 'San Blas'),
(1775, 124, 'Veraguas'),
(1777, 123, 'Chuquisaca'),
(1778, 123, 'Cochabamba'),
(1779, 123, 'El Beni'),
(1780, 123, 'La Paz'),
(1781, 123, 'Oruro'),
(1782, 123, 'Pando'),
(1783, 123, 'Potosí'),
(1784, 123, 'Santa Cruz'),
(1785, 123, 'Tarija'),
(1787, 36, 'Alajuela'),
(1788, 36, 'Cartago'),
(1789, 36, 'Guanacaste'),
(1790, 36, 'Heredia'),
(1791, 36, 'Limón'),
(1792, 36, 'Puntarenas'),
(1793, 36, 'San José'),
(1795, 103, 'Galápagos'),
(1796, 103, 'Azuay'),
(1797, 103, 'Bolívar'),
(1798, 103, 'Canar'),
(1799, 103, 'Carchi'),
(1800, 103, 'Chimborazo'),
(1801, 103, 'Cotopaxi'),
(1802, 103, 'El Oro'),
(1803, 103, 'Esmeraldas'),
(1804, 103, 'Guayas'),
(1805, 103, 'Imbabura'),
(1806, 103, 'Loja'),
(1807, 103, 'Los Ríos'),
(1808, 103, 'Manabí'),
(1809, 103, 'Morona-Santiago'),
(1810, 103, 'Pastaza'),
(1811, 103, 'Pichincha'),
(1812, 103, 'Tungurahua'),
(1813, 103, 'Zamora-Chinchipe'),
(1814, 103, 'Sucumbíos'),
(1815, 103, 'Napo'),
(1816, 103, 'Orellana'),
(1818, 5, 'Buenos Aires'),
(1819, 5, 'Catamarca'),
(1820, 5, 'Chaco'),
(1821, 5, 'Chubut'),
(1822, 5, 'Córdoba'),
(1823, 5, 'Corrientes'),
(1824, 5, 'Distrito Federal'),
(1825, 5, 'Entre Ríos'),
(1826, 5, 'Formosa'),
(1827, 5, 'Jujuy'),
(1828, 5, 'La Pampa'),
(1829, 5, 'La Rioja'),
(1830, 5, 'Mendoza'),
(1831, 5, 'Misiones'),
(1832, 5, 'Neuquén'),
(1833, 5, 'Río Negro'),
(1834, 5, 'Salta'),
(1835, 5, 'San Juan'),
(1836, 5, 'San Luis'),
(1837, 5, 'Santa Cruz'),
(1838, 5, 'Santa Fe'),
(1839, 5, 'Santiago del Estero'),
(1840, 5, 'Tierra del Fuego'),
(1841, 5, 'Tucumán'),
(1843, 95, 'Amazonas'),
(1844, 95, 'Anzoategui'),
(1845, 95, 'Apure'),
(1846, 95, 'Aragua'),
(1847, 95, 'Barinas'),
(1848, 95, 'Bolívar'),
(1849, 95, 'Carabobo'),
(1850, 95, 'Cojedes'),
(1851, 95, 'Delta Amacuro'),
(1852, 95, 'Falcón'),
(1853, 95, 'Guárico'),
(1854, 95, 'Lara'),
(1855, 95, 'Mérida'),
(1856, 95, 'Miranda'),
(1857, 95, 'Monagas'),
(1858, 95, 'Nueva Esparta'),
(1859, 95, 'Portuguesa'),
(1860, 95, 'Sucre'),
(1861, 95, 'Táchira'),
(1862, 95, 'Trujillo'),
(1863, 95, 'Yaracuy'),
(1864, 95, 'Zulia'),
(1865, 95, 'Dependencias Federales'),
(1866, 95, 'Distrito Capital'),
(1867, 95, 'Vargas'),
(1869, 209, 'Boaco'),
(1870, 209, 'Carazo'),
(1871, 209, 'Chinandega'),
(1872, 209, 'Chontales'),
(1873, 209, 'Estelí'),
(1874, 209, 'Granada'),
(1875, 209, 'Jinotega'),
(1876, 209, 'León'),
(1877, 209, 'Madriz'),
(1878, 209, 'Managua'),
(1879, 209, 'Masaya'),
(1880, 209, 'Matagalpa'),
(1881, 209, 'Nueva Segovia'),
(1882, 209, 'Rio San Juan'),
(1883, 209, 'Rivas'),
(1884, 209, 'Zelaya'),
(1886, 113, 'Pinar del Rio'),
(1887, 113, 'Ciudad de la Habana'),
(1888, 113, 'Matanzas'),
(1889, 113, 'Isla de la Juventud'),
(1890, 113, 'Camaguey'),
(1891, 113, 'Ciego de Avila'),
(1892, 113, 'Cienfuegos'),
(1893, 113, 'Granma'),
(1894, 113, 'Guantanamo'),
(1895, 113, 'La Habana'),
(1896, 113, 'Holguin'),
(1897, 113, 'Las Tunas'),
(1898, 113, 'Sancti Spiritus'),
(1899, 113, 'Santiago de Cuba'),
(1900, 113, 'Villa Clara'),
(1901, 12, 'Acre'),
(1902, 12, 'Alagoas'),
(1903, 12, 'Amapa'),
(1904, 12, 'Amazonas'),
(1905, 12, 'Bahia'),
(1906, 12, 'Ceara'),
(1907, 12, 'Distrito Federal'),
(1908, 12, 'Espirito Santo'),
(1909, 12, 'Mato Grosso do Sul'),
(1910, 12, 'Maranhao'),
(1911, 12, 'Mato Grosso'),
(1912, 12, 'Minas Gerais'),
(1913, 12, 'Para'),
(1914, 12, 'Paraiba'),
(1915, 12, 'Parana'),
(1916, 12, 'Piaui'),
(1917, 12, 'Rio de Janeiro'),
(1918, 12, 'Rio Grande do Norte'),
(1919, 12, 'Rio Grande do Sul'),
(1920, 12, 'Rondonia'),
(1921, 12, 'Roraima'),
(1922, 12, 'Santa Catarina'),
(1923, 12, 'Sao Paulo'),
(1924, 12, 'Sergipe'),
(1925, 12, 'Goias'),
(1926, 12, 'Pernambuco'),
(1927, 12, 'Tocantins'),
(1930, 83, 'Akureyri'),
(1931, 83, 'Arnessysla'),
(1932, 83, 'Austur-Bardastrandarsysla'),
(1933, 83, 'Austur-Hunavatnssysla'),
(1934, 83, 'Austur-Skaftafellssysla'),
(1935, 83, 'Borgarfjardarsysla'),
(1936, 83, 'Dalasysla'),
(1937, 83, 'Eyjafjardarsysla'),
(1938, 83, 'Gullbringusysla'),
(1939, 83, 'Hafnarfjordur'),
(1943, 83, 'Kjosarsysla'),
(1944, 83, 'Kopavogur'),
(1945, 83, 'Myrasysla'),
(1946, 83, 'Neskaupstadur'),
(1947, 83, 'Nordur-Isafjardarsysla'),
(1948, 83, 'Nordur-Mulasysla'),
(1949, 83, 'Nordur-Tingeyjarsysla'),
(1950, 83, 'Olafsfjordur'),
(1951, 83, 'Rangarvallasysla'),
(1952, 83, 'Reykjavik'),
(1953, 83, 'Saudarkrokur'),
(1954, 83, 'Seydisfjordur'),
(1956, 83, 'Skagafjardarsysla'),
(1957, 83, 'Snafellsnes- og Hnappadalssysla'),
(1958, 83, 'Strandasysla'),
(1959, 83, 'Sudur-Mulasysla'),
(1960, 83, 'Sudur-Tingeyjarsysla'),
(1961, 83, 'Vestmannaeyjar'),
(1962, 83, 'Vestur-Bardastrandarsysla'),
(1964, 83, 'Vestur-Isafjardarsysla'),
(1965, 83, 'Vestur-Skaftafellssysla'),
(1966, 35, 'Anhui'),
(1967, 35, 'Zhejiang'),
(1968, 35, 'Jiangxi'),
(1969, 35, 'Jiangsu'),
(1970, 35, 'Jilin'),
(1971, 35, 'Qinghai'),
(1972, 35, 'Fujian'),
(1973, 35, 'Heilongjiang'),
(1974, 35, 'Henan'),
(1975, 35, 'Hebei'),
(1976, 35, 'Hunan'),
(1977, 35, 'Hubei'),
(1978, 35, 'Xinjiang'),
(1979, 35, 'Xizang'),
(1980, 35, 'Gansu'),
(1981, 35, 'Guangxi'),
(1982, 35, 'Guizhou'),
(1983, 35, 'Liaoning'),
(1984, 35, 'Nei Mongol'),
(1985, 35, 'Ningxia'),
(1986, 35, 'Beijing'),
(1987, 35, 'Shanghai'),
(1988, 35, 'Shanxi'),
(1989, 35, 'Shandong'),
(1990, 35, 'Shaanxi'),
(1991, 35, 'Sichuan'),
(1992, 35, 'Tianjin'),
(1993, 35, 'Yunnan'),
(1994, 35, 'Guangdong'),
(1995, 35, 'Hainan'),
(1996, 35, 'Chongqing'),
(1997, 97, 'Central'),
(1998, 97, 'Coast'),
(1999, 97, 'Eastern'),
(2000, 97, 'Nairobi Area'),
(2001, 97, 'North-Eastern'),
(2002, 97, 'Nyanza'),
(2003, 97, 'Rift Valley'),
(2004, 97, 'Western'),
(2006, 195, 'Gilbert Islands'),
(2007, 195, 'Line Islands'),
(2008, 195, 'Phoenix Islands'),
(2010, 1, 'Australian Capital Territory'),
(2011, 1, 'New South Wales'),
(2012, 1, 'Northern Territory'),
(2013, 1, 'Queensland'),
(2014, 1, 'South Australia'),
(2015, 1, 'Tasmania'),
(2016, 1, 'Victoria'),
(2017, 1, 'Western Australia'),
(2018, 27, 'Dublin'),
(2019, 27, 'Galway'),
(2020, 27, 'Kildare'),
(2021, 27, 'Leitrim'),
(2022, 27, 'Limerick'),
(2023, 27, 'Mayo'),
(2024, 27, 'Meath'),
(2025, 27, 'Carlow'),
(2026, 27, 'Kilkenny'),
(2027, 27, 'Laois'),
(2028, 27, 'Longford'),
(2029, 27, 'Louth'),
(2030, 27, 'Offaly'),
(2031, 27, 'Westmeath'),
(2032, 27, 'Wexford'),
(2033, 27, 'Wicklow'),
(2034, 27, 'Roscommon'),
(2035, 27, 'Sligo'),
(2036, 27, 'Clare'),
(2037, 27, 'Cork'),
(2038, 27, 'Kerry'),
(2039, 27, 'Tipperary'),
(2040, 27, 'Waterford'),
(2041, 27, 'Cavan'),
(2042, 27, 'Donegal'),
(2043, 27, 'Monaghan'),
(2044, 50, 'Karachaeva-Cherkesskaya Respublica'),
(2045, 50, 'Raimirskii (Dolgano-Nenetskii) AO'),
(2046, 50, 'Respublica Tiva'),
(2047, 32, 'Newfoundland'),
(2048, 32, 'Nova Scotia'),
(2049, 32, 'Prince Edward Island'),
(2050, 32, 'New Brunswick'),
(2051, 32, 'Quebec'),
(2052, 32, 'Ontario'),
(2053, 32, 'Manitoba'),
(2054, 32, 'Saskatchewan'),
(2055, 32, 'Alberta'),
(2056, 32, 'British Columbia'),
(2057, 32, 'Nunavut'),
(2058, 32, 'Northwest Territories'),
(2059, 32, 'Yukon Territory'),
(2060, 19, 'Drenthe'),
(2061, 19, 'Friesland'),
(2062, 19, 'Gelderland'),
(2063, 19, 'Groningen'),
(2064, 19, 'Limburg'),
(2065, 19, 'Noord-Brabant'),
(2066, 19, 'Noord-Holland'),
(2067, 19, 'Utrecht'),
(2068, 19, 'Zeeland'),
(2069, 19, 'Zuid-Holland'),
(2071, 19, 'Overijssel'),
(2072, 19, 'Flevoland'),
(2073, 138, 'Duarte'),
(2074, 138, 'Puerto Plata'),
(2075, 138, 'Valverde'),
(2076, 138, 'María Trinidad Sánchez'),
(2077, 138, 'Azua'),
(2078, 138, 'Santiago'),
(2079, 138, 'San Cristóbal'),
(2080, 138, 'Peravia'),
(2081, 138, 'Elías Piña'),
(2082, 138, 'Barahona'),
(2083, 138, 'Monte Plata'),
(2084, 138, 'Salcedo'),
(2085, 138, 'La Altagracia'),
(2086, 138, 'San Juan'),
(2087, 138, 'Monseñor Nouel'),
(2088, 138, 'Monte Cristi'),
(2089, 138, 'Espaillat'),
(2090, 138, 'Sánchez Ramírez'),
(2091, 138, 'La Vega'),
(2092, 138, 'San Pedro de Macorís'),
(2093, 138, 'Independencia'),
(2094, 138, 'Dajabón'),
(2095, 138, 'Baoruco'),
(2096, 138, 'El Seibo'),
(2097, 138, 'Hato Mayor'),
(2098, 138, 'La Romana'),
(2099, 138, 'Pedernales'),
(2100, 138, 'Samaná'),
(2101, 138, 'Santiago Rodríguez'),
(2102, 138, 'San José de Ocoa'),
(2103, 70, 'Chiba'),
(2104, 70, 'Ehime'),
(2105, 70, 'Oita'),
(2106, 85, 'Skopje'),
(2108, 35, 'Schanghai'),
(2109, 35, 'Hongkong'),
(2110, 35, 'Neimenggu'),
(2111, 35, 'Aomen'),
(2112, 92, 'Amnat Charoen'),
(2113, 92, 'Ang Thong'),
(2114, 92, 'Bangkok'),
(2115, 92, 'Buri Ram'),
(2116, 92, 'Chachoengsao'),
(2117, 92, 'Chai Nat'),
(2118, 92, 'Chaiyaphum'),
(2119, 92, 'Chanthaburi'),
(2120, 92, 'Chiang Mai'),
(2121, 92, 'Chiang Rai'),
(2122, 92, 'Chon Buri'),
(2124, 92, 'Kalasin'),
(2126, 92, 'Kanchanaburi'),
(2127, 92, 'Khon Kaen'),
(2128, 92, 'Krabi'),
(2129, 92, 'Lampang'),
(2131, 92, 'Loei'),
(2132, 92, 'Lop Buri'),
(2133, 92, 'Mae Hong Son'),
(2134, 92, 'Maha Sarakham'),
(2137, 92, 'Nakhon Pathom'),
(2139, 92, 'Nakhon Ratchasima'),
(2140, 92, 'Nakhon Sawan'),
(2141, 92, 'Nakhon Si Thammarat'),
(2143, 92, 'Narathiwat'),
(2144, 92, 'Nong Bua Lam Phu'),
(2145, 92, 'Nong Khai'),
(2146, 92, 'Nonthaburi'),
(2147, 92, 'Pathum Thani'),
(2148, 92, 'Pattani'),
(2149, 92, 'Phangnga'),
(2150, 92, 'Phatthalung'),
(2154, 92, 'Phichit'),
(2155, 92, 'Phitsanulok'),
(2156, 92, 'Phra Nakhon Si Ayutthaya'),
(2157, 92, 'Phrae'),
(2158, 92, 'Phuket'),
(2159, 92, 'Prachin Buri'),
(2160, 92, 'Prachuap Khiri Khan'),
(2162, 92, 'Ratchaburi'),
(2163, 92, 'Rayong'),
(2164, 92, 'Roi Et'),
(2165, 92, 'Sa Kaeo'),
(2166, 92, 'Sakon Nakhon'),
(2167, 92, 'Samut Prakan'),
(2168, 92, 'Samut Sakhon'),
(2169, 92, 'Samut Songkhran'),
(2170, 92, 'Saraburi'),
(2172, 92, 'Si Sa Ket'),
(2173, 92, 'Sing Buri'),
(2174, 92, 'Songkhla'),
(2175, 92, 'Sukhothai'),
(2176, 92, 'Suphan Buri'),
(2177, 92, 'Surat Thani'),
(2178, 92, 'Surin'),
(2180, 92, 'Trang'),
(2182, 92, 'Ubon Ratchathani'),
(2183, 92, 'Udon Thani'),
(2184, 92, 'Uthai Thani'),
(2185, 92, 'Uttaradit'),
(2186, 92, 'Yala'),
(2187, 92, 'Yasothon'),
(2188, 69, 'Busan'),
(2189, 69, 'Daegu'),
(2191, 69, 'Gangwon'),
(2192, 69, 'Gwangju'),
(2193, 69, 'Gyeonggi'),
(2194, 69, 'Gyeongsangbuk'),
(2195, 69, 'Gyeongsangnam'),
(2196, 69, 'Jeju'),
(2201, 25, 'Delhi'),
(2202, 81, 'Región de Los Ríos'),
(2203, 81, 'Región de Arica y Parinacota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion_informacion`
--

CREATE TABLE `clasificacion_informacion` (
  `id` int(11) NOT NULL,
  `clasificacion` varchar(150) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clasificacion_informacion`
--

INSERT INTO `clasificacion_informacion` (`id`, `clasificacion`, `descripcion`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(13, 'Clasificacion A', 'Clasificacion A', 1, 5, '2023-04-10 17:01:50.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobertura`
--

CREATE TABLE `cobertura` (
  `id` int(11) NOT NULL,
  `cobertura` varchar(150) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cobertura`
--

INSERT INTO `cobertura` (`id`, `cobertura`, `descripcion`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(1, 'Cobertura Probabilidad', 'Cobertura Probabilidad', 5, '2023-03-22 00:00:00.000000', 5, '2023-04-08 01:48:46.000000', NULL, NULL, 0),
(2, 'Cobertura Impacto', 'Cobertura Impacto', 5, '2023-03-24 00:00:00.000000', NULL, '2023-04-08 01:11:00.000000', NULL, NULL, 0),
(3, 'Todos', 'Todos', 5, '2023-03-24 00:00:00.000000', NULL, '2023-03-30 15:30:00.000000', NULL, NULL, 0),
(4, 'Cobertura Prueba uno', 'Prueba ', 11, '2023-03-30 00:00:00.000000', 5, '2023-04-04 09:49:16.000000', NULL, NULL, 1),
(5, 'as', 'as', 4, '2023-04-05 00:00:00.000000', NULL, '2023-04-05 03:09:33.000000', NULL, NULL, 1),
(6, 'Cobertura Prueba', 'Cobertura Pruebados', 11, '2023-04-05 00:00:00.000000', 11, '2023-04-05 13:28:17.000000', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_pass`
--

CREATE TABLE `config_pass` (
  `id` int(11) NOT NULL,
  `duracion` int(11) DEFAULT NULL,
  `inactividad` int(11) DEFAULT NULL,
  `sesion` int(11) DEFAULT NULL,
  `tama_min` int(11) DEFAULT NULL,
  `tama_max` int(11) DEFAULT NULL,
  `letras` int(11) DEFAULT NULL,
  `numeros` int(11) DEFAULT NULL,
  `caracteres` int(11) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_actualizacion` datetime(6) DEFAULT NULL,
  `intentos` int(11) DEFAULT NULL,
  `recordatorio` int(11) DEFAULT NULL,
  `limitador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `config_pass`
--

INSERT INTO `config_pass` (`id`, `duracion`, `inactividad`, `sesion`, `tama_min`, `tama_max`, `letras`, `numeros`, `caracteres`, `fecha_creacion`, `fecha_actualizacion`, `intentos`, `recordatorio`, `limitador`) VALUES
(1, 45, 15, 30, 8, 12, 1, 1, 1, '2023-03-22 00:59:24.000000', '0000-00-00 00:00:00.000000', 3, 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continente`
--

CREATE TABLE `continente` (
  `ContinenteCodigo` char(50) NOT NULL DEFAULT '',
  `PaisContinente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `continente`
--

INSERT INTO `continente` (`ContinenteCodigo`, `PaisContinente`) VALUES
('Africa', 'Africa'),
('América', 'América'),
('Asia', 'Asia'),
('Europe', 'Europa'),
('Oceania', 'Oceania');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controles`
--

CREATE TABLE `controles` (
  `id` int(11) NOT NULL,
  `IDR` int(11) DEFAULT NULL,
  `riesgo` int(11) DEFAULT NULL,
  `IDC` int(11) DEFAULT NULL,
  `desc_control` varchar(150) DEFAULT NULL,
  `disenio` varchar(150) DEFAULT NULL,
  `responsable` int(11) DEFAULT NULL,
  `preiodicidad` varchar(150) DEFAULT NULL,
  `evidencia` varchar(150) DEFAULT NULL,
  `documentacion` varchar(150) DEFAULT NULL,
  `idobjetivo` int(11) DEFAULT NULL,
  `operatividad` varchar(150) DEFAULT NULL,
  `idprueba` int(11) DEFAULT NULL,
  `idautomatizacion` int(11) DEFAULT NULL,
  `caract_operatividad` varchar(150) DEFAULT NULL,
  `evaluacion` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` int(11) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo_actividad`
--

CREATE TABLE `correo_actividad` (
  `id` int(11) NOT NULL,
  `idactividad` int(11) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo_plan`
--

CREATE TABLE `correo_plan` (
  `id` int(11) NOT NULL,
  `idplan` int(11) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `correo_plan`
--

INSERT INTO `correo_plan` (`id`, `idplan`, `fecha_envio`, `idusuario`) VALUES
(38, 8, '2023-04-04 00:00:00', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desc_amenaza`
--

CREATE TABLE `desc_amenaza` (
  `id` int(11) NOT NULL,
  `idtipo_amenaza` int(11) DEFAULT NULL,
  `amenaza` varchar(150) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `desc_amenaza`
--

INSERT INTO `desc_amenaza` (`id`, `idtipo_amenaza`, `amenaza`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(20, 16, 'Desc A', 5, '2023-04-10 18:01:42.000000', NULL, NULL, NULL, NULL, 0),
(21, 17, 'Desc B', 5, '2023-04-10 18:01:48.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desc_vulnerabilidad`
--

CREATE TABLE `desc_vulnerabilidad` (
  `id` int(11) NOT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `vulnerabilidad` varchar(150) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `desc_vulnerabilidad`
--

INSERT INTO `desc_vulnerabilidad` (`id`, `idcategoria`, `vulnerabilidad`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(13, 11, 'Vul A', 5, '2023-04-10 18:02:12.000000', NULL, NULL, NULL, NULL, 0),
(14, 12, 'Vul B', 5, '2023-04-10 18:02:18.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_controles`
--

CREATE TABLE `detalle_controles` (
  `id` int(11) NOT NULL,
  `idControles` int(11) DEFAULT NULL,
  `idCC` int(11) DEFAULT NULL,
  `nom_tabla` varchar(40) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_controles`
--

INSERT INTO `detalle_controles` (`id`, `idControles`, `idCC`, `nom_tabla`, `valor`) VALUES
(1, 3, 7, '1', ''),
(2, 3, 9, '0', ''),
(3, 3, 10, '0', ''),
(4, 3, 8, '0', ''),
(5, 3, 11, '0', ''),
(6, 3, 13, '0', ''),
(7, 4, 7, '1', '1'),
(8, 4, 9, '0', ''),
(9, 4, 10, '0', ''),
(10, 4, 8, '0', ''),
(11, 4, 11, '0', '14'),
(12, 4, 13, '0', ''),
(13, 5, 7, '1', '4'),
(14, 5, 9, '0', 'Anual'),
(15, 5, 10, '0', 'Electrónico'),
(16, 5, 20, '0', 'Si'),
(17, 5, 5, '0', '8'),
(18, 5, 11, '0', '14'),
(19, 5, 13, '0', '15'),
(20, 5, 22, '0', '23'),
(21, 6, 7, '1', '1'),
(22, 6, 9, '0', 'as'),
(23, 6, 10, '0', 'as'),
(24, 6, 20, '0', 'as'),
(25, 6, 38, '0', ''),
(26, 6, 5, '0', '8'),
(27, 6, 11, '0', '14'),
(28, 6, 13, '0', ''),
(29, 6, 22, '0', '23'),
(30, 7, 7, '1', ''),
(31, 7, 9, '0', 'as'),
(32, 7, 10, '0', 'as'),
(33, 7, 20, '0', 'as'),
(34, 7, 38, '0', ''),
(35, 7, 5, '0', '8'),
(36, 7, 11, '0', '14'),
(37, 7, 13, '0', ''),
(38, 7, 22, '0', '23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_evaluacion_control`
--

CREATE TABLE `detalle_evaluacion_control` (
  `id` int(11) NOT NULL,
  `IEC` int(11) DEFAULT NULL,
  `ID_CC` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_evaluacion_control`
--

INSERT INTO `detalle_evaluacion_control` (`id`, `IEC`, `ID_CC`) VALUES
(51, 17, 118),
(52, 17, 131),
(53, 18, 118),
(54, 18, 132),
(55, 19, 120),
(56, 19, 131),
(57, 20, 120),
(58, 20, 133),
(59, 21, 120),
(60, 21, 132),
(61, 22, 119),
(62, 22, 133),
(63, 23, 119),
(64, 23, 131),
(65, 24, 118),
(66, 24, 133);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `empresa` varchar(250) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `empresa`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(26, 'Financiera Efectiva SA', 1, 5, '2023-04-10 16:37:16.000000', 5, '2023-04-10 16:44:05.000000', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escenario_active`
--

CREATE TABLE `escenario_active` (
  `id` int(11) NOT NULL,
  `escenario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `escenario_active`
--

INSERT INTO `escenario_active` (`id`, `escenario`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(150) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `estado`, `descripcion`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(1, 'Por Iniciar', 'Por Iniciar', 5, '2023-03-25 00:00:00.000000', 5, '2023-04-08 00:00:00.000000', NULL, NULL, 0),
(2, 'En Proceso', 'En Proceso', 5, '2023-03-25 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(3, 'Culminado', 'Terminado', 11, '2023-03-31 00:00:00.000000', 11, '2023-04-04 10:12:53.000000', 11, '2023-04-04 10:12:53.000000', 1),
(4, 'CulminadoA', 'CulminadoA', 4, '2023-04-05 00:00:00.000000', 4, '2023-04-05 03:13:22.000000', 4, '2023-04-05 03:13:22.000000', 1),
(5, 'Por Iniciar	', 'Por Iniciar	', 5, '2023-04-08 00:00:00.000000', NULL, '2023-04-08 02:01:25.000000', 5, '2023-04-08 02:01:25.000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_control`
--

CREATE TABLE `evaluacion_control` (
  `id` int(11) NOT NULL,
  `idDisenio` int(11) DEFAULT NULL,
  `idOperatividad` int(11) DEFAULT NULL,
  `calificacion` varchar(100) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_control2`
--

CREATE TABLE `evaluacion_control2` (
  `id` int(11) NOT NULL,
  `calificacion` varchar(100) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evaluacion_control2`
--

INSERT INTO `evaluacion_control2` (`id`, `calificacion`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(17, 'Débil', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(18, 'Débil', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(19, 'Moderado', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(20, 'Fuerte', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(21, 'Moderado', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(22, 'Moderado', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(23, 'Moderado', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(24, 'Moderado', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_riesgo`
--

CREATE TABLE `evaluacion_riesgo` (
  `id` int(11) NOT NULL,
  `id_tipo_riesgo` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `id_macroproceso` int(11) DEFAULT NULL,
  `id_proceso` int(11) DEFAULT NULL,
  `id_activo` int(11) DEFAULT NULL,
  `id_tipo_amenaza` int(11) DEFAULT NULL,
  `id_descripcion_amenaza` int(11) DEFAULT NULL,
  `id_tipo_vulnerabilidad` int(11) DEFAULT NULL,
  `id_descripcion_vulnerabilidad` int(11) DEFAULT NULL,
  `riesgo` longtext DEFAULT NULL,
  `valor_probabilidad` int(11) DEFAULT NULL,
  `probabilidad` varchar(150) DEFAULT NULL,
  `valor_impacto` varchar(150) DEFAULT NULL,
  `impacto` varchar(150) DEFAULT NULL,
  `valor` varchar(150) DEFAULT NULL,
  `id_control` int(11) DEFAULT NULL,
  `riesgo_controlado_probabilidad` varchar(150) DEFAULT NULL,
  `riesgo_controlado_impacto` varchar(150) DEFAULT NULL,
  `riesgo_controlado_valor` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_riesgos_controles`
--

CREATE TABLE `evaluacion_riesgos_controles` (
  `id` int(11) NOT NULL,
  `id_evaluacion_riesgo` int(11) DEFAULT NULL,
  `id_control` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deteled` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_riesgo_historial`
--

CREATE TABLE `evaluacion_riesgo_historial` (
  `id` int(11) NOT NULL,
  `id_tipo_riesgo` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `id_macroproceso` int(11) DEFAULT NULL,
  `id_proceso` int(11) DEFAULT NULL,
  `id_activo` int(11) DEFAULT NULL,
  `id_tipo_amenaza` int(11) DEFAULT NULL,
  `id_descripcion_amenaza` int(11) DEFAULT NULL,
  `id_tipo_vulnerabilidad` int(11) DEFAULT NULL,
  `id_descripcion_vulnerabilidad` int(11) DEFAULT NULL,
  `riesgo` varchar(150) DEFAULT NULL,
  `valor_probabilidad` int(11) DEFAULT NULL,
  `probabilidad` varchar(150) DEFAULT NULL,
  `valor_impacto` varchar(150) DEFAULT NULL,
  `impacto` varchar(150) DEFAULT NULL,
  `valor` varchar(150) DEFAULT NULL,
  `id_control` int(11) DEFAULT NULL,
  `riesgo_controlado_probabilidad` varchar(150) DEFAULT NULL,
  `riesgo_controlado_impacto` varchar(150) DEFAULT NULL,
  `riesgo_controlado_valor` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impacto_riesgo`
--

CREATE TABLE `impacto_riesgo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `tipo_regla` varchar(150) DEFAULT NULL,
  `tipo_valor` varchar(150) DEFAULT NULL,
  `formula` varchar(150) DEFAULT NULL,
  `operador1` varchar(150) DEFAULT NULL,
  `valor1` int(11) DEFAULT NULL,
  `operador2` varchar(150) DEFAULT NULL,
  `valor2` int(11) DEFAULT NULL,
  `comentario` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `escenario` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `impacto_riesgo`
--

INSERT INTO `impacto_riesgo` (`id`, `descripcion`, `tipo_regla`, `tipo_valor`, `formula`, `operador1`, `valor1`, `operador2`, `valor2`, `comentario`, `estado`, `escenario`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(10, 'Moderado', '1 Valor', 'Numero', '=', NULL, NULL, NULL, NULL, 'Moderado', 2, 1, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 1),
(11, 'Insignificante', '2 Valores', 'Numero', NULL, '>', 0, '<=', 3000, 'Insignificante', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(12, 'Menor', '2 Valores', 'Numero', NULL, '>', 3000, '<=', 6000, 'Menor', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(13, 'Moderado', '2 Valores', 'Numero', NULL, '>', 6000, '<=', 10000, 'Moderado', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(14, 'Alto', '2 Valores', 'Numero', NULL, '>', 10000, '<=', 45000, 'Alto', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(15, 'Catastrófico', '2 Valores', 'Numero', NULL, '>', 45000, '<=', 100000, 'Catastrófico', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(16, 'Alto', '1 Valor', 'Formula', '> 10000 Moderado', NULL, NULL, NULL, NULL, 'Alto', 1, 1, 5, '2023-04-10 17:57:35.000000', 5, '2023-04-10 18:00:50.000000', NULL, NULL, 0),
(17, 'Moderado', '1 Valor', 'Numero', '=', NULL, NULL, NULL, NULL, 'Moderado', 2, 1, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 1),
(18, 'Insignificante', '2 Valores', 'Numero', NULL, '>', 0, '<=', 3000, 'Insignificante', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(19, 'Menor', '2 Valores', 'Numero', NULL, '>', 3000, '<=', 6000, 'Menor', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(20, 'Moderado', '2 Valores', 'Numero', NULL, '>', 6000, '<=', 10000, 'Moderado', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(21, 'Alto', '2 Valores', 'Numero', NULL, '>', 10000, '<=', 45000, 'Alto', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(22, 'Catastrófico', '2 Valores', 'Numero', NULL, '>', 45000, '<=', 100000, 'Catastrófico', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(23, 'Alto', '1 Valor', 'Formula', '> 10000 Moderado', NULL, NULL, NULL, NULL, 'Alto', 2, 1, 5, '2023-04-10 17:58:34.000000', NULL, '2023-04-10 18:00:45.000000', 5, '2023-04-10 18:00:45.000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_clasificacion_activo`
--

CREATE TABLE `inventario_clasificacion_activo` (
  `id` int(11) NOT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idunidad` int(11) DEFAULT NULL,
  `idmacroproceso` int(11) DEFAULT NULL,
  `idproceso` int(11) DEFAULT NULL,
  `activo` varchar(150) DEFAULT NULL,
  `desc_activo` varchar(500) DEFAULT NULL,
  `idtipo_activo` int(11) DEFAULT NULL,
  `idcategoria_activo` int(11) DEFAULT NULL,
  `idubicacion` int(11) DEFAULT NULL,
  `idpropietario` int(11) DEFAULT NULL,
  `idcustodio` int(11) DEFAULT NULL,
  `val_c` int(11) DEFAULT NULL,
  `val_i` int(11) DEFAULT NULL,
  `val_d` int(11) DEFAULT NULL,
  `idvalor` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `estado_2` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_clasificacion_activo_historial`
--

CREATE TABLE `inventario_clasificacion_activo_historial` (
  `id` int(11) NOT NULL,
  `id_ica` int(11) NOT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idunidad` int(11) DEFAULT NULL,
  `idmacroproceso` int(11) DEFAULT NULL,
  `idproceso` int(11) DEFAULT NULL,
  `activo` varchar(150) DEFAULT NULL,
  `desc_activo` varchar(500) DEFAULT NULL,
  `idtipo_activo` int(11) DEFAULT NULL,
  `idcategoria_activo` int(11) DEFAULT NULL,
  `idubicacion` int(11) DEFAULT NULL,
  `idpropietario` int(11) DEFAULT NULL,
  `idcustodio` int(11) DEFAULT NULL,
  `val_c` int(11) DEFAULT NULL,
  `val_i` int(11) DEFAULT NULL,
  `val_d` int(11) DEFAULT NULL,
  `idvalor` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `estado_2` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_acciones`
--

CREATE TABLE `log_acciones` (
  `id` int(11) NOT NULL,
  `terminal` varchar(500) DEFAULT NULL,
  `ip_addres` varchar(150) DEFAULT NULL,
  `u_ejecutor` int(11) DEFAULT NULL,
  `u_afectado` int(11) DEFAULT NULL,
  `accion` longtext DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `log_acciones`
--

INSERT INTO `log_acciones` (`id`, `terminal`, `ip_addres`, `u_ejecutor`, `u_afectado`, `accion`, `fecha`) VALUES
(1, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin ah realizado cambio de clave', '2023-03-22 01:42:43.000000'),
(2, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 01:46:26.000000'),
(3, 'Edge 111.0.1661.44', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 02:51:35.000000'),
(4, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 09:45:15.000000'),
(5, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 11:03:43.000000'),
(6, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-22 12:39:11.000000'),
(7, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 12:39:20.000000'),
(8, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-22 13:21:07.000000'),
(9, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 13:21:17.000000'),
(10, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:administrador : Ver en opcion Empresa', '2023-03-22 13:34:58.000000'),
(11, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-22 13:35:03.000000'),
(12, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 13:35:15.000000'),
(13, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:administrador : Ver en opcion Empresa', '2023-03-22 13:35:30.000000'),
(14, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-22 13:35:33.000000'),
(15, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 13:36:12.000000'),
(16, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-22 13:36:28.000000'),
(17, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 16:27:15.000000'),
(18, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-22 16:43:12.000000'),
(19, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 16:43:48.000000'),
(20, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-22 18:33:02.000000'),
(21, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-23 11:39:33.000000'),
(22, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-23 12:37:53.000000'),
(23, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-23 13:10:38.000000'),
(24, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-23 13:10:43.000000'),
(25, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-23 13:10:56.000000'),
(26, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-23 14:18:22.000000'),
(27, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-23 14:46:45.000000'),
(28, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-23 15:16:54.000000'),
(29, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-23 15:18:59.000000'),
(30, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-24 00:14:37.000000'),
(31, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-24 00:14:56.000000'),
(32, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-24 00:15:00.000000'),
(33, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-24 02:18:52.000000'),
(34, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-24 08:11:24.000000'),
(35, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-24 08:34:42.000000'),
(36, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-24 08:34:46.000000'),
(37, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-24 11:58:17.000000'),
(38, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-24 13:11:50.000000'),
(39, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-24 13:34:37.000000'),
(40, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-24 15:22:52.000000'),
(41, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-24 15:39:25.000000'),
(42, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-24 18:28:58.000000'),
(43, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-24 23:08:53.000000'),
(44, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : ANALISTA SI', '2023-03-25 01:09:18.000000'),
(45, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Áreas', '2023-03-25 01:09:28.000000'),
(46, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Unidades', '2023-03-25 01:09:29.000000'),
(47, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Parametrización', '2023-03-25 01:09:29.000000'),
(48, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Macroprocesos', '2023-03-25 01:09:30.000000'),
(49, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Procesos', '2023-03-25 01:09:30.000000'),
(50, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Posición/Puesto', '2023-03-25 01:09:31.000000'),
(51, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Aspecto de Seguridad', '2023-03-25 01:09:32.000000'),
(52, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Valor de Activo', '2023-03-25 01:09:32.000000'),
(53, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Valoración de Activo', '2023-03-25 01:09:33.000000'),
(54, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Tipo de Activo', '2023-03-25 01:09:33.000000'),
(55, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Ubicación de Activo', '2023-03-25 01:09:35.000000'),
(56, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Categoría de Activo', '2023-03-25 01:09:35.000000'),
(57, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Clasificación de Información', '2023-03-25 01:09:35.000000'),
(58, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Clasificación de Información', '2023-03-25 01:09:38.000000'),
(59, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Categoría de Activo', '2023-03-25 01:09:39.000000'),
(60, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Ubicación de Activo', '2023-03-25 01:09:39.000000'),
(61, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Tipo de Activo', '2023-03-25 01:09:40.000000'),
(62, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Valoración de Activo', '2023-03-25 01:09:40.000000'),
(63, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Valor de Activo', '2023-03-25 01:09:40.000000'),
(64, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Macroprocesos', '2023-03-25 01:09:42.000000'),
(65, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Unidades', '2023-03-25 01:09:42.000000'),
(66, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Áreas', '2023-03-25 01:09:43.000000'),
(67, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Aspecto de Seguridad', '2023-03-25 01:09:44.000000'),
(68, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Parametrización', '2023-03-25 01:09:45.000000'),
(69, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Evaluación de Riesgos de Seguridad en Procesos de Negocio', '2023-03-25 01:09:48.000000'),
(70, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Crear en opcion Evaluación de Riesgos de Seguridad en Procesos de Negocio', '2023-03-25 01:09:49.000000'),
(71, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Editar en opcion Evaluación de Riesgos de Seguridad en Procesos de Negocio', '2023-03-25 01:09:49.000000'),
(72, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Eliminar en  opcion Evaluación de Riesgos de Seguridad en Procesos de Negocio', '2023-03-25 01:09:50.000000'),
(73, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Inventario y Clasificaci+on de Activos', '2023-03-25 01:09:51.000000'),
(74, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Evaluación de Riesgos SI-C', '2023-03-25 01:09:51.000000'),
(75, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Registro de Controles', '2023-03-25 01:09:52.000000'),
(76, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Crear en opcion Registro de Plan de Accion', '2023-03-25 01:09:52.000000'),
(77, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Crear en opcion Registro de Controles', '2023-03-25 01:09:53.000000'),
(78, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Crear en opcion Evaluación de Riesgos SI-C', '2023-03-25 01:09:53.000000'),
(79, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Crear en opcion Inventario y Clasificaci+on de Activos', '2023-03-25 01:09:54.000000'),
(80, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Registro de Plan de Accion', '2023-03-25 01:09:54.000000'),
(81, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Editar en opcion Registro de Plan de Accion', '2023-03-25 01:09:54.000000'),
(82, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Editar en opcion Evaluación de Riesgos SI-C', '2023-03-25 01:09:55.000000'),
(83, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Editar en opcion Inventario y Clasificaci+on de Activos', '2023-03-25 01:09:55.000000'),
(84, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Eliminar en  opcion Inventario y Clasificaci+on de Activos', '2023-03-25 01:09:56.000000'),
(85, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Eliminar en  opcion Evaluación de Riesgos SI-C', '2023-03-25 01:09:56.000000'),
(86, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Editar en opcion Registro de Controles', '2023-03-25 01:09:57.000000'),
(87, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Eliminar en  opcion Registro de Controles', '2023-03-25 01:09:57.000000'),
(88, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Eliminar en  opcion Registro de Plan de Accion', '2023-03-25 01:09:57.000000'),
(89, 'Opera 96.0.0.0', '::1', 5, 8, 'El usuario admin ah modificado los datos del usuario: testeo5, Se modifico el perfil administrador por ANALISTA SI', '2023-03-25 01:10:37.000000'),
(90, 'Chrome 111.0.0.0', '::1', 8, 0, 'El usuario: testeo5 ah realizado cambio de clave', '2023-03-25 01:10:57.000000'),
(91, 'Chrome 111.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-25 01:11:08.000000'),
(92, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-25 01:11:45.000000'),
(93, 'Chrome 111.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-25 01:17:22.000000'),
(94, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-25 01:18:12.000000'),
(95, 'Chrome 111.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-25 01:18:52.000000'),
(96, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-25 01:46:03.000000'),
(97, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-26 09:50:42.000000'),
(98, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-26 12:41:01.000000'),
(99, 'Chrome 111.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-26 12:42:30.000000'),
(100, 'Chrome 111.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-26 13:02:33.000000'),
(101, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-26 13:02:37.000000'),
(102, 'Chrome 111.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-26 14:26:47.000000'),
(103, 'Chrome 111.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-26 16:07:36.000000'),
(104, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-26 16:07:39.000000'),
(105, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-26 16:13:52.000000'),
(106, 'Opera 96.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-26 16:14:07.000000'),
(107, 'Opera 96.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-26 16:16:35.000000'),
(108, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-26 16:16:39.000000'),
(109, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-26 16:28:23.000000'),
(110, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-26 16:51:03.000000'),
(111, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-26 16:51:08.000000'),
(112, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-26 16:51:11.000000'),
(113, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-26 16:52:34.000000'),
(114, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-26 16:52:37.000000'),
(115, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-26 16:52:40.000000'),
(116, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-26 16:53:23.000000'),
(117, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-26 16:53:26.000000'),
(118, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-26 16:53:30.000000'),
(119, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-26 16:57:45.000000'),
(120, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-26 16:59:09.000000'),
(121, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-26 16:59:13.000000'),
(122, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-26 17:16:05.000000'),
(123, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-26 17:16:15.000000'),
(124, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-26 17:26:02.000000'),
(125, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-26 18:02:55.000000'),
(126, 'Opera 96.0.0.0', '::1', 5, 8, 'El usuario admin ah modificado los datos del usuario: testeo5', '2023-03-26 18:07:39.000000'),
(127, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-26 18:07:45.000000'),
(128, 'Opera 96.0.0.0', '::1', 5, 8, 'El usuario admin ah modificado los datos del usuario: testeo5', '2023-03-26 18:07:50.000000'),
(129, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-26 18:24:40.000000'),
(130, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 08:59:51.000000'),
(131, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 09:12:02.000000'),
(132, 'Opera 96.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-27 09:12:12.000000'),
(133, 'Opera 96.0.0.0', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-27 09:14:54.000000'),
(134, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 09:14:58.000000'),
(135, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 09:40:00.000000'),
(136, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 10:02:33.000000'),
(137, 'Opera 96.0.0.0', '::1', 5, 8, 'El usuario admin a Habilitado al usuario: testeo5', '2023-03-27 10:17:51.000000'),
(138, 'Opera 96.0.0.0', '::1', 5, 8, 'El usuario admin a Desabilitado al usuario: testeo5', '2023-03-27 10:18:25.000000'),
(139, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-27 10:18:30.000000'),
(140, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-27 10:18:33.000000'),
(141, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-27 10:23:29.000000'),
(142, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-27 10:39:39.000000'),
(143, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 10:39:42.000000'),
(144, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 10:39:45.000000'),
(145, 'Opera 96.0.0.0', '::1', 5, 8, 'El usuario admin ah modificado los datos del usuario: testeo5', '2023-03-27 10:42:23.000000'),
(146, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-27 10:42:26.000000'),
(147, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-27 10:42:30.000000'),
(148, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-27 10:59:58.000000'),
(149, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 11:56:14.000000'),
(150, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 11:56:17.000000'),
(151, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 11:58:37.000000'),
(152, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 11:58:39.000000'),
(153, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 12:08:39.000000'),
(154, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 12:08:42.000000'),
(155, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 12:16:56.000000'),
(156, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 12:17:04.000000'),
(157, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 12:56:55.000000'),
(158, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 12:56:58.000000'),
(159, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 13:12:59.000000'),
(160, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 13:13:47.000000'),
(161, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 13:41:20.000000'),
(162, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 16:40:29.000000'),
(163, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-27 16:43:10.000000'),
(164, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 16:49:18.000000'),
(165, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 16:49:21.000000'),
(166, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 17:06:11.000000'),
(167, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 17:06:14.000000'),
(168, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 17:17:05.000000'),
(169, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 17:17:11.000000'),
(170, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 17:18:06.000000'),
(171, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 17:18:09.000000'),
(172, 'Edge 111.0.1661.54', '::1', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-27 17:19:59.000000'),
(173, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 17:34:41.000000'),
(174, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 17:34:44.000000'),
(175, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 17:43:23.000000'),
(176, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 17:43:27.000000'),
(177, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 17:43:33.000000'),
(178, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 17:43:36.000000'),
(179, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 17:54:31.000000'),
(180, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 17:54:35.000000'),
(181, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 17:56:20.000000'),
(182, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 17:56:23.000000'),
(183, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 18:25:29.000000'),
(184, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 18:25:32.000000'),
(185, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 18:25:36.000000'),
(186, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 18:25:39.000000'),
(187, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 18:32:01.000000'),
(188, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 18:32:04.000000'),
(189, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 18:32:57.000000'),
(190, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 18:32:59.000000'),
(191, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 18:33:31.000000'),
(192, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 18:33:34.000000'),
(193, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 18:34:17.000000'),
(194, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-27 18:34:19.000000'),
(195, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-27 19:47:41.000000'),
(196, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 00:37:18.000000'),
(197, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 03:08:37.000000'),
(198, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 03:11:12.000000'),
(199, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 03:11:54.000000'),
(200, 'local', '127.0.0.1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 14:46:06.000000'),
(201, 'local', '127.0.0.1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 15:05:54.000000'),
(202, 'local', '127.0.0.1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 15:31:29.000000'),
(203, 'local', '127.0.0.1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 16:33:50.000000'),
(204, 'local', '127.0.0.1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 18:02:43.000000'),
(205, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 18:05:32.000000'),
(206, 'Chrome 111.0.0.0', '200.37.185.162', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-28 18:07:17.000000'),
(207, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 18:13:39.000000'),
(208, 'Chrome 111.0.0.0', '200.37.185.162', 8, 0, 'El usuario: testeo5 a cerrado sesión correstamente desde el sistema', '2023-03-28 18:15:53.000000'),
(209, 'Chrome 111.0.0.0', '200.37.185.162', 8, 0, 'El usuario: testeo5 a iniciado sesión', '2023-03-28 18:17:06.000000'),
(210, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 18:17:31.000000'),
(211, 'Edge 111.0.1661.54', '179.6.46.229', 5, 3, 'El usuario admin a Desabilitado al usuario: testeo1', '2023-03-28 18:17:44.000000'),
(212, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 18:36:00.000000'),
(213, 'Chrome 111.0.0.0', '190.43.130.176', 6, 0, 'El usuario: testeo4 ah realizado cambio de clave', '2023-03-28 18:38:27.000000'),
(214, 'Chrome 111.0.0.0', '190.43.130.176', 6, 0, 'El usuario: testeo4 a iniciado sesión', '2023-03-28 18:39:35.000000'),
(215, 'Chrome 111.0.0.0', '181.67.43.93', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 18:40:37.000000'),
(216, 'Chrome 111.0.0.0', '190.43.130.176', 6, 0, 'El usuario: testeo4 a cerrado sesión correstamente desde el sistema', '2023-03-28 18:41:00.000000'),
(217, 'Chrome 111.0.0.0', '181.67.43.93', 5, 9, 'El usuario admin ah creado el usuario: Admin1 y se le asignó el perfil : administrador', '2023-03-28 18:45:50.000000'),
(218, 'Chrome 111.0.0.0', '181.67.43.93', 5, 10, 'El usuario admin ah creado el usuario: Admin2 y se le asignó el perfil : administrador', '2023-03-28 18:48:11.000000'),
(219, 'Chrome 111.0.0.0', '181.67.43.93', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 18:54:11.000000'),
(220, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 18:56:00.000000'),
(221, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 18:56:06.000000'),
(222, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 23:08:09.000000'),
(223, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 23:08:46.000000'),
(224, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 23:35:00.000000'),
(225, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 23:35:09.000000'),
(226, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 23:35:22.000000'),
(227, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 23:35:25.000000'),
(228, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 23:35:45.000000'),
(229, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 23:55:07.000000'),
(230, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 00:26:18.000000'),
(231, 'Edge 111.0.1661.54', '179.6.46.229', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-29 00:54:09.000000'),
(232, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 00:54:11.000000'),
(233, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 00:54:17.000000'),
(234, 'Edge 111.0.1661.54', '179.6.46.229', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-29 00:55:07.000000'),
(235, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 00:55:11.000000'),
(236, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 00:55:15.000000'),
(237, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 02:08:18.000000'),
(238, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 02:08:24.000000'),
(239, 'Edge 111.0.1661.54', '179.6.46.229', 5, 3, 'El usuario admin ah modificado los datos del usuario: testeo1', '2023-03-29 02:23:10.000000'),
(240, 'Edge 111.0.1661.54', '179.6.46.229', 5, 3, 'El usuario: admin ah realizado cambio de clave al usuario: 3', '2023-03-29 02:23:25.000000'),
(241, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 02:23:30.000000'),
(242, 'Edge 111.0.1661.54', '179.6.46.229', 3, 0, 'El usuario: testeo1 a iniciado sesión', '2023-03-29 02:23:40.000000'),
(243, 'Edge 111.0.1661.54', '179.6.46.229', 3, 0, 'El usuario: testeo1 a cerrado sesión correstamente desde el sistema', '2023-03-29 02:23:45.000000'),
(244, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 02:45:40.000000'),
(245, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Accesos', '2023-03-29 02:45:48.000000'),
(246, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Accesos', '2023-03-29 02:45:49.000000'),
(247, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Empresa', '2023-03-29 02:45:52.000000'),
(248, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Áreas', '2023-03-29 02:45:53.000000'),
(249, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Unidades', '2023-03-29 02:45:54.000000'),
(250, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario admin Activo al perfil:ANALISTA SI : Ver en opcion Macroprocesos', '2023-03-29 02:45:54.000000'),
(251, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario admin Desactivo al perfil:ANALISTA SI : Ver en opcion Empresa', '2023-03-29 02:45:55.000000'),
(252, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 02:45:59.000000'),
(253, 'Chrome 111.0.0.0', '181.67.43.93', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 08:36:26.000000'),
(254, 'Chrome 111.0.0.0', '181.67.43.93', 5, 11, 'El usuario admin ah creado el usuario: Admin3 y se le asignó el perfil : administrador', '2023-03-29 08:39:11.000000'),
(255, 'Chrome 111.0.0.0', '181.67.43.93', 5, 12, 'El usuario admin ah creado el usuario: Admin4 y se le asignó el perfil : administrador', '2023-03-29 08:41:31.000000'),
(256, 'Chrome 111.0.0.0', '181.67.43.93', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 08:47:11.000000'),
(257, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 09:33:38.000000'),
(258, 'Edge 111.0.1661.54', '179.6.46.229', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-03-29 09:33:49.000000'),
(259, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 10:04:41.000000'),
(260, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 10:33:57.000000'),
(261, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 10:34:11.000000'),
(262, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 10:44:39.000000'),
(263, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 ah realizado cambio de clave', '2023-03-29 10:54:50.000000'),
(264, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-29 10:56:29.000000'),
(265, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-29 11:03:53.000000'),
(266, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-29 11:04:08.000000'),
(267, 'Edge 111.0.1661.54', '179.6.46.229', 5, 3, 'El usuario admin ah modificado los datos del usuario: testeo1, Se modifico el perfil administrador por ANALISTA SI', '2023-03-29 11:06:16.000000'),
(268, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 11:06:20.000000'),
(269, 'Edge 111.0.1661.54', '179.6.46.229', 3, 0, 'El usuario: testeo1 a iniciado sesión', '2023-03-29 11:06:31.000000'),
(270, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 ah realizado cambio de clave', '2023-03-29 11:08:38.000000'),
(271, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-29 11:10:22.000000'),
(272, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-29 11:13:53.000000'),
(273, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-29 11:14:02.000000'),
(274, 'Edge 111.0.1661.54', '179.6.46.229', 3, 0, 'El usuario: testeo1 a cerrado sesión correstamente desde el sistema', '2023-03-29 11:26:27.000000'),
(275, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 11:26:33.000000'),
(276, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-29 11:34:50.000000'),
(277, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 11:36:26.000000'),
(278, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 11:46:38.000000'),
(279, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 11:49:00.000000'),
(280, 'Edge 111.0.1661.54', '179.6.46.229', 3, 0, 'El usuario: testeo1 a iniciado sesión', '2023-03-29 11:49:05.000000'),
(281, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-29 11:50:25.000000'),
(282, 'Edge 111.0.1661.54', '179.6.46.229', 3, 0, 'El usuario: testeo1 a cerrado sesión correstamente desde el sistema', '2023-03-29 11:58:17.000000'),
(283, 'Edge 111.0.1661.54', '179.6.46.229', 3, 0, 'El usuario: testeo1 a iniciado sesión', '2023-03-29 12:13:48.000000'),
(284, 'Edge 111.0.1661.54', '179.6.46.229', 3, 0, 'El usuario: testeo1 a cerrado sesión correstamente desde el sistema', '2023-03-29 12:22:51.000000'),
(285, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 12:22:56.000000'),
(286, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 12:26:25.000000'),
(287, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-29 12:28:24.000000'),
(288, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-29 12:36:25.000000'),
(289, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-29 12:42:11.000000'),
(290, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-29 12:53:29.000000'),
(291, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario Admin3 ah creado el usuario: UsuarioPrueba y se le asignó el perfil : administrador', '2023-03-29 12:57:54.000000'),
(292, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-29 12:58:37.000000'),
(293, 'Chrome 111.0.0.0', '190.43.161.79', 13, 0, 'El usuario: UsuarioPrueba ah realizado cambio de clave', '2023-03-29 12:59:50.000000'),
(294, 'Chrome 111.0.0.0', '190.43.161.79', 13, 0, 'El usuario: UsuarioPrueba a iniciado sesión', '2023-03-29 13:00:48.000000'),
(295, 'Chrome 111.0.0.0', '190.43.161.79', 13, 0, 'El usuario: UsuarioPrueba a cerrado sesión correstamente desde el sistema', '2023-03-29 13:00:59.000000'),
(296, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-29 13:01:17.000000'),
(297, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-29 13:05:38.000000'),
(298, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 13:14:43.000000'),
(299, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 13:14:53.000000'),
(300, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-29 13:20:27.000000'),
(301, 'Chrome 111.0.0.0', '45.195.93.51', 3, 0, 'El usuario: testeo1 a iniciado sesión', '2023-03-29 13:35:17.000000'),
(302, 'Chrome 111.0.0.0', '45.195.93.51', 3, 0, 'El usuario: testeo1 a cerrado sesión correstamente desde el sistema', '2023-03-29 13:36:05.000000'),
(303, 'Chrome 111.0.0.0', '45.195.93.51', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 13:36:42.000000'),
(304, 'Chrome 111.0.0.0', '45.195.93.51', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 13:36:57.000000'),
(305, 'Chrome 111.0.0.0', '45.195.93.51', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 13:38:38.000000'),
(306, 'Chrome 111.0.0.0', '190.43.161.79', 11, 6, 'El usuario Admin3 ah modificado los datos del usuario: testeo4', '2023-03-29 13:48:38.000000'),
(307, 'Chrome 111.0.0.0', '190.43.161.79', 11, 3, 'El usuario Admin3 ah modificado los datos del usuario: testeo1', '2023-03-29 13:49:36.000000'),
(308, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario Admin3 ah modificado los datos del usuario: UsuarioPrueba', '2023-03-29 14:03:13.000000'),
(309, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario Admin3 ah modificado los datos del usuario: UsuarioPrueba, Se modifico el perfil administrador por ANALISTA SI', '2023-03-29 14:04:44.000000'),
(310, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario Admin3 ah modificado los datos del usuario: UsuarioPrueba, Se modifico el perfil ANALISTA SI por administrador', '2023-03-29 14:05:19.000000'),
(311, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario Admin3 a Desabilitado al usuario: UsuarioPrueba', '2023-03-29 14:05:26.000000'),
(312, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario Admin3 ah creado el perfil : PRUEBA', '2023-03-29 14:09:01.000000'),
(313, 'Chrome 111.0.0.0', '45.195.93.51', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 14:11:04.000000'),
(314, 'Chrome 111.0.0.0', '45.195.93.51', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 14:11:13.000000'),
(315, 'Chrome 111.0.0.0', '45.195.93.51', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 14:22:23.000000'),
(316, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-29 14:36:18.000000'),
(317, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-29 15:30:03.000000'),
(318, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-29 16:10:13.000000'),
(319, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-29 16:21:44.000000'),
(320, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-29 17:56:51.000000'),
(321, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-29 17:57:15.000000'),
(322, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 18:08:07.000000'),
(323, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 18:08:37.000000'),
(324, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-29 18:16:13.000000'),
(325, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-29 18:18:38.000000'),
(326, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-30 09:14:15.000000'),
(327, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-30 09:32:31.000000'),
(328, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 10:02:20.000000'),
(329, 'Edge 111.0.1661.54', '179.6.46.229', 5, 10, 'El usuario admin ah modificado los datos del usuario: Admin2', '2023-03-30 10:05:32.000000'),
(330, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-30 10:06:51.000000'),
(331, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-30 10:15:42.000000'),
(332, 'Edge 111.0.1661.54', '179.6.46.229', 5, 3, 'El usuario admin ah modificado los datos del usuario: testeo1', '2023-03-30 10:26:10.000000'),
(333, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-30 10:41:24.000000'),
(334, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-30 10:41:50.000000'),
(335, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-30 10:55:46.000000'),
(336, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-30 11:21:08.000000'),
(337, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-30 11:25:54.000000'),
(338, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-30 13:22:23.000000'),
(339, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-30 14:21:01.000000'),
(340, 'Chrome 111.0.0.0', '38.25.4.15', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 14:38:14.000000'),
(341, 'Chrome 111.0.0.0', '38.25.4.15', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-30 14:38:51.000000'),
(342, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 ah realizado cambio de clave', '2023-03-30 17:12:31.000000'),
(343, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-03-30 17:12:49.000000'),
(344, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-30 17:13:08.000000'),
(345, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-30 17:14:46.000000'),
(346, 'Chrome 111.0.0.0', '200.37.185.162', 10, 3, 'El usuario Admin2 ah modificado los datos del usuario: testeo1', '2023-03-30 17:17:38.000000'),
(347, 'Chrome 111.0.0.0', '200.37.185.162', 10, 3, 'El usuario Admin2 ah modificado los datos del usuario: testeo1', '2023-03-30 17:17:47.000000'),
(348, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-30 18:00:50.000000'),
(349, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 02:32:48.000000'),
(350, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario admin ah creado el perfil : PRUEBAA', '2023-03-31 02:51:40.000000'),
(351, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBAA', '2023-03-31 02:59:11.000000'),
(352, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 03:04:01.000000'),
(353, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 03:07:31.000000'),
(354, 'Edge 111.0.1661.54', '179.6.46.229', 5, 4, 'El usuario admin ah modificado los datos del usuario: testeo2', '2023-03-31 03:07:42.000000'),
(355, 'Edge 111.0.1661.54', '179.6.46.229', 5, 4, 'El usuario admin ah modificado los datos del usuario: testeo2', '2023-03-31 03:07:51.000000'),
(356, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 03:07:56.000000'),
(357, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 03:08:02.000000'),
(358, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 03:16:58.000000'),
(359, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 03:19:24.000000'),
(360, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 03:19:27.000000'),
(361, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 03:19:44.000000'),
(362, 'Chrome 111.0.0.0', '181.65.19.157', 5, 0, 'El usuario: Admin a iniciado sesión', '2023-03-31 07:12:09.000000'),
(363, 'Chrome 111.0.0.0', '181.65.19.157', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 07:14:24.000000'),
(364, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 08:29:13.000000'),
(365, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 08:44:07.000000'),
(366, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-31 10:28:45.000000'),
(367, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-31 10:29:28.000000'),
(368, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-31 10:30:54.000000'),
(369, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-31 10:31:12.000000'),
(370, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-31 11:09:21.000000'),
(371, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-31 11:13:34.000000'),
(372, 'Chrome 111.0.0.0', '38.25.16.217', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-03-31 12:39:46.000000'),
(373, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-31 13:47:57.000000'),
(374, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-31 13:48:23.000000'),
(375, 'Chrome 111.0.0.0', '38.25.16.217', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-03-31 13:51:31.000000'),
(376, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-03-31 17:08:55.000000'),
(377, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-03-31 17:15:48.000000');
INSERT INTO `log_acciones` (`id`, `terminal`, `ip_addres`, `u_ejecutor`, `u_afectado`, `accion`, `fecha`) VALUES
(378, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-03-31 19:25:13.000000'),
(379, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-03-31 22:07:17.000000'),
(380, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 02:40:11.000000'),
(381, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 03:34:40.000000'),
(382, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 03:39:48.000000'),
(383, 'Edge 111.0.1661.54', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 03:42:51.000000'),
(384, 'Chrome 111.0.0.0', '181.66.151.131', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-01 08:20:33.000000'),
(385, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 12:41:54.000000'),
(386, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 12:42:26.000000'),
(387, 'Chrome 111.0.0.0', '38.25.16.217', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-01 17:11:33.000000'),
(388, 'Chrome 111.0.0.0', '38.25.16.217', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-01 17:45:32.000000'),
(389, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 22:02:14.000000'),
(390, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 22:03:27.000000'),
(391, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 22:03:49.000000'),
(392, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 22:04:13.000000'),
(393, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 22:11:59.000000'),
(394, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 22:27:26.000000'),
(395, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 22:27:38.000000'),
(396, 'Edge 111.0.1661.62', '179.6.46.229', 5, 4, 'El usuario admin a Desabilitado al usuario: testeo2', '2023-04-02 22:29:40.000000'),
(397, 'Edge 111.0.1661.62', '179.6.46.229', 5, 4, 'El usuario: admin ah realizado cambio de clave al usuario: 4', '2023-04-02 22:29:54.000000'),
(398, 'Opera 96.0.0.0', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-02 22:30:09.000000'),
(399, 'Opera 96.0.0.0', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-02 22:30:23.000000'),
(400, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 22:30:56.000000'),
(401, 'Chrome 111.0.0.0', '38.25.4.15', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-03 01:40:29.000000'),
(402, 'Chrome 111.0.0.0', '38.25.4.15', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-03 01:45:28.000000'),
(403, 'Chrome 111.0.0.0', '190.239.69.21', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-03 09:20:14.000000'),
(404, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-03 10:33:34.000000'),
(405, 'Edge 111.0.1661.62', '179.6.46.229', 4, 4, 'El usuario testeo2 ah modificado los datos del usuario: testeo2', '2023-04-03 10:33:48.000000'),
(406, 'Edge 111.0.1661.62', '179.6.46.229', 4, 3, 'El usuario testeo2 ah modificado los datos del usuario: testeo1', '2023-04-03 10:34:14.000000'),
(407, 'Opera 96.0.0.0', '181.64.231.162', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-03 10:35:10.000000'),
(408, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-03 11:03:58.000000'),
(409, 'Opera 96.0.0.0', '181.64.231.162', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-03 11:16:37.000000'),
(410, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-03 11:20:51.000000'),
(411, 'Chrome 111.0.0.0', '190.239.69.21', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-03 11:37:58.000000'),
(412, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-03 11:53:36.000000'),
(413, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-03 11:53:53.000000'),
(414, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-03 11:54:17.000000'),
(415, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-03 11:54:22.000000'),
(416, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-03 11:54:25.000000'),
(417, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-03 11:55:49.000000'),
(418, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario Admin4 Activo al perfil:ANALISTA SI : Ver en opcion Usuarios', '2023-04-03 11:57:13.000000'),
(419, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario Admin4 Desactivo al perfil:ANALISTA SI : Ver en opcion Usuarios', '2023-04-03 11:57:14.000000'),
(420, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario Admin4 Desactivo al perfil:administrador : Crear en opcion Perfiles', '2023-04-03 11:57:40.000000'),
(421, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario Admin4 Activo al perfil:administrador : Crear en opcion Perfiles', '2023-04-03 11:57:40.000000'),
(422, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario Admin4 Desactivo al perfil:administrador : Crear en opcion Perfiles', '2023-04-03 11:57:41.000000'),
(423, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario Admin4 Activo al perfil:administrador : Crear en opcion Perfiles', '2023-04-03 11:57:41.000000'),
(424, 'Chrome 111.0.0.0', '200.121.6.171', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-03 12:38:38.000000'),
(425, 'Chrome 111.0.0.0', '200.121.6.171', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-03 12:38:43.000000'),
(426, 'Chrome 111.0.0.0', '200.121.6.171', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-03 12:38:54.000000'),
(427, 'Chrome 111.0.0.0', '200.121.6.171', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-03 12:39:11.000000'),
(428, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-03 12:55:00.000000'),
(429, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 13:40:28.000000'),
(430, 'Chrome 111.0.0.0', '190.43.161.79', 11, 11, 'El usuario Admin3 ah modificado los datos del usuario: Admin3', '2023-04-03 13:41:51.000000'),
(431, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-03 13:42:11.000000'),
(432, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 13:42:16.000000'),
(433, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-03 14:06:46.000000'),
(434, 'Chrome 111.0.0.0', '200.37.185.162', 12, 12, 'El usuario Admin4 ah modificado los datos del usuario: Admin4', '2023-04-03 14:07:46.000000'),
(435, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-03 14:08:55.000000'),
(436, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-03 14:08:58.000000'),
(437, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-03 14:33:12.000000'),
(438, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-03 14:33:12.000000'),
(439, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 16:05:26.000000'),
(440, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-03 16:07:07.000000'),
(441, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 16:07:49.000000'),
(442, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-03 16:11:21.000000'),
(443, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 16:11:28.000000'),
(444, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 ah realizado cambio de clave', '2023-04-03 16:13:06.000000'),
(445, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-03 16:16:05.000000'),
(446, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 ah realizado cambio de clave', '2023-04-03 16:16:26.000000'),
(447, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-03 16:18:35.000000'),
(448, 'Opera 97.0.0.0', '181.64.231.162', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-03 16:20:46.000000'),
(449, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 ah realizado cambio de clave', '2023-04-03 16:25:22.000000'),
(450, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-03 17:00:38.000000'),
(451, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-03 17:14:20.000000'),
(452, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-03 17:14:45.000000'),
(453, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-03 17:15:33.000000'),
(454, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-03 17:18:29.000000'),
(455, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-03 17:19:43.000000'),
(456, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-03 17:23:39.000000'),
(457, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 17:23:40.000000'),
(458, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-03 17:31:57.000000'),
(459, 'Opera 97.0.0.0', '181.64.231.162', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-03 17:37:18.000000'),
(460, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-03 17:41:08.000000'),
(461, 'Edge 111.0.1661.62', '179.6.46.229', 4, 4, 'El usuario testeo2 ah modificado los datos del usuario: testeo2', '2023-04-03 17:41:32.000000'),
(462, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-03 17:41:35.000000'),
(463, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-03 17:41:39.000000'),
(464, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario: Admin3 ah realizado cambio de clave al usuario: 13', '2023-04-03 17:47:33.000000'),
(465, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-03 17:47:40.000000'),
(466, 'Chrome 111.0.0.0', '190.43.161.79', 13, 0, 'El usuario: UsuarioPrueba a iniciado sesión', '2023-04-03 17:47:59.000000'),
(467, 'Chrome 111.0.0.0', '190.43.161.79', 13, 0, 'El usuario: UsuarioPrueba a cerrado sesión correstamente desde el sistema', '2023-04-03 17:48:11.000000'),
(468, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 17:49:57.000000'),
(469, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-03 17:52:31.000000'),
(470, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 17:52:49.000000'),
(471, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-03 17:53:09.000000'),
(472, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario Admin3 a Desabilitado al usuario: UsuarioPrueba', '2023-04-03 17:53:11.000000'),
(473, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-03 17:53:14.000000'),
(474, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-03 17:54:48.000000'),
(475, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-03 17:55:52.000000'),
(476, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 18:02:54.000000'),
(477, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-03 18:23:39.000000'),
(478, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-03 18:23:45.000000'),
(479, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario Admin3 ah modificado los datos del usuario: UsuarioPrueba', '2023-04-03 18:26:59.000000'),
(480, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario Admin3 ah modificado los datos del usuario: UsuarioPrueba', '2023-04-03 18:27:07.000000'),
(481, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario Admin3 ah eliminado el perfil : PRUEBA PERFIL', '2023-04-03 18:29:09.000000'),
(482, 'Chrome 111.0.0.0', '190.237.145.243', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-03 18:41:15.000000'),
(483, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-03 18:42:05.000000'),
(484, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-03 18:42:27.000000'),
(485, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-03 19:01:36.000000'),
(486, 'Opera 97.0.0.0', '181.64.231.162', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-03 19:06:15.000000'),
(487, 'Chrome 111.0.0.0', '190.237.145.243', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-03 19:15:08.000000'),
(488, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 01:44:17.000000'),
(489, 'Edge 111.0.1661.62', '179.6.46.229', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-04-04 02:36:51.000000'),
(490, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 02:46:27.000000'),
(491, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-04 08:57:59.000000'),
(492, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-04 09:13:59.000000'),
(493, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-04 09:15:49.000000'),
(494, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 09:29:45.000000'),
(495, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 10:25:10.000000'),
(496, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-04 10:49:31.000000'),
(497, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-04 10:55:25.000000'),
(498, 'Chrome 111.0.0.0', '200.37.185.162', 11, 10, 'El usuario Admin3 ah modificado los datos del usuario: Admin2', '2023-04-04 10:56:09.000000'),
(499, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 10:57:26.000000'),
(500, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-04 11:00:42.000000'),
(501, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 11:03:43.000000'),
(502, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 11:04:32.000000'),
(503, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 11:20:54.000000'),
(504, 'Chrome 111.0.0.0', '200.37.185.162', 10, 10, 'El usuario Admin2 ah modificado los datos del usuario: Admin2', '2023-04-04 11:53:06.000000'),
(505, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 11:58:40.000000'),
(506, 'Chrome 111.0.0.0', '200.37.185.162', 11, 10, 'El usuario Admin3 ah modificado los datos del usuario: Admin2', '2023-04-04 12:00:25.000000'),
(507, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario Admin3 ah creado el perfil : PRUEBA', '2023-04-04 12:02:58.000000'),
(508, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario Admin3 ah eliminado el perfil : PRUEBA DOS', '2023-04-04 12:03:37.000000'),
(509, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 12:13:27.000000'),
(510, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 12:19:02.000000'),
(511, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-04 12:20:02.000000'),
(512, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 12:20:16.000000'),
(513, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-04 12:20:27.000000'),
(514, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 12:20:34.000000'),
(515, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-04 12:20:48.000000'),
(516, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 12:21:04.000000'),
(517, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-04 12:21:34.000000'),
(518, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 12:22:10.000000'),
(519, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 12:23:58.000000'),
(520, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 12:24:20.000000'),
(521, 'Chrome 111.0.0.0', '181.65.25.189', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 12:27:53.000000'),
(522, 'Chrome 111.0.0.0', '181.65.25.189', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 12:29:11.000000'),
(523, 'Chrome 111.0.0.0', '181.65.25.189', 5, 0, 'El usuario: Admin a iniciado sesión', '2023-04-04 12:29:42.000000'),
(524, 'Chrome 111.0.0.0', '181.65.25.189', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 12:48:54.000000'),
(525, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-04 12:50:52.000000'),
(526, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 12:51:13.000000'),
(527, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 12:51:32.000000'),
(528, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 13:08:15.000000'),
(529, 'Edge 111.0.1661.62', '179.6.46.229', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-04-04 13:08:34.000000'),
(530, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 13:08:42.000000'),
(531, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 13:08:48.000000'),
(532, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 13:09:07.000000'),
(533, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-04 13:18:31.000000'),
(534, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-04 13:18:42.000000'),
(535, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-04 14:37:34.000000'),
(536, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 14:45:42.000000'),
(537, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 15:37:51.000000'),
(538, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-04 15:38:31.000000'),
(539, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 15:38:38.000000'),
(540, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-04 15:40:54.000000'),
(541, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 15:41:44.000000'),
(542, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-04 15:41:59.000000'),
(543, 'Chrome 111.0.0.0', '181.65.25.189', 5, 0, 'El usuario: Admin a iniciado sesión', '2023-04-04 15:47:13.000000'),
(544, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 15:48:48.000000'),
(545, 'Chrome 111.0.0.0', '181.65.25.189', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 15:50:37.000000'),
(546, 'Chrome 111.0.0.0', '200.37.185.162', 5, 0, 'El usuario: Admin a iniciado sesión', '2023-04-04 15:52:11.000000'),
(547, 'Chrome 111.0.0.0', '200.37.185.162', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 15:52:19.000000'),
(548, 'Chrome 111.0.0.0', '200.37.185.162', 5, 0, 'El usuario: Admin a iniciado sesión', '2023-04-04 15:52:27.000000'),
(549, 'Chrome 111.0.0.0', '200.37.185.162', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 15:52:37.000000'),
(550, 'Chrome 111.0.0.0', '200.37.185.162', 5, 0, 'El usuario: Admin a iniciado sesión', '2023-04-04 15:52:52.000000'),
(551, 'Chrome 111.0.0.0', '200.37.185.162', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 15:53:29.000000'),
(552, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 16:29:21.000000'),
(553, 'Chrome 111.0.0.0', '45.195.93.63', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 16:32:46.000000'),
(554, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 16:42:01.000000'),
(555, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-04 16:42:15.000000'),
(556, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-04 16:42:33.000000'),
(557, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 16:43:32.000000'),
(558, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-04 16:43:38.000000'),
(559, 'Chrome 111.0.0.0', '45.195.93.63', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 16:44:38.000000'),
(560, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 16:45:28.000000'),
(561, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 16:46:25.000000'),
(562, 'Edge 111.0.1661.62', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 16:47:14.000000'),
(563, 'Edge 111.0.1661.62', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-04 16:48:04.000000'),
(564, 'Edge 111.0.1661.62', '45.195.93.63', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 16:48:25.000000'),
(565, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 16:48:30.000000'),
(566, 'Edge 111.0.1661.62', '45.195.93.63', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 16:48:36.000000'),
(567, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-04 16:48:45.000000'),
(568, 'Chrome 111.0.0.0', '45.195.93.63', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 16:48:48.000000'),
(569, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-04 16:48:52.000000'),
(570, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 16:49:11.000000'),
(571, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-04 16:49:12.000000'),
(572, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-04 16:49:21.000000'),
(573, 'Edge 111.0.1661.62', '200.37.185.162', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-04 16:49:57.000000'),
(574, 'Chrome 111.0.0.0', '200.37.185.162', 10, 10, 'El usuario Admin2 ah modificado los datos del usuario: Admin2', '2023-04-04 16:55:47.000000'),
(575, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:administrador : Ver en opcion Categoría de Vulnerabilidad', '2023-04-04 16:56:16.000000'),
(576, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:administrador : Ver en opcion Categoría de Vulnerabilidad', '2023-04-04 16:56:17.000000'),
(577, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:administrador : Ver en opcion Empresa', '2023-04-04 16:56:58.000000'),
(578, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:administrador : Ver en opcion Empresa', '2023-04-04 16:56:58.000000'),
(579, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:administrador : Crear en opcion Empresa', '2023-04-04 16:56:59.000000'),
(580, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:administrador : Crear en opcion Empresa', '2023-04-04 16:57:00.000000'),
(581, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:administrador : Editar en opcion Empresa', '2023-04-04 16:57:00.000000'),
(582, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:administrador : Editar en opcion Empresa', '2023-04-04 16:57:01.000000'),
(583, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Empresa', '2023-04-04 16:57:27.000000'),
(584, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Áreas', '2023-04-04 16:57:28.000000'),
(585, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Unidades', '2023-04-04 16:57:29.000000'),
(586, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Macroprocesos', '2023-04-04 16:57:30.000000'),
(587, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Procesos', '2023-04-04 16:57:31.000000'),
(588, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Posición/Puesto', '2023-04-04 16:57:32.000000'),
(589, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Aspecto de Seguridad', '2023-04-04 16:57:32.000000'),
(590, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Valor de Activo', '2023-04-04 16:57:35.000000'),
(591, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Valoración de Activo', '2023-04-04 16:57:36.000000'),
(592, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Tipo de Activo', '2023-04-04 16:57:36.000000'),
(593, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Categoría de Activo', '2023-04-04 16:57:37.000000'),
(594, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Ubicación de Activo', '2023-04-04 16:57:37.000000'),
(595, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Clasificación de Información', '2023-04-04 16:57:38.000000'),
(596, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Activos', '2023-04-04 16:57:40.000000'),
(597, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Activos', '2023-04-04 16:57:42.000000'),
(598, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Activos', '2023-04-04 16:57:42.000000'),
(599, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Parametrización', '2023-04-04 16:57:44.000000'),
(600, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Accesos', '2023-04-04 16:57:46.000000'),
(601, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Usuarios', '2023-04-04 16:57:47.000000'),
(602, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Config. Contraseña', '2023-04-04 16:57:47.000000'),
(603, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Perfiles', '2023-04-04 16:57:47.000000'),
(604, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Riesgos SI-C', '2023-04-04 16:57:49.000000'),
(605, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Tipo de Riesgo', '2023-04-04 16:57:50.000000'),
(606, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Probabilidad de Riesgo', '2023-04-04 16:57:50.000000'),
(607, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Impacto de Riesgo', '2023-04-04 16:57:51.000000'),
(608, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Nivel de Riesgo', '2023-04-04 16:57:52.000000'),
(609, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Valoracion de Riesgo', '2023-04-04 16:57:52.000000'),
(610, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Tipo de Amenaza', '2023-04-04 16:57:53.000000'),
(611, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Descripcion de Amenaza', '2023-04-04 16:57:53.000000'),
(612, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Vulnerabilidad', '2023-04-04 16:57:54.000000'),
(613, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Categoría de Vulnerabilidad', '2023-04-04 16:57:55.000000'),
(614, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Descripcion de Vulnerabilidad', '2023-04-04 16:57:55.000000'),
(615, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Controles', '2023-04-04 16:57:56.000000'),
(616, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Cobertura', '2023-04-04 16:57:57.000000'),
(617, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Evaluación de Control', '2023-04-04 16:57:57.000000'),
(618, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Aplicación de Probabilidad', '2023-04-04 16:57:58.000000'),
(619, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Aplicacón de Impacto', '2023-04-04 16:57:58.000000'),
(620, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Estado', '2023-04-04 16:57:59.000000'),
(621, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Prioridad', '2023-04-04 16:58:00.000000'),
(622, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Alerta de Seguimiento', '2023-04-04 16:58:01.000000'),
(623, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Plan de Accion', '2023-04-04 16:58:04.000000'),
(624, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Accesos', '2023-04-04 16:58:38.000000'),
(625, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Usuarios', '2023-04-04 16:58:38.000000'),
(626, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Config. Contraseña', '2023-04-04 16:58:39.000000'),
(627, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Perfiles', '2023-04-04 16:58:39.000000'),
(628, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Parametrización', '2023-04-04 16:58:39.000000'),
(629, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Activos', '2023-04-04 16:58:41.000000'),
(630, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Empresa', '2023-04-04 16:58:42.000000'),
(631, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Aspecto de Seguridad', '2023-04-04 16:58:44.000000'),
(632, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Valor de Activo', '2023-04-04 16:58:45.000000'),
(633, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Valoración de Activo', '2023-04-04 16:58:45.000000'),
(634, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Tipo de Activo', '2023-04-04 16:58:45.000000'),
(635, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Categoría de Activo', '2023-04-04 16:58:47.000000'),
(636, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Ubicación de Activo', '2023-04-04 16:58:48.000000'),
(637, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Clasificación de Información', '2023-04-04 16:58:48.000000'),
(638, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Riesgos SI-C', '2023-04-04 16:58:49.000000'),
(639, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Impacto de Riesgo', '2023-04-04 16:58:50.000000'),
(640, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Probabilidad de Riesgo', '2023-04-04 16:58:51.000000'),
(641, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Tipo de Riesgo', '2023-04-04 16:58:51.000000'),
(642, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Nivel de Riesgo', '2023-04-04 16:58:53.000000'),
(643, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Valoracion de Riesgo', '2023-04-04 16:58:53.000000'),
(644, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Tipo de Amenaza', '2023-04-04 16:58:53.000000'),
(645, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Descripcion de Amenaza', '2023-04-04 16:58:54.000000'),
(646, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Vulnerabilidad', '2023-04-04 16:58:55.000000'),
(647, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Categoría de Vulnerabilidad', '2023-04-04 16:58:55.000000'),
(648, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Descripcion de Vulnerabilidad', '2023-04-04 16:58:55.000000'),
(649, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Controles', '2023-04-04 16:58:57.000000'),
(650, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Cobertura', '2023-04-04 16:58:58.000000'),
(651, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Activo al perfil:ANALISTA SI : Crear en opcion Cobertura', '2023-04-04 16:58:58.000000'),
(652, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Evaluación de Control', '2023-04-04 16:58:59.000000'),
(653, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Cobertura', '2023-04-04 16:58:59.000000'),
(654, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Aplicación de Probabilidad', '2023-04-04 16:59:00.000000'),
(655, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Aplicacón de Impacto', '2023-04-04 16:59:00.000000'),
(656, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Plan de Accion', '2023-04-04 16:59:01.000000'),
(657, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Estado', '2023-04-04 16:59:02.000000'),
(658, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Prioridad', '2023-04-04 16:59:02.000000'),
(659, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Alerta de Seguimiento', '2023-04-04 16:59:03.000000'),
(660, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Evaluación de Riesgos de Seguridad en Procesos de Negocio', '2023-04-04 16:59:04.000000'),
(661, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Inventario y Clasificaci+on de Activos', '2023-04-04 16:59:04.000000'),
(662, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Evaluación de Riesgos SI-C', '2023-04-04 16:59:05.000000'),
(663, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Registro de Controles', '2023-04-04 16:59:05.000000'),
(664, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario Admin2 Desactivo al perfil:ANALISTA SI : Crear en opcion Registro de Plan de Accion', '2023-04-04 16:59:06.000000'),
(665, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-04 17:06:16.000000'),
(666, 'Edge 111.0.1661.62', '179.6.46.229', 4, 4, 'El usuario testeo2 ah modificado los datos del usuario: testeo2', '2023-04-04 17:07:24.000000'),
(667, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-04 17:07:30.000000'),
(668, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-04 17:07:35.000000'),
(669, 'Edge 111.0.1661.62', '179.6.46.229', 4, 3, 'El usuario testeo2 ah modificado los datos del usuario: testeo1', '2023-04-04 17:10:17.000000'),
(670, 'Edge 111.0.1661.62', '179.6.46.229', 4, 3, 'El usuario: testeo2 ah realizado cambio de clave al usuario: 3', '2023-04-04 17:10:44.000000'),
(671, 'Opera 96.0.0.0', '179.6.46.229', 3, 0, 'El usuario: testeo1 a iniciado sesión', '2023-04-04 17:11:06.000000'),
(672, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-04 17:12:23.000000'),
(673, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 17:12:40.000000'),
(674, 'Opera 96.0.0.0', '179.6.46.229', 3, 0, 'El usuario: testeo1 a cerrado sesión correstamente desde el sistema', '2023-04-04 17:17:47.000000'),
(675, 'Edge 111.0.1661.62', '200.37.185.162', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-04 17:42:31.000000'),
(676, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-04 17:56:25.000000'),
(677, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 17:57:46.000000'),
(678, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-04 18:03:11.000000'),
(679, 'Chrome 111.0.0.0', '200.37.185.162', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-04 18:03:38.000000'),
(680, 'Chrome 111.0.0.0', '45.195.93.63', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-04 18:06:39.000000'),
(681, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-04 18:07:29.000000'),
(682, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-04 18:11:16.000000'),
(683, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-04 18:11:25.000000'),
(684, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-04 18:12:06.000000'),
(685, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-04 18:12:09.000000'),
(686, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 ah realizado cambio de clave', '2023-04-04 18:12:27.000000'),
(687, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-04 18:12:32.000000'),
(688, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-04 18:13:52.000000'),
(689, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-04 18:13:57.000000'),
(690, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-04 18:14:41.000000'),
(691, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-04 18:16:00.000000'),
(692, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-04 18:17:05.000000'),
(693, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-04 18:22:59.000000'),
(694, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-04 18:23:55.000000'),
(695, 'Chrome 111.0.0.0', '45.195.93.63', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-04 18:25:23.000000'),
(696, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-05 00:51:37.000000'),
(697, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-05 01:46:49.000000'),
(698, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-05 01:57:30.000000'),
(699, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario testeo2 ah creado el perfil : TESTEO REGISTRADOR', '2023-04-05 03:15:31.000000'),
(700, 'Edge 111.0.1661.62', '179.6.46.229', 4, 4, 'El usuario testeo2 ah modificado los datos del usuario: testeo2, Se modifico el perfil administrador por TESTEO REGISTRADOR', '2023-04-05 03:15:40.000000'),
(701, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-05 03:15:50.000000'),
(702, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a iniciado sesión', '2023-04-05 03:15:54.000000'),
(703, 'Edge 111.0.1661.62', '179.6.46.229', 4, 0, 'El usuario: testeo2 a cerrado sesión correstamente desde el sistema', '2023-04-05 03:16:01.000000'),
(704, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 03:16:24.000000'),
(705, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-05 03:16:54.000000'),
(706, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 03:16:58.000000'),
(707, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-05 05:36:11.000000'),
(708, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-05 09:34:42.000000'),
(709, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-05 09:48:00.000000'),
(710, 'Edge 111.0.1661.62', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-05 09:49:16.000000'),
(711, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-05 09:58:51.000000'),
(712, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-05 10:17:25.000000'),
(713, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-05 10:17:35.000000'),
(714, 'Chrome 111.0.0.0', '190.43.161.79', 11, 13, 'El usuario Admin3 a Desabilitado al usuario: UsuarioPrueba', '2023-04-05 10:23:37.000000'),
(715, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-05 10:23:41.000000'),
(716, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-05 10:23:51.000000'),
(717, 'Edge 111.0.1661.62', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-05 10:55:34.000000'),
(718, 'Edge 111.0.1661.62', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-05 10:57:59.000000'),
(719, 'Chrome 111.0.0.0', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-05 11:06:28.000000'),
(720, 'Edge 111.0.1661.62', '190.43.161.79', 11, 0, 'El usuario: Admin3 a iniciado sesión', '2023-04-05 11:06:44.000000'),
(721, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-05 12:03:01.000000'),
(722, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-05 12:03:37.000000'),
(723, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-05 12:04:02.000000'),
(724, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-05 12:04:27.000000'),
(725, 'Chrome 111.0.0.0', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-05 12:04:38.000000'),
(726, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 12:08:39.000000');
INSERT INTO `log_acciones` (`id`, `terminal`, `ip_addres`, `u_ejecutor`, `u_afectado`, `accion`, `fecha`) VALUES
(727, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-05 12:08:52.000000'),
(728, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-05 12:38:38.000000'),
(729, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-05 12:40:12.000000'),
(730, 'Chrome 111.0.0.0', '200.37.185.162', 12, 3, 'El usuario Admin4 ah modificado los datos del usuario: testeo1', '2023-04-05 12:41:21.000000'),
(731, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 12:47:14.000000'),
(732, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-05 12:52:43.000000'),
(733, 'Chrome 111.0.0.0', '200.37.185.162', 12, 3, 'El usuario Admin4 ah modificado los datos del usuario: testeo1', '2023-04-05 13:00:48.000000'),
(734, 'Edge 111.0.1661.62', '200.37.185.162', 10, 0, 'El usuario: Admin2 a cerrado sesión correstamente desde el sistema', '2023-04-05 13:02:26.000000'),
(735, 'Edge 111.0.1661.62', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-05 13:02:42.000000'),
(736, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 13:05:36.000000'),
(737, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-05 13:27:49.000000'),
(738, 'Edge 111.0.1661.62', '190.43.161.79', 11, 0, 'El usuario: Admin3 a cerrado sesión correstamente desde el sistema', '2023-04-05 13:43:31.000000'),
(739, 'Edge 111.0.1661.62', '179.6.46.229', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-05 14:00:01.000000'),
(740, 'Edge 111.0.1661.62', '200.37.185.162', 10, 0, 'El usuario: Admin2 a iniciado sesión', '2023-04-05 15:58:36.000000'),
(741, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a iniciado sesión', '2023-04-05 16:12:47.000000'),
(742, 'Chrome 111.0.0.0', '200.37.185.162', 12, 0, 'El usuario: Admin4 a cerrado sesión correstamente desde el sistema', '2023-04-05 16:46:20.000000'),
(743, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 18:37:37.000000'),
(744, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-04-05 18:39:32.000000'),
(745, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-05 18:41:59.000000'),
(746, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 18:47:25.000000'),
(747, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-05 18:48:08.000000'),
(748, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 18:49:02.000000'),
(749, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 22:56:27.000000'),
(750, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-05 23:29:59.000000'),
(751, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-05 23:45:52.000000'),
(752, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-05 23:50:41.000000'),
(753, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-06 10:09:02.000000'),
(754, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-06 11:04:58.000000'),
(755, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-06 11:45:16.000000'),
(756, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-06 13:16:45.000000'),
(757, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-07 18:40:23.000000'),
(758, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-07 19:55:22.000000'),
(759, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-07 22:40:47.000000'),
(760, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-07 23:08:23.000000'),
(761, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 01:01:48.000000'),
(762, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-08 01:39:06.000000'),
(763, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 01:42:20.000000'),
(764, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-08 02:26:33.000000'),
(765, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 02:33:06.000000'),
(766, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-08 03:44:23.000000'),
(767, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 03:56:18.000000'),
(768, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-08 04:04:10.000000'),
(769, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 04:04:13.000000'),
(770, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-08 04:14:43.000000'),
(771, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 04:14:47.000000'),
(772, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-08 04:26:15.000000'),
(773, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 04:26:20.000000'),
(774, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 10:19:34.000000'),
(775, 'Opera 96.0.0.0', '::1', 5, 14, 'El usuario admin ah creado el usuario: testeo33 y se le asignó el perfil : administrador', '2023-04-08 10:26:09.000000'),
(776, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-08 10:35:55.000000'),
(777, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 10:54:31.000000'),
(778, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-08 11:00:46.000000'),
(779, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 11:21:22.000000'),
(780, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-08 11:50:58.000000'),
(781, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 12:39:48.000000'),
(782, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-08 18:32:53.000000'),
(783, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-09 09:06:20.000000'),
(784, 'Opera 96.0.0.0', '::1', 5, 14, 'El usuario admin ah eliminado al usuario : testeo33', '2023-04-09 09:14:53.000000'),
(785, 'Opera 96.0.0.0', '::1', 5, 14, 'El usuario admin ah eliminado al usuario : testeo33', '2023-04-09 09:15:10.000000'),
(786, 'Opera 96.0.0.0', '::1', 5, 12, 'El usuario admin ah eliminado al usuario : Admin4', '2023-04-09 09:17:27.000000'),
(787, 'Opera 96.0.0.0', '::1', 5, 11, 'El usuario admin ah eliminado al usuario : Admin3', '2023-04-09 09:19:25.000000'),
(788, 'Opera 96.0.0.0', '::1', 5, 9, 'El usuario admin ah eliminado al usuario : Admin1', '2023-04-09 09:20:37.000000'),
(789, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-09 09:27:08.000000'),
(790, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-09 09:33:22.000000'),
(791, 'Opera 96.0.0.0', '::1', 5, 13, 'El usuario admin a Desabilitado al usuario: UsuarioPrueba', '2023-04-09 09:41:24.000000'),
(792, 'Opera 96.0.0.0', '::1', 5, 13, 'El usuario: admin ah realizado cambio de clave al usuario: 13', '2023-04-09 09:41:38.000000'),
(793, 'Opera 96.0.0.0', '::1', 5, 13, 'El usuario admin ah modificado los datos del usuario: UsuarioPrueba, Se modifico el perfil administrador por TESTEO REGISTRADOR', '2023-04-09 09:42:18.000000'),
(794, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Ver en opcion Accesos', '2023-04-09 09:42:59.000000'),
(795, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Crear en opcion Accesos', '2023-04-09 09:43:00.000000'),
(796, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Editar en opcion Accesos', '2023-04-09 09:43:00.000000'),
(797, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Eliminar en  opcion Accesos', '2023-04-09 09:43:00.000000'),
(798, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Editar en opcion Usuarios', '2023-04-09 09:43:01.000000'),
(799, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Crear en opcion Usuarios', '2023-04-09 09:43:02.000000'),
(800, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Ver en opcion Usuarios', '2023-04-09 09:43:02.000000'),
(801, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Ver en opcion Config. Contraseña', '2023-04-09 09:43:03.000000'),
(802, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Ver en opcion Perfiles', '2023-04-09 09:43:03.000000'),
(803, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Crear en opcion Perfiles', '2023-04-09 09:43:04.000000'),
(804, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Crear en opcion Config. Contraseña', '2023-04-09 09:43:04.000000'),
(805, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Editar en opcion Config. Contraseña', '2023-04-09 09:43:04.000000'),
(806, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Editar en opcion Perfiles', '2023-04-09 09:43:05.000000'),
(807, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Eliminar en  opcion Perfiles', '2023-04-09 09:43:05.000000'),
(808, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Eliminar en  opcion Config. Contraseña', '2023-04-09 09:43:06.000000'),
(809, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:TESTEO REGISTRADOR : Eliminar en  opcion Usuarios', '2023-04-09 09:43:06.000000'),
(810, 'Chrome 111.0.0.0', '::1', 13, 0, 'El usuario: UsuarioPrueba a iniciado sesión', '2023-04-09 09:46:09.000000'),
(811, 'Chrome 111.0.0.0', '::1', 13, 0, 'El usuario: UsuarioPrueba a cerrado sesión correstamente desde el sistema', '2023-04-09 09:47:28.000000'),
(812, 'Chrome 111.0.0.0', '::1', 13, 0, 'El usuario: UsuarioPrueba a iniciado sesión', '2023-04-09 09:47:43.000000'),
(813, 'Chrome 111.0.0.0', '::1', 13, 0, 'El usuario: UsuarioPrueba a cerrado sesión correstamente desde el sistema', '2023-04-09 09:52:41.000000'),
(814, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBA', '2023-04-09 10:04:28.000000'),
(815, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-04-09 10:05:39.000000'),
(816, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBAA', '2023-04-09 10:06:09.000000'),
(817, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : AAAA', '2023-04-09 10:07:52.000000'),
(818, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : AAAA', '2023-04-09 10:08:01.000000'),
(819, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : AAAA', '2023-04-09 10:08:58.000000'),
(820, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBAA', '2023-04-09 10:09:05.000000'),
(821, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : AAAA', '2023-04-09 10:11:14.000000'),
(822, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : AAA', '2023-04-09 10:11:39.000000'),
(823, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-04-09 10:12:46.000000'),
(824, 'Opera 96.0.0.0', '::1', 5, 4, 'El usuario admin ah modificado los datos del usuario: testeo2, Se modifico el perfil TESTEO REGISTRADOR por administrador', '2023-04-09 10:23:49.000000'),
(825, 'Opera 96.0.0.0', '::1', 5, 3, 'El usuario admin ah modificado los datos del usuario: testeo1, Se modifico el perfil ANALISTA SI por administrador', '2023-04-09 10:23:56.000000'),
(826, 'Opera 96.0.0.0', '::1', 5, 8, 'El usuario admin ah modificado los datos del usuario: testeo5, Se modifico el perfil ANALISTA SI por administrador', '2023-04-09 10:24:15.000000'),
(827, 'Opera 96.0.0.0', '::1', 5, 6, 'El usuario admin ah modificado los datos del usuario: testeo4', '2023-04-09 10:24:20.000000'),
(828, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : ANALISTA SI', '2023-04-09 10:24:27.000000'),
(829, 'Opera 96.0.0.0', '::1', 5, 13, 'El usuario admin ah modificado los datos del usuario: UsuarioPrueba, Se modifico el perfil TESTEO REGISTRADOR por administrador', '2023-04-09 10:24:38.000000'),
(830, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : TESTEO REGISTRADOR', '2023-04-09 10:24:41.000000'),
(831, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-09 19:29:36.000000'),
(832, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-09 19:34:13.000000'),
(833, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-09 19:34:17.000000'),
(834, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBA', '2023-04-09 19:36:50.000000'),
(835, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Ver en opcion Accesos', '2023-04-09 19:36:59.000000'),
(836, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Crear en opcion Accesos', '2023-04-09 19:36:59.000000'),
(837, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Editar en opcion Accesos', '2023-04-09 19:37:00.000000'),
(838, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Eliminar en  opcion Accesos', '2023-04-09 19:37:00.000000'),
(839, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Eliminar en  opcion Usuarios', '2023-04-09 19:37:01.000000'),
(840, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Editar en opcion Usuarios', '2023-04-09 19:37:01.000000'),
(841, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Crear en opcion Usuarios', '2023-04-09 19:37:02.000000'),
(842, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Ver en opcion Usuarios', '2023-04-09 19:37:02.000000'),
(843, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Ver en opcion Config. Contraseña', '2023-04-09 19:37:03.000000'),
(844, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Crear en opcion Perfiles', '2023-04-09 19:37:03.000000'),
(845, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Ver en opcion Perfiles', '2023-04-09 19:37:04.000000'),
(846, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Editar en opcion Perfiles', '2023-04-09 19:37:05.000000'),
(847, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Editar en opcion Config. Contraseña', '2023-04-09 19:37:05.000000'),
(848, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Crear en opcion Config. Contraseña', '2023-04-09 19:37:06.000000'),
(849, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Eliminar en  opcion Config. Contraseña', '2023-04-09 19:37:06.000000'),
(850, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin Activo al perfil:PRUEBA : Eliminar en  opcion Perfiles', '2023-04-09 19:37:07.000000'),
(851, 'Opera 96.0.0.0', '::1', 5, 13, 'El usuario admin ah modificado los datos del usuario: UsuarioPrueba, Se modifico el perfil administrador por PRUEBA', '2023-04-09 19:37:18.000000'),
(852, 'Chrome 111.0.0.0', '::1', 13, 0, 'El usuario: UsuarioPrueba a iniciado sesión', '2023-04-09 19:37:46.000000'),
(853, 'Opera 96.0.0.0', '::1', 5, 15, 'El usuario admin ah creado el usuario: prueba y se le asignó el perfil : administrador', '2023-04-09 19:43:16.000000'),
(854, 'Chrome 111.0.0.0', '::1', 13, 0, 'El usuario: UsuarioPrueba a cerrado sesión correstamente desde el sistema', '2023-04-09 19:47:31.000000'),
(855, 'Opera 96.0.0.0', '::1', 5, 13, 'El usuario admin ah modificado los datos del usuario: UsuarioPrueba, Se modifico el perfil PRUEBA por administrador', '2023-04-09 19:48:01.000000'),
(856, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-04-09 19:49:11.000000'),
(857, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-09 20:12:55.000000'),
(858, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-09 20:13:00.000000'),
(859, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-09 20:53:21.000000'),
(860, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-09 22:35:46.000000'),
(861, 'Opera 96.0.0.0', '::1', 5, 16, 'El usuario admin ah creado el usuario: prueba123 y se le asignó el perfil : administrador', '2023-04-09 22:36:24.000000'),
(862, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBA', '2023-04-09 22:37:01.000000'),
(863, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBAA', '2023-04-09 22:37:10.000000'),
(864, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-04-09 22:50:45.000000'),
(865, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-09 22:50:48.000000'),
(866, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-09 22:50:52.000000'),
(867, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-04-09 23:07:02.000000'),
(868, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-09 23:35:21.000000'),
(869, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-09 23:38:47.000000'),
(870, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-04-09 23:39:14.000000'),
(871, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-10 00:35:21.000000'),
(872, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-10 01:42:41.000000'),
(873, 'Opera 96.0.0.0', '::1', 5, 17, 'El usuario admin ah creado el usuario: prueba123 y se le asignó el perfil : ADMINISTRADOR', '2023-04-10 01:43:00.000000'),
(874, 'Opera 96.0.0.0', '::1', 5, 17, 'El usuario admin ah eliminado al usuario : prueba123', '2023-04-10 01:44:09.000000'),
(875, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-10 01:57:49.000000'),
(876, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-10 16:30:26.000000'),
(877, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-04-10 16:38:28.000000'),
(878, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-10 16:38:37.000000'),
(879, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-10 16:38:40.000000'),
(880, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-04-10 17:34:00.000000'),
(881, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-10 17:34:04.000000'),
(882, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-10 17:34:07.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `macroproceso`
--

CREATE TABLE `macroproceso` (
  `id` int(11) NOT NULL,
  `macroproceso` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idunidad` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `macroproceso`
--

INSERT INTO `macroproceso` (`id`, `macroproceso`, `estado`, `idempresa`, `idarea`, `idunidad`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(19, 'Nuevo Macro', 1, 26, 27, 33, 5, '2023-04-10 16:37:48.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_riesgo`
--

CREATE TABLE `nivel_riesgo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `operador1` varchar(150) DEFAULT NULL,
  `valor1` int(11) DEFAULT NULL,
  `operador2` varchar(150) DEFAULT NULL,
  `valor2` int(11) DEFAULT NULL,
  `color` varchar(150) DEFAULT NULL,
  `comentario` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nivel_riesgo`
--

INSERT INTO `nivel_riesgo` (`id`, `descripcion`, `operador1`, `valor1`, `operador2`, `valor2`, `color`, `comentario`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(8, 'Moderado', '>', 20000, '<', 52000, '#e85454', 'Moderado', 1, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(9, 'Bajo', '>', 0, '<', 15000, '#000000', 'Bajo', 1, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(10, 'Moderado', '>', 20000, '<', 52000, '#e85454', 'Moderado', 1, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(11, 'Bajo', '>', 0, '<', 15000, '#000000', 'Bajo', 1, 5, '2023-04-10 17:58:35.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `paisnombre` varchar(250) NOT NULL,
  `continente` varchar(250) DEFAULT NULL,
  `codigoPais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `paisnombre`, `continente`, `codigoPais`) VALUES
(1, 'Australia', 'NULL', NULL),
(2, 'Austria', 'NULL', NULL),
(3, 'Azerbaiyán', 'NULL', NULL),
(4, 'Anguilla', 'NULL', NULL),
(5, 'Argentina', 'América', NULL),
(6, 'Armenia', 'NULL', NULL),
(7, 'Bielorrusia', 'NULL', NULL),
(8, 'Belice', 'América', NULL),
(9, 'Bélgica', 'NULL', NULL),
(10, 'Bermudas', 'NULL', NULL),
(11, 'Bulgaria', 'NULL', NULL),
(12, 'Brasil', 'América', NULL),
(13, 'Reino Unido', 'NULL', NULL),
(14, 'Hungría', 'NULL', NULL),
(15, 'Vietnam', 'NULL', NULL),
(16, 'Haiti', 'América', NULL),
(17, 'Guadalupe', 'NULL', NULL),
(18, 'Alemania', 'NULL', NULL),
(19, 'Países Bajos, Holanda', 'NULL', NULL),
(20, 'Grecia', 'NULL', NULL),
(21, 'Georgia', 'NULL', NULL),
(22, 'Dinamarca', 'NULL', NULL),
(23, 'Egipto', 'NULL', NULL),
(24, 'Israel', 'NULL', NULL),
(25, 'India', 'NULL', NULL),
(26, 'Irán', 'NULL', NULL),
(27, 'Irlanda', 'NULL', NULL),
(28, 'España', 'NULL', NULL),
(29, 'Italia', 'NULL', NULL),
(30, 'Kazajstán', 'NULL', NULL),
(31, 'Camerún', 'NULL', NULL),
(32, 'Canadá', 'América', NULL),
(33, 'Chipre', 'NULL', NULL),
(34, 'Kirguistán', 'NULL', NULL),
(35, 'China', 'NULL', NULL),
(36, 'Costa Rica', 'América', NULL),
(37, 'Kuwait', 'NULL', NULL),
(38, 'Letonia', 'NULL', NULL),
(39, 'Libia', 'NULL', NULL),
(40, 'Lituania', 'NULL', NULL),
(41, 'Luxemburgo', 'NULL', NULL),
(42, 'México', 'América', NULL),
(43, 'Moldavia', 'NULL', NULL),
(44, 'Mónaco', 'NULL', NULL),
(45, 'Nueva Zelanda', 'NULL', NULL),
(46, 'Noruega', 'NULL', NULL),
(47, 'Polonia', 'NULL', NULL),
(48, 'Portugal', 'NULL', NULL),
(49, 'Reunión', 'NULL', NULL),
(50, 'Rusia', 'NULL', NULL),
(51, 'El Salvador', 'América', NULL),
(52, 'Eslovaquia', 'NULL', NULL),
(53, 'Eslovenia', 'NULL', NULL),
(54, 'Surinam', 'América', NULL),
(55, 'Estados Unidos', 'América', NULL),
(56, 'Tadjikistan', 'NULL', NULL),
(57, 'Turkmenistan', 'NULL', NULL),
(58, 'Islas Turcas y Caicos', 'NULL', NULL),
(59, 'Turquía', 'NULL', NULL),
(60, 'Uganda', 'NULL', NULL),
(61, 'Uzbekistán', 'NULL', NULL),
(62, 'Ucrania', 'NULL', NULL),
(63, 'Finlandia', 'NULL', NULL),
(64, 'Francia', 'NULL', NULL),
(65, 'República Checa', 'NULL', NULL),
(66, 'Suiza', 'NULL', NULL),
(67, 'Suecia', 'NULL', NULL),
(68, 'Estonia', 'NULL', NULL),
(69, 'Corea del Sur', 'NULL', NULL),
(70, 'Japón', 'NULL', NULL),
(71, 'Croacia', 'NULL', NULL),
(72, 'Rumanía', 'NULL', NULL),
(73, 'Hong Kong', 'NULL', NULL),
(74, 'Indonesia', 'NULL', NULL),
(75, 'Jordania', 'NULL', NULL),
(76, 'Malasia', 'NULL', NULL),
(77, 'Singapur', 'NULL', NULL),
(78, 'Taiwan', 'NULL', NULL),
(79, 'Bosnia y Herzegovina', 'NULL', NULL),
(80, 'Bahamas', 'América', NULL),
(81, 'Chile', 'América', NULL),
(82, 'Colombia', 'América', NULL),
(83, 'Islandia', 'NULL', NULL),
(84, 'Corea del Norte', 'NULL', NULL),
(85, 'Macedonia', 'NULL', NULL),
(86, 'Malta', 'NULL', NULL),
(87, 'Pakistán', 'NULL', NULL),
(88, 'Papúa-Nueva Guinea', 'NULL', NULL),
(89, 'Perú', 'América', NULL),
(90, 'Filipinas', 'NULL', NULL),
(91, 'Arabia Saudita', 'NULL', NULL),
(92, 'Tailandia', 'NULL', NULL),
(93, 'Emiratos árabes Unidos', 'NULL', NULL),
(94, 'Groenlandia', 'NULL', NULL),
(95, 'Venezuela', 'América', NULL),
(96, 'Zimbabwe', 'NULL', NULL),
(97, 'Kenia', 'NULL', NULL),
(98, 'Algeria', 'NULL', NULL),
(99, 'Líbano', 'NULL', NULL),
(100, 'Botsuana', 'Africa', NULL),
(101, 'Tanzania', 'NULL', NULL),
(102, 'Namibia', 'NULL', NULL),
(103, 'Ecuador', 'América', NULL),
(104, 'Marruecos', 'NULL', NULL),
(105, 'Ghana', 'NULL', NULL),
(106, 'Siria', 'NULL', NULL),
(107, 'Nepal', 'NULL', NULL),
(108, 'Mauritania', 'NULL', NULL),
(109, 'Seychelles', 'NULL', NULL),
(110, 'Paraguay', 'América', NULL),
(111, 'Uruguay', 'América', NULL),
(112, 'Congo (Brazzaville)', 'NULL', NULL),
(113, 'Cuba', 'América', NULL),
(114, 'Albania', 'NULL', NULL),
(115, 'Nigeria', 'NULL', NULL),
(116, 'Zambia', 'NULL', NULL),
(117, 'Mozambique', 'NULL', NULL),
(119, 'Angola', 'Africa', NULL),
(120, 'Sri Lanka', 'NULL', NULL),
(121, 'Etiopía', 'NULL', NULL),
(122, 'Túnez', 'NULL', NULL),
(123, 'Bolivia', 'América', NULL),
(124, 'Panamá', 'América', NULL),
(125, 'Malawi', 'NULL', NULL),
(126, 'Liechtenstein', 'NULL', NULL),
(127, 'Bahrein', 'NULL', NULL),
(128, 'Barbados', 'América', NULL),
(130, 'Chad', 'NULL', NULL),
(131, 'Man, Isla de', 'NULL', NULL),
(132, 'Jamaica', 'América', NULL),
(133, 'Malí', 'NULL', NULL),
(134, 'Madagascar', 'NULL', NULL),
(135, 'Senegal', 'NULL', NULL),
(136, 'Togo', 'NULL', NULL),
(137, 'Honduras', 'América', NULL),
(138, 'República Dominicana', 'América', NULL),
(139, 'Mongolia', 'NULL', NULL),
(140, 'Irak', 'NULL', NULL),
(141, 'Sudáfrica', 'NULL', NULL),
(142, 'Aruba', 'NULL', NULL),
(143, 'Gibraltar', 'NULL', NULL),
(144, 'Afganistán', 'NULL', NULL),
(145, 'Andorra', 'NULL', NULL),
(147, 'Antigua y Barbuda', 'América', NULL),
(149, 'Bangladesh', 'NULL', NULL),
(151, 'Benín', 'Africa', NULL),
(152, 'Bután', 'NULL', NULL),
(154, 'Islas Virgenes Británicas', 'NULL', NULL),
(155, 'Brunéi', 'NULL', NULL),
(156, 'Burkina Faso', 'Africa', NULL),
(157, 'Burundi', 'NULL', NULL),
(158, 'Camboya', 'NULL', NULL),
(159, 'Cabo Verde', 'NULL', NULL),
(164, 'Comores', 'NULL', NULL),
(165, 'Congo (Kinshasa)', 'NULL', NULL),
(166, 'Cook, Islas', 'NULL', NULL),
(168, 'Costa de Marfil', 'NULL', NULL),
(169, 'Djibouti, Yibuti', 'NULL', NULL),
(171, 'Timor Oriental', 'NULL', NULL),
(172, 'Guinea Ecuatorial', 'NULL', NULL),
(173, 'Eritrea', 'NULL', NULL),
(175, 'Feroe, Islas', 'NULL', NULL),
(176, 'Fiyi', 'NULL', NULL),
(178, 'Polinesia Francesa', 'NULL', NULL),
(180, 'Gabón', 'NULL', NULL),
(181, 'Gambia', 'NULL', NULL),
(184, 'Granada', 'América', NULL),
(185, 'Guatemala', 'América', NULL),
(186, 'Guernsey', 'NULL', NULL),
(187, 'Guinea', 'NULL', NULL),
(188, 'Guinea-Bissau', 'NULL', NULL),
(189, 'Guyana', 'América', NULL),
(193, 'Jersey', 'NULL', NULL),
(195, 'Kiribati', 'NULL', NULL),
(196, 'Laos', 'NULL', NULL),
(197, 'Lesotho', 'NULL', NULL),
(198, 'Liberia', 'NULL', NULL),
(200, 'Maldivas', 'NULL', NULL),
(201, 'Martinica', 'NULL', NULL),
(202, 'Mauricio', 'NULL', NULL),
(205, 'Myanmar', 'NULL', NULL),
(206, 'Nauru', 'NULL', NULL),
(207, 'Antillas Holandesas', 'NULL', NULL),
(208, 'Nueva Caledonia', 'NULL', NULL),
(209, 'Nicaragua', 'América', NULL),
(210, 'Níger', 'NULL', NULL),
(212, 'Norfolk Island', 'NULL', NULL),
(213, 'Omán', 'NULL', NULL),
(215, 'Isla Pitcairn', 'NULL', NULL),
(216, 'Qatar', 'NULL', NULL),
(217, 'Ruanda', 'NULL', NULL),
(218, 'Santa Elena', 'NULL', NULL),
(219, 'San Cristobal y Nevis', 'NULL', NULL),
(220, 'Santa Lucía', 'América', NULL),
(221, 'San Pedro y Miquelón', 'NULL', NULL),
(222, 'San Vincente y Granadinas', 'NULL', NULL),
(223, 'Samoa', 'NULL', NULL),
(224, 'San Marino', 'NULL', NULL),
(225, 'San Tomé y Príncipe', 'NULL', NULL),
(226, 'Serbia y Montenegro', 'NULL', NULL),
(227, 'Sierra Leona', 'NULL', NULL),
(228, 'Islas Salomón', 'NULL', NULL),
(229, 'Somalia', 'NULL', NULL),
(232, 'Sudán', 'NULL', NULL),
(234, 'Swazilandia', 'NULL', NULL),
(235, 'Tokelau', 'NULL', NULL),
(236, 'Tonga', 'NULL', NULL),
(237, 'Trinidad y Tobago', 'América', NULL),
(239, 'Tuvalu', 'NULL', NULL),
(240, 'Vanuatu', 'NULL', NULL),
(241, 'Wallis y Futuna', 'NULL', NULL),
(242, 'Sáhara Occidental', 'NULL', NULL),
(243, 'Yemen', 'NULL', NULL),
(246, 'Puerto Rico', 'NULL', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_accion`
--

CREATE TABLE `plan_accion` (
  `id` int(11) NOT NULL,
  `plan_accion` varchar(150) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idunidad` int(11) DEFAULT NULL,
  `idposicion` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idprioridad` int(11) DEFAULT NULL,
  `idestado` int(11) DEFAULT NULL,
  `idalerta` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `actividades` int(11) DEFAULT NULL,
  `id_riesgo` varchar(50) DEFAULT NULL,
  `id_control` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_riesgo`
--

CREATE TABLE `plan_riesgo` (
  `id` int(11) NOT NULL,
  `idplan_accion` int(11) DEFAULT NULL,
  `idriesgo` int(11) DEFAULT NULL,
  `idcontrol` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` int(11) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posicion_puesto`
--

CREATE TABLE `posicion_puesto` (
  `id` int(11) NOT NULL,
  `posicion_puesto` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idunidad` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `posicion_puesto`
--

INSERT INTO `posicion_puesto` (`id`, `posicion_puesto`, `estado`, `idempresa`, `idarea`, `idunidad`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(15, 'Nuevo Puesto', 1, 26, 27, 33, 5, '2023-04-10 16:38:11.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prioridad`
--

CREATE TABLE `prioridad` (
  `id` int(11) NOT NULL,
  `prioridad` varchar(150) DEFAULT NULL,
  `decripcion` varchar(150) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prioridad`
--

INSERT INTO `prioridad` (`id`, `prioridad`, `decripcion`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(7, 'Baja', 'Baja', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(8, 'Media', 'Media', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(9, 'Alta', 'Alta', 5, '2023-04-10 00:00:00.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `probabilidad_riesgo`
--

CREATE TABLE `probabilidad_riesgo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `tipo_regla` varchar(150) DEFAULT NULL,
  `tipo_valor` varchar(150) DEFAULT NULL,
  `formula` varchar(150) DEFAULT NULL,
  `operador1` varchar(150) DEFAULT NULL,
  `valor1` int(11) DEFAULT NULL,
  `operador2` varchar(150) DEFAULT NULL,
  `valor2` int(11) DEFAULT NULL,
  `comentario` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `escenario` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `probabilidad_riesgo`
--

INSERT INTO `probabilidad_riesgo` (`id`, `descripcion`, `tipo_regla`, `tipo_valor`, `formula`, `operador1`, `valor1`, `operador2`, `valor2`, `comentario`, `estado`, `escenario`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(11, 'Rara', '2 Valores', 'Numero', NULL, '>', 1, '<=', 3, 'Rara', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(12, 'Moderado', '2 Valores', 'Numero', NULL, '>', 4, '<=', 8, 'Moderado', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(13, 'Alto', '2 Valores', 'Numero', NULL, '>', 9, '<=', 14, 'Alto', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(14, 'Muy Probable', '2 Valores', 'Numero', NULL, '>', 15, '<=', 29, 'Muy Probable', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(15, 'Casi Certeza', '2 Valores', 'Numero', NULL, '>', 30, '<=', 104, 'Casi Certeza', 2, 2, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(16, 'Moderado', '1 Valor', 'Formula', '> 5 Improbable', NULL, NULL, NULL, NULL, 'Moderado', 1, 1, 5, '2023-04-10 17:57:35.000000', NULL, NULL, NULL, NULL, 0),
(17, 'Rara', '2 Valores', 'Numero', NULL, '>', 1, '<=', 3, 'Rara', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(18, 'Moderado', '2 Valores', 'Numero', NULL, '>', 4, '<=', 8, 'Moderado', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(19, 'Alto', '2 Valores', 'Numero', NULL, '>', 9, '<=', 14, 'Alto', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(20, 'Muy Probable', '2 Valores', 'Numero', NULL, '>', 15, '<=', 29, 'Muy Probable', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(21, 'Casi Certeza', '2 Valores', 'Numero', NULL, '>', 30, '<=', 104, 'Casi Certeza', 2, 2, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(22, 'Moderado', '1 Valor', 'Formula', '> 5 Improbable', NULL, NULL, NULL, NULL, 'Moderado', 2, 1, 5, '2023-04-10 17:58:34.000000', NULL, '2023-04-10 18:00:38.000000', 5, '2023-04-10 18:00:38.000000', 1),
(23, 'Rara', '2 Valores', 'Numero', NULL, '>', 1, '<=', 3, 'Rara', 2, 2, 5, '2023-04-10 17:59:33.000000', NULL, NULL, NULL, NULL, 0),
(24, 'Moderado', '2 Valores', 'Numero', NULL, '>', 4, '<=', 8, 'Moderado', 2, 2, 5, '2023-04-10 17:59:33.000000', NULL, NULL, NULL, NULL, 0),
(25, 'Alto', '2 Valores', 'Numero', NULL, '>', 9, '<=', 14, 'Alto', 2, 2, 5, '2023-04-10 17:59:33.000000', NULL, NULL, NULL, NULL, 0),
(26, 'Muy Probable', '2 Valores', 'Numero', NULL, '>', 15, '<=', 29, 'Muy Probable', 2, 2, 5, '2023-04-10 17:59:33.000000', NULL, NULL, NULL, NULL, 0),
(27, 'Casi Certeza', '2 Valores', 'Numero', NULL, '>', 30, '<=', 104, 'Casi Certeza', 2, 2, 5, '2023-04-10 17:59:33.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE `proceso` (
  `id` int(11) NOT NULL,
  `proceso` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idunidad` int(11) DEFAULT NULL,
  `idmacroproceso` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proceso`
--

INSERT INTO `proceso` (`id`, `proceso`, `estado`, `idempresa`, `idarea`, `idunidad`, `idmacroproceso`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(18, 'Nuevo Proceso', 1, 26, 27, 33, 19, 5, '2023-04-10 16:37:59.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_controles`
--

CREATE TABLE `registro_controles` (
  `id` int(11) NOT NULL,
  `IDR` varchar(30) DEFAULT NULL,
  `riesgo` varchar(100) DEFAULT NULL,
  `IDC` varchar(30) DEFAULT NULL,
  `nom_control` varchar(100) DEFAULT NULL,
  `idCobertura` int(11) DEFAULT NULL,
  `evaluacion` varchar(30) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `riesgos`
--

CREATE TABLE `riesgos` (
  `id` int(11) NOT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idunidad` int(11) DEFAULT NULL,
  `idmacroproceso` int(11) DEFAULT NULL,
  `idproceso` int(11) DEFAULT NULL,
  `idactivo` int(11) DEFAULT NULL,
  `idamenaza` int(11) DEFAULT NULL,
  `iddesc_amenaza` int(11) DEFAULT NULL,
  `idcat_vulnerabilidad` int(11) DEFAULT NULL,
  `riesgo` varchar(150) DEFAULT NULL,
  `valor_probabilidad` int(11) DEFAULT NULL,
  `probabilidad_absoluto` varchar(150) DEFAULT NULL,
  `valor_impacto` int(11) DEFAULT NULL,
  `impacto_absoluto` int(11) DEFAULT NULL,
  `valor_absoluto` int(11) DEFAULT NULL,
  `idcontrol` int(11) DEFAULT NULL,
  `probabilidad_controlado` int(11) DEFAULT NULL,
  `impacto_controlado` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` int(11) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sysdiagrams`
--

CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_perfil`
--

CREATE TABLE `tb_detalle_perfil` (
  `id_det_per` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `view_det` int(11) DEFAULT NULL,
  `create_det` int(11) DEFAULT NULL,
  `update_det` int(11) DEFAULT NULL,
  `delete_det` int(11) DEFAULT NULL,
  `tabla` varchar(50) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_detalle_perfil`
--

INSERT INTO `tb_detalle_perfil` (`id_det_per`, `id_perfil`, `view_det`, `create_det`, `update_det`, `delete_det`, `tabla`, `id`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(1, 11, 1, 1, 1, 1, 'tb_modulo', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 11, 1, 1, 1, 1, 'tb_modulo', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 11, 1, 1, 1, 1, 'tb_modulo', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 11, 1, 1, 1, 1, 'tb_opcion', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 11, 1, 1, 1, 1, 'tb_opcion', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 11, 1, 1, 1, 1, 'tb_opcion', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 11, 1, 1, 1, 1, 'tb_opcion', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 11, 1, 1, 1, 1, 'tb_opcion', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 11, 1, 1, 1, 1, 'tb_opcion', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 11, 1, 1, 1, 1, 'tb_opcion', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 11, 1, 1, 1, 1, 'tb_opcion', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 11, 1, 1, 1, 1, 'tb_opcion', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(13, 11, 1, 1, 1, 1, 'tb_opcion', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(14, 11, 1, 1, 1, 1, 'tb_opcion', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(15, 11, 1, 1, 1, 1, 'tb_item', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(16, 11, 1, 1, 1, 1, 'tb_item', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(17, 11, 1, 1, 1, 1, 'tb_item', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(18, 11, 1, 1, 1, 1, 'tb_item', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(19, 11, 1, 1, 1, 1, 'tb_item', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(20, 11, 1, 1, 1, 1, 'tb_item', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(21, 11, 1, 1, 1, 1, 'tb_item', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(22, 11, 1, 1, 1, 1, 'tb_item', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(23, 11, 1, 1, 1, 1, 'tb_item', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(24, 11, 1, 1, 1, 1, 'tb_item', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(25, 11, 1, 1, 1, 1, 'tb_item', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(26, 11, 1, 1, 1, 1, 'tb_item', 12, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(27, 11, 1, 1, 1, 1, 'tb_item', 13, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(28, 11, 1, 1, 1, 1, 'tb_item', 14, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(29, 11, 1, 1, 1, 1, 'tb_item', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(30, 11, 1, 1, 1, 1, 'tb_item', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(31, 11, 1, 1, 1, 1, 'tb_item', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(32, 11, 1, 1, 1, 1, 'tb_item', 18, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(33, 11, 1, 1, 1, 1, 'tb_item', 19, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(34, 11, 1, 1, 1, 1, 'tb_item', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(35, 11, 1, 1, 1, 1, 'tb_item', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(36, 11, 1, 1, 1, 1, 'tb_item', 22, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(37, 11, 1, 1, 1, 1, 'tb_item', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(38, 11, 1, 1, 1, 1, 'tb_item', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(39, 11, 1, 1, 1, 1, 'tb_item', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(41, 11, 1, 1, 1, 1, 'tb_item', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(42, 11, 1, 1, 1, 1, 'tb_item', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(43, 11, 1, 1, 1, 1, 'tb_item', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(44, 11, 1, 1, 1, 1, 'tb_item', 29, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(45, 11, 1, 1, 1, 1, 'tb_item', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(446, 11, 1, 1, 1, 1, 'tb_item', 31, 5, '2023-04-09 10:23:13', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_historial_claves`
--

CREATE TABLE `tb_historial_claves` (
  `id_cl` int(11) NOT NULL,
  `pass_cl` varchar(200) NOT NULL,
  `id_us` int(11) NOT NULL,
  `creacion_cl` datetime(6) NOT NULL,
  `expiracion_cl` decimal(30,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_historial_claves`
--

INSERT INTO `tb_historial_claves` (`id_cl`, `pass_cl`, `id_us`, `creacion_cl`, `expiracion_cl`) VALUES
(3, '$2y$10$0nbCT9wSCcFwwxmt6jkPZ.UAqhUYhnH.mH1ByaNAD6cUI.k7aVFYq', 5, '2023-03-22 00:41:33.000000', '1683351693.000000'),
(4, '$2y$10$h.raTGdK2nnbqf1Gl5rq1Ox4P4Pou5H3sPyxbMvaWMPfyHylZp.9.', 5, '2023-03-22 01:42:42.000000', '1683355362.000000'),
(30, '$2y$10$0x4AytfyD5iOgLKHI46dHOYhqoemDvVFFx7.AS74UomgnEhQGkG3.', 17, '2023-04-10 01:43:00.000000', '1684996980.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_item`
--

CREATE TABLE `tb_item` (
  `id_item` int(11) NOT NULL,
  `est_item` int(11) DEFAULT NULL,
  `actualizacion_item` int(11) DEFAULT NULL,
  `id_op` int(11) DEFAULT NULL,
  `desc_item` varchar(200) DEFAULT NULL,
  `creacion_item` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_item`
--

INSERT INTO `tb_item` (`id_item`, `est_item`, `actualizacion_item`, `id_op`, `desc_item`, `creacion_item`) VALUES
(1, 1, NULL, 4, 'Empresa', '0000-00-00 00:00:00.000000'),
(2, 1, NULL, 4, 'Áreas', '0000-00-00 00:00:00.000000'),
(3, 1, NULL, 4, 'Unidades', '0000-00-00 00:00:00.000000'),
(4, 1, NULL, 4, 'Macroprocesos', '0000-00-00 00:00:00.000000'),
(5, 1, NULL, 4, 'Procesos', '0000-00-00 00:00:00.000000'),
(6, 1, NULL, 4, 'Posición/Puesto', '0000-00-00 00:00:00.000000'),
(7, 1, NULL, 4, 'Aspecto de Seguridad', '0000-00-00 00:00:00.000000'),
(8, 1, NULL, 4, 'Valor de Activo', '0000-00-00 00:00:00.000000'),
(9, 1, NULL, 4, 'Valoración de Activo', '0000-00-00 00:00:00.000000'),
(10, 1, NULL, 4, 'Tipo de Activo', '0000-00-00 00:00:00.000000'),
(11, 1, NULL, 4, 'Categoría de Activo', '0000-00-00 00:00:00.000000'),
(12, 1, NULL, 4, 'Ubicación de Activo', '0000-00-00 00:00:00.000000'),
(13, 1, NULL, 4, 'Clasificación de Información', '0000-00-00 00:00:00.000000'),
(14, 1, NULL, 5, 'Tipo de Riesgo', '0000-00-00 00:00:00.000000'),
(15, 1, NULL, 5, 'Probabilidad de Riesgo', '0000-00-00 00:00:00.000000'),
(16, 1, NULL, 5, 'Impacto de Riesgo', '0000-00-00 00:00:00.000000'),
(17, 1, NULL, 5, 'Nivel de Riesgo', '0000-00-00 00:00:00.000000'),
(18, 1, NULL, 5, 'Valoracion de Riesgo', '0000-00-00 00:00:00.000000'),
(19, 1, NULL, 5, 'Tipo de Amenaza', '0000-00-00 00:00:00.000000'),
(20, 1, NULL, 5, 'Descripcion de Amenaza', '0000-00-00 00:00:00.000000'),
(21, 1, NULL, 5, 'Vulnerabilidad', '0000-00-00 00:00:00.000000'),
(22, 1, NULL, 5, 'Categoría de Vulnerabilidad', '0000-00-00 00:00:00.000000'),
(23, 1, NULL, 5, 'Descripcion de Vulnerabilidad', '0000-00-00 00:00:00.000000'),
(24, 1, NULL, 6, 'Cobertura', '0000-00-00 00:00:00.000000'),
(25, 1, NULL, 6, 'Evaluación de Control', '0000-00-00 00:00:00.000000'),
(26, 1, NULL, 6, 'Aplicación de Probabilidad', '0000-00-00 00:00:00.000000'),
(27, 1, NULL, 6, 'Aplicacón de Impacto', '0000-00-00 00:00:00.000000'),
(28, 1, NULL, 7, 'Estado', '0000-00-00 00:00:00.000000'),
(29, 1, NULL, 7, 'Prioridad', '0000-00-00 00:00:00.000000'),
(30, 1, NULL, 7, 'Alerta de Seguimiento', '0000-00-00 00:00:00.000000'),
(31, 1, NULL, 6, 'Características de control', '2023-04-08 10:53:14.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_modulo`
--

CREATE TABLE `tb_modulo` (
  `id_mod` int(11) NOT NULL,
  `desc_mod` varchar(200) NOT NULL,
  `est_mod` int(11) NOT NULL,
  `creacion_mod` datetime(6) NOT NULL,
  `actualizacion_mod` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_modulo`
--

INSERT INTO `tb_modulo` (`id_mod`, `desc_mod`, `est_mod`, `creacion_mod`, `actualizacion_mod`) VALUES
(1, 'Accesos', 1, '0000-00-00 00:00:00.000000', NULL),
(2, 'Parametrización', 1, '0000-00-00 00:00:00.000000', NULL),
(3, 'Evaluación de Riesgos de Seguridad en Procesos de Negocio', 1, '0000-00-00 00:00:00.000000', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_opcion`
--

CREATE TABLE `tb_opcion` (
  `id_op` int(11) NOT NULL,
  `desc_op` varchar(50) NOT NULL,
  `est_op` int(11) NOT NULL,
  `creacion_op` datetime(6) NOT NULL,
  `actualizacion_op` datetime(6) DEFAULT NULL,
  `id_mod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_opcion`
--

INSERT INTO `tb_opcion` (`id_op`, `desc_op`, `est_op`, `creacion_op`, `actualizacion_op`, `id_mod`) VALUES
(1, 'Usuarios', 1, '0000-00-00 00:00:00.000000', NULL, 1),
(2, 'Config. Contraseña', 1, '0000-00-00 00:00:00.000000', NULL, 1),
(3, 'Perfiles', 1, '0000-00-00 00:00:00.000000', NULL, 1),
(4, 'Activos', 1, '0000-00-00 00:00:00.000000', NULL, 2),
(5, 'Riesgos SI-C', 1, '0000-00-00 00:00:00.000000', NULL, 2),
(6, 'Controles', 1, '0000-00-00 00:00:00.000000', NULL, 2),
(7, 'Plan de Accion', 1, '0000-00-00 00:00:00.000000', NULL, 2),
(8, 'Inventario y Clasificaci+on de Activos', 1, '0000-00-00 00:00:00.000000', NULL, 3),
(9, 'Evaluación de Riesgos SI-C', 1, '0000-00-00 00:00:00.000000', NULL, 3),
(10, 'Registro de Controles', 1, '0000-00-00 00:00:00.000000', NULL, 3),
(11, 'Registro de Plan de Accion', 1, '0000-00-00 00:00:00.000000', NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_perfiles`
--

CREATE TABLE `tb_perfiles` (
  `id_perfil` int(11) NOT NULL,
  `perfil` varchar(100) NOT NULL,
  `desc_perfil` varchar(200) NOT NULL,
  `est_perfil` int(11) NOT NULL,
  `creacion_perfil` datetime(6) NOT NULL,
  `actualizacion_perfil` datetime(6) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `is_user_negocio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_perfiles`
--

INSERT INTO `tb_perfiles` (`id_perfil`, `perfil`, `desc_perfil`, `est_perfil`, `creacion_perfil`, `actualizacion_perfil`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`, `is_user_negocio`) VALUES
(11, 'ADMINISTRADOR', 'ADMINISTRADOR', 1, '2023-03-21 00:00:00.000000', '2023-04-09 23:10:38.000000', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_sesiones`
--

CREATE TABLE `tb_sesiones` (
  `id_se` int(11) NOT NULL,
  `id_us` int(11) NOT NULL,
  `iat` decimal(30,6) NOT NULL,
  `expi` decimal(30,6) NOT NULL,
  `last_activity` datetime(6) DEFAULT NULL,
  `loged` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_sesiones`
--

INSERT INTO `tb_sesiones` (`id_se`, `id_us`, `iat`, `expi`, `last_activity`, `loged`) VALUES
(325, 5, '1681166047.000000', '1681169647.000000', '2023-04-10 17:34:07.000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_users`
--

CREATE TABLE `tb_users` (
  `id_us` int(11) NOT NULL,
  `docident_us` varchar(10) NOT NULL,
  `nombres_us` varchar(50) NOT NULL,
  `apepat_us` varchar(50) NOT NULL,
  `apemat_us` varchar(50) NOT NULL,
  `email_us` varchar(50) DEFAULT NULL,
  `usuario_us` varchar(20) NOT NULL,
  `creacion_us` datetime(6) NOT NULL,
  `actualizacion_us` datetime(6) DEFAULT NULL,
  `estado_us` int(11) NOT NULL,
  `intentos_us` int(11) DEFAULT NULL,
  `bloqueo_us` int(11) DEFAULT NULL,
  `change_pass` int(11) DEFAULT NULL,
  `bloqueo_time` decimal(30,6) DEFAULT NULL,
  `perfil_us` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idposicion` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idunidad` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `escenario` int(11) DEFAULT NULL,
  `is_user_negocio` int(11) DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_users`
--

INSERT INTO `tb_users` (`id_us`, `docident_us`, `nombres_us`, `apepat_us`, `apemat_us`, `email_us`, `usuario_us`, `creacion_us`, `actualizacion_us`, `estado_us`, `intentos_us`, `bloqueo_us`, `change_pass`, `bloqueo_time`, `perfil_us`, `idempresa`, `idposicion`, `idarea`, `idunidad`, `id_user_added`, `id_user_updated`, `id_user_deleted`, `is_deleted`, `escenario`, `is_user_negocio`, `date_add`, `date_modify`, `date_deleted`) VALUES
(5, '48186731', 'Administrador', 'Administrador', 'Administrador', 'youkai.miguel@gmail.com', 'admin', '2023-03-22 00:41:33.000000', '2023-04-10 17:34:00.000000', 1, 1, 0, 1, NULL, 11, 26, 15, 27, 33, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(17, '65432121', 'prueba', 'prueba', 'prueba', 'prueba@gmail.com', 'prueba123', '2023-04-10 01:43:00.000000', NULL, 1, NULL, NULL, 0, NULL, 11, 0, 0, 0, 0, NULL, NULL, 17, 1, NULL, NULL, NULL, '2023-04-10 01:44:09', '2023-04-10 01:44:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_activo`
--

CREATE TABLE `tipo_activo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_activo`
--

INSERT INTO `tipo_activo` (`id`, `tipo`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(11, 'Software', 1, 5, '2023-04-10 17:00:40.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_amenaza`
--

CREATE TABLE `tipo_amenaza` (
  `id` int(11) NOT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_amenaza`
--

INSERT INTO `tipo_amenaza` (`id`, `tipo`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(16, 'AmenazaA', 1, 5, '2023-04-10 18:01:19.000000', NULL, NULL, NULL, NULL, 0),
(17, 'AmenazaB', 1, 5, '2023-04-10 18:01:19.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_riesgo`
--

CREATE TABLE `tipo_riesgo` (
  `id` int(11) NOT NULL,
  `tipo_riesgo` varchar(150) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_riesgo`
--

INSERT INTO `tipo_riesgo` (`id`, `tipo_riesgo`, `descripcion`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(31, 'TipoA', 'TipoA', 1, 5, '2023-04-10 17:57:34.000000', NULL, NULL, NULL, NULL, 0),
(32, 'TipoB', 'TipoB', 1, 5, '2023-04-10 17:57:34.000000', NULL, NULL, NULL, NULL, 0),
(33, 'TipoC', 'TipoC', 1, 5, '2023-04-10 17:57:34.000000', NULL, NULL, NULL, NULL, 0),
(34, 'TipoA', 'TipoA', 1, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(35, 'TipoB', 'TipoB', 1, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(36, 'TipoC', 'TipoC', 1, 5, '2023-04-10 17:58:34.000000', NULL, NULL, NULL, NULL, 0),
(37, 'TipoA', 'TipoA', 1, 5, '2023-04-10 17:59:33.000000', NULL, NULL, NULL, NULL, 0),
(38, 'TipoB', 'TipoB', 1, 5, '2023-04-10 17:59:33.000000', NULL, NULL, NULL, NULL, 0),
(39, 'TipoC', 'TipoC', 1, 5, '2023-04-10 17:59:33.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_activo`
--

CREATE TABLE `ubicacion_activo` (
  `id` int(11) NOT NULL,
  `continente` varchar(150) DEFAULT NULL,
  `pais` varchar(150) DEFAULT NULL,
  `ciudad` varchar(150) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicacion_activo`
--

INSERT INTO `ubicacion_activo` (`id`, `continente`, `pais`, `ciudad`, `direccion`, `descripcion`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(10, 'América', '89', '1610', 'Javier Prado', 'Infraestructura', 1, 5, '2023-04-10 17:01:37.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` int(11) NOT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `unidad`, `estado`, `idempresa`, `idarea`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(33, 'UNIDAD SN', 1, 26, 27, 5, '2023-04-10 16:37:36.000000', 5, '2023-04-10 16:59:30.000000', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion_activo`
--

CREATE TABLE `valoracion_activo` (
  `id` int(11) NOT NULL,
  `idaspecto1` int(11) DEFAULT NULL,
  `valoracion1` varchar(150) DEFAULT NULL,
  `idaspecto2` int(11) DEFAULT NULL,
  `valoracion2` varchar(150) DEFAULT NULL,
  `idaspecto3` int(11) DEFAULT NULL,
  `valoracion3` varchar(150) DEFAULT NULL,
  `idvalor` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `valoracion_activo`
--

INSERT INTO `valoracion_activo` (`id`, `idaspecto1`, `valoracion1`, `idaspecto2`, `valoracion2`, `idaspecto3`, `valoracion3`, `idvalor`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(25, 1, '1', 2, '1', 3, '1', 12, 1, 5, '2023-04-10 17:00:28.000000', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion_riesgo`
--

CREATE TABLE `valoracion_riesgo` (
  `id` int(11) NOT NULL,
  `idProbabilidad` int(11) DEFAULT NULL,
  `idImpacto` int(11) DEFAULT NULL,
  `valor` varchar(100) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_activo`
--

CREATE TABLE `valor_activo` (
  `id` int(11) NOT NULL,
  `valor` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_user_added` int(11) DEFAULT NULL,
  `date_add` datetime(6) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` datetime(6) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` datetime(6) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `valor_activo`
--

INSERT INTO `valor_activo` (`id`, `valor`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(12, 'Valor A', 1, 5, '2023-04-10 17:00:16.000000', NULL, NULL, NULL, NULL, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades_plan`
--
ALTER TABLE `actividades_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alerta_act` (`idalerta`),
  ADD KEY `fk_empresa_act` (`idempresa`),
  ADD KEY `fk_area_act` (`idarea`),
  ADD KEY `fk_unidad_act` (`idunidad`),
  ADD KEY `fk_posicion_act` (`idposicion`),
  ADD KEY `fk_usuario_act` (`idusuario`),
  ADD KEY `FK__actividad__id_us__51851410` (`id_user_added`),
  ADD KEY `FK__actividad__id_us__52793849` (`id_user_updated`),
  ADD KEY `FK__actividad__id_us__536D5C82` (`id_user_deleted`);

--
-- Indices de la tabla `alert_seguimiento`
--
ALTER TABLE `alert_seguimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__alert_seg__id_us__5555A4F4` (`id_user_added`),
  ADD KEY `FK__alert_seg__id_us__5649C92D` (`id_user_updated`),
  ADD KEY `FK__alert_seg__id_us__573DED66` (`id_user_deleted`);

--
-- Indices de la tabla `aplicacion_impacto`
--
ALTER TABLE `aplicacion_impacto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__aplicacio__id_us__592635D8` (`id_user_added`),
  ADD KEY `FK__aplicacio__id_us__5A1A5A11` (`id_user_updated`),
  ADD KEY `FK__aplicacio__id_us__5B0E7E4A` (`id_user_deleted`);

--
-- Indices de la tabla `aplicacion_probailidad`
--
ALTER TABLE `aplicacion_probailidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__aplicacio__id_us__5CF6C6BC` (`id_user_added`),
  ADD KEY `FK__aplicacio__id_us__5DEAEAF5` (`id_user_updated`),
  ADD KEY `FK__aplicacio__id_us__5EDF0F2E` (`id_user_deleted`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__area__id_user_ad__60C757A0` (`id_user_added`),
  ADD KEY `FK__area__id_user_up__61BB7BD9` (`id_user_updated`),
  ADD KEY `FK__area__id_user_de__62AFA012` (`id_user_deleted`),
  ADD KEY `FK_area_empresa1` (`idempresa`);

--
-- Indices de la tabla `aspectos_seguridad`
--
ALTER TABLE `aspectos_seguridad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__aspectos___id_us__6497E884` (`id_user_added`),
  ADD KEY `FK__aspectos___id_us__658C0CBD` (`id_user_updated`),
  ADD KEY `FK__aspectos___id_us__668030F6` (`id_user_deleted`);

--
-- Indices de la tabla `caracteristica_control`
--
ALTER TABLE `caracteristica_control`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__caracteri__id_us__4DB4832C` (`id_user_added`),
  ADD KEY `FK__caracteri__id_us__4EA8A765` (`id_user_updated`),
  ADD KEY `FK__caracteri__id_us__4F9CCB9E` (`id_user_deleted`);

--
-- Indices de la tabla `catalogo_tabla`
--
ALTER TABLE `catalogo_tabla`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria_activo`
--
ALTER TABLE `categoria_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_categoria_activo_tipo_activo` (`idtipo`),
  ADD KEY `FK__categoria__id_us__6E2152BE` (`id_user_updated`),
  ADD KEY `FK__categoria__id_us__6F1576F7` (`id_user_deleted`);

--
-- Indices de la tabla `categoria_vulnerabilidad`
--
ALTER TABLE `categoria_vulnerabilidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__categoria__id_us__70FDBF69` (`id_user_updated`),
  ADD KEY `FK__categoria__id_us__71F1E3A2` (`id_user_deleted`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clasificacion_informacion`
--
ALTER TABLE `clasificacion_informacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__clasifica__id_us__7993056A` (`id_user_updated`),
  ADD KEY `FK__clasifica__id_us__7A8729A3` (`id_user_deleted`);

--
-- Indices de la tabla `cobertura`
--
ALTER TABLE `cobertura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__cobertura__id_us__7C6F7215` (`id_user_updated`),
  ADD KEY `FK__cobertura__id_us__7D63964E` (`id_user_deleted`);

--
-- Indices de la tabla `config_pass`
--
ALTER TABLE `config_pass`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `continente`
--
ALTER TABLE `continente`
  ADD PRIMARY KEY (`ContinenteCodigo`);

--
-- Indices de la tabla `controles`
--
ALTER TABLE `controles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__controles__id_us__004002F9` (`id_user_deleted`),
  ADD KEY `FK__controles__id_us__7F4BDEC0` (`id_user_updated`);

--
-- Indices de la tabla `correo_actividad`
--
ALTER TABLE `correo_actividad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `correo_plan`
--
ALTER TABLE `correo_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `desc_amenaza`
--
ALTER TABLE `desc_amenaza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__desc_amen__id_us__0504B816` (`id_user_updated`),
  ADD KEY `FK__desc_amen__id_us__05F8DC4F` (`id_user_deleted`),
  ADD KEY `fk_tipo_amenaza` (`idtipo_amenaza`);

--
-- Indices de la tabla `desc_vulnerabilidad`
--
ALTER TABLE `desc_vulnerabilidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__desc_vuln__id_us__07E124C1` (`id_user_updated`),
  ADD KEY `FK__desc_vuln__id_us__08D548FA` (`id_user_deleted`),
  ADD KEY `fk_vulne_cate` (`idcategoria`);

--
-- Indices de la tabla `detalle_controles`
--
ALTER TABLE `detalle_controles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_evaluacion_control`
--
ALTER TABLE `detalle_evaluacion_control`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__empresa__id_user__0D99FE17` (`id_user_updated`),
  ADD KEY `FK__empresa__id_user__0E8E2250` (`id_user_deleted`);

--
-- Indices de la tabla `escenario_active`
--
ALTER TABLE `escenario_active`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__estado__id_user___10766AC2` (`id_user_updated`),
  ADD KEY `FK__estado__id_user___116A8EFB` (`id_user_deleted`);

--
-- Indices de la tabla `evaluacion_control`
--
ALTER TABLE `evaluacion_control`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__evaluacio__id_us__381A47C8` (`id_user_added`),
  ADD KEY `FK__evaluacio__id_us__390E6C01` (`id_user_updated`),
  ADD KEY `FK__evaluacio__id_us__3A02903A` (`id_user_deleted`),
  ADD KEY `FK__evaluacio__idDis__3AF6B473` (`idDisenio`),
  ADD KEY `FK__evaluacio__idOpe__3BEAD8AC` (`idOperatividad`);

--
-- Indices de la tabla `evaluacion_control2`
--
ALTER TABLE `evaluacion_control2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__evaluacio__id_us__5ECA0095` (`id_user_added`),
  ADD KEY `FK__evaluacio__id_us__5FBE24CE` (`id_user_updated`),
  ADD KEY `FK__evaluacio__id_us__60B24907` (`id_user_deleted`);

--
-- Indices de la tabla `evaluacion_riesgo`
--
ALTER TABLE `evaluacion_riesgo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__evaluacio__id_us__46BD6CDA` (`id_user_added`),
  ADD KEY `FK__evaluacio__id_us__47B19113` (`id_user_updated`),
  ADD KEY `FK__evaluacio__id_us__48A5B54C` (`id_user_deleted`),
  ADD KEY `FK__evaluacio__id_ti__4999D985` (`id_tipo_riesgo`),
  ADD KEY `FK__evaluacio__id_em__4A8DFDBE` (`id_empresa`),
  ADD KEY `FK__evaluacio__id_ar__4B8221F7` (`id_area`),
  ADD KEY `FK__evaluacio__id_un__4C764630` (`id_unidad`),
  ADD KEY `FK__evaluacio__id_ma__4D6A6A69` (`id_macroproceso`),
  ADD KEY `FK__evaluacio__id_pr__4E5E8EA2` (`id_proceso`),
  ADD KEY `FK__evaluacio__id_ti__4F52B2DB` (`id_tipo_amenaza`),
  ADD KEY `FK__evaluacio__id_de__5046D714` (`id_descripcion_amenaza`);

--
-- Indices de la tabla `evaluacion_riesgos_controles`
--
ALTER TABLE `evaluacion_riesgos_controles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion_riesgo_historial`
--
ALTER TABLE `evaluacion_riesgo_historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__evaluacio__id_us__550B8C31` (`id_user_added`),
  ADD KEY `FK__evaluacio__id_us__55FFB06A` (`id_user_updated`),
  ADD KEY `FK__evaluacio__id_us__56F3D4A3` (`id_user_deleted`),
  ADD KEY `FK__evaluacio__id_ti__57E7F8DC` (`id_tipo_riesgo`),
  ADD KEY `FK__evaluacio__id_em__58DC1D15` (`id_empresa`),
  ADD KEY `FK__evaluacio__id_ar__59D0414E` (`id_area`),
  ADD KEY `FK__evaluacio__id_un__5AC46587` (`id_unidad`),
  ADD KEY `FK__evaluacio__id_ma__5BB889C0` (`id_macroproceso`),
  ADD KEY `FK__evaluacio__id_pr__5CACADF9` (`id_proceso`),
  ADD KEY `FK__evaluacio__id_ti__5DA0D232` (`id_tipo_amenaza`),
  ADD KEY `FK__evaluacio__id_de__5E94F66B` (`id_descripcion_amenaza`);

--
-- Indices de la tabla `impacto_riesgo`
--
ALTER TABLE `impacto_riesgo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__impacto_r__id_us__1352D76D` (`id_user_updated`),
  ADD KEY `FK__impacto_r__id_us__1446FBA6` (`id_user_deleted`);

--
-- Indices de la tabla `inventario_clasificacion_activo`
--
ALTER TABLE `inventario_clasificacion_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__inventari__idemp__6265874F` (`idempresa`),
  ADD KEY `FK__inventari__idare__6359AB88` (`idarea`),
  ADD KEY `FK__inventari__iduni__644DCFC1` (`idunidad`),
  ADD KEY `FK__inventari__idmac__6541F3FA` (`idmacroproceso`),
  ADD KEY `FK__inventari__idpro__66361833` (`idproceso`),
  ADD KEY `FK__inventari__idtip__672A3C6C` (`idtipo_activo`),
  ADD KEY `FK__inventari__idcat__681E60A5` (`idcategoria_activo`),
  ADD KEY `FK__inventari__idubi__691284DE` (`idubicacion`),
  ADD KEY `FK__inventari__idval__6A06A917` (`idvalor`),
  ADD KEY `FK__inventari__id_us__6AFACD50` (`id_user_added`),
  ADD KEY `FK__inventari__id_us__6BEEF189` (`id_user_updated`),
  ADD KEY `FK__inventari__id_us__6CE315C2` (`id_user_deleted`);

--
-- Indices de la tabla `inventario_clasificacion_activo_historial`
--
ALTER TABLE `inventario_clasificacion_activo_historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__inventari__idubi__00EA0E6F` (`idubicacion`),
  ADD KEY `FK__inventari__idval__01DE32A8` (`idvalor`),
  ADD KEY `FK__inventari__id_us__02D256E1` (`id_user_added`),
  ADD KEY `FK__inventari__id_us__03C67B1A` (`id_user_updated`),
  ADD KEY `FK__inventari__id_us__04BA9F53` (`id_user_deleted`),
  ADD KEY `FK__inventari__id_ic__05AEC38C` (`id_ica`),
  ADD KEY `FK__inventari__idemp__7A3D10E0` (`idempresa`),
  ADD KEY `FK__inventari__idare__7B313519` (`idarea`),
  ADD KEY `FK__inventari__iduni__7C255952` (`idunidad`),
  ADD KEY `FK__inventari__idmac__7D197D8B` (`idmacroproceso`),
  ADD KEY `FK__inventari__idpro__7E0DA1C4` (`idproceso`),
  ADD KEY `FK__inventari__idtip__7F01C5FD` (`idtipo_activo`),
  ADD KEY `FK__inventari__idcat__7FF5EA36` (`idcategoria_activo`);

--
-- Indices de la tabla `log_acciones`
--
ALTER TABLE `log_acciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `macroproceso`
--
ALTER TABLE `macroproceso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_macroprocesos_unidades` (`idunidad`),
  ADD KEY `FK__macroproc__id_us__190BB0C3` (`id_user_updated`),
  ADD KEY `FK__macroproc__id_us__19FFD4FC` (`id_user_deleted`),
  ADD KEY `FK_macroprocesos_area` (`idarea`),
  ADD KEY `FK_macroprocesos_empresa` (`idempresa`);

--
-- Indices de la tabla `nivel_riesgo`
--
ALTER TABLE `nivel_riesgo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__nivel_rie__id_us__50B0EB68` (`id_user_added`),
  ADD KEY `FK__nivel_rie__id_us__51A50FA1` (`id_user_updated`),
  ADD KEY `FK__nivel_rie__id_us__529933DA` (`id_user_deleted`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plan_accion`
--
ALTER TABLE `plan_accion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prio_plan` (`idprioridad`),
  ADD KEY `fk_alerta_plan` (`idalerta`),
  ADD KEY `fk_empresa_plan` (`idempresa`),
  ADD KEY `fk_area_plan` (`idarea`),
  ADD KEY `fk_unidad_plan` (`idunidad`),
  ADD KEY `fk_posicion_plan` (`idposicion`),
  ADD KEY `fk_usuario_plan` (`idusuario`),
  ADD KEY `FK__plan_acci__id_us__247D636F` (`id_user_updated`),
  ADD KEY `FK__plan_acci__id_us__257187A8` (`id_user_deleted`),
  ADD KEY `fk_estado_plan` (`idestado`);

--
-- Indices de la tabla `plan_riesgo`
--
ALTER TABLE `plan_riesgo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_plan_plan` (`idplan_accion`),
  ADD KEY `FK__plan_ries__id_us__2759D01A` (`id_user_updated`),
  ADD KEY `FK__plan_ries__id_us__284DF453` (`id_user_deleted`),
  ADD KEY `fk_plan_riesgo` (`idriesgo`),
  ADD KEY `fk_plan_control` (`idcontrol`);

--
-- Indices de la tabla `posicion_puesto`
--
ALTER TABLE `posicion_puesto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_posicion_puesto_unidades` (`idunidad`),
  ADD KEY `FK__posicion___id_us__2A363CC5` (`id_user_updated`),
  ADD KEY `FK__posicion___id_us__2B2A60FE` (`id_user_deleted`),
  ADD KEY `FK_posicion_puesto_area` (`idarea`),
  ADD KEY `FK_posicion_puesto_empresa` (`idempresa`);

--
-- Indices de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__prioridad__id_us__2E06CDA9` (`id_user_deleted`),
  ADD KEY `FK__prioridad__id_us__2D12A970` (`id_user_updated`);

--
-- Indices de la tabla `probabilidad_riesgo`
--
ALTER TABLE `probabilidad_riesgo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__probailid__id_us__2FEF161B` (`id_user_updated`),
  ADD KEY `FK__probailid__id_us__30E33A54` (`id_user_deleted`);

--
-- Indices de la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_procesos_area` (`idarea`),
  ADD KEY `FK_procesos_empresa` (`idempresa`),
  ADD KEY `FK_procesos_macroprocesos` (`idmacroproceso`),
  ADD KEY `FK_procesos_unidades` (`idunidad`),
  ADD KEY `FK__procesos__id_use__32CB82C6` (`id_user_updated`),
  ADD KEY `FK__procesos__id_use__33BFA6FF` (`id_user_deleted`);

--
-- Indices de la tabla `registro_controles`
--
ALTER TABLE `registro_controles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__registro___id_us__5728DECD` (`id_user_added`),
  ADD KEY `FK__registro___id_us__581D0306` (`id_user_updated`),
  ADD KEY `FK__registro___id_us__5911273F` (`id_user_deleted`),
  ADD KEY `fk_cobertura_control` (`idCobertura`);

--
-- Indices de la tabla `riesgos`
--
ALTER TABLE `riesgos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_empresa_riesgo` (`idempresa`),
  ADD KEY `fk_area_riesgo` (`idarea`),
  ADD KEY `fk_unidad_riesgo` (`idunidad`),
  ADD KEY `fk_macroproceso_riesgo` (`idmacroproceso`),
  ADD KEY `fk_proceso_riesgo` (`idproceso`),
  ADD KEY `fk_activo_riesgo` (`idactivo`),
  ADD KEY `fk_amenaza_riesgo` (`idamenaza`),
  ADD KEY `fk_descame_riesgo` (`iddesc_amenaza`),
  ADD KEY `fk_catvulne_riesgo` (`idcat_vulnerabilidad`),
  ADD KEY `fk_control_riesgo` (`idcontrol`),
  ADD KEY `FK__riesgos__id_user__38845C1C` (`id_user_updated`),
  ADD KEY `FK__riesgos__id_user__39788055` (`id_user_deleted`);

--
-- Indices de la tabla `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  ADD PRIMARY KEY (`diagram_id`),
  ADD UNIQUE KEY `UK_principal_name` (`principal_id`,`name`);

--
-- Indices de la tabla `tb_detalle_perfil`
--
ALTER TABLE `tb_detalle_perfil`
  ADD PRIMARY KEY (`id_det_per`);

--
-- Indices de la tabla `tb_historial_claves`
--
ALTER TABLE `tb_historial_claves`
  ADD PRIMARY KEY (`id_cl`);

--
-- Indices de la tabla `tb_item`
--
ALTER TABLE `tb_item`
  ADD PRIMARY KEY (`id_item`);

--
-- Indices de la tabla `tb_modulo`
--
ALTER TABLE `tb_modulo`
  ADD PRIMARY KEY (`id_mod`);

--
-- Indices de la tabla `tb_opcion`
--
ALTER TABLE `tb_opcion`
  ADD PRIMARY KEY (`id_op`),
  ADD KEY `fk_mod_op` (`id_mod`);

--
-- Indices de la tabla `tb_perfiles`
--
ALTER TABLE `tb_perfiles`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `tb_sesiones`
--
ALTER TABLE `tb_sesiones`
  ADD PRIMARY KEY (`id_se`);

--
-- Indices de la tabla `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_us`),
  ADD KEY `fk_user_perfil` (`perfil_us`);

--
-- Indices de la tabla `tipo_activo`
--
ALTER TABLE `tipo_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__tipo_acti__id_us__43F60EC8` (`id_user_updated`),
  ADD KEY `FK__tipo_acti__id_us__44EA3301` (`id_user_deleted`);

--
-- Indices de la tabla `tipo_amenaza`
--
ALTER TABLE `tipo_amenaza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__tipo_amen__id_us__46D27B73` (`id_user_updated`),
  ADD KEY `FK__tipo_amen__id_us__47C69FAC` (`id_user_deleted`);

--
-- Indices de la tabla `tipo_riesgo`
--
ALTER TABLE `tipo_riesgo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__tipo_ries__id_us__29971E47` (`id_user_added`),
  ADD KEY `FK__tipo_ries__id_us__2A8B4280` (`id_user_updated`),
  ADD KEY `FK__tipo_ries__id_us__2B7F66B9` (`id_user_deleted`);

--
-- Indices de la tabla `ubicacion_activo`
--
ALTER TABLE `ubicacion_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__ubicacion__id_us__49AEE81E` (`id_user_updated`),
  ADD KEY `FK__ubicacion__id_us__4AA30C57` (`id_user_deleted`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_unidades_area` (`idarea`),
  ADD KEY `FK_unidades_empresa` (`idempresa`),
  ADD KEY `FK__unidades__id_use__542C7691` (`id_user_updated`),
  ADD KEY `FK__unidades__id_use__55209ACA` (`id_user_deleted`);

--
-- Indices de la tabla `valoracion_activo`
--
ALTER TABLE `valoracion_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_valoracion_valor` (`idvalor`),
  ADD KEY `fk_valoracion_valor1` (`idaspecto1`),
  ADD KEY `fk_valoracion_valor2` (`idaspecto2`),
  ADD KEY `fk_valoracion_valor3` (`idaspecto3`),
  ADD KEY `FK__valoracio__id_us__59E54FE7` (`id_user_updated`),
  ADD KEY `FK__valoracio__id_us__5AD97420` (`id_user_deleted`);

--
-- Indices de la tabla `valoracion_riesgo`
--
ALTER TABLE `valoracion_riesgo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__valoracio__id_us__058EC7FB` (`id_user_added`),
  ADD KEY `FK__valoracio__id_us__0682EC34` (`id_user_updated`),
  ADD KEY `FK__valoracio__id_us__0777106D` (`id_user_deleted`),
  ADD KEY `FK__valoracio__idImp__095F58DF` (`idImpacto`),
  ADD KEY `FK__valoracio__idPro__086B34A6` (`idProbabilidad`);

--
-- Indices de la tabla `valor_activo`
--
ALTER TABLE `valor_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__valor_act__id_us__5708E33C` (`id_user_updated`),
  ADD KEY `FK__valor_act__id_us__57FD0775` (`id_user_deleted`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades_plan`
--
ALTER TABLE `actividades_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `alert_seguimiento`
--
ALTER TABLE `alert_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `aplicacion_impacto`
--
ALTER TABLE `aplicacion_impacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `aplicacion_probailidad`
--
ALTER TABLE `aplicacion_probailidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `aspectos_seguridad`
--
ALTER TABLE `aspectos_seguridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `caracteristica_control`
--
ALTER TABLE `caracteristica_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `catalogo_tabla`
--
ALTER TABLE `catalogo_tabla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria_activo`
--
ALTER TABLE `categoria_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `categoria_vulnerabilidad`
--
ALTER TABLE `categoria_vulnerabilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2204;

--
-- AUTO_INCREMENT de la tabla `clasificacion_informacion`
--
ALTER TABLE `clasificacion_informacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cobertura`
--
ALTER TABLE `cobertura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `config_pass`
--
ALTER TABLE `config_pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `controles`
--
ALTER TABLE `controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `correo_actividad`
--
ALTER TABLE `correo_actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `correo_plan`
--
ALTER TABLE `correo_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `desc_amenaza`
--
ALTER TABLE `desc_amenaza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `desc_vulnerabilidad`
--
ALTER TABLE `desc_vulnerabilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `detalle_controles`
--
ALTER TABLE `detalle_controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `detalle_evaluacion_control`
--
ALTER TABLE `detalle_evaluacion_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `escenario_active`
--
ALTER TABLE `escenario_active`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evaluacion_control`
--
ALTER TABLE `evaluacion_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacion_control2`
--
ALTER TABLE `evaluacion_control2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `evaluacion_riesgo`
--
ALTER TABLE `evaluacion_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `evaluacion_riesgos_controles`
--
ALTER TABLE `evaluacion_riesgos_controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `evaluacion_riesgo_historial`
--
ALTER TABLE `evaluacion_riesgo_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `impacto_riesgo`
--
ALTER TABLE `impacto_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `inventario_clasificacion_activo`
--
ALTER TABLE `inventario_clasificacion_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `inventario_clasificacion_activo_historial`
--
ALTER TABLE `inventario_clasificacion_activo_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `log_acciones`
--
ALTER TABLE `log_acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=883;

--
-- AUTO_INCREMENT de la tabla `macroproceso`
--
ALTER TABLE `macroproceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `nivel_riesgo`
--
ALTER TABLE `nivel_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT de la tabla `plan_accion`
--
ALTER TABLE `plan_accion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `plan_riesgo`
--
ALTER TABLE `plan_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posicion_puesto`
--
ALTER TABLE `posicion_puesto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `probabilidad_riesgo`
--
ALTER TABLE `probabilidad_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `proceso`
--
ALTER TABLE `proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `registro_controles`
--
ALTER TABLE `registro_controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `riesgos`
--
ALTER TABLE `riesgos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  MODIFY `diagram_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_detalle_perfil`
--
ALTER TABLE `tb_detalle_perfil`
  MODIFY `id_det_per` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=537;

--
-- AUTO_INCREMENT de la tabla `tb_historial_claves`
--
ALTER TABLE `tb_historial_claves`
  MODIFY `id_cl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `tb_item`
--
ALTER TABLE `tb_item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tb_modulo`
--
ALTER TABLE `tb_modulo`
  MODIFY `id_mod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_opcion`
--
ALTER TABLE `tb_opcion`
  MODIFY `id_op` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tb_perfiles`
--
ALTER TABLE `tb_perfiles`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tb_sesiones`
--
ALTER TABLE `tb_sesiones`
  MODIFY `id_se` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;

--
-- AUTO_INCREMENT de la tabla `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id_us` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipo_activo`
--
ALTER TABLE `tipo_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipo_amenaza`
--
ALTER TABLE `tipo_amenaza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipo_riesgo`
--
ALTER TABLE `tipo_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `ubicacion_activo`
--
ALTER TABLE `ubicacion_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `valoracion_activo`
--
ALTER TABLE `valoracion_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `valoracion_riesgo`
--
ALTER TABLE `valoracion_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `valor_activo`
--
ALTER TABLE `valor_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades_plan`
--
ALTER TABLE `actividades_plan`
  ADD CONSTRAINT `FK__actividad__id_us__51851410` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__actividad__id_us__52793849` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__actividad__id_us__536D5C82` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `fk_alerta_act` FOREIGN KEY (`idalerta`) REFERENCES `alert_seguimiento` (`id`),
  ADD CONSTRAINT `fk_area_act` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `fk_empresa_act` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `fk_posicion_act` FOREIGN KEY (`idposicion`) REFERENCES `posicion_puesto` (`id`),
  ADD CONSTRAINT `fk_unidad_act` FOREIGN KEY (`idunidad`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `fk_usuario_act` FOREIGN KEY (`idusuario`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `alert_seguimiento`
--
ALTER TABLE `alert_seguimiento`
  ADD CONSTRAINT `FK__alert_seg__id_us__5555A4F4` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__alert_seg__id_us__5649C92D` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__alert_seg__id_us__573DED66` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `aplicacion_impacto`
--
ALTER TABLE `aplicacion_impacto`
  ADD CONSTRAINT `FK__aplicacio__id_us__592635D8` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__aplicacio__id_us__5A1A5A11` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__aplicacio__id_us__5B0E7E4A` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `aplicacion_probailidad`
--
ALTER TABLE `aplicacion_probailidad`
  ADD CONSTRAINT `FK__aplicacio__id_us__5CF6C6BC` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__aplicacio__id_us__5DEAEAF5` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__aplicacio__id_us__5EDF0F2E` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `FK__area__id_user_ad__60C757A0` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__area__id_user_de__62AFA012` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__area__id_user_up__61BB7BD9` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK_area_empresa1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`);

--
-- Filtros para la tabla `aspectos_seguridad`
--
ALTER TABLE `aspectos_seguridad`
  ADD CONSTRAINT `FK__aspectos___id_us__668030F6` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `caracteristica_control`
--
ALTER TABLE `caracteristica_control`
  ADD CONSTRAINT `FK__caracteri__id_us__4DB4832C` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__caracteri__id_us__4EA8A765` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__caracteri__id_us__4F9CCB9E` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `categoria_activo`
--
ALTER TABLE `categoria_activo`
  ADD CONSTRAINT `FK__categoria__id_us__6E2152BE` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__categoria__id_us__6F1576F7` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK_categoria_activo_tipo_activo` FOREIGN KEY (`idtipo`) REFERENCES `tipo_activo` (`id`);

--
-- Filtros para la tabla `categoria_vulnerabilidad`
--
ALTER TABLE `categoria_vulnerabilidad`
  ADD CONSTRAINT `FK__categoria__id_us__70FDBF69` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__categoria__id_us__71F1E3A2` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `clasificacion_informacion`
--
ALTER TABLE `clasificacion_informacion`
  ADD CONSTRAINT `FK__clasifica__id_us__7993056A` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__clasifica__id_us__7A8729A3` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `cobertura`
--
ALTER TABLE `cobertura`
  ADD CONSTRAINT `FK__cobertura__id_us__7D63964E` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `controles`
--
ALTER TABLE `controles`
  ADD CONSTRAINT `FK__controles__id_us__004002F9` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__controles__id_us__7F4BDEC0` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `desc_amenaza`
--
ALTER TABLE `desc_amenaza`
  ADD CONSTRAINT `FK__desc_amen__id_us__0504B816` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__desc_amen__id_us__05F8DC4F` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `fk_tipo_amenaza` FOREIGN KEY (`idtipo_amenaza`) REFERENCES `tipo_amenaza` (`id`);

--
-- Filtros para la tabla `desc_vulnerabilidad`
--
ALTER TABLE `desc_vulnerabilidad`
  ADD CONSTRAINT `FK__desc_vuln__id_us__07E124C1` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__desc_vuln__id_us__08D548FA` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `fk_vulne_cate` FOREIGN KEY (`idcategoria`) REFERENCES `categoria_vulnerabilidad` (`id`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `FK__empresa__id_user__0D99FE17` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__empresa__id_user__0E8E2250` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `evaluacion_control`
--
ALTER TABLE `evaluacion_control`
  ADD CONSTRAINT `FK__evaluacio__idDis__3AF6B473` FOREIGN KEY (`idDisenio`) REFERENCES `caracteristica_control` (`id`),
  ADD CONSTRAINT `FK__evaluacio__idOpe__3BEAD8AC` FOREIGN KEY (`idOperatividad`) REFERENCES `caracteristica_control` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_us__381A47C8` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__evaluacio__id_us__390E6C01` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__evaluacio__id_us__3A02903A` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `evaluacion_control2`
--
ALTER TABLE `evaluacion_control2`
  ADD CONSTRAINT `FK__evaluacio__id_us__5ECA0095` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__evaluacio__id_us__5FBE24CE` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__evaluacio__id_us__60B24907` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `evaluacion_riesgo`
--
ALTER TABLE `evaluacion_riesgo`
  ADD CONSTRAINT `FK__evaluacio__id_ar__4B8221F7` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_de__5046D714` FOREIGN KEY (`id_descripcion_amenaza`) REFERENCES `desc_amenaza` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_em__4A8DFDBE` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_ma__4D6A6A69` FOREIGN KEY (`id_macroproceso`) REFERENCES `macroproceso` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_pr__4E5E8EA2` FOREIGN KEY (`id_proceso`) REFERENCES `proceso` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_ti__4999D985` FOREIGN KEY (`id_tipo_riesgo`) REFERENCES `tipo_riesgo` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_ti__4F52B2DB` FOREIGN KEY (`id_tipo_amenaza`) REFERENCES `tipo_amenaza` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_un__4C764630` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_us__46BD6CDA` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__evaluacio__id_us__47B19113` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__evaluacio__id_us__48A5B54C` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `evaluacion_riesgo_historial`
--
ALTER TABLE `evaluacion_riesgo_historial`
  ADD CONSTRAINT `FK__evaluacio__id_ar__59D0414E` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_de__5E94F66B` FOREIGN KEY (`id_descripcion_amenaza`) REFERENCES `desc_amenaza` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_em__58DC1D15` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_ma__5BB889C0` FOREIGN KEY (`id_macroproceso`) REFERENCES `macroproceso` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_pr__5CACADF9` FOREIGN KEY (`id_proceso`) REFERENCES `proceso` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_ti__57E7F8DC` FOREIGN KEY (`id_tipo_riesgo`) REFERENCES `tipo_riesgo` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_ti__5DA0D232` FOREIGN KEY (`id_tipo_amenaza`) REFERENCES `tipo_amenaza` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_un__5AC46587` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `FK__evaluacio__id_us__550B8C31` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__evaluacio__id_us__55FFB06A` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__evaluacio__id_us__56F3D4A3` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `impacto_riesgo`
--
ALTER TABLE `impacto_riesgo`
  ADD CONSTRAINT `FK__impacto_r__id_us__1352D76D` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__impacto_r__id_us__1446FBA6` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `inventario_clasificacion_activo`
--
ALTER TABLE `inventario_clasificacion_activo`
  ADD CONSTRAINT `FK__inventari__id_us__6AFACD50` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__inventari__id_us__6BEEF189` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__inventari__id_us__6CE315C2` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__inventari__idare__6359AB88` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `FK__inventari__idcat__681E60A5` FOREIGN KEY (`idcategoria_activo`) REFERENCES `categoria_activo` (`id`),
  ADD CONSTRAINT `FK__inventari__idemp__6265874F` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FK__inventari__idmac__6541F3FA` FOREIGN KEY (`idmacroproceso`) REFERENCES `macroproceso` (`id`),
  ADD CONSTRAINT `FK__inventari__idpro__66361833` FOREIGN KEY (`idproceso`) REFERENCES `proceso` (`id`),
  ADD CONSTRAINT `FK__inventari__idtip__672A3C6C` FOREIGN KEY (`idtipo_activo`) REFERENCES `tipo_activo` (`id`),
  ADD CONSTRAINT `FK__inventari__idubi__691284DE` FOREIGN KEY (`idubicacion`) REFERENCES `ubicacion_activo` (`id`),
  ADD CONSTRAINT `FK__inventari__iduni__644DCFC1` FOREIGN KEY (`idunidad`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `FK__inventari__idval__6A06A917` FOREIGN KEY (`idvalor`) REFERENCES `valor_activo` (`id`);

--
-- Filtros para la tabla `inventario_clasificacion_activo_historial`
--
ALTER TABLE `inventario_clasificacion_activo_historial`
  ADD CONSTRAINT `FK__inventari__id_ic__05AEC38C` FOREIGN KEY (`id_ica`) REFERENCES `inventario_clasificacion_activo` (`id`),
  ADD CONSTRAINT `FK__inventari__id_us__02D256E1` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__inventari__id_us__03C67B1A` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__inventari__id_us__04BA9F53` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__inventari__idare__7B313519` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `FK__inventari__idcat__7FF5EA36` FOREIGN KEY (`idcategoria_activo`) REFERENCES `categoria_activo` (`id`),
  ADD CONSTRAINT `FK__inventari__idemp__7A3D10E0` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FK__inventari__idmac__7D197D8B` FOREIGN KEY (`idmacroproceso`) REFERENCES `macroproceso` (`id`),
  ADD CONSTRAINT `FK__inventari__idpro__7E0DA1C4` FOREIGN KEY (`idproceso`) REFERENCES `proceso` (`id`),
  ADD CONSTRAINT `FK__inventari__idtip__7F01C5FD` FOREIGN KEY (`idtipo_activo`) REFERENCES `tipo_activo` (`id`),
  ADD CONSTRAINT `FK__inventari__idubi__00EA0E6F` FOREIGN KEY (`idubicacion`) REFERENCES `ubicacion_activo` (`id`),
  ADD CONSTRAINT `FK__inventari__iduni__7C255952` FOREIGN KEY (`idunidad`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `FK__inventari__idval__01DE32A8` FOREIGN KEY (`idvalor`) REFERENCES `valor_activo` (`id`);

--
-- Filtros para la tabla `macroproceso`
--
ALTER TABLE `macroproceso`
  ADD CONSTRAINT `FK__macroproc__id_us__190BB0C3` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__macroproc__id_us__19FFD4FC` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK_macroprocesos_area` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `FK_macroprocesos_empresa` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FK_macroprocesos_unidades` FOREIGN KEY (`idunidad`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `nivel_riesgo`
--
ALTER TABLE `nivel_riesgo`
  ADD CONSTRAINT `FK__nivel_rie__id_us__50B0EB68` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__nivel_rie__id_us__51A50FA1` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__nivel_rie__id_us__529933DA` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `plan_accion`
--
ALTER TABLE `plan_accion`
  ADD CONSTRAINT `FK__plan_acci__id_us__247D636F` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__plan_acci__id_us__257187A8` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `fk_alerta_plan` FOREIGN KEY (`idalerta`) REFERENCES `alert_seguimiento` (`id`),
  ADD CONSTRAINT `fk_area_plan` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `fk_empresa_plan` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `fk_estado_plan` FOREIGN KEY (`idestado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `fk_posicion_plan` FOREIGN KEY (`idposicion`) REFERENCES `posicion_puesto` (`id`),
  ADD CONSTRAINT `fk_prio_plan` FOREIGN KEY (`idprioridad`) REFERENCES `prioridad` (`id`),
  ADD CONSTRAINT `fk_unidad_plan` FOREIGN KEY (`idunidad`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `fk_usuario_plan` FOREIGN KEY (`idusuario`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `plan_riesgo`
--
ALTER TABLE `plan_riesgo`
  ADD CONSTRAINT `FK__plan_ries__id_us__2759D01A` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__plan_ries__id_us__284DF453` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `fk_plan_control` FOREIGN KEY (`idcontrol`) REFERENCES `controles` (`id`),
  ADD CONSTRAINT `fk_plan_plan` FOREIGN KEY (`idplan_accion`) REFERENCES `plan_accion` (`id`),
  ADD CONSTRAINT `fk_plan_riesgo` FOREIGN KEY (`idriesgo`) REFERENCES `riesgos` (`id`);

--
-- Filtros para la tabla `posicion_puesto`
--
ALTER TABLE `posicion_puesto`
  ADD CONSTRAINT `FK__posicion___id_us__2A363CC5` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__posicion___id_us__2B2A60FE` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK_posicion_puesto_area` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `FK_posicion_puesto_empresa` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FK_posicion_puesto_unidades` FOREIGN KEY (`idunidad`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `prioridad`
--
ALTER TABLE `prioridad`
  ADD CONSTRAINT `FK__prioridad__id_us__2D12A970` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__prioridad__id_us__2E06CDA9` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `probabilidad_riesgo`
--
ALTER TABLE `probabilidad_riesgo`
  ADD CONSTRAINT `FK__probailid__id_us__2FEF161B` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__probailid__id_us__30E33A54` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD CONSTRAINT `FK__procesos__id_use__32CB82C6` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__procesos__id_use__33BFA6FF` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK_procesos_area` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `FK_procesos_empresa` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FK_procesos_macroprocesos` FOREIGN KEY (`idmacroproceso`) REFERENCES `macroproceso` (`id`),
  ADD CONSTRAINT `FK_procesos_unidades` FOREIGN KEY (`idunidad`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `registro_controles`
--
ALTER TABLE `registro_controles`
  ADD CONSTRAINT `FK__registro___id_us__5728DECD` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__registro___id_us__581D0306` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__registro___id_us__5911273F` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `registro_controles_ibfk_1` FOREIGN KEY (`idCobertura`) REFERENCES `cobertura` (`id`);

--
-- Filtros para la tabla `riesgos`
--
ALTER TABLE `riesgos`
  ADD CONSTRAINT `FK__riesgos__id_user__38845C1C` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__riesgos__id_user__39788055` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `fk_activo_riesgo` FOREIGN KEY (`idactivo`) REFERENCES `tipo_activo` (`id`),
  ADD CONSTRAINT `fk_amenaza_riesgo` FOREIGN KEY (`idamenaza`) REFERENCES `categoria_activo` (`id`),
  ADD CONSTRAINT `fk_area_riesgo` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `fk_catvulne_riesgo` FOREIGN KEY (`idcat_vulnerabilidad`) REFERENCES `categoria_vulnerabilidad` (`id`),
  ADD CONSTRAINT `fk_control_riesgo` FOREIGN KEY (`idcontrol`) REFERENCES `controles` (`id`),
  ADD CONSTRAINT `fk_descame_riesgo` FOREIGN KEY (`iddesc_amenaza`) REFERENCES `desc_amenaza` (`id`),
  ADD CONSTRAINT `fk_empresa_riesgo` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `fk_macroproceso_riesgo` FOREIGN KEY (`idmacroproceso`) REFERENCES `macroproceso` (`id`),
  ADD CONSTRAINT `fk_proceso_riesgo` FOREIGN KEY (`idproceso`) REFERENCES `proceso` (`id`),
  ADD CONSTRAINT `fk_unidad_riesgo` FOREIGN KEY (`idunidad`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `tb_opcion`
--
ALTER TABLE `tb_opcion`
  ADD CONSTRAINT `fk_mod_op` FOREIGN KEY (`id_mod`) REFERENCES `tb_modulo` (`id_mod`);

--
-- Filtros para la tabla `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `fk_user_perfil` FOREIGN KEY (`perfil_us`) REFERENCES `tb_perfiles` (`id_perfil`);

--
-- Filtros para la tabla `tipo_activo`
--
ALTER TABLE `tipo_activo`
  ADD CONSTRAINT `FK__tipo_acti__id_us__43F60EC8` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__tipo_acti__id_us__44EA3301` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `tipo_amenaza`
--
ALTER TABLE `tipo_amenaza`
  ADD CONSTRAINT `FK__tipo_amen__id_us__46D27B73` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__tipo_amen__id_us__47C69FAC` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `tipo_riesgo`
--
ALTER TABLE `tipo_riesgo`
  ADD CONSTRAINT `FK__tipo_ries__id_us__29971E47` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__tipo_ries__id_us__2A8B4280` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__tipo_ries__id_us__2B7F66B9` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `ubicacion_activo`
--
ALTER TABLE `ubicacion_activo`
  ADD CONSTRAINT `FK__ubicacion__id_us__49AEE81E` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__ubicacion__id_us__4AA30C57` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `FK__unidades__id_use__542C7691` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__unidades__id_use__55209ACA` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK_unidades_area` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `FK_unidades_empresa` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`);

--
-- Filtros para la tabla `valoracion_activo`
--
ALTER TABLE `valoracion_activo`
  ADD CONSTRAINT `FK__valoracio__id_us__59E54FE7` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__valoracio__id_us__5AD97420` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `fk_valoracion_valor` FOREIGN KEY (`idvalor`) REFERENCES `valor_activo` (`id`),
  ADD CONSTRAINT `fk_valoracion_valor1` FOREIGN KEY (`idaspecto1`) REFERENCES `aspectos_seguridad` (`id`),
  ADD CONSTRAINT `fk_valoracion_valor2` FOREIGN KEY (`idaspecto2`) REFERENCES `aspectos_seguridad` (`id`),
  ADD CONSTRAINT `fk_valoracion_valor3` FOREIGN KEY (`idaspecto3`) REFERENCES `aspectos_seguridad` (`id`);

--
-- Filtros para la tabla `valoracion_riesgo`
--
ALTER TABLE `valoracion_riesgo`
  ADD CONSTRAINT `FK__valoracio__idImp__095F58DF` FOREIGN KEY (`idImpacto`) REFERENCES `impacto_riesgo` (`id`),
  ADD CONSTRAINT `FK__valoracio__idPro__086B34A6` FOREIGN KEY (`idProbabilidad`) REFERENCES `probabilidad_riesgo` (`id`),
  ADD CONSTRAINT `FK__valoracio__id_us__058EC7FB` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__valoracio__id_us__0682EC34` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__valoracio__id_us__0777106D` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `valor_activo`
--
ALTER TABLE `valor_activo`
  ADD CONSTRAINT `FK__valor_act__id_us__5708E33C` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__valor_act__id_us__57FD0775` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
