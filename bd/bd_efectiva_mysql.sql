-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2023 a las 09:12:28
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
-- Base de datos: `bd_efectiva`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_escenario_active` (IN `idEmpresa` INT, IN `escenario` INT, IN `idUser` INT)   BEGIN
	INSERT INTO escenario_active (idEmpresa,escenario,id_user_added,date_add) 
	VALUES(idEmpresa,escenario,idUser,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_actividades_plan` (IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idposicion` INT, IN `idusuario` INT, IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATETIME, IN `fecha_fin` DATETIME, IN `idalerta` INT, IN `progreso` INT, IN `idUserAdd` INT, IN `idplan` INT)   BEGIN
	insert into actividades_plan (
        idempresa, idarea, idunidad, idposicion, idusuario, descripcion, 
		fecha_inicio,
        fecha_fin, 
		idalerta, progreso, id_user_added, date_add,id_planes)
    values (
        idempresa, idarea, idunidad, idposicion, idusuario, descripcion,
        CONVERT(fecha_inicio,datetime),
		CONVERT(fecha_fin,datetime),
		idalerta, progreso, idUserAdd, current_date(),idplan);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_AplicacionImpacto` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
	INSERT INTO aplicacion_impacto(
	   idclasificacion,
	   posicion,descripcion,escenario,id_user_added,date_add)
    VALUES (
	   disenio,
	   posicion,descripcion,escenario,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_AplicacionProbabilidad` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
	INSERT INTO aplicacion_probailidad(
	   idclasificacion,
	   posicion,descripcion,escenario,id_user_added,date_add)
    VALUES (
	   disenio,
	   posicion,descripcion,escenario,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_area` (IN `area` VARCHAR(150), IN `empresa` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO area (area,idempresa,estado,id_user_added,date_add) VALUES(area,empresa,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_aspecto` (IN `aspecto` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO aspectos_seguridad(aspecto,estado,
id_user_added,date_add) VALUES(aspecto,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Automatizacion` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `peso` FLOAT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO automatizacion(
	   caracteristica,
	   descripcion,peso,estado,id_user_added,date_add)
    VALUES (
	   caracteristica,
	   descripcion,peso ,estado,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_caractControl` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `estado` INT, IN `peso` VARCHAR(50), IN `valor` VARCHAR(50), IN `condicion` VARCHAR(50), IN `tipo` VARCHAR(50), IN `idOpcion` INT, IN `calificacion` INT, IN `check_tabla` INT, IN `nom_tabla` VARCHAR(100), IN `seleccionable` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO caracteristica_control(
	   caracteristica,
	   descripcion,estado,peso,valor,condicion,tipo,idOpcion,clasificacion,check_tabla,nom_tabla,seleccionable,
	   id_user_added,date_add)
    VALUES (caracteristica,descripcion,estado,peso,valor,condicion,tipo,idOpcion,calificacion,check_tabla,
	   nom_tabla,seleccionable,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_CaracteristicaOpera` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(200), IN `idUserAdd` INT)   BEGIN
	INSERT INTO caract_operatividad(caracteristica,descripcion,id_user_added,date_add)
    VALUES (caracteristica,descripcion,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_catactivo` (IN `categoria` VARCHAR(150), IN `tipo` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO categoria_activo
(categoria,estado,idtipo,id_user_added,date_add)
VALUES
(categoria,estado,tipo,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_ClasificacionDise` (IN `clasificacion` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `condicion` VARCHAR(10), IN `valor` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO clasificacion_dise(clasificacion,descripcion,condicion,valor,id_user_added,date_add)
    VALUES (clasificacion,descripcion,condicion,valor,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_ClasificacionOpera` (IN `clasificacion` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `condicion` VARCHAR(10), IN `valor` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO clasi_operatividad(clasificacion,descripcion,condicion,valor,id_user_added,date_add)
    VALUES (clasificacion,descripcion,condicion,valor,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_clasinfo` (IN `clasificacion` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO clasificacion_informacion
(clasificacion,descripcion,estado,id_user_added,date_add)
VALUES
(clasificacion,descripcion,estado,tipo,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_cobertura` (IN `cobertura` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
	INSERT INTO cobertura  (cobertura,descripcion,id_user_added,date_add)
    VALUES (cobertura,descripcion,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Definicion` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `peso` FLOAT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO definicion(caracteristica,descripcion,peso,estado,id_user_added,date_add)
    VALUES (caracteristica,descripcion,peso,estado,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_detalle_control` (IN `idControl` INT, IN `idCC` INT, IN `nom_tabla` INT, IN `valor` VARCHAR(50))   BEGIN
	INSERT INTO detalle_controles(idControles, idCC, nom_tabla,valor)
	VALUES (idControl,idCC,nom_tabla,valor);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_detalle_Evaluacion_Control` (IN `IEC` INT, IN `IDCC` INT)   BEGIN
	INSERT INTO detalle_evaluacion_control(IEC,ID_CC)
    VALUES (IEC,IDCC);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Diseño` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO diseño(caracteristica,descripcion,estado,id_user_added,date_add)
    VALUES (caracteristica,descripcion,estado,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_empresa` (IN `empresa` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO empresa	(empresa,estado,id_user_added,date_add) VALUES(empresa,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_estado` (IN `estado` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `idUserAdd` INT)   BEGIN
	INSERT INTO estado  (estado,descripcion,id_user_added,date_add)
    VALUES (estado, descripcion,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Evaluacion_Control` (IN `calificacion` VARCHAR(50), IN `idUserAdd` INT)   BEGIN
	INSERT INTO evaluacion_control2(calificacion,id_user_added,date_add)
    VALUES (calificacion,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_macroproceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO macroproceso(macroproceso,
idunidad,idempresa,idarea,estado,
id_user_added,date_add) VALUES(macroproceso,unidad,empresa,area,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Objetivo` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `peso` FLOAT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO objetivo(caracteristica,descripcion,peso,estado,id_user_added,date_add)
    VALUES (caracteristica,descripcion,peso,estado,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Operatividad` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO operatividad(caracteristica,descripcion,estado,id_user_added,date_add)
	VALUES (caracteristica,descripcion,estado,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_plan_accion` (IN `id_riesgo` VARCHAR(150), IN `id_control` VARCHAR(150), IN `plan_accion` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATE, IN `fecha_fin` DATE, IN `id_user_added` INT, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idposicion` INT, IN `idusuario` INT, IN `idprioridad` INT, IN `idestado` INT, IN `idalerta` INT)   BEGIN
	 INSERT INTO plan_accion (
        id_riesgo, id_control, plan_accion, descripcion, fecha_inicio, fecha_fin, id_user_added, date_add,
        idempresa, idarea, idunidad, idposicion, idusuario, idprioridad, idestado, idalerta)
    VALUES (
        id_riesgo, id_control, plan_accion, descripcion, fecha_inicio, fecha_fin, id_user_added, current_date(),
        idempresa, idarea, idunidad, idposicion, idusuario, idprioridad, idestado, idalerta);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_posicion` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `posicion` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO posicion_puesto(posicion_puesto,
idempresa,idarea,idunidad,estado,
id_user_added,date_add) VALUES(posicion,                               empresa,area,unidad,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_prioridad` (IN `prioridad` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
	INSERT INTO prioridad(prioridad, decripcion,id_user_added,date_add)
	VALUES (prioridad,descripcion,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_proceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` INT, IN `proceso` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO proceso(proceso,idmacroproceso,
idunidad,idempresa,idarea,estado,
id_user_added,date_add) VALUES(proceso,macroproceso,unidad,
                               empresa,area,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Prueba` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `peso` FLOAT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO prueba(caracteristica,descripcion,peso,estado,id_user_added,date_add)
    VALUES (caracteristica,descripcion,peso,estado,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_Registro_Controles` (IN `IDR` VARCHAR(100), IN `riesgo` VARCHAR(100), IN `IDC` VARCHAR(100), IN `control` VARCHAR(100), IN `cobertura` INT, IN `evaluacion` VARCHAR(100), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO registro_controles(IDR,riesgo,IDC,nom_control,idCobertura,evaluacion,estado,id_user_added,date_add)
    VALUES (IDR,riesgo,IDC,control,cobertura,evaluacion,estado,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_tipoactivo` (IN `tipo` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO tipo_activo (tipo,estado,id_user_added,date_add)
VALUES (tipo,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_ubiactivo` (IN `continente` VARCHAR(50), IN `pais` VARCHAR(50), IN `ciudad` VARCHAR(50), IN `direccion` VARCHAR(300), IN `descripcion` VARCHAR(300), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO ubicacion_activo
(continente,pais,ciudad,direccion,descripcion,estado,id_user_added,date_add)
VALUES
(continente,pais,ciudad,direccion,descripcion,estado,tipo,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_unidad` (IN `area` INT, IN `empresa` INT, IN `unidad` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO unidades(unidad,idempresa,idarea,estado,
id_user_added,date_add) VALUES(unidad,empresa,area,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_valoracionactivo` (IN `aspecto1` INT, IN `aspecto2` INT, IN `aspecto3` INT, IN `valoracion1` INT, IN `valoracion2` INT, IN `valoracion3` INT, IN `idvalor` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO valoracion_activo
        (idaspecto1,idaspecto2,idaspecto3,
		valoracion1,valoracion2,valoracion3,
		idvalor,estado,id_user_added,date_add) 
		VALUES(aspecto1,aspecto2,aspecto3,valoracion1,
valoracion2,valoracion3,idvalor,1,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_ValoracionRiesgo` (IN `valor` VARCHAR(100), IN `probabilidad` INT, IN `impacto` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO valoracion_riesgo(valor,idProbabilidad,idImpacto,id_user_added,date_add)
    VALUES (valor,probabilidad,impacto,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_valoractivo` (IN `valor` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO valor_activo(valor,estado,
id_user_added,date_add) VALUES(valor,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_area` (IN `area` VARCHAR(150), IN `empresa` INT, IN `estado` INT, IN `idarea` INT, IN `idUserAdd` INT)   begin
	update area  
	set area=area,empresa=empresa,estado=estado,
    id_user_updated=idUserAdd,
    date_modify = now()
	where id=idarea;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_aspecto` (IN `aspecto` VARCHAR(150), IN `idaspecto` INT, IN `estado` INT, IN `idUserAdd` INT)   begin
	UPDATE aspectos_seguridad SET

aspecto=aspecto,
estado=estado,
id_user_updated=iduserAdd,
date_modify=now()
where id=idaspecto;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_catactivo` (IN `categoria` VARCHAR(150), IN `idcategoria` INT, IN `tipo` INT, IN `estado` INT, IN `idUserAdd` INT)   begin
UPDATE categoria_activo SET
categoria=categoria,
idtipo = tipo,
estado = estado ,
id_user_updated=iduserAdd,
date_modify=now()
where id=idcategoria;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_clasinfo` (IN `idclasi` INT, IN `clasificacion` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   begin
UPDATE clasificacion_informacion SET
clasificacion=clasificacion,
descripcion=descripcion,
estado = estado ,
id_user_updated=iduserAdd,
date_modify=now()
where id=idclasi;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_empresa` (IN `empresa` VARCHAR(150), IN `estado` INT, IN `idempresa` INT, IN `idUserAdd` INT)   begin
	update empresa 
	set empresa=empresa,estado=estado,
    id_user_updated=idUserAdd,
    date_modify = now()
	where id=idempresa;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_macroproceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` VARCHAR(150), IN `estado` INT, IN `idmacroproceso` INT, IN `idUserAdd` INT)   begin
	update macroproceso   
	set 
    idrea=area,
    idempresa=empresa,
    idunidad=unidad,
    macroproceso=macroproceso,
    estado=estado,
    id_user_updated=idUserAdd,
    date_modify = now()
	where id=idmacroproceso;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_plan_accion` (IN `id` INT, IN `id_riesgo` VARCHAR(150), IN `id_control` VARCHAR(150), IN `plan_accion` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATE, IN `fecha_fin` DATE, IN `id_user_updated` INT)   BEGIN
	UPDATE plan_accion
    SET id_riesgo = id_riesgo,
	id_control = id_control,
	plan_accion = plan_accion,
	descripcion = descripcion,
	fecha_inicio = fecha_inicio,
	fecha_fin = fecha_fin,
	id_user_updated = id_user_updated,
	date_modify = current_date()
    WHERE id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_posicion` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `posicion` VARCHAR(150), IN `idposicion` INT, IN `estado` INT, IN `idUserAdd` INT)   begin
	UPDATE posicion_puesto SET
idarea=area,
idempresa=empresa,
idunidad=unidad,
posicion_puesto=posicion,
estado=estado,
id_user_updated=iduserAdd,
date_modify=getdate()
where id=idposicion;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_proceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` INT, IN `proceso` VARCHAR(150), IN `idproceso` INT, IN `estado` INT, IN `idUserAdd` INT)   begin
	update proceso   
	set 
    idarea=area,
idempresa=empresa,
idunidad=unidad,
idmacroproceso=macroproceso,
proceso=proceso,
estado=estado,
id_user_updated=iduserAdd,
date_modify=getdate()
where id=idproceso;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_tipoactivo` (IN `tipo` VARCHAR(150), IN `idtipo` INT, IN `estado` INT, IN `idUserAdd` INT)   begin
UPDATE tipo_activo SET
tipo = tipo,
estado = estado ,

id_user_updated=iduserAdd,
date_modify=now()
where id=idtipo;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_ubiactivo` (IN `idubiactivo` INT, IN `continente` VARCHAR(50), IN `pais` VARCHAR(50), IN `ciudad` VARCHAR(50), IN `direccion` VARCHAR(300), IN `descripcion` VARCHAR(300), IN `estado` INT, IN `idUserAdd` INT)   begin
UPDATE ubicacion_activo SET
continente=continente,
pais=pais,
ciudad=ciudad,
direccion=direccion,
descripcion=descripcion,
estado = estado ,
id_user_updated=iduserAdd,
date_modify=now()
where id=idubiactivo;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_unidad` (IN `area` INT, IN `empresa` INT, IN `unidad` VARCHAR(150), IN `estado` INT, IN `idunidad` INT, IN `idUserAdd` INT)   begin
	update unidades  
	set idrea=area,
    idempresa=empresa,
    unidad=unidad,
    estado=estado,
    id_user_updated=idUserAdd,
    date_modify = now()
	where id=idunidad;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_valoracionactivo` (IN `aspecto1` INT, IN `aspecto2` INT, IN `aspecto3` INT, IN `valoracion1` INT, IN `valoracion2` INT, IN `valoracion3` INT, IN `idvalor` INT, IN `idvaloracion` INT, IN `idUserAdd` INT)   begin
	UPDATE valoracion_activo SET
	 idaspecto1=aspecto1,
	 idaspecto2=aspecto2,
	 idaspecto3=aspecto3,
		valoracion1=valoracion1,
		valoracion2=valoracion2,
		valoracion3=valoracion3,
		idvalor=idvalor,	
id_user_updated=iduserAdd,
date_modify=now()
where id=idvaloracion;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_valoractivo` (IN `valor` VARCHAR(150), IN `idalor` INT, IN `estado` INT, IN `idUserAdd` INT)   begin
	UPDATE valor_activo  SET

valor=valor,
estado=estado,
id_user_updated=iduserAdd,
date_modify=now()
where id=idvalor;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_actividades_plan` (IN `id` INT, IN `idUserDel` INT)   BEGIN
	UPDATE actividades_plan SET 
	id_user_deleted = idUserDel,
	date_deleted = current_date(),
	is_deleted = 1
    WHERE id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_alertSeguimiento` (IN `idUserAdd` INT, IN `idAlerta` INT)   BEGIN
	UPDATE alert_seguimiento  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idAlerta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_AplicacionImpacto` (IN `idUserAdd` INT, IN `idAplicacionImpacto` INT)   BEGIN
	UPDATE aplicacion_probailidad  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id= idAplicacionImpacto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_AplicacionProbabilidad` (IN `idUserAdd` INT, IN `idAplicacionProbabilidad` INT)   BEGIN
	UPDATE aplicacion_probailidad  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id= idAplicacionProbabilidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Automatizacion` (IN `idUserAdd` INT, IN `idAutomatizacion` INT)   BEGIN
	UPDATE prueba  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idAutomatizacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_caractControl` (IN `idUserAdd` INT, IN `idCaractControl` INT)   BEGIN
	UPDATE caracteristica_control  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idCaractControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_CaracteristicaOpera` (IN `idUserAdd` INT, IN `idClasificacionOpera` INT)   BEGIN
	UPDATE caract_operatividad  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idClasificacionOpera;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_ClasificacionDise` (IN `idUserAdd` INT, IN `idClasificacionDise` INT)   BEGIN
	UPDATE clasificacion_dise  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idClasificacionDise;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_ClasificacionOpera` (IN `idUserAdd` INT, IN `idClasificacionOpera` INT)   BEGIN
	UPDATE clasi_operatividad  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idClasificacionOpera;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cobertura` (IN `idUserAdd` INT, IN `idCobertura` INT)   BEGIN
	UPDATE cobertura  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idCobertura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Definicion` (IN `idUserAdd` INT, IN `idDefinicion` INT)   BEGIN
	UPDATE definicion  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idDefinicion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Diseño` (IN `idUserAdd` INT, IN `idDisenio` INT)   BEGIN
	UPDATE diseño  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idDisenio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_estado` (IN `idUserAdd` INT, IN `idEstado` INT)   BEGIN
	UPDATE estado  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idEstado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Evaluacion_Control` (IN `idUserAdd` INT, IN `idEvaluacionControl` INT)   BEGIN
	UPDATE evaluacion_control2  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id= idEvaluacionControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Objetivo` (IN `idUserAdd` INT, IN `idObjetivo` INT)   BEGIN
	UPDATE objetivo  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idObjetivo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Operatividad` (IN `idUserAdd` INT, IN `idOperatividad` INT)   BEGIN
	UPDATE operatividad  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idOperatividad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_plan_accion` (IN `id` INT, IN `id_user_deleted` INT)   BEGIN
	UPDATE plan_accion
    SET id_user_deleted = id_user_deleted,
	is_deleted = 1,
	date_deleted = current_date()
    WHERE id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_prioridad` (IN `idUserAdd` INT, IN `idPrioridad` INT)   BEGIN
	UPDATE prioridad  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idPrioridad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Prueba` (IN `idUserAdd` INT, IN `idPrueba` INT)   BEGIN
	UPDATE prueba  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idPrueba;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Registro_Controles` (IN `idUserAdd` INT, IN `idControl` INT)   BEGIN
	UPDATE  registro_controles SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_ValoracionRiesgo` (IN `idUserAdd` INT, IN `idValoracionRiesgo` INT)   BEGIN
	UPDATE valoracion_riesgo  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id= idValoracionRiesgo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAspectoByActivo` ()   begin
	SELECT * FROM aspectos_seguridad where estado='1' and is_deleted=0;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getComboPosicion` ()   begin
	SELECT * FROM posicion_puesto where estado='1' and is_deleted=0;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPosicionByArea` (IN `idarea` INT)   begin
	SELECT PP.id as id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
        E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto as PP inner join empresa as E
        on PP.idempresa=E.id inner join area as A on PP.idarea=A.id 
        inner join unidades as U on PP.idunidad=U.id
        where pp.idarea=idarea;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getTipoActivoByActivo` ()   begin
	SELECT * FROM tipo_activo 
         where estado='1' and is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByDatos` (IN `user` VARCHAR(50))   BEGIN
	SELECT *,TP.is_user_negocio as negocio FROM  tb_users as TU INNER JOIN tb_historial_claves AS TH
        on TU.id_us=TH.id_us inner join tb_perfiles as TP on TP.id_perfil=TU.perfil_us
		WHERE TU.usuario_us= user and estado_us='1'  ORDER BY TH.id_cl DESC limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getValorActivoByActivo` ()   begin
	SELECT * FROM valor_activo where estado='1' and is_deleted=0;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_Plan_Control` (IN `id` INT)   BEGIN
	select PA.id,(SELECT COUNT(*) FROM actividades_plan WHERE id_planes = PA.id) as actividades,PA.*
	from plan_accion as PA   where PA.is_deleted=0 and PA.id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `last_id_Evaluacion_Control` ()   BEGIN
	SELECT  id as maxid FROM evaluacion_control2 order by id desc limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `last_id_Registro_Proceso` ()   BEGIN
	SELECT  id as maxid FROM registro_controles order by id desc limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaProcesoByEstado` ()   begin
	SELECT * FROM proceso 
            where estado='1' ;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarArea` ()   begin
	SELECT a.id,a.idempresa,e.empresa,a.area,a.estado
                from empresa as E inner join area as A on a.idempresa = e.id;


end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAreaByActivo` (IN `empresa` INT)   begin
	SELECT * FROM area 
            where estado='1' and idempresa=empresa;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAreaEmpresa` (IN `dato` INT)   begin
	SELECT a.id,a.idempresa,e.empresa,a.area,a.estado
            from empresa as E inner join area as A 
			on a.idempresa = e.id where a.idempresa=dato;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAspecto` ()   begin
	SELECT * FROM 
        aspectos_seguridad where is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarcatactivo` ()   begin
	SELECT CA.id,CA.categoria,CA.estado,CA.idtipo,
TA.tipo FROM categoria_activo as CA inner join 
tipo_activo as TA on CA.idtipo=TA.id 
where CA.is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarclasinfo` ()   begin
	SELECT * FROM clasificacion_informacion where is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEmpresa` ()   begin
	SELECT * FROM empresa;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEmpresaByAcivo` ()   begin
	SELECT * FROM empresa where estado='1';
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMacroEmpresa` (IN `dato` INT)   begin
	SELECT M.id, m.macroproceso,E.empresa,A.area,U.unidad,M.estado,M.idempresa,
            M.idarea,M.idunidad
            from macroproceso as M inner join empresa as E on M.idempresa=e.id
                                    inner join area as A on M.idarea=A.id
                                    inner join unidades as U on M.idunidad=U.id where E.id = dato and M.is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMacroproceso` ()   begin
	SELECT M.id, m.macroproceso,E.empresa,A.area,U.unidad,M.estado,M.idempresa,
            M.idarea,M.idunidad
            from macroproceso as M inner join empresa as E on M.idempresa=e.id
                                    inner join area as A on M.idarea=A.id
                                    inner join unidades as U on M.idunidad=U.id and M.is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMacroprocesoByActivo` (IN `empresa` INT, IN `area` INT, IN `unidad` INT)   begin
	SELECT * FROM macroproceso  
            where estado='1' 
			and idempresa=empresa
			and idarea=area
            and idunidad=unidad;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarPosicion` ()   begin
	SELECT PP.id as id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
            E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto as PP inner join empresa as E
            on PP.idempresa=E.id inner join area as A on PP.idarea=A.id 
            inner join unidades as U on PP.idunidad=U.id where PP.is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarPosicionEmpresa` (IN `dato` INT)   begin
	SELECT PP.id as id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
            E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto as PP inner join empresa as E
            on PP.idempresa=E.id inner join area as A on PP.idarea=A.id 
            inner join unidades as U 
			on PP.idunidad=U.id where E.id=dato 
            and PP.is_deleted=0;




end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProceso` ()   begin
	SELECT P.id,P.proceso,E.empresa,A.area,U.unidad,m.macroproceso,P.estado,
            P.idempresa,P.idarea,P.idunidad,P.idmacroproceso
            from proceso as P inner join empresa as E on P.idempresa=e.id
                                    inner join area as A on P.idarea=A.id
                                    inner join unidades as U on P.idunidad=U.id												   
                                    inner join macroproceso as M on P.idmacroproceso = M.id and P.is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProcesoEmpresa` (IN `dato` INT)   begin
	SELECT P.id,P.proceso,E.empresa,A.area,U.unidad,m.macroproceso,P.estado,
            P.idempresa,P.idarea,P.idunidad,P.idmacroproceso
            from proceso as P inner join empresa as E on P.idempresa=e.id
                                    inner join area as A on P.idarea=A.id
                                    inner join unidades as U on P.idunidad=U.id												   
                                    inner join macroproceso as M on P.idmacroproceso = M.id 
									where e.id = dato and P.is_deleted=0;




end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listartipoactivo` ()   begin
	SELECT * FROM tipo_activo where is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarubiactivo` ()   begin
	SELECT UA.id,UA.continente,UA.pais,UA.ciudad,UA.estado,UA.direccion,
        UA.descripcion,C.PaisContinente,P.paisnombre ,CI.estadonombre FROM ubicacion_activo as UA 
        inner join continente as C on UA.continente=C.ContinenteCodigo inner join
        pais as P on UA.pais=P.id inner join ciudad as CI 
        on UA.ciudad=CI.id where UA.is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUnidadByActivo` (IN `idempresa` INT, IN `idarea` INT)   begin
	SELECT * FROM unidades 
            where estado='1' 
			and idempresa=idempresa
			and idarea=idarea;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUnidadByEstado` ()   begin
SELECT * FROM unidades where estado='1';

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUnidadEmpresa` (IN `dato` INT)   begin
	SELECT U.id,U.unidad,E.empresa,A.area,U.estado,U.idempresa,U.idarea
            from unidades as U inner join empresa as E on U.idempresa = e.id
                               inner join area as A on U.idarea = A.id 
							   where e.id  = dato and U.is_deleted=0;


end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUnidades` ()   begin
	SELECT U.id,U.unidad,E.empresa,A.area,U.estado,U.idempresa,U.idarea
            from unidades as U inner join empresa as E on U.idempresa = e.id
                               inner join area as A on U.idarea = A.id and U.is_deleted=0;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarValoracionActivo` ()   begin
	SELECT VA.id as id_valActivo,(select aspecto from aspectos_seguridad where id=VA.idaspecto1) as aspecto1,
        (select aspecto from aspectos_seguridad where id=VA.idaspecto2) as aspecto2, 
        (select aspecto from aspectos_seguridad where id=VA.idaspecto3) as aspecto3,VA.idaspecto1,VA.idaspecto2
        ,VA.idaspecto3,VA.estado,A.valor,VA.idvalor ,VA.valoracion1,VA.valoracion2,VA.valoracion3
        FROM valoracion_activo  as VA inner join valor_activo as A on VA.idvalor=A.id
        where VA.is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarValorActivo` ()   begin
	SELECT * FROM 
        valor_activo where is_deleted=0;



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_actividadesByPlan` (IN `id_planes` INT)   BEGIN
	select PA.id, 
		(select empresa from empresa where idempresa=id) as empresa,
		(select area from area where idarea=id) as area,
		(select unidad from unidades where idunidad=id) as unidad,
		(select posicion_puesto from posicion_puesto where idposicion=id) as posicion,
		(select nombres_us from tb_users where id_us=idusuario) as nombre,
		descripcion,
		fecha_inicio,
		fecha_fin	
	from actividades_plan as PA
	where is_deleted=0 and id_planes = id_planes;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_actividades_plan` (IN `id` INT)   BEGIN
	select AP.id,PA.idempresa,PA.idarea,PA.idunidad,PA.idposicion,PA.idusuario,PA.idalerta,
	(select empresa from empresa where id=PA.idempresa) as empresa,
	(select area from area where id=PA.idarea) as area,
	(select unidad from unidades where id=PA.idunidad) as unidad,
	(select posicion_puesto from posicion_puesto where id=PA.idposicion) as posicion,
	(select nombres_us from tb_users where id_us=AP.idusuario) as nombre,
	AP.descripcion,
	AP.fecha_inicio,
	AP.fecha_fin,AP.progreso
	from plan_accion as PA inner join actividades_plan as AP on PA.id=AP.id_planes
	where AP.is_deleted=0 and PA.id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_alert_seguimiento` ()   BEGIN
	SELECT * FROM alert_seguimiento where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_AplicacionImpacto` (IN `escenario` INT)   BEGIN
	select id,idclasificacion,(select caracteristica from caracteristica_control where id=idclasificacion) as disenio,
	posicion,descripcion,escenario
	from aplicacion_impacto  where is_deleted=0 and escenario=escenario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_AplicacionProbabilidad` (IN `escenario` INT)   BEGIN
	select id,idclasificacion,(select caracteristica from caracteristica_control where id=idclasificacion) as disenio,
	posicion,descripcion,escenario
	from aplicacion_probailidad 
	where is_deleted=0 and escenario=escenario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Automatizacion` ()   BEGIN
	SELECT * FROM automatizacion where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_caractControl` ()   BEGIN
	SELECT * FROM caracteristica_control where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_CaracteristicaOpera` ()   BEGIN
	SELECT * FROM caract_operatividad where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ClasificacionDise` ()   BEGIN
	SELECT * FROM clasificacion_dise where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ClasificacionOpera` ()   BEGIN
	SELECT * FROM clasi_operatividad where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Definicion` ()   BEGIN
	SELECT * FROM definicion where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_detalle_plan` (IN `id` INT)   BEGIN
	select count(*) as actividades from actividades_plan where id_planes= id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Diseño` ()   BEGIN
	SELECT * FROM diseño where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_estado` ()   BEGIN
	SELECT * FROM estado where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Evaluacion_Control` ()   BEGIN
	select id,idDisenio,(select caracteristica from caracteristica_control where id=idDisenio) as disenio,
	idOperatividad,(select caracteristica from caracteristica_control where id=idOperatividad) as operatividad,calificacion
	from evaluacion_control as EC 
	where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ImpactoRiesgoByActivo` ()   BEGIN
	SELECT *
	FROM impacto_riesgo
    where is_deleted=0 and estado=1 and tipo_regla='2 Valores'  order by valor1 ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Objetivo` ()   BEGIN
	SELECT * FROM objetivo where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Operatividad` ()   BEGIN
	SELECT * FROM operatividad where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_plan_accion` ()   BEGIN
	select id,plan_accion, 
	(SELECT COUNT(*) FROM actividades_plan WHERE id_planes = PA.id) as actividades,	
	descripcion,idarea,(select area from area where id = idarea) as responsable, idestado,
	(select estado from estado where id=idestado) as estado,
	idprioridad,(select prioridad from prioridad where id=idprioridad) as prioridad, fecha_inicio, fecha_fin 
	from plan_accion as PA
	where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_prioridad` ()   BEGIN
	SELECT *
	FROM prioridad where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ProbabilidadRiesgoByActivo` ()   BEGIN
	SELECT *
	FROM probabilidad_riesgo where is_deleted=0 and estado=1 and tipo_regla='2 Valores'  order by valor1 DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Prueba` ()   BEGIN
	SELECT * FROM prueba where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_riesgos` ()   BEGIN
	SELECT * FROM evaluacion_riesgo where is_deleted=0 and estado = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ValoracionRiesgo` ()   BEGIN
	select VR.id,VR.idProbabilidad,VR.idImpacto,VR.valor, 
	PR.descripcion as probabilidad, IR.descripcion as impacto
	from valoracion_riesgo as VR inner join probabilidad_riesgo as PR 
	on VR.idProbabilidad = PR.id inner join impacto_riesgo as IR on VR.idImpacto=IR.id
	where VR.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_actividades_plan` (IN `id` INT, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idposicion` INT, IN `idusuario` INT, IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATETIME, IN `fecha_fin` DATETIME, IN `idalerta` INT, IN `progreso` INT, IN `idUserModify` INT)   BEGIN
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
        date_modify = current_date()
		WHERE id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_AlertSeguimiento` (IN `alerta` VARCHAR(150), IN `valor` INT, IN `descripcion` VARCHAR(150), IN `idUserAdd` INT, IN `idAlerta` INT)   BEGIN
	UPDATE alert_seguimiento  SET
	alerta=alerta,
	valor=valor,
	descripcion= descripcion,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idAlerta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_AplicacionImpacto` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT, IN `idAplicacionImpacto` INT)   BEGIN
	UPDATE aplicacion_impacto  SET
	idclasificacion=disenio,
	posicion= posicion,
	descripcion= descripcion,
	escenario= escenario,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idAplicacionImpacto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_AplicacionProbabilidad` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT, IN `idAplicacionProbabilidad` INT)   BEGIN
	UPDATE aplicacion_probailidad  SET
	idclasificacion=disenio,
	posicion= posicion,
	descripcion= descripcion,
	escenario= escenario,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idAplicacionProbabilidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Automatizacion` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `peso` FLOAT, IN `estado` INT, IN `idUserAdd` INT, IN `idAutomatizacion` INT)   BEGIN
	UPDATE automatizacion  SET
	caracteristica=caracteristica,
	descripcion= descripcion,
	peso=peso,
	estado= estado,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idAutomatizacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_caractControl` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `estado` INT, IN `peso` VARCHAR(50), IN `valor` VARCHAR(50), IN `condicion` VARCHAR(50), IN `check_tabla` INT, IN `nom_tabla` VARCHAR(100), IN `calificacion` INT, IN `seleccionable` INT, IN `idUserAdd` INT, IN `idCaractControl` INT)   BEGIN
	UPDATE caracteristica_control  SET
	   caracteristica=caracteristica,
	   descripcion= descripcion,
	   estado= estado,
	   peso = peso,
	   valor = valor,
	   condicion = condicion,
	   check_tabla=check_tabla,
	   nom_tabla=nom_tabla,
	   clasificacion=calificacion,
	   seleccionable=seleccionable,
	   id_user_updated=idUserAdd,
	   date_modify=current_date() where id=idCaractControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_CaracteristicaOpera` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `idUserAdd` INT, IN `idClasificacionOpera` INT)   BEGIN
	UPDATE caract_operatividad  SET
	caracteristica=caracteristica,
	descripcion= descripcion,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idClasificacionOpera;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_ClasificacionDise` (IN `clasificacion` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `condicion` VARCHAR(50), IN `valor` INT, IN `idUserAdd` INT, IN `idClasificacionDise` INT)   BEGIN
	UPDATE clasificacion_dise  SET
	clasificacion=clasificacion,
	descripcion= descripcion,
	condicion=condicion,
	valor= valor,
	id_user_updated=idUserAdd,
	date_modify=CURRENT_DATE() where id=idClasificacionDise;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_ClasificacionOpera` (IN `clasificacion` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `condicion` VARCHAR(50), IN `valor` INT, IN `idUserAdd` INT, IN `idClasificacionOpera` INT)   BEGIN
	UPDATE clasi_operatividad  SET
	clasificacion=clasificacion,
	descripcion= descripcion,
	condicion=condicion,
	valor= valor,
	id_user_updated=idUserAdd,
	date_modify=CURRENT_DATE() where id=idClasificacionOpera;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_cobertura` (IN `cobertura` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `idUserAdd` INT, IN `idCobertura` INT)   BEGIN
	UPDATE cobertura  SET
	cobertura=cobertura,
	descripcion= descripcion,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idCobertura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Definicion` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `peso` FLOAT, IN `estado` INT, IN `idUserAdd` INT, IN `idDefinicion` INT)   BEGIN
	UPDATE definicion  SET
	caracteristica=caracteristica,
	descripcion= descripcion,
	peso=peso,
	estado= estado,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idDefinicion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_detalle_control` (IN `valor` VARCHAR(50), IN `idControl` INT, IN `idCC` INT)   BEGIN
	UPDATE  detalle_controles SET
	valor=valor WHERE idControles=idControl and idCC=idCC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Diseño` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `estado` INT, IN `idUserAdd` INT, IN `idDisenio` INT)   BEGIN
	UPDATE diseño  SET
	   caracteristica=caracteristica,
	   descripcion= descripcion,
	   estado= estado,
	   id_user_updated=idUserAdd,
	   date_modify=current_date() where id=idDisenio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_escenario_active` (IN `idEmpresa` INT, IN `user_id` INT, IN `scene` INT)   BEGIN
	UPDATE escenario_active
    set escenario=scene,
	id_user_updated=user_id,
	date_modify=current_date()
	where idEmpresa=idEmpresa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_estado` (IN `estado` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `idUserAdd` INT, IN `idEstado` INT)   BEGIN
	UPDATE estado  SET
	   estado=estado,
	   descripcion= descripcion,
	   id_user_updated=idUserAdd,
	   date_modify=current_date() where id=idEstado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Evaluacion_Control` (IN `calificacion` VARCHAR(50), IN `idUserAdd` INT, IN `idEvaluacionControl` INT)   BEGIN
	UPDATE evaluacion_control2  SET
	calificacion= calificacion,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=@idEvaluacionControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Objetivo` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `peso` FLOAT, IN `estado` INT, IN `idUserAdd` INT, IN `idObjetivo` INT)   BEGIN
	UPDATE objetivo  SET
	   caracteristica=caracteristica,
	   descripcion= descripcion,
	   peso=peso,
	   estado= estado,
	   id_user_updated=idUserAdd,
	   date_modify=current_date() where id=idObjetivo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Operatividad` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `estado` INT, IN `idUserAdd` INT, IN `idOperatividad` INT)   BEGIN
	UPDATE operatividad  SET
	   caracteristica=caracteristica,
	   descripcion= descripcion,
	   estado= estado,
	   id_user_updated=idUserAdd,
	   date_modify=CURRENT_DATE() where id=idOperatividad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_plan_accion` (IN `id` INT, IN `plan` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `fecha_ini` DATETIME, IN `fecha_fin` DATETIME, IN `empresa` INT, IN `area` INT, IN `unidad` INT, IN `posicion` INT, IN `usuario` INT, IN `prioridad` INT, IN `estado` INT, IN `alerta` INT, IN `idUserAdd` INT, IN `idriesgo` VARCHAR(150), IN `idcontrol` VARCHAR(150))   BEGIN
	update plan_accion SET
	plan_accion = plan,
	descripcion = descripcion,
	fecha_inicio = fecha_ini,
	fecha_fin = fecha_fin,
	idempresa = empresa,
	idarea = area,
	idunidad = unidad,
	idposicion = posicion,
	idusuario = usuario,
	idprioridad = prioridad,
	idestado = estado,
	idalerta=alerta,
	id_riesgo = idriesgo,
	id_control = idcontrol,
	id_user_updated = idUserAdd,
	date_modify = current_date()
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_prioridad` (IN `prioridad` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `idUserAdd` INT, IN `idPrioridad` INT)   BEGIN
	UPDATE prioridad  SET
	prioridad=prioridad,
	decripcion= descripcion,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idPrioridad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Prueba` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `peso` FLOAT, IN `estado` INT, IN `idUserAdd` INT, IN `idPrueba` INT)   BEGIN
	UPDATE prueba  SET
	caracteristica=caracteristica,
	descripcion= descripcion,
	peso=peso,
	estado= estado,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idPrueba;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_Registro_Controles` (IN `IDR` VARCHAR(100), IN `riesgo` VARCHAR(100), IN `IDC` VARCHAR(100), IN `control` VARCHAR(100), IN `cobertura` INT, IN `evaluacion` VARCHAR(100), IN `estado` INT, IN `idUserAdd` INT, IN `idControl` INT)   BEGIN
	UPDATE  registro_controles SET
	IDR= IDR,
	riesgo=riesgo,
	IDC=IDC,
	nom_control=control,
	idCobertura=cobertura,
	evaluacion=evaluacion,
	estado=estado,
	id_user_added=idUserAdd,
	date_add=current_date() WHERE id=idControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_ValoracionRiesgo` (IN `valor` VARCHAR(100), IN `probabilidad` INT, IN `impacto` INT, IN `idUserAdd` INT, IN `idValoracionRiesgo` INT)   BEGIN
	UPDATE valoracion_riesgo
    SET valor=valor,
	idProbabilidad= probabilidad,
	idImpacto= impacto,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idValoracionRiesgo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_categoria_vulnerabilidad` (IN `categoria` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into categoria_vulnerabilidad(categoria,estado,id_user_added,date_add)
	values (categoria,estado,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_desc_amenaza` (IN `idtipo_amenaza` INT, IN `amenaza` VARCHAR(150), IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into desc_amenaza(idtipo_amenaza,amenaza,id_user_added,date_add)
	values (idtipo_amenaza,amenaza,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_desc_vulnerabilidad` (IN `idcategoria` INT, IN `vulnerabilidad` VARCHAR(150), IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into desc_vulnerabilidad(idcategoria,vulnerabilidad,id_user_added,date_add)
	values (idcategoria,vulnerabilidad,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_evaluacion_riesgo` (IN `id_tipo_riesgo` INT, IN `id_empresa` INT, IN `id_area` INT, IN `id_unidad` INT, IN `id_macroproceso` INT, IN `id_proceso` INT, IN `id_activo` INT, IN `id_tipo_amenaza` INT, IN `id_descripcion_amenaza` INT, IN `id_tipo_vulnerabilidad` INT, IN `id_descripcion_vulnerabilidad` INT, IN `riesgo` VARCHAR(150), IN `valor_probabilidad` INT, IN `probabilidad` VARCHAR(150), IN `valor_impacto` VARCHAR(150), IN `impacto` VARCHAR(150), IN `valor` VARCHAR(150), IN `id_control` INT, IN `riesgo_controlado_probabilidad` VARCHAR(150), IN `riesgo_controlado_impacto` VARCHAR(150), IN `riesgo_controlado_valor` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into evaluacion_riesgo(
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
	date_add
	) values (
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
		date_add
	);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_evaluacion_riesgo_historial` (IN `id_tipo_riesgo` INT, IN `id_empresa` INT, IN `id_area` INT, IN `id_unidad` INT, IN `id_macroproceso` INT, IN `id_proceso` INT, IN `id_activo` INT, IN `id_tipo_amenaza` INT, IN `id_descripcion_amenaza` INT, IN `id_tipo_vulnerabilidad` INT, IN `id_descripcion_vulnerabilidad` INT, IN `riesgo` VARCHAR(150), IN `valor_probabilidad` INT, IN `probabilidad` VARCHAR(150), IN `valor_impacto` VARCHAR(150), IN `impacto` VARCHAR(150), IN `valor` VARCHAR(150), IN `id_control` INT, IN `riesgo_controlado_probabilidad` VARCHAR(150), IN `riesgo_controlado_impacto` VARCHAR(150), IN `riesgo_controlado_valor` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into evaluacion_riesgo_historial(
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
	date_add
	) values (
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
		date_add
	);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_impacto_1` (IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `escenario` INT, IN `formula` VARCHAR(150), IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into impacto_riesgo(descripcion,tipo_regla,tipo_valor,formula,comentario,estado,escenario,id_user_added,date_add)
	values (descripcion,tipo_regla,tipo_valor,formula,comentario,estado,escenario,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_impacto_2` (IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `comentario` VARCHAR(150), IN `estado` INT, IN `escenario` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into impacto_riesgo(descripcion,tipo_regla,tipo_valor,operador1,valor1,operador2,valor2,comentario,estado,escenario,id_user_added,date_add)
	values (descripcion,tipo_regla,tipo_valor,operador1,valor1,operador2,valor2,comentario,estado,escenario,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_inventario_clasificacion_activo` (IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idmacroproceso` INT, IN `idproceso` INT, IN `activo` VARCHAR(150), IN `desc_activo` VARCHAR(500), IN `idtipo_activo` INT, IN `idcategoria_activo` INT, IN `idubicacion` INT, IN `idpropietario` INT, IN `idcustodio` INT, IN `val_c` INT, IN `val_i` INT, IN `val_d` INT, IN `idvalor` INT, IN `estado` INT, IN `comentario` VARCHAR(500), IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
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
	date_add
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
		date_add
	);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_inventario_clasificacion_activo_historial` (IN `id_ica` INT, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idmacroproceso` INT, IN `idproceso` INT, IN `activo` VARCHAR(150), IN `desc_activo` VARCHAR(500), IN `idtipo_activo` INT, IN `idcategoria_activo` INT, IN `idubicacion` INT, IN `idpropietario` INT, IN `idcustodio` INT, IN `val_c` INT, IN `val_i` INT, IN `val_d` INT, IN `idvalor` INT, IN `estado` INT, IN `comentario` VARCHAR(500), IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into inventario_clasificacion_activo_historial(
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
	date_add
	) values(
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
		date_add
	);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_nivel_riesgo` (IN `descripcion` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `color` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into nivel_riesgo(descripcion,operador1,valor1,operador2,valor2,color,comentario,estado,id_user_added,date_add)
	values (descripcion,operador1,valor1,operador2,valor2,color,comentario,estado,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_probabilidad_1` (IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `escenario` INT, IN `formula` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into probabilidad_riesgo(formula,descripcion,tipo_regla,tipo_valor,comentario,estado,escenario,id_user_added,date_add)
	values (formula,descripcion,tipo_regla,tipo_valor,comentario,estado,escenario,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_probabilidad_2` (IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `comentario` VARCHAR(150), IN `estado` INT, IN `escenario` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into probabilidad_riesgo(descripcion,tipo_regla,tipo_valor,operador1,valor1,operador2,valor2,comentario,estado,escenario,id_user_added,date_add)
	values (descripcion,tipo_regla,tipo_valor,operador1,valor1,operador2,valor2,comentario,estado,escenario,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_tipo_amenaza` (IN `tipo` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into tipo_amenaza(tipo,estado,id_user_added,date_add)
	values (tipo,estado,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_plan_accion` (IN `plan_accion` VARCHAR(150), IN `actividades` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `fecha_inicio` DATETIME, IN `fecha_fin` DATETIME, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idposicion` INT, IN `id_user` INT)   BEGIN
	set @fecha_actual = current_date();
    
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
        date_add
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_count_evaluacion_by_valor` ()   BEGIN
	select count(*) as cantidad,er.valor
	from evaluacion_riesgo er
	inner join inventario_clasificacion_activo ica on ica.id=er.id_activo
	where er.estado=1 and er.is_deleted=0 and ica.is_deleted=0
	group by er.valor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_categoria_vulnerabilidad` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update categoria_vulnerabilidad
	set is_deleted=1,
	estado=2,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_desc_amenaza` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update desc_amenaza
	set is_deleted=1,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_desc_vulnerabilidad` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update desc_vulnerabilidad
	set is_deleted=1,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_evaluacion_riesgo` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update evaluacion_riesgo
	set is_deleted=1,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_impacto` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update impacto_riesgo
	set is_deleted=1,estado=2,id_user_deleted=id_user_deleted,date_deleted=date_deleted
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_inventario_clasificacion_activo` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update inventario_clasificacion_activo
	set is_deleted=1,id_user_deleted=id_user_deleted,date_deleted=date_deleted
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_nivel_riesgo` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update nivel_riesgo
	set is_deleted=1,
	estado=2,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_probabilidad` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update probabilidad_riesgo
	set is_deleted=1,estado=2,id_user_deleted=id_user_deleted,date_deleted=date_deleted
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_tipo_amenaza` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update tipo_amenaza
	set is_deleted=1,
	estado=2,
	id_user_deleted=id_user_deleted,
	date_deleted=date_deleted
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_tipo_riesgo` (IN `id` INT, IN `id_user_deleted` INT, IN `date_deleted` DATETIME)   BEGIN
	update tipo_riesgo
	set estado=2,is_deleted=1,id_user_deleted=id_user_deleted,date_deleted=date_deleted
	where id=id;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_categoria_vulnerabilidad` (IN `id` INT, IN `categoria` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update categoria_vulnerabilidad
	set categoria=categoria,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_desc_amenaza` (IN `id` INT, IN `idtipo_amenaza` INT, IN `amenaza` VARCHAR(150), IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update desc_amenaza
	set idtipo_amenaza=idtipo_amenaza,
	amenaza=amenaza,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_desc_vulnerabilidad` (IN `id` INT, IN `idcategoria` INT, IN `vulnerabilidad` VARCHAR(150), IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update desc_vulnerabilidad
	set idcategoria=idcategoria,
	vulnerabilidad=vulnerabilidad,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_impacto_1` (IN `id` INT, IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `formula` VARCHAR(150), IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update impacto_riesgo
	set formula=formula,descripcion=descripcion,tipo_regla=tipo_regla,tipo_valor=tipo_valor,comentario=comentario,estado=estado,id_user_updated=id_user_updated,date_modify=date_modify
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_impacto_2` (IN `id` INT, IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `comentario` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update impacto_riesgo
	set descripcion=descripcion,
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
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_inventario_clasificacion_activo` (IN `id` INT, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idmacroproceso` INT, IN `idproceso` INT, IN `activo` VARCHAR(150), IN `desc_activo` VARCHAR(500), IN `idtipo_activo` INT, IN `idcategoria_activo` INT, IN `idubicacion` INT, IN `idpropietario` INT, IN `idcustodio` INT, IN `val_c` INT, IN `val_i` INT, IN `val_d` INT, IN `idvalor` INT, IN `estado` INT, IN `comentario` VARCHAR(500), IN `id_user_updated` INT, IN `date_modify` DATETIME, IN `observacion` VARCHAR(200))   BEGIN
	update inventario_clasificacion_activo
	set idempresa=idempresa,
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
	observacion=observacion
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_nivel_riesgo` (IN `id` INT, IN `descripcion` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `color` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update nivel_riesgo
	set descripcion=descripcion,
	operador1=operador1,
	operador2=operador2,
	valor1=valor1,
	valor2=valor2,
	color=color,
	comentario=comentario,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_probabilidad_1` (IN `id` INT, IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `comentario` VARCHAR(150), IN `estado` INT, IN `formula` VARCHAR(150), IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update probabilidad_riesgo
	set formula=formula,descripcion=descripcion,tipo_regla=tipo_regla,tipo_valor=tipo_valor,comentario=comentario,estado=estado,id_user_updated=id_user_updated,date_modify=date_modify
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_probabilidad_2` (IN `id` INT, IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `comentario` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update probabilidad_riesgo
	set descripcion=descripcion,
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
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_tipo_amenaza` (IN `id` INT, IN `tipo` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update tipo_amenaza
	set tipo=tipo,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_active_escenario_1` (IN `caracteristica` VARCHAR(50), IN `escene` INT)   BEGIN
	select * from probabilidad_riesgo where estado=1 and is_deleted=0 and escenario=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_active_impacto_escenario_1` (IN `caracteristica` VARCHAR(50), IN `escene` INT)   BEGIN
	select * from impacto_riesgo where estado=1 and is_deleted=0 and escenario=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_aplicacion_impacto_by_caracteristica` (IN `caracteristica` VARCHAR(50), IN `escene` INT)   BEGIN
	select ai.*,cc.caracteristica
	from aplicacion_impacto ai
	inner join caracteristica_control cc on cc.id = ai.idclasificacion
	where cc.caracteristica=caracteristica and ai.is_deleted=0 and escenario=escene;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_aplicacion_probabilidad_by_caracteristica` (IN `caracteristica` VARCHAR(50), IN `escene` INT)   BEGIN
	select ap.*,cc.caracteristica
	from aplicacion_probailidad ap
	inner join caracteristica_control cc on cc.id = ap.idclasificacion
	where cc.caracteristica=caracteristica and ap.is_deleted=0 and escenario=escene;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_evaluacion_riesgo_by_id` (IN `id` INT)   BEGIN
	select * from evaluacion_riesgo where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impacto_by_description` (IN `description` VARCHAR(50))   BEGIN
	select * from impacto_riesgo
	where descripcion=description and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_info_to_email` (IN `id` INT)   BEGIN
	select
	ica.id as ica_id,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario as propietario,
	pp.posicion_puesto as des_propietario,
	ica.idcustodio as custodio,
	ica.observacion as observacion,
	pp1.posicion_puesto as des_custodio,
	ica.val_c as val_c,
	ica.val_i as val_i,
	ica.val_d as val_d,
	ica.estado as ica_estado,
	ica.comentario as ica_comentario,
	e.id as id_empresa,
	e.empresa as empresa,
	a.id as id_area,
	a.area as area,
	u.id as id_unidad,
	u.unidad as unidad,
	m.id as id_macroproceso,
	m.macroproceso as macroproceso,
	p.id as id_proceso,
	p.proceso as proceso,
	ta.id as id_tipo_activo,
	ta.tipo as tipo_activo,
	ca.id as id_categoria_activo,
	ca.categoria as categoria_activo,
	ua.id as ubicacion_id,
	ua.continente as ubicacion_continente,
	ua.pais as ubicacion_pais,
	ua.ciudad as ubicacion_ciudad,
	ua.direccion as ubicacion_direccion,
	ua.descripcion as ubicacion_descripcion,
	va.id as id_valor,
	va.valor as valor
	from inventario_clasificacion_activo as ica
	inner join empresa as e on e.id=ica.idempresa
	inner join area as a on a.id=ica.idarea
	inner join unidades as u on u.id=ica.idunidad
	inner join macroproceso as m on m.id=ica.idmacroproceso
	inner join proceso as p on p.id=ica.idproceso
	inner join tipo_activo as ta on ta.id=ica.idtipo_activo
	inner join categoria_activo as ca on ca.id=ica.idcategoria_activo
	inner join ubicacion_activo as ua on ua.id=ica.idubicacion
	inner join valor_activo as va on va.id=ica.idvalor
	inner join posicion_puesto as pp on pp.id=ica.idpropietario
	inner join posicion_puesto as pp1 on pp1.id=ica.idcustodio
	where ica.id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_inventario_clasificacion_activo` (IN `id` INT)   BEGIN
	select * from inventario_clasificacion_activo where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_last_id` ()   BEGIN
	select * from inventario_clasificacion_activo order by id desc limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_probabilidad_by_description` (IN `description` VARCHAR(50))   BEGIN
	select * from probabilidad_riesgo
	where descripcion=description and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_valoracion_riesgo` (IN `id_probabilidad` INT, IN `id_impacto` INT)   BEGIN
	select * from valoracion_riesgo where idProbabilidad=id_probabilidad and idImpacto=id_impacto and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_valor_combinacion_valoracion` (IN `val_c` INT, IN `val_i` INT, IN `val_d` INT)   BEGIN
	select vac.id,vac.valor from valoracion_activo va
	inner join valor_activo vac on va.idvalor=vac.id
	where va.valoracion1=val_c and va.valoracion2=val_i and valoracion3=val_d;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tipo_riesgo` (IN `tipo_riesgo` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   BEGIN
	insert into tipo_riesgo(tipo_riesgo,descripcion,estado,id_user_added,date_add) VALUES(tipo_riesgo,descripcion,estado,id_user_added,date_add);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_categoria_vulnerabilidad` ()   BEGIN
	select * from categoria_vulnerabilidad where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_desc_amenaza` ()   BEGIN
	select * from desc_amenaza where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_desc_vulnerabilidad` ()   BEGIN
	select * from desc_vulnerabilidad where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_evaluacion_riesgo` ()   BEGIN
	select * from evaluacion_riesgo where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_evaluacion_riesgo_historial` ()   BEGIN
	select
		erh.id as id,
		tipo_riesgo.tipo_riesgo as tipo_riesgo,
		empresa.empresa as empresa,
		area.area as area,
		unidades.unidad as unidad,
		macroproceso.macroproceso as macroproceso,
		proceso.proceso as proceso,
		iva.activo as activo,
		ta.tipo as tipo_amenaza,
		da.amenaza as descripcion_amenaza,
		ca.categoria as tipo_vulnerabilidad,
		dv.vulnerabilidad as descripcion_vulnerabilidad,
		erh.riesgo as riesgo,
		erh.valor_probabilidad as valor_probabilidad,
		erh.probabilidad as probabilidad,
		erh.valor_impacto as valor_impacto,
		erh.impacto as impacto,
		erh.valor as valor,
		erh.id_control as control,
		erh.riesgo_controlado_probabilidad as riesgo_controlado_probabilidad,
		erh.riesgo_controlado_impacto as riesgo_controlado_impacto,
		erh.riesgo_controlado_valor as riesgo_controlado_valor,
		erh.date_add as date_add
	from evaluacion_riesgo_historial erh
	inner join empresa on empresa.id=erh.id_empresa
	inner join tipo_riesgo on tipo_riesgo.id=erh.id_tipo_riesgo
	inner join area on area.id=erh.id_area
	inner join unidades on unidades.id=erh.id_unidad
	inner join macroproceso on macroproceso.id=erh.id_macroproceso
	inner join proceso on proceso.id = erh.id_proceso
	inner join inventario_clasificacion_activo iva on iva.id=erh.id_activo
	inner join tipo_amenaza ta on ta.id=erh.id_tipo_amenaza
	inner join desc_amenaza da on da.id=erh.id_descripcion_amenaza
	inner join categoria_vulnerabilidad ca on ca.id=erh.id_tipo_vulnerabilidad
	inner join desc_vulnerabilidad dv on dv.id=erh.id_descripcion_vulnerabilidad
	where erh.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_ica_by_valoracion` (IN `val_c` INT, IN `val_i` INT, IN `val_d` INT)   BEGIN
	select ica.* from inventario_clasificacion_activo ica
	where ica.val_c=val_c and ica.val_i=val_i and ica.val_d=val_d;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_impacto` (IN `escenario` INT)   BEGIN
	select * from impacto_riesgo where escenario=escenario and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo` ()   BEGIN
	select
	ica.id as ica_id,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario as propietario,
	pp.posicion_puesto as des_propietario,
	ica.idcustodio as custodio,
	ica.observacion as observacion,
	pp1.posicion_puesto as des_custodio,
	ica.val_c as val_c,
	ica.val_i as val_i,
	ica.val_d as val_d,
	ica.estado as ica_estado,
	ica.comentario as ica_comentario,
	e.id as id_empresa,
	e.empresa as empresa,
	a.id as id_area,
	a.area as area,
	u.id as id_unidad,
	u.unidad as unidad,
	m.id as id_macroproceso,
	m.macroproceso as macroproceso,
	p.id as id_proceso,
	p.proceso as proceso,
	ta.id as id_tipo_activo,
	ta.tipo as tipo_activo,
	ca.id as id_categoria_activo,
	ca.categoria as categoria_activo,
	ua.id as ubicacion_id,
	ua.continente as ubicacion_continente,
	ua.pais as ubicacion_pais,
	ua.ciudad as ubicacion_ciudad,
	ua.direccion as ubicacion_direccion,
	ua.descripcion as ubicacion_descripcion,
	va.id as id_valor,
	va.valor as valor
	from inventario_clasificacion_activo as ica
	inner join empresa as e on e.id=ica.idempresa
	inner join area as a on a.id=ica.idarea
	inner join unidades as u on u.id=ica.idunidad
	inner join macroproceso as m on m.id=ica.idmacroproceso
	inner join proceso as p on p.id=ica.idproceso
	inner join tipo_activo as ta on ta.id=ica.idtipo_activo
	inner join categoria_activo as ca on ca.id=ica.idcategoria_activo
	inner join ubicacion_activo as ua on ua.id=ica.idubicacion
	inner join valor_activo as va on va.id=ica.idvalor
	inner join posicion_puesto as pp on pp.id=ica.idpropietario
	inner join posicion_puesto as pp1 on pp1.id=ica.idcustodio
	where ica.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo_by_user` (IN `id_user` INT)   BEGIN
	select
	ica.id as ica_id,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario as propietario,
	pp.posicion_puesto as des_propietario,
	ica.idcustodio as custodio,
	ica.observacion as observacion,
	pp1.posicion_puesto as des_custodio,
	ica.val_c as val_c,
	ica.val_i as val_i,
	ica.val_d as val_d,
	ica.estado as ica_estado,
	ica.comentario as ica_comentario,
	e.id as id_empresa,
	e.empresa as empresa,
	a.id as id_area,
	a.area as area,
	u.id as id_unidad,
	u.unidad as unidad,
	m.id as id_macroproceso,
	m.macroproceso as macroproceso,
	p.id as id_proceso,
	p.proceso as proceso,
	ta.id as id_tipo_activo,
	ta.tipo as tipo_activo,
	ca.id as id_categoria_activo,
	ca.categoria as categoria_activo,
	ua.id as ubicacion_id,
	ua.continente as ubicacion_continente,
	ua.pais as ubicacion_pais,
	ua.ciudad as ubicacion_ciudad,
	ua.direccion as ubicacion_direccion,
	ua.descripcion as ubicacion_descripcion,
	va.id as id_valor,
	va.valor as valor
	from inventario_clasificacion_activo as ica
	inner join empresa as e on e.id=ica.idempresa
	inner join area as a on a.id=ica.idarea
	inner join unidades as u on u.id=ica.idunidad
	inner join macroproceso as m on m.id=ica.idmacroproceso
	inner join proceso as p on p.id=ica.idproceso
	inner join tipo_activo as ta on ta.id=ica.idtipo_activo
	inner join categoria_activo as ca on ca.id=ica.idcategoria_activo
	inner join ubicacion_activo as ua on ua.id=ica.idubicacion
	inner join valor_activo as va on va.id=ica.idvalor
	inner join posicion_puesto as pp on pp.id=ica.idpropietario
	inner join posicion_puesto as pp1 on pp1.id=ica.idcustodio
	where ica.is_deleted=0 and ica.id_user_added=id_user;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo_historial` ()   BEGIN
	select
	ica.id_ica as ica_id,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario as propietario,
	pp.posicion_puesto as des_propietario,
	ica.idcustodio as custodio,
	ica.observacion as observacion,
	ica.date_add as date_created,
	pp1.posicion_puesto as des_custodio,
	ica.val_c as val_c,
	ica.val_i as val_i,
	ica.val_d as val_d,
	ica.estado as ica_estado,
	ica.comentario as ica_comentario,
	e.id as id_empresa,
	e.empresa as empresa,
	a.id as id_area,
	a.area as area,
	u.id as id_unidad,
	u.unidad as unidad,
	m.id as id_macroproceso,
	m.macroproceso as macroproceso,
	p.id as id_proceso,
	p.proceso as proceso,
	ta.id as id_tipo_activo,
	ta.tipo as tipo_activo,
	ca.id as id_categoria_activo,
	ca.categoria as categoria_activo,
	ua.id as ubicacion_id,
	ua.continente as ubicacion_continente,
	ua.pais as ubicacion_pais,
	ua.ciudad as ubicacion_ciudad,
	ua.direccion as ubicacion_direccion,
	ua.descripcion as ubicacion_descripcion,
	va.id as id_valor,
	va.valor as valor
	from inventario_clasificacion_activo_historial as ica
	inner join empresa as e on e.id=ica.idempresa
	inner join area as a on a.id=ica.idarea
	inner join unidades as u on u.id=ica.idunidad
	inner join macroproceso as m on m.id=ica.idmacroproceso
	inner join proceso as p on p.id=ica.idproceso
	inner join tipo_activo as ta on ta.id=ica.idtipo_activo
	inner join categoria_activo as ca on ca.id=ica.idcategoria_activo
	inner join ubicacion_activo as ua on ua.id=ica.idubicacion
	inner join valor_activo as va on va.id=ica.idvalor
	inner join posicion_puesto as pp on pp.id=ica.idpropietario
	inner join posicion_puesto as pp1 on pp1.id=ica.idcustodio
	where ica.is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo_historial_by_user` (IN `id_user` INT)   BEGIN
	select
	ica.id_ica as ica_id,
	ica.activo,
	ica.desc_activo,
	ica.idpropietario as propietario,
	ica.date_add as date_created,
	pp.posicion_puesto as des_propietario,
	ica.idcustodio as custodio,
	ica.observacion as observacion,
	pp1.posicion_puesto as des_custodio,
	ica.val_c as val_c,
	ica.val_i as val_i,
	ica.val_d as val_d,
	ica.estado as ica_estado,
	ica.comentario as ica_comentario,
	e.id as id_empresa,
	e.empresa as empresa,
	a.id as id_area,
	a.area as area,
	u.id as id_unidad,
	u.unidad as unidad,
	m.id as id_macroproceso,
	m.macroproceso as macroproceso,
	p.id as id_proceso,
	p.proceso as proceso,
	ta.id as id_tipo_activo,
	ta.tipo as tipo_activo,
	ca.id as id_categoria_activo,
	ca.categoria as categoria_activo,
	ua.id as ubicacion_id,
	ua.continente as ubicacion_continente,
	ua.pais as ubicacion_pais,
	ua.ciudad as ubicacion_ciudad,
	ua.direccion as ubicacion_direccion,
	ua.descripcion as ubicacion_descripcion,
	va.id as id_valor,
	va.valor as valor
	from inventario_clasificacion_activo_historial as ica
	inner join empresa as e on e.id=ica.idempresa
	inner join area as a on a.id=ica.idarea
	inner join unidades as u on u.id=ica.idunidad
	inner join macroproceso as m on m.id=ica.idmacroproceso
	inner join proceso as p on p.id=ica.idproceso
	inner join tipo_activo as ta on ta.id=ica.idtipo_activo
	inner join categoria_activo as ca on ca.id=ica.idcategoria_activo
	inner join ubicacion_activo as ua on ua.id=ica.idubicacion
	inner join valor_activo as va on va.id=ica.idvalor
	inner join posicion_puesto as pp on pp.id=ica.idpropietario
	inner join posicion_puesto as pp1 on pp1.id=ica.idcustodio
	inner join inventario_clasificacion_activo as ic on ic.id=ica.id_ica
	where ica.is_deleted=0 and ic.id_user_added=id_user;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_nivel_riesgo` ()   BEGIN
	select * from nivel_riesgo where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_probabilidad` (IN `escenario` INT)   BEGIN
	select * from probabilidad_riesgo where escenario=escenario and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_tipo_amenaza` ()   BEGIN
	select * from tipo_amenaza where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_tipo_riesgo` ()   BEGIN
	select * from tipo_riesgo where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_evaluacion_riesgo` (IN `id` INT, IN `id_tipo_riesgo` INT, IN `id_empresa` INT, IN `id_area` INT, IN `id_unidad` INT, IN `id_macroproceso` INT, IN `id_proceso` INT, IN `id_activo` INT, IN `id_tipo_amenaza` INT, IN `id_descripcion_amenaza` INT, IN `id_tipo_vulnerabilidad` INT, IN `id_descripcion_vulnerabilidad` INT, IN `riesgo` VARCHAR(150), IN `valor_probabilidad` INT, IN `probabilidad` VARCHAR(150), IN `valor_impacto` VARCHAR(150), IN `impacto` VARCHAR(150), IN `valor` VARCHAR(150), IN `id_control` INT, IN `riesgo_controlado_probabilidad` VARCHAR(150), IN `riesgo_controlado_impacto` VARCHAR(150), IN `riesgo_controlado_valor` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update evaluacion_riesgo
	set 
	id_tipo_riesgo=id_tipo_riesgo,
	id_empresa=id_empresa,
	id_area=id_area,
	id_unidad=id_unidad,
	id_macroproceso=id_macroproceso,
	id_proceso=id_proceso,
	id_activo=id_activo,
	id_tipo_amenaza=id_tipo_amenaza,
	id_descripcion_amenaza=id_descripcion_amenaza,
	id_tipo_vulnerabilidad=id_tipo_vulnerabilidad,
	id_descripcion_vulnerabilidad=id_descripcion_vulnerabilidad,
	riesgo=riesgo,
	valor_probabilidad=valor_probabilidad,
	probabilidad=probabilidad,
	valor_impacto=valor_impacto,
	impacto=impacto,
	valor=valor,
	id_control=id_control,
	riesgo_controlado_probabilidad=riesgo_controlado_probabilidad,
	riesgo_controlado_impacto=riesgo_controlado_impacto,
	riesgo_controlado_valor=riesgo_controlado_valor,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_scene_probabilidad_user` (IN `user_id` INT, IN `scene` INT)   BEGIN
	update escenario_active set escenario=scene;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_tipo_riesgo` (IN `id` INT, IN `tipo_riesgo` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   begin
	update tipo_riesgo
	set tipo_riesgo=tipo_riesgo,descripcion=descripcion,estado=estado,id_user_updated=id_user_updated,date_modify=date_modify
	where id=id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validate_combinatoria_impacto` (IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT)   begin
	select * from impacto_riesgo
	where operador1=operador1 and valor1=valor1
	and operador2=operador2 and valor2=valor2 and estado=1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validate_combinatoria_probabilidad` (IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT)   begin
	select * from probabilidad_riesgo
	where operador1=operador1 and valor1=valor1
	and operador2=operador2 and valor2=valor2 and estado=1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_status_ica` (IN `id` INT, IN `estado` INT, IN `date_modify` DATETIME, IN `id_user_updated` INT)   begin
	update inventario_clasificacion_activo
	set estado=estado,id_user_updated=id_user_updated,date_modify=date_modify
	where id=id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_valor_ica` (IN `id` INT, IN `id_valor` INT)   begin
	update inventario_clasificacion_activo
	set idvalor=id_valor
	where id=id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaAlerta_seguimiento` (IN `alert` VARCHAR(50))   begin
	  SELECT * FROM alert_seguimiento where alerta=alert;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaArea` (IN `area` VARCHAR(150), IN `empresa` INT)   begin
	select * from area   where idempresa =empresa
    and area=area;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaAspecto` (IN `aspecto` VARCHAR(150))   begin
	 SELECT * FROM aspectos_seguridad where 
         aspecto=aspecto and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaCatActivo` (IN `categoria` VARCHAR(150), IN `tipo` INT)   begin
	SELECT * FROM categoria_activo 
            where idtipo=tipo and 
			categoria=categoria and
            is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaClasInfo` (IN `clasificacion` VARCHAR(150))   begin
SELECT * FROM clasificacion_informacion 
            where clasificacion=clasificacion and
            is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaEmpresa` (IN `empresa` VARCHAR(150))   begin
	select * from empresa  where empresa =empresa;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaEstado` (IN `estado` VARCHAR(50))   begin
	  SELECT * FROM estado where estado=estado;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaMacroproceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` VARCHAR(150))   begin
	SELECT * FROM macroproceso where 
          idempresa=empresa and
		idarea = area and idunidad=unidad
		and macroproceso=macroproceso;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaPlanAccion` (IN `plan_accion` VARCHAR(150))   begin
	  SELECT * FROM plan_accion where plan_accion=plan_accion;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaPosicion` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `posicion` VARCHAR(150))   begin
	SELECT * FROM posicion_puesto where 
          idempresa=empresa and
		idarea = area and idunidad=unidad
		and posicion_puesto=posicion and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaPrioridad` (IN `prioridad1` VARCHAR(150))   begin
	select * from prioridad where prioridad=prioridad1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaProceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` INT, IN `proceso` VARCHAR(150))   begin
	SELECT * FROM proceso where 
		idmacroproceso=macroproceso and
          idempresa=empresa and
		idarea = area and idunidad=unidad
		and proceso=proceso and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaTipoActivo` (IN `tipo` VARCHAR(150))   begin
	SELECT * FROM tipo_activo 
            where tipo=tipo and
            is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaUbiActivo` (IN `continente` VARCHAR(50), IN `pais` VARCHAR(50), IN `ciudad` VARCHAR(50), IN `direccion` VARCHAR(300), IN `descripcion` VARCHAR(300))   begin
	SELECT * FROM ubicacion_activo 
            where continente=continente and 
			pais=pais and
			ciudad= ciudad and
			direccion=direccion and
			descripcion = descripcion and
            is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaUnidad` (IN `area` INT, IN `empresa` INT, IN `unidad` VARCHAR(150))   begin
	SELECT * FROM unidades where 
          idempresa=empresa and
		idarea = area and unidad=unidad;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaValoracionActivo` (IN `aspecto1` INT, IN `aspecto2` INT, IN `aspecto3` INT, IN `valoracion1` INT, IN `valoracion2` INT, IN `valoracion3` INT, IN `idvalor` INT)   begin
	SELECT * FROM valoracion_activo 
            where idaspecto1=aspecto1
            and idaspecto2= aspecto2
            and idaspecto3=aspecto3
            and idvalor=idvalor
            and valoracion1=valoracion1
            and valoracion2=valoracion2
            and valoracion3=valoracion3 and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaValorActivo` (IN `valor` VARCHAR(150))   begin
	 SELECT * FROM valor_activo where 
         valor=valor and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_AplicacionImpacto` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT)   begin
	 SELECT *
	FROM aplicacion_impacto where idclasificacion=disenio and 
	posicion=posicion and escenario=escenario and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_AplicacionProbabilidad` (IN `disenio` INT, IN `posicion` VARCHAR(50), IN `escenario` INT)   begin
	SELECT *
	FROM aplicacion_probailidad where idclasificacion=disenio and 
	posicion=posicion and escenario=escenario and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_Automatizacion` (IN `caracteristica` VARCHAR(50), IN `peso` FLOAT)   begin
	SELECT *
	FROM automatizacion where caracteristica=caracteristica and peso=peso and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_caractControl` (IN `caracteristica` VARCHAR(50), IN `idOpcion` INT)   begin
	SELECT *
	FROM caracteristica_control where caracteristica=caracteristica and is_deleted=0 and idOpcion = idOpcion;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_CaracteristicaOpera` (IN `caracteristica` VARCHAR(50))   begin
	SELECT *
	FROM caract_operatividad where caracteristica=caracteristica and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_ClasificacionDise` (IN `clasificacion` VARCHAR(50), IN `condicion` VARCHAR(10), IN `valor` INT)   begin
	SELECT *
	FROM clasificacion_dise
    where clasificacion=clasificacion and condicion=condicion and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_ClasificacionOpera` (IN `clasificacion` VARCHAR(50), IN `condicion` VARCHAR(10), IN `valor` INT)   begin
	SELECT *
	FROM clasi_operatividad
    where clasificacion=clasificacion and condicion=condicion and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_Diseño` (IN `caracteristica` VARCHAR(50))   begin
	 SELECT * FROM diseño where caracteristica=caracteristica and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_Evaluacion_Control` (IN `disenio` INT, IN `operatividad` INT, IN `calificacion` VARCHAR(50))   begin
	SELECT *
	FROM evaluacion_control
    where idDisenio=disenio and 
	idOperatividad=operatividad and calificacion=calificacion and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_Objetivo` (IN `caracteristica` VARCHAR(50), IN `peso` FLOAT)   begin
	  SELECT * FROM objetivo where caracteristica=caracteristica and peso=peso and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_Operatividad` (IN `caracteristica` VARCHAR(50))   begin
	SELECT * FROM operatividad where caracteristica=caracteristica and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_Prueba` (IN `caracteristica` VARCHAR(50), IN `peso` FLOAT)   begin
	  SELECT * FROM prueba where caracteristica=caracteristica and peso=peso and is_deleted=0 ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_ValoracionRiesgo` (IN `probabilidad` INT, IN `impacto` INT)   begin
	  SELECT *
	  FROM valoracion_riesgo where 
	  idProbabilidad=probabilidad and IdImpacto=impacto;
end$$

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
(10, 'RRHH', 1, 10, NULL, '2023-03-21 00:00:00.000000', NULL, NULL, NULL, NULL, 0);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `ubicacionpaisid` int(11) DEFAULT NULL,
  `estadonombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 45, 15, 30, 8, 12, 1, 1, 1, '2023-03-22 00:59:24.000000', NULL, 3, 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continente`
--

CREATE TABLE `continente` (
  `ContinenteCodigo` char(50) NOT NULL DEFAULT '',
  `PaisContinente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_evaluacion_control`
--

CREATE TABLE `detalle_evaluacion_control` (
  `id` int(11) NOT NULL,
  `IEC` int(11) DEFAULT NULL,
  `ID_CC` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(10, 'Financiera Efectisa SA', 1, NULL, '2023-03-21 00:00:00.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 1),
(2, 1);

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
  `is_deleted` int(11) DEFAULT 0
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
  `is_deleted` int(11) DEFAULT 0
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
(3, 'Edge 111.0.1661.44', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-22 02:51:35.000000');

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
  `date_add` int(11) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` int(11) DEFAULT NULL,
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
(39, 11, 1, 1, 1, 1, 'tb_item', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0);

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
(1, '$2y$10$OVoz4fljMdFFP32OdaG12.kvCajp2ghZIDoudWV4MlfQbPxubaSJS', 3, '2023-03-22 00:08:34.000000', '1683349714.000000'),
(2, '$2y$10$8nEQ5rrflhrpvlfM/ac2/.jk4ljLvuo4f6IQ0PHze8dFDunb6Yek6', 4, '2023-03-22 00:30:49.000000', '1683351049.000000'),
(3, '$2y$10$0nbCT9wSCcFwwxmt6jkPZ.UAqhUYhnH.mH1ByaNAD6cUI.k7aVFYq', 5, '2023-03-22 00:41:33.000000', '1683351693.000000'),
(4, '$2y$10$h.raTGdK2nnbqf1Gl5rq1Ox4P4Pou5H3sPyxbMvaWMPfyHylZp.9.', 5, '2023-03-22 01:42:42.000000', '1683355362.000000');

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
(30, 1, NULL, 7, 'Alerta de Seguimiento', '0000-00-00 00:00:00.000000');

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
  `date_add` int(11) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `is_user_negocio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_perfiles`
--

INSERT INTO `tb_perfiles` (`id_perfil`, `perfil`, `desc_perfil`, `est_perfil`, `creacion_perfil`, `actualizacion_perfil`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`, `is_user_negocio`) VALUES
(11, 'administrador', 'administrador de sistemas', 1, '2023-03-21 00:00:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);

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
(4, 5, '1679467586.000000', '1679471186.000000', '2023-03-22 01:46:26.000000', 1),
(5, 5, '1679471495.000000', '1679475095.000000', '2023-03-22 02:51:35.000000', 1);

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
  `date_add` int(11) DEFAULT NULL,
  `id_user_updated` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL,
  `id_user_deleted` int(11) DEFAULT NULL,
  `date_deleted` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `escenario` int(11) DEFAULT NULL,
  `is_user_negocio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_users`
--

INSERT INTO `tb_users` (`id_us`, `docident_us`, `nombres_us`, `apepat_us`, `apemat_us`, `email_us`, `usuario_us`, `creacion_us`, `actualizacion_us`, `estado_us`, `intentos_us`, `bloqueo_us`, `change_pass`, `bloqueo_time`, `perfil_us`, `idempresa`, `idposicion`, `idarea`, `idunidad`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`, `escenario`, `is_user_negocio`) VALUES
(3, '', '', '', '', 'youkai.miguel@gmail.com', 'testeo1', '2023-03-22 00:08:34.000000', NULL, 1, 1, 0, 0, NULL, 11, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(4, '', '', '', '', 'prueba@gmail.com', 'testeo2', '2023-03-22 00:30:49.000000', NULL, 1, 1, 0, 0, NULL, 11, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(5, '', '', '', '', 'prueba2@gmail.com', 'admin', '2023-03-22 00:41:33.000000', NULL, 1, 1, 0, 1, NULL, 11, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

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
(7, 'Unidad Logistica', 1, 10, 10, NULL, '2023-03-21 00:00:00.000000', NULL, NULL, NULL, NULL, 0);

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
  ADD KEY `FK__registro___id_us__5911273F` (`id_user_deleted`);

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
  ADD PRIMARY KEY (`id_det_per`),
  ADD KEY `FK__tb_detall__id_us__3B60C8C7` (`id_user_updated`),
  ADD KEY `FK__tb_detall__id_us__3C54ED00` (`id_user_deleted`),
  ADD KEY `fk_det_perfil` (`id_perfil`);

--
-- Indices de la tabla `tb_historial_claves`
--
ALTER TABLE `tb_historial_claves`
  ADD PRIMARY KEY (`id_cl`),
  ADD KEY `fk_user_clave` (`id_us`);

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
  ADD PRIMARY KEY (`id_perfil`),
  ADD KEY `FK__tb_perfil__id_us__3E3D3572` (`id_user_updated`),
  ADD KEY `FK__tb_perfil__id_us__3F3159AB` (`id_user_deleted`);

--
-- Indices de la tabla `tb_sesiones`
--
ALTER TABLE `tb_sesiones`
  ADD PRIMARY KEY (`id_se`),
  ADD KEY `fk_se_us` (`id_us`);

--
-- Indices de la tabla `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_us`),
  ADD KEY `FK__tb_users__id_use__4119A21D` (`id_user_updated`),
  ADD KEY `FK__tb_users__id_use__420DC656` (`id_user_deleted`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alert_seguimiento`
--
ALTER TABLE `alert_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aplicacion_impacto`
--
ALTER TABLE `aplicacion_impacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aplicacion_probailidad`
--
ALTER TABLE `aplicacion_probailidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `aspectos_seguridad`
--
ALTER TABLE `aspectos_seguridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caracteristica_control`
--
ALTER TABLE `caracteristica_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catalogo_tabla`
--
ALTER TABLE `catalogo_tabla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_activo`
--
ALTER TABLE `categoria_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_vulnerabilidad`
--
ALTER TABLE `categoria_vulnerabilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clasificacion_informacion`
--
ALTER TABLE `clasificacion_informacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cobertura`
--
ALTER TABLE `cobertura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `correo_plan`
--
ALTER TABLE `correo_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `desc_amenaza`
--
ALTER TABLE `desc_amenaza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `desc_vulnerabilidad`
--
ALTER TABLE `desc_vulnerabilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_controles`
--
ALTER TABLE `detalle_controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_evaluacion_control`
--
ALTER TABLE `detalle_evaluacion_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `escenario_active`
--
ALTER TABLE `escenario_active`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacion_control`
--
ALTER TABLE `evaluacion_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacion_control2`
--
ALTER TABLE `evaluacion_control2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacion_riesgo`
--
ALTER TABLE `evaluacion_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacion_riesgo_historial`
--
ALTER TABLE `evaluacion_riesgo_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impacto_riesgo`
--
ALTER TABLE `impacto_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario_clasificacion_activo`
--
ALTER TABLE `inventario_clasificacion_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario_clasificacion_activo_historial`
--
ALTER TABLE `inventario_clasificacion_activo_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `log_acciones`
--
ALTER TABLE `log_acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `macroproceso`
--
ALTER TABLE `macroproceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nivel_riesgo`
--
ALTER TABLE `nivel_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_accion`
--
ALTER TABLE `plan_accion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_riesgo`
--
ALTER TABLE `plan_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posicion_puesto`
--
ALTER TABLE `posicion_puesto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `probabilidad_riesgo`
--
ALTER TABLE `probabilidad_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proceso`
--
ALTER TABLE `proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_controles`
--
ALTER TABLE `registro_controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_det_per` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `tb_historial_claves`
--
ALTER TABLE `tb_historial_claves`
  MODIFY `id_cl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_item`
--
ALTER TABLE `tb_item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tb_sesiones`
--
ALTER TABLE `tb_sesiones`
  MODIFY `id_se` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id_us` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_activo`
--
ALTER TABLE `tipo_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_amenaza`
--
ALTER TABLE `tipo_amenaza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_riesgo`
--
ALTER TABLE `tipo_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion_activo`
--
ALTER TABLE `ubicacion_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `valoracion_activo`
--
ALTER TABLE `valoracion_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `valoracion_riesgo`
--
ALTER TABLE `valoracion_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `valor_activo`
--
ALTER TABLE `valor_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `FK__aspectos___id_us__6497E884` FOREIGN KEY (`id_user_added`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__aspectos___id_us__658C0CBD` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
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
  ADD CONSTRAINT `FK__cobertura__id_us__7C6F7215` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
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
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `FK__estado__id_user___10766AC2` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__estado__id_user___116A8EFB` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

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
  ADD CONSTRAINT `FK__registro___id_us__5911273F` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

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
-- Filtros para la tabla `tb_detalle_perfil`
--
ALTER TABLE `tb_detalle_perfil`
  ADD CONSTRAINT `FK__tb_detall__id_us__3B60C8C7` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__tb_detall__id_us__3C54ED00` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `fk_det_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `tb_perfiles` (`id_perfil`);

--
-- Filtros para la tabla `tb_historial_claves`
--
ALTER TABLE `tb_historial_claves`
  ADD CONSTRAINT `fk_user_clave` FOREIGN KEY (`id_us`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `tb_opcion`
--
ALTER TABLE `tb_opcion`
  ADD CONSTRAINT `fk_mod_op` FOREIGN KEY (`id_mod`) REFERENCES `tb_modulo` (`id_mod`);

--
-- Filtros para la tabla `tb_perfiles`
--
ALTER TABLE `tb_perfiles`
  ADD CONSTRAINT `FK__tb_perfil__id_us__3E3D3572` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__tb_perfil__id_us__3F3159AB` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `tb_sesiones`
--
ALTER TABLE `tb_sesiones`
  ADD CONSTRAINT `fk_se_us` FOREIGN KEY (`id_us`) REFERENCES `tb_users` (`id_us`);

--
-- Filtros para la tabla `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `FK__tb_users__id_use__4119A21D` FOREIGN KEY (`id_user_updated`) REFERENCES `tb_users` (`id_us`),
  ADD CONSTRAINT `FK__tb_users__id_use__420DC656` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`),
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
