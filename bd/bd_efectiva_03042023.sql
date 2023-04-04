-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-04-2023 a las 17:04:50
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_evaluacion_riesgos_controles` (IN `id_evaluacion_riesgo` INT, IN `id_control` INT, IN `id_user_added` INT, IN `date_add` DATETIME)   begin
	insert into evaluacion_riesgos_controles(id_evaluacion_riesgo,id_control,id_user_added,date_add) values (id_evaluacion_riesgo,id_control,id_user_added,date_add);
end$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_AlertSeguimiento` (IN `alerta` VARCHAR(100), IN `valor` INT, IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
  INSERT INTO alert_seguimiento(alerta, valor, descripcion, id_user_added, DATE_ADD)
  VALUES (alerta, valor, descripcion, idUserAdd, NOW());
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_caractControl` (IN `caracteristica` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `estado` INT, IN `peso` VARCHAR(50), IN `valor` VARCHAR(50), IN `condicion` VARCHAR(50), IN `tipo` VARCHAR(50), IN `idOpcion` INT, IN `calificacion` INT, IN `check_tabla` INT, IN `nom_tabla` VARCHAR(100), IN `seleccionable` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO caracteristica_control(
	   caracteristica,
	   descripcion,estado,peso,valor,condicion,tipo,idOpcion,clasificacion,check_tabla,nom_tabla,seleccionable,
	   id_user_added,date_add)
    VALUES (caracteristica,descripcion,estado,peso,valor,condicion,tipo,idOpcion,calificacion,check_tabla,
	   nom_tabla,seleccionable,idUserAdd,current_date());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_catactivo` (IN `categoria` VARCHAR(150), IN `tipo` INT, IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO categoria_activo
(categoria,estado,idtipo,id_user_added,date_add)
VALUES
(categoria,estado,tipo,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_clasinfo` (IN `clasificacion` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `idUserAdd` INT)   BEGIN
	INSERT INTO clasificacion_informacion
(clasificacion,descripcion,estado,id_user_added,date_add)
VALUES
(clasificacion,descripcion,estado,idUserAdd,now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_cobertura` (IN `cobertura` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `idUserAdd` INT)   BEGIN
	INSERT INTO cobertura  (cobertura,descripcion,id_user_added,date_add)
    VALUES (cobertura,descripcion,idUserAdd,current_date());
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
(continente,pais,ciudad,direccion,descripcion,estado,idUserAdd,now());
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
	set area=area,idempresa=empresa,estado=estado,
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
    idarea=area,
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
date_modify=now()
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
date_modify=now()
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
	set idarea=area,
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_valoractivo` (IN `valor` VARCHAR(150), IN `idvalor` INT, IN `estado` INT, IN `idUserAdd` INT)   begin
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_caractControl` (IN `idUserAdd` INT, IN `idCaractControl` INT)   BEGIN
	UPDATE caracteristica_control  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idCaractControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cobertura` (IN `idUserAdd` INT, IN `idCobertura` INT)   BEGIN
	UPDATE cobertura  SET
	id_user_deleted=idUserAdd,
	date_deleted=current_date(),
	is_deleted=1
	where id=idCobertura;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `getById` (IN `idid` INT)   begin
SELECT id from caracteristica_control 
        where is_deleted=0 and clasificacion =1 and idOpcion=idid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getByIdSesion` (IN `id` INT, IN `iat` INT)   begin
	SELECT  * from tb_sesiones
         where id_us=id and expi > iat and loged='1' ORDER BY id_se LIMIT 1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCaractControl` ()   begin
	SELECT * FROM caracteristica_control where tipo='menu'  and is_deleted=0 ;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `getComboPosicion` ()   begin
	SELECT * FROM posicion_puesto where estado='1' and is_deleted=0;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getConfigPass` ()   begin
SELECT * FROM  config_pass;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getContinente` (IN `dato` VARCHAR(30))   begin
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPosicionByArea` (IN `idarea` INT)   begin
	SELECT PP.id as id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
        E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto as PP inner join empresa as E
        on PP.idempresa=E.id inner join area as A on PP.idarea=A.id 
        inner join unidades as U on PP.idunidad=U.id
        where pp.idarea=idarea;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPosicionByUnidad` (IN `empresa` INT, IN `area` INT, IN `unidad` INT)   begin
	SELECT PP.id as id_pos,PP.posicion_puesto,PP.idempresa,PP.idunidad,PP.idarea,
        E.empresa,A.area,U.unidad,PP.estado FROM posicion_puesto as PP inner join empresa as E
        on PP.idempresa=E.id inner join area as A on PP.idarea=A.id 
        inner join unidades as U on PP.idunidad=U.id
        where pp.idarea=area and PP.idempresa=empresa and PP.idunidad=unidad;
end$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCorreoActividad` (IN `id` INT, IN `fecha` DATETIME, IN `usuario` INT)   begin
	INSERT INTO correo_actividad (idactividad,fecha_envio,idusuario) 
        VALUES (id,fecha,usuario);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCorreoPlan` (IN `id` INT, IN `fecha` DATETIME, IN `usuario` INT)   begin
	INSERT INTO correo_plan (idplan,fecha_envio,idusuario) 
        VALUES (id,fecha,usuario);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LastIdControles` ()   begin
SELECT MAX(id) as last_id from registro_controles;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `last_id_Evaluacion_Control` ()   BEGIN
	SELECT  id as maxid FROM evaluacion_control2 order by id desc limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `last_id_Registro_Proceso` ()   BEGIN
	SELECT  id as maxid FROM registro_controles order by id desc limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaCategoriaByActivo` (IN `idactivo` INT)   begin
	SELECT * FROM categoria_activo where idtipo=idactivo and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaProcesoByEstado` ()   begin
	SELECT * FROM proceso 
            where estado='1' ;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaProcesoByMacro` (IN `empresa` INT, IN `area` INT, IN `unidad` INT, IN `macroproceso` INT)   begin
	SELECT * FROM proceso where idempresa=empresa and idarea=area AND
    idunidad=unidad and idmacroproceso=macroproceso and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarArea` ()   begin
	SELECT a.id,a.idempresa,e.empresa,a.area,a.estado
                from empresa as E inner join area as A on a.idempresa = e.id where a.is_deleted=0;


end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAreaByActivo` (IN `empresa` INT)   begin
	SELECT * FROM area 
            where estado='1' and idempresa=empresa and is_deleted=0;
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
	SELECT * FROM empresa where is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEmpresaByAcivo` ()   begin
	SELECT * FROM empresa where estado='1' and is_deleted=0;
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
									where E.id = dato and P.is_deleted=0;




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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUnidadByActivo` (IN `empresa` INT(12), IN `area` INT(12))   begin
	SELECT * FROM unidades 
            where estado='1' 
			and idempresa=empresa
			and idarea=area
			and is_deleted=0;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_actividades_plan` (IN `idid` INT)   BEGIN
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
	where AP.is_deleted=0 and PA.id = idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_alert_seguimiento` ()   BEGIN
	SELECT * FROM alert_seguimiento where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_AplicacionImpacto` (IN `idescenario` INT)   BEGIN
	select id,idclasificacion,(select caracteristica from caracteristica_control where id=idclasificacion) as disenio,
	posicion,descripcion,escenario
	from aplicacion_impacto  where is_deleted=0 and escenario=idescenario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_AplicacionProbabilidad` (IN `idescenario` INT)   BEGIN
	select id,idclasificacion,(select caracteristica from caracteristica_control where id=idclasificacion) as disenio,
	posicion,descripcion,escenario
	from aplicacion_probailidad 
	where is_deleted=0 and escenario=idescenario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_caractControl` ()   BEGIN
	SELECT * FROM caracteristica_control where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_cobertura` ()   begin
	SELECT * FROM cobertura where is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_detalle_plan` (IN `id` INT)   BEGIN
	select count(*) as actividades from actividades_plan where id_planes= id;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_plan_accion` ()   BEGIN
	select id,plan_accion, 
	(SELECT COUNT(*) FROM actividades_plan WHERE id_planes = PA.id and is_deleted=0) as actividades,	
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
        date_modify = current_date()
		WHERE id = idid;
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
	   date_modify=current_date() where id=idCaractControl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_cobertura` (IN `cobertura` VARCHAR(100), IN `descripcion` VARCHAR(100), IN `idUserAdd` INT, IN `idCobertura` INT)   BEGIN
	UPDATE cobertura  SET
	cobertura=cobertura,
	descripcion= descripcion,
	id_user_updated=idUserAdd,
	date_modify=current_date() where id=idCobertura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_detalle_control` (IN `idvalor` VARCHAR(50), IN `idControl` INT, IN `ididCC` INT)   BEGIN
	UPDATE  detalle_controles SET
	valor=idvalor WHERE idControles=idControl and idCC=ididCC;
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
	date_modify=current_date() where id=idEvaluacionControl;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_categoria_vulnerabilidad` (IN `idid` INT, IN `categoria` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update categoria_vulnerabilidad
	set categoria=categoria,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_desc_amenaza` (IN `idid` INT, IN `idtipo_amenaza` INT, IN `amenaza` VARCHAR(150), IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update desc_amenaza
	set idtipo_amenaza=idtipo_amenaza,
	amenaza=amenaza,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_desc_vulnerabilidad` (IN `idid` INT, IN `idcategoria` INT, IN `vulnerabilidad` VARCHAR(150), IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update desc_vulnerabilidad
	set idcategoria=idcategoria,
	vulnerabilidad=vulnerabilidad,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_impacto_1` (IN `idir` INT, IN `iddescripcion` VARCHAR(150), IN `idtipo_regla` VARCHAR(150), IN `idtipo_valor` VARCHAR(150), IN `idcomentario` VARCHAR(150), IN `idestado` INT, IN `idformula` VARCHAR(150), IN `idid_user_updated` INT, IN `iddate_modify` DATETIME)   BEGIN
	update impacto_riesgo
	set formula=idformula,
    descripcion=iddescripcion,
    tipo_regla=idtipo_regla,
    tipo_valor=idtipo_valor,
    comentario=idcomentario,
    estado=idestado,
    id_user_updated=
    idid_user_updated,
    date_modify=iddate_modify
	where id=idir;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_impacto_2` (IN `idir` INT, IN `descripcion` VARCHAR(150), IN `tipo_regla` VARCHAR(150), IN `tipo_valor` VARCHAR(150), IN `operador1` VARCHAR(150), IN `valor1` INT, IN `operador2` VARCHAR(150), IN `valor2` INT, IN `comentario` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
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
	where id=idir;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_inventario_clasificacion_activo` (IN `idid` INT, IN `idempresa` INT, IN `idarea` INT, IN `idunidad` INT, IN `idmacroproceso` INT, IN `idproceso` INT, IN `activo` VARCHAR(150), IN `desc_activo` VARCHAR(500), IN `idtipo_activo` INT, IN `idcategoria_activo` INT, IN `idubicacion` INT, IN `idpropietario` INT, IN `idcustodio` INT, IN `val_c` INT, IN `val_i` INT, IN `val_d` INT, IN `idvalor` INT, IN `estado` INT, IN `comentario` VARCHAR(500), IN `id_user_updated` INT, IN `date_modify` DATETIME, IN `observacion` VARCHAR(200))   BEGIN
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
	where id=idid;
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
	update probabilidad_riesgo
	set formula=idformula,
    descripcion=iddescripcion,
    tipo_regla=idtipo_regla,
    tipo_valor=idtipo_valor,
    comentario=idcomentario,
    estado=idestado,
    id_user_updated=idid_user_updated,
    date_modify=iddate_modify
	where id=idpr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_probabilidad_2` (IN `idpr` INT, IN `iddescripcion` VARCHAR(150), IN `idtipo_regla` VARCHAR(150), IN `idtipo_valor` VARCHAR(150), IN `idoperador1` VARCHAR(150), IN `idvalor1` INT, IN `idoperador2` VARCHAR(150), IN `idvalor2` INT, IN `idcomentario` VARCHAR(150), IN `idestado` INT, IN `idid_user_updated` INT, IN `iddate_modify` DATETIME)   BEGIN
	update probabilidad_riesgo
	set descripcion=iddescripcion,
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
	where id=idpr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_tipo_amenaza` (IN `idid` INT, IN `tipo` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   BEGIN
	update tipo_amenaza
	set tipo=tipo,
	estado=estado,
	id_user_updated=id_user_updated,
	date_modify=date_modify
	where id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_active_escenario_1` ()   BEGIN
	select * from probabilidad_riesgo where estado=1 and is_deleted=0 and escenario=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_active_impacto_escenario_1` ()   BEGIN
	select * from impacto_riesgo where estado=1 and is_deleted=0 and escenario=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_aplicacion_impacto_by_caracteristica` (IN `caracteristica` VARCHAR(50), IN `escene` INT)   BEGIN
	select ai.*,cc.caracteristica
	from aplicacion_impacto ai
	inner join caracteristica_control cc on cc.id = ai.idclasificacion
	where cc.caracteristica=caracteristica and ai.is_deleted=0 and escenario=escene;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_aplicacion_probabilidad_by_caracteristica` (IN `idcaracteristica` VARCHAR(50), IN `escene` INT)   BEGIN
	select ap.*,cc.caracteristica
	from aplicacion_probailidad ap
	inner join caracteristica_control cc on cc.id = ap.idclasificacion
	where cc.caracteristica=idcaracteristica and ap.is_deleted=0 and escenario=escene;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_caracteristica_control_opcion` (IN `scene` INT)   begin
	select ap.id,cc.caracteristica,ap.posicion,ap.escenario
	from aplicacion_probailidad as ap
	inner join caracteristica_control as cc on cc.id = ap.idclasificacion where ap.escenario=scene;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_evaluacion_riesgo_by_id` (IN `id` INT)   BEGIN
	select * from evaluacion_riesgo where id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_evaluacion_riesgo_controles_by_evaluacion_riesgo_id` (IN `id_evaluacion_riesgo_pass` INT)   begin
	select * from evaluacion_riesgos_controles where id_evaluacion_riesgo = id_evaluacion_riesgo_pass;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impacto_by_description` (IN `iddescription` VARCHAR(50))   BEGIN
	select * from impacto_riesgo
	where descripcion=iddescription and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_info_to_email` (IN `idid` INT)   BEGIN
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
	where ica.id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_inventario_clasificacion_activo` (IN `idid` INT)   BEGIN
	select * from inventario_clasificacion_activo where id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_last_evaluacion_riesgo` ()   begin
	select id from evaluacion_riesgo order by id desc limit 1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_last_id` ()   BEGIN
	select * from inventario_clasificacion_activo order by id desc limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_probabilidad_by_description` (IN `iddescription` VARCHAR(50))   BEGIN
	select * from probabilidad_riesgo
	where descripcion=iddescription and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_valoracion_riesgo` (IN `idid_probabilidad` INT, IN `idid_impacto` INT)   BEGIN
	select * from valoracion_riesgo where idProbabilidad=idid_probabilidad and idImpacto=idid_impacto and is_deleted=0;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_evaluacion_riesgo_historial` (IN `idid` INT)   BEGIN
	select
		erh.id as id,
		tipo_riesgo.tipo_riesgo as tipo_riesgo,
		empresa.empresa as empresa,
		area.area as area,
		unidades.unidad as unidad,
		macroproceso.macroproceso as macroproceso,
		proceso.proceso as proceso,
		erh.id_activo as activo,
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
	inner join inventario_clasificacion_activo as iva on iva.id=erh.id_activo
	inner join tipo_amenaza ta on ta.id=erh.id_tipo_amenaza
	inner join desc_amenaza da on da.id=erh.id_descripcion_amenaza
	inner join categoria_vulnerabilidad ca on ca.id=erh.id_tipo_vulnerabilidad
	inner join desc_vulnerabilidad dv on dv.id=erh.id_descripcion_vulnerabilidad
	where erh.is_deleted=0 and empresa.id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_ica_by_valoracion` (IN `val_c` INT, IN `val_i` INT, IN `val_d` INT)   BEGIN
	select ica.* from inventario_clasificacion_activo ica
	where ica.val_c=val_c and ica.val_i=val_i and ica.val_d=val_d;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_impacto` (IN `idescenario` INT)   BEGIN
	select * from impacto_riesgo where escenario=idescenario and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo` (IN `empresa` INT)   BEGIN
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
	where ica.is_deleted=0 and e.id=empresa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo_by_user` (IN `id_user` INT, IN `empresa` INT)   BEGIN
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
	where ica.is_deleted=0 and ica.id_user_added=id_user and e.id=empresa
;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo_historial` (IN `idid` INT)   BEGIN
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
	where ica.is_deleted=0 and e.id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_inventario_clasificacion_activo_historial_by_user` (IN `id_user` INT, IN `idid` INT)   BEGIN
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
	where ica.is_deleted=0 and ic.id_user_added=id_user 
    AND e.id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_nivel_riesgo` ()   BEGIN
	select * from nivel_riesgo where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_probabilidad` (IN `idescenario` INT)   BEGIN
	select * from probabilidad_riesgo where escenario=idescenario and is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_tipo_amenaza` ()   BEGIN
	select * from tipo_amenaza where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_tipo_riesgo` ()   BEGIN
	select * from tipo_riesgo where is_deleted=0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_evaluacion_riesgo` (IN `idid` INT, IN `idid_tipo_riesgo` INT, IN `idid_empresa` INT, IN `idid_area` INT, IN `idid_unidad` INT, IN `idid_macroproceso` INT, IN `idid_proceso` INT, IN `idid_activo` INT, IN `idid_tipo_amenaza` INT, IN `idid_descripcion_amenaza` INT, IN `idid_tipo_vulnerabilidad` INT, IN `idid_descripcion_vulnerabilidad` INT, IN `idriesgo` VARCHAR(150), IN `idvalor_probabilidad` INT, IN `idprobabilidad` VARCHAR(150), IN `idvalor_impacto` VARCHAR(150), IN `idimpacto` VARCHAR(150), IN `idvalor` VARCHAR(150), IN `idid_control` INT, IN `idriesgo_controlado_probabilidad` VARCHAR(150), IN `idriesgo_controlado_impacto` VARCHAR(150), IN `idriesgo_controlado_valor` VARCHAR(150), IN `idestado` INT, IN `idid_user_updated` INT, IN `iddate_modify` DATETIME)   BEGIN
	update evaluacion_riesgo
	set 
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
	where id=idid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_scene_probabilidad_user` (IN `user_id` INT, IN `idscene` INT)   BEGIN
	update escenario_active set escenario=idscene;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_tipo_riesgo` (IN `idid` INT, IN `tipo_riesgo` VARCHAR(150), IN `descripcion` VARCHAR(150), IN `estado` INT, IN `id_user_updated` INT, IN `date_modify` DATETIME)   begin
	update tipo_riesgo
	set tipo_riesgo=tipo_riesgo,descripcion=descripcion,estado=estado,id_user_updated=id_user_updated,date_modify=date_modify
	where id=idid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validate_combinatoria_impacto` (IN `idoperador1` VARCHAR(150), IN `idvalor1` INT, IN `idoperador2` VARCHAR(150), IN `idvalor2` INT)   begin
	select * from impacto_riesgo
	where operador1=idoperador1 and valor1=idvalor1
	and operador2=idoperador2 and valor2=idvalor2 and estado=1 AND is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validate_combinatoria_probabilidad` (IN `idoperador1` VARCHAR(150), IN `idvalor1` INT, IN `idoperador2` VARCHAR(150), IN `idvalor2` INT)   begin
	select * from probabilidad_riesgo
	where operador1=idoperador1 and valor1=idvalor1
	and operador2=idoperador2 and valor2=idvalor2 and estado=1
    and is_deleted=0;
end$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_status_ica` (IN `idid` INT, IN `estado` INT, IN `date_modify` DATETIME, IN `id_user_updated` INT)   begin
	update inventario_clasificacion_activo
	set estado=estado,id_user_updated=id_user_updated,date_modify=date_modify
	where id=idid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_valor_ica` (IN `id` INT, IN `id_valor` INT)   begin
	update inventario_clasificacion_activo
	set idvalor=id_valor
	where id=id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaAlerta_seguimiento` (IN `idalert` VARCHAR(50))   begin
	  SELECT * FROM alert_seguimiento where alerta=idalert and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaArea` (IN `idarea` VARCHAR(150), IN `empresa` INT)   begin
	select * from area   where idempresa =empresa
    and area=idarea;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaAspecto` (IN `idaspecto` VARCHAR(150))   begin
	 SELECT * FROM aspectos_seguridad where 
         aspecto=idaspecto and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaCatActivo` (IN `idcategoria` VARCHAR(150), IN `tipo` INT)   begin
	SELECT * FROM categoria_activo 
            where idtipo=tipo and 
			categoria=idcategoria and
            is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaClasInfo` (IN `idclasificacion` VARCHAR(150))   begin
SELECT * FROM clasificacion_informacion 
            where clasificacion=idclasificacion and
            is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaEmpresa` (IN `idempresa` VARCHAR(150))   begin
	select * from empresa  where empresa =idempresa and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaEstado` (IN `idestado` VARCHAR(50))   begin
	  SELECT * FROM estado where estado=idestado and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaMacroproceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `idmacroproceso` VARCHAR(150))   begin
	SELECT * FROM macroproceso where 
          idempresa=empresa and
		idarea = area and idunidad=unidad
		and macroproceso=idmacroproceso and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaPlanAccion` (IN `idplan_accion` VARCHAR(150))   begin
	  SELECT * FROM plan_accion where plan_accion=idplan_accion and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaPosicion` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `idposicion` VARCHAR(150))   begin
	SELECT * FROM posicion_puesto where 
          idempresa=empresa and
		idarea = area and idunidad=unidad
		and posicion_puesto=idposicion and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaPrioridad` (IN `idprioridad` VARCHAR(150))   begin
	select * from prioridad where prioridad=idprioridad and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaProceso` (IN `area` INT, IN `empresa` INT, IN `unidad` INT, IN `macroproceso` INT, IN `idproceso` VARCHAR(150))   begin
	SELECT * FROM proceso where 
		idmacroproceso=macroproceso and
          idempresa=empresa and
		idarea = area and idunidad=unidad
		and proceso=idproceso and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaRegistroControl` (IN `dato` INT)   begin
select * from registro_controles 
        where is_deleted=0 and nom_control=dato;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaTipoActivo` (IN `idtipo` VARCHAR(150))   begin
	SELECT * FROM tipo_activo 
            where tipo=idtipo and
            is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaUbiActivo` (IN `idcontinente` VARCHAR(50), IN `idpais` VARCHAR(50), IN `idciudad` VARCHAR(50), IN `iddireccion` VARCHAR(300), IN `iddescripcion` VARCHAR(300))   begin
	SELECT * FROM ubicacion_activo 
            where continente=idcontinente and 
			pais=idpais and
			ciudad= idciudad and
			direccion=iddireccion and
			descripcion = iddescripcion and
            is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaUnidad` (IN `idarea` INT, IN `idempresa` INT, IN `idunidad` VARCHAR(150))   begin
	SELECT * FROM unidades where 
          idempresa=idempresa and
		idarea = idarea and unidad=idunidad;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaValoracionActivo` (IN `idaspecto1` INT, IN `idaspecto2` INT, IN `idaspecto3` INT, IN `idvaloracion1` INT, IN `idvaloracion2` INT, IN `idvaloracion3` INT, IN `ididvalor` INT)   begin
	SELECT * FROM valoracion_activo 
            where idaspecto1=idaspecto1
            and idaspecto2= idaspecto2
            and idaspecto3=idaspecto3
            and idvalor=ididvalor
            and valoracion1=idvaloracion1
            and valoracion2=idvaloracion2
            and valoracion3=idvaloracion3 and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validaValorActivo` (IN `idvalor` VARCHAR(150))   begin
	 SELECT * FROM valor_activo where 
         valor=idvalor and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_AplicacionImpacto` (IN `iddisenio` INT, IN `idposicion` VARCHAR(50), IN `idescenario` INT)   begin
	 SELECT *
	FROM aplicacion_impacto where idclasificacion=iddisenio and 
	posicion=idposicion and escenario=idescenario and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_AplicacionProbabilidad` (IN `iddisenio` INT, IN `idposicion` VARCHAR(50), IN `idescenario` INT)   begin
	SELECT *
	FROM aplicacion_probailidad where idclasificacion=iddisenio and 
	posicion=idposicion and escenario=idescenario and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_caractControl` (IN `idcaracteristica` VARCHAR(50), IN `ididOpcion` INT)   begin
	SELECT *
	FROM caracteristica_control where caracteristica=idcaracteristica and idOpcion=ididOpcion and is_deleted=0 ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_cobertura` (IN `idcobertura` VARCHAR(150))   begin
	SELECT * FROM cobertura where cobertura=idcobertura and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_Evaluacion_Control` (IN `disenio` INT, IN `operatividad` INT, IN `calificacion` VARCHAR(50))   begin
	SELECT *
	FROM evaluacion_control
    where idDisenio=disenio and 
	idOperatividad=operatividad and calificacion=calificacion and is_deleted=0;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_ValoracionRiesgo` (IN `probabilidad` INT, IN `impacto` INT)   begin
	  SELECT *
	  FROM valoracion_riesgo where 
	  idProbabilidad=probabilidad and IdImpacto=impacto and is_deleted=0;
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

--
-- Volcado de datos para la tabla `actividades_plan`
--

INSERT INTO `actividades_plan` (`id`, `idempresa`, `idarea`, `idunidad`, `idposicion`, `idusuario`, `descripcion`, `fecha_inicio`, `fecha_fin`, `idalerta`, `progreso`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`, `id_planes`) VALUES
(1, 12, 11, 8, 1, 8, 'A', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 1, 100, 5, '2023-03-26 00:00:00.000000', 8, '2023-03-26 00:00:00.000000', 5, '2023-03-28 00:00:00.000000', 1, 1),
(2, 12, 11, 8, 1, 8, 'A', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 1, 10, 5, '2023-03-26 00:00:00.000000', 8, '2023-03-26 00:00:00.000000', 5, '2023-03-28 00:00:00.000000', 1, 1),
(3, 12, 11, 8, 1, 8, 'A', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 1, 10, 8, '2023-03-26 00:00:00.000000', 8, '2023-03-26 00:00:00.000000', 5, '2023-03-28 00:00:00.000000', 1, 2),
(4, 12, 11, 8, 1, 8, 'F', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 1, 90, 8, '2023-03-26 00:00:00.000000', NULL, NULL, 5, '2023-03-28 00:00:00.000000', 1, 6),
(5, 12, 11, 8, 1, 8, 'A', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 1, 100, 5, '2023-03-26 00:00:00.000000', NULL, NULL, 5, '2023-03-28 00:00:00.000000', 1, 7),
(6, 12, 11, 8, 1, 8, 'B', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 1, 90, 5, '2023-03-26 00:00:00.000000', NULL, NULL, 5, '2023-03-28 00:00:00.000000', 1, 7),
(7, 12, 15, 11, 4, 8, 'A', '2023-03-28 00:00:00.000000', '2023-03-30 00:00:00.000000', 1, 50, 5, '2023-03-28 00:00:00.000000', NULL, NULL, 5, '2023-03-28 00:00:00.000000', 1, 8);

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
(1, 'Alerta Diaria', 'Alerta Diaria', 1, 5, '2023-03-25 01:43:05.000000', NULL, NULL, NULL, NULL, 0),
(2, 'Alerta Semanal', 'Alerta Semanal', 7, 5, '2023-03-25 01:43:15.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 16, '5%', 'Disminuye 5%', 5, '2023-03-24 00:00:00.000000', 5, '2023-03-24 00:00:00.000000', NULL, NULL, 0, 1),
(2, 17, '10%', 'Disminuye 10%', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 1),
(3, 16, '1', '1 posicion a la izquierda', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 2),
(4, 17, '2', '2 a la izquierda', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 2),
(5, 21, '80%', 'Disminuye 80%', 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 1),
(6, 21, '1', 'Mueve 1 a la izquierda', 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 2);

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
(1, 16, '5%', 'Disminuye 5%', 5, '2023-03-24 00:00:00.000000', 5, '2023-03-24 00:00:00.000000', NULL, NULL, 0, 1),
(2, 17, '10%', 'Disminuye 10%', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 1),
(3, 16, '1', 'Baja 1 posicion', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 2),
(4, 17, '2', 'Baja 2 posiciones', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 2),
(5, 21, '80%', 'Disminuye 80%', 5, '2023-03-27 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, 1),
(6, 21, '1', 'Baja 1 posicionb hacia abajo', 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0, 2);

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
(11, 'Recursos Humanos', 1, 12, 5, '2023-03-23 14:49:26.000000', NULL, NULL, NULL, NULL, 0),
(12, 'Gerencia de TI', 1, 12, 5, '2023-03-23 14:49:53.000000', 5, '2023-03-24 02:19:28.000000', 5, '2023-03-24 02:19:28.000000', 1),
(13, 'Logistica', 1, 12, 5, '2023-03-24 02:20:46.000000', NULL, NULL, NULL, NULL, 0),
(14, 'Area RH', 1, 13, 5, '2023-03-26 16:51:26.000000', NULL, NULL, NULL, NULL, 0),
(15, 'SN', 1, 12, 5, '2023-03-27 10:34:35.000000', NULL, NULL, NULL, NULL, 0),
(16, 'Nueva Area', 1, 12, 5, '2023-03-30 02:51:54.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 'Confidencialidad', 1, 5, '2023-03-24 02:43:56.000000', 5, '2023-03-24 02:44:05.000000', NULL, NULL, 0),
(2, 'Integridad', 1, 5, '2023-03-24 02:44:12.000000', NULL, NULL, NULL, NULL, 0),
(3, 'Disponibilidad', 1, 5, '2023-03-24 02:44:20.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 'Diseño', 'Diseño', 1, 5, '2023-03-22 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'menu', 0, 0, 0, '', 0),
(3, 'Operatividad', 'Operatividad', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-04-01 00:00:00.000000', NULL, NULL, 0, '', '', '', 'menu', 0, 0, 0, '', 1),
(4, 'Definición', 'Definición', 1, 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'submenu', 1, 0, 0, '', 0),
(5, 'Objetivo', 'Objetivo', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-04-01 00:00:00.000000', NULL, NULL, 0, '', '', '', 'submenu', 1, 0, 0, '', 1),
(6, 'Calificación Diseño', 'Calififación Diseño', 1, 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'submenu', 1, 1, 0, '', 0),
(7, 'Responsable', 'Responsable', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '', '', '0.25', 'opcion', 4, 0, 1, '1', 0),
(8, 'El control mitiga el riesgo efectivamente', 'El control mitiga el riesgo efectivamente', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '', '', '2', 'opcion', 5, 0, 0, '', 0),
(9, 'Periodicidad', 'Periodicidad', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '', '', '0.25', 'opcion', 4, 0, 0, '', 0),
(10, 'Evidencia', 'Evidencia', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '', '', '0.2', 'opcion', 4, 0, 0, '', 0),
(11, 'Automatización', 'Automatización', 1, 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'submenu', 3, 0, 0, '', 0),
(12, 'Calificación Operatividad', 'Calificación Operatividad', 1, 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'submenu', 3, 1, 0, '', 0),
(13, 'Características de Operatividad', 'Caracteristicas de Operatividad', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '', '', '', 'submenu', 3, 0, 0, '', 0),
(14, 'Semi Automático', 'Semi Automático', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '', '', '1', 'opcion', 11, 0, 0, '', 0),
(15, 'Preventivo', 'Preventivo', 1, 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '', 'opcion', 13, 0, 0, '', 0),
(16, 'Bajo', 'Bajo', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '1', '<=', '', 'opcion', 6, 1, 0, '', 0),
(17, 'Medio', 'Medio', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '2', '=', '', 'opcion', 6, 1, 0, '', 0),
(18, 'Bajo', 'Bajo', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '1', '<=', '', 'opcion', 12, 1, 0, '', 0),
(19, 'Medio', 'Medio', 1, 5, '2023-03-24 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '2', '=', '', 'opcion', 12, 1, 0, '', 0),
(20, 'Documentación', 'Documentación', 1, 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '0.3', 'opcion', 4, 0, 0, '', 0),
(21, 'Fuerte', 'Fuerte', 1, 5, '2023-03-27 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '2', '>', '', 'opcion', 6, 1, 0, '', 0),
(22, 'Prueba', 'Prueba', 1, 5, '2023-03-27 00:00:00.000000', 5, '2023-04-01 00:00:00.000000', NULL, NULL, 0, '', '', '', 'submenu', 3, 0, 0, '', 0),
(23, 'Fuerte', 'Fuerte', 1, 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0, '', '', '2', 'opcion', 22, 0, 0, '', 0),
(24, 'Fuerte', 'Fuerte', 1, 5, '2023-03-27 00:00:00.000000', 5, '2023-03-27 00:00:00.000000', NULL, NULL, 0, '2', '>', '', 'opcion', 12, 1, 0, '', 0),
(25, 'Nuevo', 'Nuevo', 1, 5, '2023-03-31 00:00:00.000000', 5, '2023-03-31 13:22:05.000000', 5, '2023-03-31 13:22:05.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(26, 'Nuevo2', 'Nuevo2', 1, 5, '2023-03-31 00:00:00.000000', NULL, '2023-03-31 13:21:59.000000', 5, '2023-03-31 13:21:59.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(27, 'Nuevo 3', 'Nuevo 3', 1, 5, '2023-03-31 00:00:00.000000', NULL, '2023-03-31 13:22:20.000000', 5, '2023-03-31 13:22:20.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(28, 'Nuevo 2', 'Nuevo 2', 1, 5, '2023-03-31 00:00:00.000000', NULL, '2023-03-31 13:24:08.000000', 5, '2023-03-31 13:24:08.000000', 1, '', '', '', 'submenu', 1, 0, 0, '', 0),
(29, 'Nuevo 3', 'Nuevo 2', 1, 5, '2023-03-31 00:00:00.000000', 5, '2023-03-31 13:24:30.000000', 5, '2023-03-31 13:24:30.000000', 1, '', '', '', 'submenu', 1, 0, 0, '', 0),
(30, 'Nuevo2', 'Nuevo', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 02:53:35.000000', 5, '2023-04-01 02:53:35.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(31, 'Nuevo', 'Nuevoo', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 13:11:45.000000', 5, '2023-04-01 13:11:45.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(32, 'Nuevo 2', 'Nuevo 2', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 03:25:59.000000', 5, '2023-04-01 03:25:59.000000', 1, '', '', '', 'submenu', 31, 0, 0, '', 0),
(33, 'hola mundo', 'hola mundo', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 12:43:45.000000', 5, '2023-04-01 12:43:45.000000', 1, '', '', '', 'submenu', 1, 0, 0, '', 1),
(34, 'Nuevo2', 'Nuevo 2', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 13:11:43.000000', 5, '2023-04-01 13:11:43.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 0),
(35, 'hola mundo', 'hola mundo', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 12:47:02.000000', 5, '2023-04-01 12:47:02.000000', 1, '', '', '', 'submenu', 34, 0, 0, '', 1),
(36, 'Nuevo area2', 'Nuevo area', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 13:10:24.000000', 5, '2023-04-01 13:10:24.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 0),
(37, 'Hola Mundoo', 'Hola Mundoo', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 13:10:45.000000', 5, '2023-04-01 13:10:45.000000', 1, '', '', '', 'submenu', 34, 0, 0, '', 0),
(38, 'Hola', 'Hola', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 13:05:55.000000', 5, '2023-04-01 13:05:55.000000', 1, '', '', '', 'submenu', 36, 0, 0, '', 1),
(39, 'hola', 'hola', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 00:00:00.000000', NULL, NULL, 0, '', '', '', 'submenu', 31, 0, 0, '', 1),
(40, 'Nuevo2', 'Nuevo', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 13:13:12.000000', 5, '2023-04-01 13:13:12.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 0),
(41, 'hola mudno', 'hola mudno', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 13:13:06.000000', 5, '2023-04-01 13:13:06.000000', 1, '', '', '', 'submenu', 40, 0, 0, '', 1),
(42, 'Neuvo', 'Neuvo', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 13:22:24.000000', 5, '2023-04-01 13:22:24.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(43, 'hola mundo2', 'hola mundo', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 13:22:03.000000', 5, '2023-04-01 13:22:03.000000', 1, '', '', '', 'submenu', 42, 0, 0, '', 1),
(44, 'hola', 'hola', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 13:21:43.000000', 5, '2023-04-01 13:21:43.000000', 1, '', '', '0.25', 'opcion', 43, 0, 0, '', 0),
(45, 'hola  mudno3', 'hola  mudno3', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 13:22:02.000000', 5, '2023-04-01 13:22:02.000000', 1, '', '', '', 'submenu', 42, 0, 0, '', 1),
(46, 'hola mundo 4', 'hola mundo 4', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 13:22:20.000000', 5, '2023-04-01 13:22:20.000000', 1, '', '', '', 'submenu', 42, 0, 0, '', 0),
(47, 'hola', 'hola', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 13:23:36.000000', 5, '2023-04-01 13:23:36.000000', 1, '', '', '', 'submenu', 1, 0, 0, '', 0),
(48, 'hola mundo', 'hola mundo', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 13:25:23.000000', 5, '2023-04-01 13:25:23.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(49, 'asd', 'asd', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 13:25:16.000000', 5, '2023-04-01 13:25:16.000000', 1, '', '', '', 'submenu', 48, 0, 0, '', 1),
(50, 'Nueva Opcion2', 'Nueva Opcion', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 13:28:53.000000', 5, '2023-04-01 13:28:53.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(51, 'holaa', 'holaaa', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 13:28:47.000000', 5, '2023-04-01 13:28:47.000000', 1, '', '', '', 'submenu', 50, 0, 0, '', 1),
(52, 'Mundo', 'Mundo', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 13:29:18.000000', 5, '2023-04-01 13:29:18.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(53, 'Nuevo', 'Nuevo', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 16:05:04.000000', 5, '2023-04-01 16:05:04.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 1),
(54, 'Hola Mundo', 'Hola Mundo', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 16:04:59.000000', 5, '2023-04-01 16:04:59.000000', 1, '', '', '', 'submenu', 53, 0, 0, '', 1),
(55, 'Este es un registrooo', 'Este es un registro', 1, 5, '2023-04-01 00:00:00.000000', 5, '2023-04-01 16:04:52.000000', 5, '2023-04-01 16:04:52.000000', 1, '', '', '0.5', 'opcion', 54, 0, 0, '', 0),
(56, 'Nuevo 2', 'Nuevo 2', 1, 5, '2023-04-01 00:00:00.000000', NULL, '2023-04-01 16:05:38.000000', 5, '2023-04-01 16:05:38.000000', 1, '', '', '', 'menu', 0, 0, 0, '', 0);

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
(1, 'TI', 1, 1, 5, '2023-03-24 02:34:56.000000', 5, '2023-03-24 02:35:04.000000', NULL, NULL, 0);

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
(1, 'Categoria A', 1, 5, '2023-03-24 02:51:39.000000', 5, '2023-03-24 02:51:46.000000', NULL, NULL, 0),
(2, 'Categoria B', 1, 5, '2023-03-31 12:35:13.000000', 5, '2023-03-31 12:35:21.000000', NULL, NULL, 0);

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
(1, 'InformacionA', 'Informacion', 1, 5, '2023-03-24 02:32:15.000000', 5, '2023-03-24 02:32:31.000000', NULL, NULL, 0);

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
(1, 'Cobertura Probabilidad', 'Cobertura Probabilidad', 5, '2023-03-22 00:00:00.000000', 5, '2023-03-22 00:00:00.000000', NULL, NULL, 0),
(2, 'Cobertura Impacto', 'Cobertura Impacto', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(3, 'Todos', 'Todos', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(4, 'hola', 'hola', 5, '2023-03-31 00:00:00.000000', NULL, '2023-03-31 12:39:09.000000', NULL, NULL, 1),
(5, 'holaaaa', 'holaaaa', 5, '2023-03-31 00:00:00.000000', NULL, '2023-03-31 12:40:58.000000', NULL, NULL, 1);

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

--
-- Volcado de datos para la tabla `correo_actividad`
--

INSERT INTO `correo_actividad` (`id`, `idactividad`, `fecha_envio`, `idusuario`) VALUES
(14, 2, '2023-03-26 00:00:00', 8),
(15, 3, '2023-03-26 00:00:00', 8),
(16, 4, '2023-03-26 00:00:00', 8),
(17, 6, '2023-03-26 00:00:00', 8);

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
(22, 1, '2023-03-26 00:00:00', 8),
(23, 2, '2023-03-26 00:00:00', 8),
(24, 3, '2023-03-26 00:00:00', 8),
(25, 4, '2023-03-26 00:00:00', 8),
(26, 5, '2023-03-26 00:00:00', 8),
(27, 6, '2023-03-26 00:00:00', 5),
(28, 7, '2023-03-26 00:00:00', 8);

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
(1, 1, 'Es una amena<a de nivel A', 5, '2023-03-24 02:51:22.000000', 5, '2023-03-24 02:51:31.000000', NULL, NULL, 0);

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
(1, 1, 'Vulnerabilidad A', 5, '2023-03-24 02:52:01.000000', NULL, NULL, NULL, NULL, 0),
(2, 2, 'Vulnerabilidad  B', 5, '2023-03-31 12:35:55.000000', 5, '2023-03-31 12:36:06.000000', NULL, NULL, 0);

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
(18, 5, 11, '0', ''),
(19, 5, 13, '0', '15'),
(20, 5, 22, '0', '23');

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
(3, 2, 16),
(4, 2, 19),
(5, 3, 17),
(6, 3, 18),
(7, 4, 17),
(8, 4, 19),
(9, 5, 21),
(10, 5, 24),
(11, 6, 21),
(12, 6, 19),
(13, 7, 17),
(14, 7, 24),
(15, 8, 21),
(16, 8, 18),
(23, 9, 21),
(24, 9, 18),
(39, 1, 16),
(40, 1, 18),
(43, 10, 21),
(44, 10, 18);

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
(11, 'Financiera Efectiva SA', 1, 5, '2023-03-23 12:11:09.000000', 5, '2023-03-23 12:11:38.000000', 5, '2023-03-23 12:11:38.000000', 1),
(12, 'Financiera Efectiva SA', 1, 5, '2023-03-23 12:13:32.000000', NULL, NULL, NULL, NULL, 0),
(13, 'Financiera Prueba', 1, 5, '2023-03-23 13:14:28.000000', 5, '2023-03-27 19:10:55.000000', NULL, NULL, 0);

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
(1, 2);

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
(1, 'Por Iniciar', 'Por Iniciar', 5, '2023-03-25 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(2, 'En Proceso', 'En Proceso', 5, '2023-03-25 00:00:00.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 'Bajo', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(2, 'Bajo', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(3, 'Medio', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(4, 'Medio', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(5, 'Fuerte', 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(6, 'Medio', 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(7, 'Medio', 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(8, '', 5, '2023-03-29 00:00:00.000000', NULL, '2023-03-29 17:28:39.000000', NULL, NULL, 1),
(9, 'Medio', 5, '2023-03-31 00:00:00.000000', NULL, '2023-03-31 01:50:20.000000', NULL, NULL, 1),
(10, 'Medio', 5, '2023-03-31 00:00:00.000000', 5, '2023-03-31 00:00:00.000000', NULL, NULL, 0);

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

--
-- Volcado de datos para la tabla `evaluacion_riesgo`
--

INSERT INTO `evaluacion_riesgo` (`id`, `id_tipo_riesgo`, `id_empresa`, `id_area`, `id_unidad`, `id_macroproceso`, `id_proceso`, `id_activo`, `id_tipo_amenaza`, `id_descripcion_amenaza`, `id_tipo_vulnerabilidad`, `id_descripcion_vulnerabilidad`, `riesgo`, `valor_probabilidad`, `probabilidad`, `valor_impacto`, `impacto`, `valor`, `id_control`, `riesgo_controlado_probabilidad`, `riesgo_controlado_impacto`, `riesgo_controlado_valor`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(6, 1, 12, 15, 11, 3, 3, 10, 1, 1, 1, 1, 'Inadecuada gestión y desempeño de Bantotal por Incumplimiento en la ejecución de tareas y actividades de diseño y desarrollo de software, puede afecta', 5, 'Improbable', '10000', 'Moderado', 'Moderado', 5, '4.5', '10000', 'Moderado', 1, 5, '2023-03-27 16:45:03.000000', 5, '2023-03-27 18:53:50.000000', NULL, NULL, 0),
(7, 1, 12, 15, 11, 3, 3, 10, 1, 1, 1, 1, 'Inadecuada2 gestión y desempeño de Bantotal por Incumplimiento en la ejecución de tareas y actividades de diseño y desarrollo de software, puede afect', 5, 'Improbable', '10000', 'Moderado', 'Moderado', 5, '4.5', 'Moderado', 'Moderado', 1, 5, '2023-03-27 16:51:34.000000', 5, '2023-03-27 16:53:45.000000', NULL, NULL, 0),
(8, 1, 12, 15, 11, 3, 3, 10, 1, 1, 1, 1, 'Riesgo C', 5, 'Improbable', '10000', 'Moderado', 'Moderado', 5, '4.5', '10000', 'Moderado', 1, 5, '2023-03-29 17:20:52.000000', NULL, NULL, NULL, NULL, 0);

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

--
-- Volcado de datos para la tabla `evaluacion_riesgos_controles`
--

INSERT INTO `evaluacion_riesgos_controles` (`id`, `id_evaluacion_riesgo`, `id_control`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deteled`, `is_deleted`) VALUES
(7, 6, 5, 5, '2023-03-27 16:45:03', NULL, NULL, NULL, NULL, 0),
(8, 7, 5, 5, '2023-03-27 16:51:34', NULL, NULL, NULL, NULL, 0),
(9, 8, 5, 5, '2023-03-29 17:20:52', NULL, NULL, NULL, NULL, 0);

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

--
-- Volcado de datos para la tabla `evaluacion_riesgo_historial`
--

INSERT INTO `evaluacion_riesgo_historial` (`id`, `id_tipo_riesgo`, `id_empresa`, `id_area`, `id_unidad`, `id_macroproceso`, `id_proceso`, `id_activo`, `id_tipo_amenaza`, `id_descripcion_amenaza`, `id_tipo_vulnerabilidad`, `id_descripcion_vulnerabilidad`, `riesgo`, `valor_probabilidad`, `probabilidad`, `valor_impacto`, `impacto`, `valor`, `id_control`, `riesgo_controlado_probabilidad`, `riesgo_controlado_impacto`, `riesgo_controlado_valor`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(1, 1, 12, 11, 8, 1, 1, 8, 1, 1, 1, 1, 'Riesgo A', 5, 'Improbable', '6000', 'Menor', 'Medio', 3, 'Rara', 'Insignificante', 'Medio', 1, 5, '2023-03-26 17:23:34.000000', NULL, NULL, NULL, NULL, 0),
(2, 1, 12, 11, 8, 1, 1, 8, 1, 1, 1, 1, 'Riesgo A', 5, '', '6000', '', 'Moderado', 3, '4.75', '5700', 'Moderado', 1, 5, '2023-03-26 17:57:10.000000', NULL, NULL, NULL, NULL, 0),
(3, 1, 12, 11, 8, 1, 1, 8, 1, 1, 1, 1, 'Riesgo A', 5, '', '6000', '', 'Moderado', 3, '4.75', '5700', 'Moderado', 1, 5, '2023-03-26 17:57:11.000000', NULL, NULL, NULL, NULL, 0),
(4, 1, 12, 15, 11, 3, 3, 9, 1, 1, 1, 1, 'Inadecuada gestión y desempeño de Bantotal por Incumplimiento en la ejecución de tareas y actividades de diseño y desarrollo de software, puede afecta', 5, 'Improbable', '10000', 'Moderado', 'Moderado', 5, '1', '10000', 'Bajo', 1, 5, '2023-03-27 13:33:52.000000', NULL, NULL, NULL, NULL, 0),
(5, 1, 12, 15, 12, 4, 4, 9, 1, 1, 1, 1, 'Divulgación no autorizada de la información de los Expedientes de crédito por Exposición de información en lugares de acceso común, puede afectar a la', 5, 'Improbable', '10000', 'Moderado', 'Moderado', 5, '1', '10000', 'Bajo', 1, 5, '2023-03-27 13:33:53.000000', NULL, NULL, NULL, NULL, 0),
(6, 1, 12, 15, 11, 3, 3, 9, 1, 1, 1, 1, 'Inadecuada gestión y desempeño de Bantotal por Incumplimiento en la ejecución de tareas y actividades de diseño y desarrollo de software, puede afecta', 5, 'Moderado', '10000', 'Moderado', 'Moderado', 5, 'Rara', 'Moderado', 'Moderado', 1, 5, '2023-03-27 13:33:53.000000', NULL, NULL, NULL, NULL, 0),
(7, 1, 12, 15, 11, 3, 3, 10, 1, 1, 1, 1, 'Inadecuada2 gestión y desempeño de Bantotal por Incumplimiento en la ejecución de tareas y actividades de diseño y desarrollo de software, puede afect', 5, 'Improbable', '10000', 'Moderado', 'Moderado', 5, 'Rara', 'Moderado', 'Moderado', 1, 5, '2023-03-27 16:53:45.000000', NULL, NULL, NULL, NULL, 0),
(8, 1, 12, 15, 11, 3, 3, 10, 1, 1, 1, 1, 'Inadecuada gestión y desempeño de Bantotal por Incumplimiento en la ejecución de tareas y actividades de diseño y desarrollo de software, puede afecta', 5, 'Improbable', '10000', 'Moderado', 'Moderado', 5, '4.5', '10000', 'Moderado', 1, 5, '2023-03-27 18:52:33.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 'Moderado', '1 Valor', 'Numero', '=  ', NULL, NULL, NULL, NULL, 'Moderado', 2, 1, 5, '2023-03-24 02:49:59.000000', 5, '2023-03-24 08:20:07.000000', 5, '2023-03-24 08:20:07.000000', 1),
(2, 'Insignificante', '2 Valores', 'Numero', NULL, '>', 0, '<=', 3000, 'Insignificante', 1, 2, 5, '2023-03-24 08:14:38.000000', 5, '2023-03-30 16:13:25.000000', NULL, NULL, 0),
(3, 'Menor', '2 Valores', 'Numero', NULL, '>', 3000, '<=', 6000, 'Menor', 1, 2, 5, '2023-03-24 08:30:48.000000', 5, '2023-03-30 16:13:29.000000', NULL, NULL, 0),
(4, 'Moderado', '2 Valores', 'Numero', NULL, '>', 6000, '<=', 10000, 'Moderado', 1, 2, 5, '2023-03-24 08:32:06.000000', 5, '2023-03-30 16:13:31.000000', NULL, NULL, 0),
(5, 'Alto', '2 Valores', 'Numero', NULL, '>', 10000, '<=', 45000, 'Alto', 1, 2, 5, '2023-03-24 08:32:40.000000', 5, '2023-03-30 16:13:35.000000', NULL, NULL, 0),
(6, 'Catastrófico', '2 Valores', 'Numero', NULL, '>', 45000, '<=', 100000, 'Catastrófico', 1, 2, 5, '2023-03-24 08:33:16.000000', 5, '2023-03-30 16:13:38.000000', NULL, NULL, 0),
(7, 'Alto', '1 Valor', 'Formula', '= 10000 Moderado', NULL, NULL, NULL, NULL, 'Alto', 2, 1, 5, '2023-03-26 17:21:43.000000', 5, '2023-03-30 16:12:26.000000', NULL, NULL, 0);

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

--
-- Volcado de datos para la tabla `inventario_clasificacion_activo`
--

INSERT INTO `inventario_clasificacion_activo` (`id`, `idempresa`, `idarea`, `idunidad`, `idmacroproceso`, `idproceso`, `activo`, `desc_activo`, `idtipo_activo`, `idcategoria_activo`, `idubicacion`, `idpropietario`, `idcustodio`, `val_c`, `val_i`, `val_d`, `idvalor`, `estado`, `comentario`, `observacion`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(10, 12, 15, 11, 3, 3, 'Activo A', 'Activo A', 1, 1, 1, 4, 4, 1, 1, 1, 1, 2, 'Activo A', '', 5, '2023-03-27 16:42:54.000000', 5, '2023-03-29 12:21:06.000000', NULL, NULL, 0),
(11, 12, 15, 11, 3, 3, 'Activo B', 'Activo B', 1, 1, 1, 4, 4, 1, 1, 1, 1, 2, 'Activo B', '', 5, '2023-03-27 16:44:06.000000', 5, '2023-03-29 09:38:26.000000', NULL, NULL, 0);

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

--
-- Volcado de datos para la tabla `inventario_clasificacion_activo_historial`
--

INSERT INTO `inventario_clasificacion_activo_historial` (`id`, `id_ica`, `idempresa`, `idarea`, `idunidad`, `idmacroproceso`, `idproceso`, `activo`, `desc_activo`, `idtipo_activo`, `idcategoria_activo`, `idubicacion`, `idpropietario`, `idcustodio`, `val_c`, `val_i`, `val_d`, `idvalor`, `estado`, `comentario`, `observacion`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(20, 10, 12, 15, 11, 3, 3, 'Activo A', 'Activo A', 1, 1, 1, 4, 4, 1, 1, 1, 1, 4, 'Activo A', NULL, 8, '2023-03-27 16:43:28.000000', NULL, NULL, NULL, NULL, 0),
(21, 11, 12, 15, 11, 3, 3, 'Activo B', 'Activo B', 1, 1, 1, 4, 4, 1, 1, 1, 1, 4, 'Activo B', NULL, 8, '2023-03-27 16:44:22.000000', NULL, NULL, NULL, NULL, 0),
(22, 11, 12, 15, 11, 3, 3, 'Activo B', 'Activo B', 1, 1, 1, 4, 4, 1, 1, 1, 1, 2, 'Activo B', NULL, 5, '2023-03-29 09:38:26.000000', NULL, NULL, NULL, NULL, 0),
(23, 10, 12, 15, 11, 3, 3, 'Activo A', 'Activo A', 1, 1, 1, 4, 4, 1, 1, 1, 1, 2, 'Activo A', NULL, 5, '2023-03-29 12:21:06.000000', NULL, NULL, NULL, NULL, 0);

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
(200, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-28 11:46:16.000000'),
(201, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-28 12:12:03.000000'),
(202, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 00:35:47.000000'),
(203, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 01:19:32.000000'),
(204, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 09:38:10.000000'),
(205, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 10:05:10.000000'),
(206, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 12:20:52.000000'),
(207, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 12:22:18.000000'),
(208, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 17:17:02.000000'),
(209, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-29 22:37:29.000000'),
(210, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-29 23:02:58.000000'),
(211, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 02:51:17.000000'),
(212, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-30 02:54:25.000000'),
(213, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 09:57:50.000000'),
(214, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-30 09:57:55.000000'),
(215, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 09:58:33.000000'),
(216, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-30 10:00:12.000000'),
(217, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 10:01:22.000000'),
(218, 'Opera 96.0.0.0', '::1', 5, 3, 'El usuario admin ah modificado los datos del usuario: testeo1', '2023-03-30 10:01:34.000000'),
(219, 'Opera 96.0.0.0', '::1', 5, 3, 'El usuario admin a Desabilitado al usuario: testeo1', '2023-03-30 10:01:50.000000'),
(220, 'Opera 96.0.0.0', '::1', 5, 3, 'El usuario admin a Habilitado al usuario: testeo1', '2023-03-30 10:01:54.000000'),
(221, 'Opera 96.0.0.0', '::1', 5, 4, 'El usuario: admin ah realizado cambio de clave al usuario: 4', '2023-03-30 10:22:13.000000'),
(222, 'Opera 96.0.0.0', '::1', 5, 3, 'El usuario admin a Desabilitado al usuario: testeo1', '2023-03-30 10:23:26.000000'),
(223, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBA', '2023-03-30 10:28:40.000000'),
(224, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBA', '2023-03-30 11:09:04.000000'),
(225, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-03-30 11:09:41.000000'),
(226, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-03-30 11:09:47.000000'),
(227, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-03-30 11:09:57.000000'),
(228, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBA', '2023-03-30 11:12:18.000000'),
(229, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-03-30 11:12:20.000000'),
(230, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBA', '2023-03-30 11:16:59.000000'),
(231, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-03-30 11:17:03.000000'),
(232, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-30 11:42:57.000000'),
(233, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 12:14:30.000000'),
(234, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-30 12:58:57.000000'),
(235, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 15:31:50.000000'),
(236, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-30 16:04:37.000000'),
(237, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 16:05:08.000000'),
(238, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-30 16:06:18.000000'),
(239, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-30 16:06:23.000000'),
(240, 'Opera 96.0.0.0', '::1', 5, 3, 'El usuario admin ah modificado los datos del usuario: testeo1', '2023-03-30 16:08:35.000000'),
(241, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBA', '2023-03-30 16:09:21.000000'),
(242, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-03-30 16:09:36.000000'),
(243, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 00:39:23.000000'),
(244, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 01:03:55.000000'),
(245, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 01:13:06.000000'),
(246, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah creado el perfil : PRUEBA', '2023-03-31 01:13:20.000000'),
(247, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario admin ah eliminado el perfil : PRUEBA', '2023-03-31 01:13:23.000000'),
(248, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 01:42:55.000000'),
(249, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 01:47:39.000000'),
(250, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 02:25:57.000000'),
(251, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 08:34:53.000000'),
(252, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 10:31:55.000000'),
(253, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 12:25:38.000000'),
(254, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-03-31 14:13:10.000000'),
(255, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-03-31 17:56:21.000000'),
(256, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 02:15:13.000000'),
(257, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 11:55:54.000000'),
(258, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 12:32:58.000000'),
(259, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 12:41:17.000000'),
(260, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 14:27:55.000000'),
(261, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 14:34:18.000000'),
(262, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 15:12:02.000000'),
(263, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 15:12:07.000000'),
(264, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 16:33:54.000000'),
(265, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 20:49:58.000000'),
(266, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 21:26:58.000000'),
(267, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 21:39:07.000000'),
(268, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 22:05:45.000000'),
(269, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 22:23:35.000000'),
(270, 'Opera 96.0.0.0', '::1', 5, 5, 'El usuario admin ah modificado los datos del usuario: admin', '2023-04-01 22:38:17.000000'),
(271, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 23:28:59.000000'),
(272, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-01 23:32:16.000000'),
(273, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-01 23:56:31.000000'),
(274, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 00:11:43.000000'),
(275, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 00:40:59.000000'),
(276, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 01:08:29.000000'),
(277, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 01:48:57.000000'),
(278, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 02:13:03.000000'),
(279, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 02:50:58.000000'),
(280, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 02:51:56.000000'),
(281, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 04:12:31.000000'),
(282, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 16:41:41.000000'),
(283, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 17:05:58.000000'),
(284, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a iniciado sesión', '2023-04-02 22:13:10.000000'),
(285, 'Opera 96.0.0.0', '::1', 5, 0, 'El usuario: admin a cerrado sesión correstamente desde el sistema', '2023-04-02 22:50:15.000000');

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
(1, 'Rh Macro', 1, 12, 11, 8, 5, '2023-03-24 02:22:29.000000', 5, '2023-03-24 02:23:34.000000', NULL, NULL, 0),
(2, 'Macro RH', 1, 13, 14, 10, 5, '2023-03-26 16:51:54.000000', NULL, NULL, NULL, NULL, 0),
(3, 'Gestión_de_Centro_de_Datos', 1, 12, 15, 11, 5, '2023-03-27 10:35:55.000000', NULL, NULL, NULL, NULL, 0),
(4, 'Custodia_y_Control_de_Expedientes_de_Crédito_y_Valorados', 1, 12, 15, 12, 5, '2023-03-27 10:36:24.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 'Moderado', '>', 20000, '<', 52000, '#e85454', 'Moderado', 1, 5, '2023-03-24 02:50:33.000000', 5, '2023-03-27 11:48:30.000000', NULL, NULL, 0),
(2, 'Bajo', '>', 0, '<', 15000, '#000000', 'Bajo', 1, 5, '2023-03-27 11:48:49.000000', 5, '2023-03-31 12:30:01.000000', NULL, NULL, 0);

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

--
-- Volcado de datos para la tabla `plan_accion`
--

INSERT INTO `plan_accion` (`id`, `plan_accion`, `descripcion`, `fecha_inicio`, `fecha_fin`, `idempresa`, `idarea`, `idunidad`, `idposicion`, `idusuario`, `idprioridad`, `idestado`, `idalerta`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`, `actividades`, `id_riesgo`, `id_control`) VALUES
(1, 'Plan B', 'Plan B', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 12, 11, 8, 1, 8, 1, 2, 1, 5, '2023-03-26 00:00:00.000000', 8, '2023-03-28 01:48:29.000000', 5, '2023-03-28 01:48:29.000000', 1, NULL, '', '3'),
(2, 'Plan B', 'Plan B', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 12, 11, 8, 1, 8, 1, 2, 1, 8, '2023-03-26 00:00:00.000000', 8, '2023-03-28 01:48:34.000000', 5, '2023-03-28 01:48:34.000000', 1, NULL, '', '3'),
(3, 'Plan C', 'Plan C', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 12, 11, 8, 1, 8, 1, 2, 1, 8, '2023-03-26 00:00:00.000000', NULL, '2023-03-28 01:48:46.000000', 5, '2023-03-28 01:48:46.000000', 1, NULL, '', '3'),
(4, 'Plan D', 'Plan D', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 12, 11, 8, 1, 8, 1, 2, 1, 8, '2023-03-26 00:00:00.000000', NULL, '2023-03-28 01:48:47.000000', 5, '2023-03-28 01:48:47.000000', 1, NULL, '', '3'),
(5, 'Plan E', 'Plan E', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 12, 11, 8, 1, 8, 1, 2, 1, 8, '2023-03-26 00:00:00.000000', NULL, '2023-03-28 01:48:48.000000', 5, '2023-03-28 01:48:48.000000', 1, NULL, '', '3'),
(6, 'Plan F', 'Plan F', '2023-03-26 00:00:00.000000', '2023-03-30 00:00:00.000000', 12, 11, 8, 1, 5, 2, 2, 1, 8, '2023-03-26 00:00:00.000000', NULL, '2023-03-28 01:48:50.000000', 5, '2023-03-28 01:48:50.000000', 1, NULL, '', '3'),
(7, 'Plan Z', 'Plan Z', '2023-03-26 00:00:00.000000', '2023-06-05 00:00:00.000000', 12, 11, 8, 1, 8, 3, 2, 1, 5, '2023-03-26 00:00:00.000000', NULL, '2023-03-28 01:50:31.000000', 5, '2023-03-28 01:50:31.000000', 1, NULL, '1', '3-4'),
(8, 'Plan de Adecuacion de gestin', 'Plan de Adecuacion de gestin', '2023-03-28 00:00:00.000000', '2023-06-05 00:00:00.000000', 12, 15, 11, 4, 8, 3, 1, 1, 5, '2023-03-28 00:00:00.000000', NULL, NULL, NULL, NULL, 0, NULL, '6', '5');

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
(1, 'Gerente RH', 1, 12, 11, 8, 5, '2023-03-24 02:28:03.000000', 5, '2023-03-24 02:28:41.000000', NULL, NULL, 0),
(2, 'Gerente Logistica', 1, 12, 13, 9, 5, '2023-03-24 02:29:02.000000', NULL, NULL, NULL, NULL, 0),
(3, 'Puesto RH', 1, 13, 14, 10, 5, '2023-03-26 16:54:30.000000', NULL, NULL, NULL, NULL, 0),
(4, 'Gerente de IS TI', 1, 12, 15, 11, 5, '2023-03-27 10:39:10.000000', NULL, NULL, NULL, NULL, 0),
(5, 'Gerente Operaciones', 1, 12, 15, 12, 5, '2023-03-27 10:39:23.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 'Baja', 'Baja', 5, '2023-03-25 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(2, 'Media', 'Media', 5, '2023-03-25 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(3, 'Alta', 'Alta', 5, '2023-03-25 00:00:00.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 'Improbable', '2 Valores', 'Numero', '=  ', '>', 4, '<=', 8, 'Improbable', 1, 1, 5, '2023-03-24 02:46:32.000000', 5, '2023-03-24 08:25:50.000000', 5, '2023-03-24 08:19:25.000000', 1),
(2, 'Rara', '2 Valores', 'Numero', NULL, '>', 1, '<=', 3, 'Rara', 1, 2, 5, '2023-03-24 08:13:02.000000', 5, '2023-03-30 16:12:40.000000', NULL, NULL, 0),
(3, 'Moderado', '2 Valores', 'Numero', NULL, '>', 4, '<=', 8, 'Moderado', 1, 2, 5, '2023-03-24 08:25:06.000000', 5, '2023-03-30 16:13:08.000000', NULL, NULL, 0),
(4, 'Alto', '2 Valores', 'Numero', NULL, '>', 9, '<=', 14, 'Alto', 1, 2, 5, '2023-03-24 08:25:39.000000', 5, '2023-03-30 16:13:12.000000', NULL, NULL, 0),
(5, 'Muy Probable', '2 Valores', 'Numero', NULL, '>', 15, '<=', 29, 'Muy Probable', 1, 2, 5, '2023-03-24 08:29:08.000000', 5, '2023-03-30 16:13:15.000000', NULL, NULL, 0),
(6, 'Casi Certeza', '2 Valores', 'Numero', NULL, '>', 30, '<=', 104, 'Casi Certeza', 1, 2, 5, '2023-03-24 08:29:32.000000', 5, '2023-03-30 16:13:18.000000', NULL, NULL, 0),
(7, 'Moderado', '1 Valor', 'Formula', '= 5 Improbable', NULL, NULL, NULL, NULL, 'Moderado', 2, 1, 5, '2023-03-26 17:21:12.000000', 5, '2023-03-30 16:12:33.000000', NULL, NULL, 0);

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
(1, 'Proceso Pruebaa', 5, 12, 15, 11, 3, 5, '2023-03-24 02:26:19.000000', 5, '2023-03-31 09:09:34.000000', NULL, NULL, 0),
(2, 'Proceso Prueba', 5, 12, 15, 11, 3, 5, '2023-03-26 16:52:09.000000', 5, '2023-03-31 09:07:00.000000', NULL, NULL, 0),
(3, 'Gestión_de_Servicio_de_Terceros_Centro_de_Datos', 1, 12, 15, 11, 3, 5, '2023-03-27 10:36:49.000000', NULL, NULL, NULL, NULL, 0),
(4, 'Custodia_de_Expedientes_y_Valorados_en_Agencia_y_Oficina_Especial', 1, 12, 15, 12, 4, 5, '2023-03-27 10:37:07.000000', NULL, NULL, NULL, NULL, 0),
(5, 'Proceso Pruebasss', 2, 12, 15, 11, 3, 5, '2023-03-31 09:06:53.000000', 5, '2023-03-31 09:11:26.000000', NULL, NULL, 0);

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

--
-- Volcado de datos para la tabla `registro_controles`
--

INSERT INTO `registro_controles` (`id`, `IDR`, `riesgo`, `IDC`, `nom_control`, `idCobertura`, `evaluacion`, `estado`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(3, '', '', 'C00001', 'Control 1', 3, 'BAJO', 1, 5, '2023-03-24 00:00:00.000000', NULL, '2023-03-28 01:44:23.000000', NULL, NULL, 1),
(4, '1', 'Riesgo A', 'C00001', 'Control 2', 3, 'BAJO', 1, 5, '2023-03-26 00:00:00.000000', NULL, '2023-03-28 01:45:32.000000', NULL, NULL, 1),
(5, '', '', 'C00001', 'PLANIFICACION DE PROYECTO', 1, 'MEDIO', 1, 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0);

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
(16, 11, 1, 1, 1, 1, 'tb_item', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(17, 11, 1, 1, 1, 1, 'tb_item', 3, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
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
(46, 14, 0, 0, 0, 0, 'tb_modulo', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(47, 14, 0, 0, 0, 0, 'tb_modulo', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(48, 14, 1, 1, 1, 1, 'tb_modulo', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(49, 14, 0, 0, 0, 0, 'tb_opcion', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(50, 14, 0, 0, 0, 0, 'tb_opcion', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(51, 14, 0, 0, 0, 0, 'tb_opcion', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(52, 14, 0, 0, 0, 0, 'tb_opcion', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(53, 14, 0, 0, 0, 0, 'tb_opcion', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(54, 14, 0, 0, 0, 0, 'tb_opcion', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(55, 14, 0, 0, 0, 0, 'tb_opcion', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(56, 14, 1, 1, 1, 1, 'tb_opcion', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(57, 14, 1, 1, 1, 1, 'tb_opcion', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(58, 14, 1, 1, 1, 1, 'tb_opcion', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(59, 14, 1, 1, 1, 1, 'tb_opcion', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(60, 14, 0, 0, 0, 0, 'tb_item', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(61, 14, 0, 0, 0, 0, 'tb_item', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(62, 14, 0, 0, 0, 0, 'tb_item', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(63, 14, 0, 0, 0, 0, 'tb_item', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(64, 14, 1, 0, 0, 0, 'tb_item', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(65, 14, 1, 0, 0, 0, 'tb_item', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(66, 14, 0, 0, 0, 0, 'tb_item', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(67, 14, 0, 0, 0, 0, 'tb_item', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(68, 14, 0, 0, 0, 0, 'tb_item', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(69, 14, 0, 0, 0, 0, 'tb_item', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(70, 14, 0, 0, 0, 0, 'tb_item', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(71, 14, 0, 0, 0, 0, 'tb_item', 12, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(72, 14, 0, 0, 0, 0, 'tb_item', 13, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(73, 14, 0, 0, 0, 0, 'tb_item', 14, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(74, 14, 0, 0, 0, 0, 'tb_item', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(75, 14, 0, 0, 0, 0, 'tb_item', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(76, 14, 0, 0, 0, 0, 'tb_item', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(77, 14, 0, 0, 0, 0, 'tb_item', 18, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(78, 14, 0, 0, 0, 0, 'tb_item', 19, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(79, 14, 0, 0, 0, 0, 'tb_item', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(80, 14, 0, 0, 0, 0, 'tb_item', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(81, 14, 0, 0, 0, 0, 'tb_item', 22, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(82, 14, 0, 0, 0, 0, 'tb_item', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(83, 14, 0, 0, 0, 0, 'tb_item', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(84, 14, 0, 0, 0, 0, 'tb_item', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(85, 14, 0, 0, 0, 0, 'tb_item', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(86, 14, 0, 0, 0, 0, 'tb_item', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(87, 14, 0, 0, 0, 0, 'tb_item', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(88, 14, 0, 0, 0, 0, 'tb_item', 29, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(89, 14, 0, 0, 0, 0, 'tb_item', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(90, 15, 0, 0, 0, 0, 'tb_modulo', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(91, 15, 0, 0, 0, 0, 'tb_modulo', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(92, 15, 0, 0, 0, 0, 'tb_modulo', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(93, 15, 0, 0, 0, 0, 'tb_opcion', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(94, 15, 0, 0, 0, 0, 'tb_opcion', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(95, 15, 0, 0, 0, 0, 'tb_opcion', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(96, 15, 0, 0, 0, 0, 'tb_opcion', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(97, 15, 0, 0, 0, 0, 'tb_opcion', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(98, 15, 0, 0, 0, 0, 'tb_opcion', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(99, 15, 0, 0, 0, 0, 'tb_opcion', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(100, 15, 0, 0, 0, 0, 'tb_opcion', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(101, 15, 0, 0, 0, 0, 'tb_opcion', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(102, 15, 0, 0, 0, 0, 'tb_opcion', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(103, 15, 0, 0, 0, 0, 'tb_opcion', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(104, 15, 0, 0, 0, 0, 'tb_item', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(105, 15, 0, 0, 0, 0, 'tb_item', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(106, 15, 0, 0, 0, 0, 'tb_item', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(107, 15, 0, 0, 0, 0, 'tb_item', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(108, 15, 0, 0, 0, 0, 'tb_item', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(109, 15, 0, 0, 0, 0, 'tb_item', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(110, 15, 0, 0, 0, 0, 'tb_item', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(111, 15, 0, 0, 0, 0, 'tb_item', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(112, 15, 0, 0, 0, 0, 'tb_item', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(113, 15, 0, 0, 0, 0, 'tb_item', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(114, 15, 0, 0, 0, 0, 'tb_item', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(115, 15, 0, 0, 0, 0, 'tb_item', 12, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(116, 15, 0, 0, 0, 0, 'tb_item', 13, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(117, 15, 0, 0, 0, 0, 'tb_item', 14, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(118, 15, 0, 0, 0, 0, 'tb_item', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(119, 15, 0, 0, 0, 0, 'tb_item', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(120, 15, 0, 0, 0, 0, 'tb_item', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(121, 15, 0, 0, 0, 0, 'tb_item', 18, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(122, 15, 0, 0, 0, 0, 'tb_item', 19, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(123, 15, 0, 0, 0, 0, 'tb_item', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(124, 15, 0, 0, 0, 0, 'tb_item', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(125, 15, 0, 0, 0, 0, 'tb_item', 22, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(126, 15, 0, 0, 0, 0, 'tb_item', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(127, 15, 0, 0, 0, 0, 'tb_item', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(128, 15, 0, 0, 0, 0, 'tb_item', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(129, 15, 0, 0, 0, 0, 'tb_item', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(130, 15, 0, 0, 0, 0, 'tb_item', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(131, 15, 0, 0, 0, 0, 'tb_item', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(132, 15, 0, 0, 0, 0, 'tb_item', 29, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(133, 15, 0, 0, 0, 0, 'tb_item', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(134, 16, 0, 0, 0, 0, 'tb_modulo', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(135, 16, 0, 0, 0, 0, 'tb_modulo', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(136, 16, 0, 0, 0, 0, 'tb_modulo', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(137, 16, 0, 0, 0, 0, 'tb_opcion', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(138, 16, 0, 0, 0, 0, 'tb_opcion', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(139, 16, 0, 0, 0, 0, 'tb_opcion', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(140, 16, 0, 0, 0, 0, 'tb_opcion', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(141, 16, 0, 0, 0, 0, 'tb_opcion', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(142, 16, 0, 0, 0, 0, 'tb_opcion', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(143, 16, 0, 0, 0, 0, 'tb_opcion', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(144, 16, 0, 0, 0, 0, 'tb_opcion', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(145, 16, 0, 0, 0, 0, 'tb_opcion', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(146, 16, 0, 0, 0, 0, 'tb_opcion', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(147, 16, 0, 0, 0, 0, 'tb_opcion', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(148, 16, 0, 0, 0, 0, 'tb_item', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(149, 16, 0, 0, 0, 0, 'tb_item', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(150, 16, 0, 0, 0, 0, 'tb_item', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(151, 16, 0, 0, 0, 0, 'tb_item', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(152, 16, 0, 0, 0, 0, 'tb_item', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(153, 16, 0, 0, 0, 0, 'tb_item', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(154, 16, 0, 0, 0, 0, 'tb_item', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(155, 16, 0, 0, 0, 0, 'tb_item', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(156, 16, 0, 0, 0, 0, 'tb_item', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(157, 16, 0, 0, 0, 0, 'tb_item', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(158, 16, 0, 0, 0, 0, 'tb_item', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(159, 16, 0, 0, 0, 0, 'tb_item', 12, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(160, 16, 0, 0, 0, 0, 'tb_item', 13, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(161, 16, 0, 0, 0, 0, 'tb_item', 14, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(162, 16, 0, 0, 0, 0, 'tb_item', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(163, 16, 0, 0, 0, 0, 'tb_item', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(164, 16, 0, 0, 0, 0, 'tb_item', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(165, 16, 0, 0, 0, 0, 'tb_item', 18, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(166, 16, 0, 0, 0, 0, 'tb_item', 19, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(167, 16, 0, 0, 0, 0, 'tb_item', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(168, 16, 0, 0, 0, 0, 'tb_item', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(169, 16, 0, 0, 0, 0, 'tb_item', 22, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(170, 16, 0, 0, 0, 0, 'tb_item', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(171, 16, 0, 0, 0, 0, 'tb_item', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(172, 16, 0, 0, 0, 0, 'tb_item', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(173, 16, 0, 0, 0, 0, 'tb_item', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(174, 16, 0, 0, 0, 0, 'tb_item', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(175, 16, 0, 0, 0, 0, 'tb_item', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(176, 16, 0, 0, 0, 0, 'tb_item', 29, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(177, 16, 0, 0, 0, 0, 'tb_item', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(178, 17, 0, 0, 0, 0, 'tb_modulo', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(179, 17, 0, 0, 0, 0, 'tb_modulo', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(180, 17, 0, 0, 0, 0, 'tb_modulo', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(181, 17, 0, 0, 0, 0, 'tb_opcion', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(182, 17, 0, 0, 0, 0, 'tb_opcion', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(183, 17, 0, 0, 0, 0, 'tb_opcion', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(184, 17, 0, 0, 0, 0, 'tb_opcion', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(185, 17, 0, 0, 0, 0, 'tb_opcion', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(186, 17, 0, 0, 0, 0, 'tb_opcion', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(187, 17, 0, 0, 0, 0, 'tb_opcion', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(188, 17, 0, 0, 0, 0, 'tb_opcion', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(189, 17, 0, 0, 0, 0, 'tb_opcion', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(190, 17, 0, 0, 0, 0, 'tb_opcion', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(191, 17, 0, 0, 0, 0, 'tb_opcion', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(192, 17, 0, 0, 0, 0, 'tb_item', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(193, 17, 0, 0, 0, 0, 'tb_item', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(194, 17, 0, 0, 0, 0, 'tb_item', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(195, 17, 0, 0, 0, 0, 'tb_item', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(196, 17, 0, 0, 0, 0, 'tb_item', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(197, 17, 0, 0, 0, 0, 'tb_item', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(198, 17, 0, 0, 0, 0, 'tb_item', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(199, 17, 0, 0, 0, 0, 'tb_item', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(200, 17, 0, 0, 0, 0, 'tb_item', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(201, 17, 0, 0, 0, 0, 'tb_item', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(202, 17, 0, 0, 0, 0, 'tb_item', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(203, 17, 0, 0, 0, 0, 'tb_item', 12, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(204, 17, 0, 0, 0, 0, 'tb_item', 13, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(205, 17, 0, 0, 0, 0, 'tb_item', 14, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(206, 17, 0, 0, 0, 0, 'tb_item', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(207, 17, 0, 0, 0, 0, 'tb_item', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(208, 17, 0, 0, 0, 0, 'tb_item', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(209, 17, 0, 0, 0, 0, 'tb_item', 18, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(210, 17, 0, 0, 0, 0, 'tb_item', 19, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(211, 17, 0, 0, 0, 0, 'tb_item', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(212, 17, 0, 0, 0, 0, 'tb_item', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(213, 17, 0, 0, 0, 0, 'tb_item', 22, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(214, 17, 0, 0, 0, 0, 'tb_item', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(215, 17, 0, 0, 0, 0, 'tb_item', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(216, 17, 0, 0, 0, 0, 'tb_item', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(217, 17, 0, 0, 0, 0, 'tb_item', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(218, 17, 0, 0, 0, 0, 'tb_item', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(219, 17, 0, 0, 0, 0, 'tb_item', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(220, 17, 0, 0, 0, 0, 'tb_item', 29, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(221, 17, 0, 0, 0, 0, 'tb_item', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(222, 18, 0, 0, 0, 0, 'tb_modulo', 1, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(223, 18, 0, 0, 0, 0, 'tb_modulo', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(224, 18, 0, 0, 0, 0, 'tb_modulo', 3, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(225, 18, 0, 0, 0, 0, 'tb_opcion', 1, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(226, 18, 0, 0, 0, 0, 'tb_opcion', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(227, 18, 0, 0, 0, 0, 'tb_opcion', 3, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(228, 18, 0, 0, 0, 0, 'tb_opcion', 4, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(229, 18, 0, 0, 0, 0, 'tb_opcion', 5, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(230, 18, 0, 0, 0, 0, 'tb_opcion', 6, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(231, 18, 0, 0, 0, 0, 'tb_opcion', 7, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(232, 18, 0, 0, 0, 0, 'tb_opcion', 8, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(233, 18, 0, 0, 0, 0, 'tb_opcion', 9, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(234, 18, 0, 0, 0, 0, 'tb_opcion', 10, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(235, 18, 0, 0, 0, 0, 'tb_opcion', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(236, 18, 0, 0, 0, 0, 'tb_item', 1, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(237, 18, 0, 0, 0, 0, 'tb_item', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(238, 18, 0, 0, 0, 0, 'tb_item', 3, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(239, 18, 0, 0, 0, 0, 'tb_item', 4, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(240, 18, 0, 0, 0, 0, 'tb_item', 5, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(241, 18, 0, 0, 0, 0, 'tb_item', 6, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(242, 18, 0, 0, 0, 0, 'tb_item', 7, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(243, 18, 0, 0, 0, 0, 'tb_item', 8, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(244, 18, 0, 0, 0, 0, 'tb_item', 9, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(245, 18, 0, 0, 0, 0, 'tb_item', 10, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(246, 18, 0, 0, 0, 0, 'tb_item', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(247, 18, 0, 0, 0, 0, 'tb_item', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(248, 18, 0, 0, 0, 0, 'tb_item', 13, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(249, 18, 0, 0, 0, 0, 'tb_item', 14, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(250, 18, 0, 0, 0, 0, 'tb_item', 15, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(251, 18, 0, 0, 0, 0, 'tb_item', 16, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(252, 18, 0, 0, 0, 0, 'tb_item', 17, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(253, 18, 0, 0, 0, 0, 'tb_item', 18, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(254, 18, 0, 0, 0, 0, 'tb_item', 19, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(255, 18, 0, 0, 0, 0, 'tb_item', 20, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(256, 18, 0, 0, 0, 0, 'tb_item', 21, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(257, 18, 0, 0, 0, 0, 'tb_item', 22, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(258, 18, 0, 0, 0, 0, 'tb_item', 23, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(259, 18, 0, 0, 0, 0, 'tb_item', 24, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(260, 18, 0, 0, 0, 0, 'tb_item', 25, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(261, 18, 0, 0, 0, 0, 'tb_item', 26, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(262, 18, 0, 0, 0, 0, 'tb_item', 27, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(263, 18, 0, 0, 0, 0, 'tb_item', 28, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(264, 18, 0, 0, 0, 0, 'tb_item', 29, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(265, 18, 0, 0, 0, 0, 'tb_item', 30, NULL, NULL, NULL, '0000-00-00 00:00:00', 5, '0000-00-00 00:00:00', 1),
(266, 19, 0, 0, 0, 0, 'tb_modulo', 1, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(267, 19, 0, 0, 0, 0, 'tb_modulo', 2, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(268, 19, 0, 0, 0, 0, 'tb_modulo', 3, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(269, 19, 0, 0, 0, 0, 'tb_opcion', 1, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(270, 19, 0, 0, 0, 0, 'tb_opcion', 2, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(271, 19, 0, 0, 0, 0, 'tb_opcion', 3, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(272, 19, 0, 0, 0, 0, 'tb_opcion', 4, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(273, 19, 0, 0, 0, 0, 'tb_opcion', 5, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(274, 19, 0, 0, 0, 0, 'tb_opcion', 6, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(275, 19, 0, 0, 0, 0, 'tb_opcion', 7, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(276, 19, 0, 0, 0, 0, 'tb_opcion', 8, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(277, 19, 0, 0, 0, 0, 'tb_opcion', 9, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(278, 19, 0, 0, 0, 0, 'tb_opcion', 10, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(279, 19, 0, 0, 0, 0, 'tb_opcion', 11, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(280, 19, 0, 0, 0, 0, 'tb_item', 1, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(281, 19, 0, 0, 0, 0, 'tb_item', 2, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(282, 19, 0, 0, 0, 0, 'tb_item', 3, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(283, 19, 0, 0, 0, 0, 'tb_item', 4, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(284, 19, 0, 0, 0, 0, 'tb_item', 5, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(285, 19, 0, 0, 0, 0, 'tb_item', 6, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(286, 19, 0, 0, 0, 0, 'tb_item', 7, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(287, 19, 0, 0, 0, 0, 'tb_item', 8, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(288, 19, 0, 0, 0, 0, 'tb_item', 9, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(289, 19, 0, 0, 0, 0, 'tb_item', 10, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(290, 19, 0, 0, 0, 0, 'tb_item', 11, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(291, 19, 0, 0, 0, 0, 'tb_item', 12, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(292, 19, 0, 0, 0, 0, 'tb_item', 13, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(293, 19, 0, 0, 0, 0, 'tb_item', 14, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(294, 19, 0, 0, 0, 0, 'tb_item', 15, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(295, 19, 0, 0, 0, 0, 'tb_item', 16, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(296, 19, 0, 0, 0, 0, 'tb_item', 17, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(297, 19, 0, 0, 0, 0, 'tb_item', 18, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(298, 19, 0, 0, 0, 0, 'tb_item', 19, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(299, 19, 0, 0, 0, 0, 'tb_item', 20, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(300, 19, 0, 0, 0, 0, 'tb_item', 21, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(301, 19, 0, 0, 0, 0, 'tb_item', 22, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(302, 19, 0, 0, 0, 0, 'tb_item', 23, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(303, 19, 0, 0, 0, 0, 'tb_item', 24, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(304, 19, 0, 0, 0, 0, 'tb_item', 25, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(305, 19, 0, 0, 0, 0, 'tb_item', 26, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(306, 19, 0, 0, 0, 0, 'tb_item', 27, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(307, 19, 0, 0, 0, 0, 'tb_item', 28, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(308, 19, 0, 0, 0, 0, 'tb_item', 29, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(309, 19, 0, 0, 0, 0, 'tb_item', 30, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1),
(310, 20, 0, 0, 0, 0, 'tb_modulo', 1, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(311, 20, 0, 0, 0, 0, 'tb_modulo', 2, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(312, 20, 0, 0, 0, 0, 'tb_modulo', 3, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(313, 20, 0, 0, 0, 0, 'tb_opcion', 1, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(314, 20, 0, 0, 0, 0, 'tb_opcion', 2, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(315, 20, 0, 0, 0, 0, 'tb_opcion', 3, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(316, 20, 0, 0, 0, 0, 'tb_opcion', 4, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(317, 20, 0, 0, 0, 0, 'tb_opcion', 5, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(318, 20, 0, 0, 0, 0, 'tb_opcion', 6, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(319, 20, 0, 0, 0, 0, 'tb_opcion', 7, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(320, 20, 0, 0, 0, 0, 'tb_opcion', 8, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(321, 20, 0, 0, 0, 0, 'tb_opcion', 9, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(322, 20, 0, 0, 0, 0, 'tb_opcion', 10, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(323, 20, 0, 0, 0, 0, 'tb_opcion', 11, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(324, 20, 0, 0, 0, 0, 'tb_item', 1, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(325, 20, 0, 0, 0, 0, 'tb_item', 2, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(326, 20, 0, 0, 0, 0, 'tb_item', 3, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(327, 20, 0, 0, 0, 0, 'tb_item', 4, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(328, 20, 0, 0, 0, 0, 'tb_item', 5, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(329, 20, 0, 0, 0, 0, 'tb_item', 6, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(330, 20, 0, 0, 0, 0, 'tb_item', 7, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(331, 20, 0, 0, 0, 0, 'tb_item', 8, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(332, 20, 0, 0, 0, 0, 'tb_item', 9, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(333, 20, 0, 0, 0, 0, 'tb_item', 10, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(334, 20, 0, 0, 0, 0, 'tb_item', 11, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(335, 20, 0, 0, 0, 0, 'tb_item', 12, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(336, 20, 0, 0, 0, 0, 'tb_item', 13, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(337, 20, 0, 0, 0, 0, 'tb_item', 14, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(338, 20, 0, 0, 0, 0, 'tb_item', 15, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(339, 20, 0, 0, 0, 0, 'tb_item', 16, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(340, 20, 0, 0, 0, 0, 'tb_item', 17, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(341, 20, 0, 0, 0, 0, 'tb_item', 18, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(342, 20, 0, 0, 0, 0, 'tb_item', 19, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(343, 20, 0, 0, 0, 0, 'tb_item', 20, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(344, 20, 0, 0, 0, 0, 'tb_item', 21, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(345, 20, 0, 0, 0, 0, 'tb_item', 22, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(346, 20, 0, 0, 0, 0, 'tb_item', 23, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(347, 20, 0, 0, 0, 0, 'tb_item', 24, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(348, 20, 0, 0, 0, 0, 'tb_item', 25, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(349, 20, 0, 0, 0, 0, 'tb_item', 26, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(350, 20, 0, 0, 0, 0, 'tb_item', 27, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(351, 20, 0, 0, 0, 0, 'tb_item', 28, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(352, 20, 0, 0, 0, 0, 'tb_item', 29, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1),
(353, 20, 0, 0, 0, 0, 'tb_item', 30, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1);

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
(4, '$2y$10$h.raTGdK2nnbqf1Gl5rq1Ox4P4Pou5H3sPyxbMvaWMPfyHylZp.9.', 5, '2023-03-22 01:42:42.000000', '1683355362.000000'),
(5, '$2y$10$vgLmy52RwC2huelZvyS5.unRpTVvUFxYdf6IIIdqWUcacpJD2iCVq', 6, '2023-03-22 15:43:24.000000', '1683405804.000000'),
(6, '$2y$10$ig7FqQXW3hR0DnJmbhpDlOHHu329w7LihTGTOEqg4/ORbEqybYtfG', 8, '2023-03-22 15:58:17.000000', '1683406697.000000'),
(7, '$2y$10$y.NWRpHV7spM.1kLbVmgfedjd5cym0AFd.qeME311nMeT2HUvMgCO', 8, '2023-03-25 01:10:57.000000', '1683612657.000000'),
(8, '$2y$10$X43chjuqBEo5CxbBuadRW.NiE6AwH4vS5kMHuUmF7ef04UUDBNyL.', 4, '2023-03-30 10:22:13.000000', '1684077733.000000');

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
(11, 'administrador', 'administrador de sistemas', 1, '2023-03-21 00:00:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(14, 'ANALISTA SI', 'ANALISTA SI', 1, '2023-03-25 01:09:17.000000', '2023-03-25 01:18:23.000000', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(17, 'PRUEBA', 'PRUEBA', 1, '2023-03-30 11:12:17.000000', NULL, NULL, NULL, NULL, '2023-03-30 11:12:20', 5, '2023-03-30 11:12:20', 1, 1),
(18, 'PRUEBA', 'PRUEBA', 1, '2023-03-30 11:16:58.000000', NULL, NULL, NULL, NULL, '2023-03-30 11:17:03', 5, '2023-03-30 11:17:03', 1, 1),
(19, 'PRUEBA', 'PRUEBA', 1, '2023-03-30 16:09:20.000000', NULL, NULL, NULL, NULL, '2023-03-30 16:09:36', 5, '2023-03-30 16:09:36', 1, 1),
(20, 'PRUEBA', 'PRUEBA', 1, '2023-03-31 01:13:18.000000', NULL, NULL, NULL, NULL, '2023-03-31 01:13:23', 5, '2023-03-31 01:13:23', 1, 1);

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
(3, '', '', '', '', 'youkai.miguel@gmail.com', 'testeo1', '2023-03-22 00:08:34.000000', '2023-03-30 16:08:35.000000', 1, 4, 0, 0, NULL, 11, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(4, '', '', '', '', 'prueba@gmail.com', 'testeo2', '2023-03-22 00:30:49.000000', NULL, 1, 1, 0, 1, NULL, 11, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(5, '', 'admin', 'admin', 'admin', 'youkai.miguel@gmail.com', 'admin', '2023-03-22 00:41:33.000000', '2023-04-01 22:38:17.000000', 1, 1, 0, 1, NULL, 11, 12, 4, 15, 11, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(6, '', '', '', '', 'prueba4@gmail.com', 'testeo4', '2023-03-22 15:43:24.000000', NULL, 1, NULL, 0, 0, NULL, 11, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(8, '', 'testeo5', 'testeo5', 'testeo5', 'youkai.miguel@gmail.com', 'testeo5', '2023-03-22 15:58:17.000000', '2023-03-27 10:42:23.000000', 1, 1, 0, 1, NULL, 14, 12, 4, 15, 11, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

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
(1, 'Software', 1, 5, '2023-03-24 02:34:21.000000', 5, '2023-03-24 02:34:43.000000', NULL, NULL, 0),
(2, 'Infraestructura', 1, 5, '2023-03-24 02:34:34.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 'AmenazaA', 1, 5, '2023-03-24 02:51:05.000000', 5, '2023-03-24 02:51:12.000000', NULL, NULL, 0),
(2, 'Amenaza B', 1, 5, '2023-03-31 12:31:36.000000', 5, '2023-03-31 12:31:52.000000', NULL, NULL, 0);

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
(1, 'TipoA', 'TipoA', 1, 5, '2023-03-24 02:46:00.000000', 5, '2023-03-24 02:46:08.000000', NULL, NULL, 0),
(2, 'Tipo B', 'Tipo B', 1, 5, '2023-03-31 12:28:19.000000', NULL, NULL, NULL, NULL, 0),
(3, 'Tipo C', 'Tipo C', 1, 5, '2023-03-31 12:28:27.000000', 5, '2023-04-01 02:15:33.000000', NULL, NULL, 0);

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
(1, 'América', '89', '1610', 'Javier Prado', 'Infraestructura', 1, 5, '2023-03-25 00:51:01.000000', NULL, NULL, NULL, NULL, 0);

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
(8, 'Unidad Humanos', 1, 12, 11, 5, '2023-03-23 15:24:18.000000', 5, '2023-03-23 15:26:16.000000', NULL, NULL, 0),
(9, 'Unidad Logistica', 1, 12, 13, 5, '2023-03-24 02:21:05.000000', NULL, NULL, NULL, NULL, 0),
(10, 'Unidad RH', 1, 13, 14, 5, '2023-03-26 16:51:41.000000', NULL, NULL, NULL, NULL, 0),
(11, 'Infraestructura_y_Servicios_TI', 1, 12, 15, 5, '2023-03-27 10:35:05.000000', 5, '2023-03-27 10:35:12.000000', NULL, NULL, 0),
(12, 'Operaciones', 1, 12, 15, 5, '2023-03-27 10:35:22.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 1, '1', 2, '1', 3, '1', 1, 1, 5, '2023-03-24 02:45:18.000000', 5, '2023-03-24 02:45:32.000000', NULL, NULL, 0);

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

--
-- Volcado de datos para la tabla `valoracion_riesgo`
--

INSERT INTO `valoracion_riesgo` (`id`, `idProbabilidad`, `idImpacto`, `valor`, `id_user_added`, `date_add`, `id_user_updated`, `date_modify`, `id_user_deleted`, `date_deleted`, `is_deleted`) VALUES
(1, 2, 2, 'Bajo', 5, '2023-03-24 00:00:00.000000', 5, '2023-03-24 00:00:00.000000', NULL, NULL, 0),
(2, 2, 4, 'Bajo', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(3, 2, 3, 'Bajo', 5, '2023-03-24 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(4, 5, 3, 'Bajo', 5, '2023-03-26 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(5, 3, 3, 'Medio', 5, '2023-03-26 00:00:00.000000', NULL, NULL, NULL, NULL, 0),
(6, 7, 7, 'Moderado', 3, NULL, NULL, NULL, NULL, NULL, 0),
(7, 3, 4, 'Moderado', 5, '2023-03-27 00:00:00.000000', NULL, NULL, NULL, NULL, 0);

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
(1, 'ValorA', 1, 5, '2023-03-24 02:37:14.000000', 5, '2023-03-24 02:38:00.000000', NULL, NULL, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `alert_seguimiento`
--
ALTER TABLE `alert_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `aplicacion_impacto`
--
ALTER TABLE `aplicacion_impacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `aplicacion_probailidad`
--
ALTER TABLE `aplicacion_probailidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `aspectos_seguridad`
--
ALTER TABLE `aspectos_seguridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `caracteristica_control`
--
ALTER TABLE `caracteristica_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `catalogo_tabla`
--
ALTER TABLE `catalogo_tabla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria_activo`
--
ALTER TABLE `categoria_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria_vulnerabilidad`
--
ALTER TABLE `categoria_vulnerabilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2204;

--
-- AUTO_INCREMENT de la tabla `clasificacion_informacion`
--
ALTER TABLE `clasificacion_informacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cobertura`
--
ALTER TABLE `cobertura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `desc_amenaza`
--
ALTER TABLE `desc_amenaza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `desc_vulnerabilidad`
--
ALTER TABLE `desc_vulnerabilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_controles`
--
ALTER TABLE `detalle_controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `detalle_evaluacion_control`
--
ALTER TABLE `detalle_evaluacion_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `escenario_active`
--
ALTER TABLE `escenario_active`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `evaluacion_control`
--
ALTER TABLE `evaluacion_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacion_control2`
--
ALTER TABLE `evaluacion_control2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `evaluacion_riesgo`
--
ALTER TABLE `evaluacion_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `evaluacion_riesgos_controles`
--
ALTER TABLE `evaluacion_riesgos_controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `evaluacion_riesgo_historial`
--
ALTER TABLE `evaluacion_riesgo_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `impacto_riesgo`
--
ALTER TABLE `impacto_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `inventario_clasificacion_activo`
--
ALTER TABLE `inventario_clasificacion_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `inventario_clasificacion_activo_historial`
--
ALTER TABLE `inventario_clasificacion_activo_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `log_acciones`
--
ALTER TABLE `log_acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT de la tabla `macroproceso`
--
ALTER TABLE `macroproceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `nivel_riesgo`
--
ALTER TABLE `nivel_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT de la tabla `plan_accion`
--
ALTER TABLE `plan_accion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `plan_riesgo`
--
ALTER TABLE `plan_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posicion_puesto`
--
ALTER TABLE `posicion_puesto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `probabilidad_riesgo`
--
ALTER TABLE `probabilidad_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proceso`
--
ALTER TABLE `proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `registro_controles`
--
ALTER TABLE `registro_controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id_det_per` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354;

--
-- AUTO_INCREMENT de la tabla `tb_historial_claves`
--
ALTER TABLE `tb_historial_claves`
  MODIFY `id_cl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tb_sesiones`
--
ALTER TABLE `tb_sesiones`
  MODIFY `id_se` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id_us` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo_activo`
--
ALTER TABLE `tipo_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_amenaza`
--
ALTER TABLE `tipo_amenaza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_riesgo`
--
ALTER TABLE `tipo_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ubicacion_activo`
--
ALTER TABLE `ubicacion_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `valoracion_activo`
--
ALTER TABLE `valoracion_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `valoracion_riesgo`
--
ALTER TABLE `valoracion_riesgo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `valor_activo`
--
ALTER TABLE `valor_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `FK__tb_detall__id_us__3C54ED00` FOREIGN KEY (`id_user_deleted`) REFERENCES `tb_users` (`id_us`);

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
