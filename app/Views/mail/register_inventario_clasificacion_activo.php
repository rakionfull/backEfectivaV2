<h1> Informacion Registrada - <?php
    if($data->ica_estado == '2'){
        echo 'Proceder a Revisar';
    }else if($data->ica_estado == '3'){
        echo 'Corregir las observaciones';
    }
    ?>
</h1>
<p> Activo: <?php echo $data->activo;?></p>
<p> Descripcion Activo: <?php echo $data->desc_activo; ?></p>
<p> Propietario: <?php echo $data->des_propietario; ?></p>
<p> Custodio: <?php echo $data->des_custodio; ?></p>
<p> Valoracion Confidencialidad: <?php echo $data->val_c; ?></p>
<p> Valoracion Integridad: <?php echo $data->val_i; ?></p>
<p> Valoracion Disponibilidad: <?php echo $data->val_d; ?></p>
<p> Empresa: <?php echo $data->empresa; ?></p>
<p> Area: <?php echo $data->area; ?></p>
<p> Unidad: <?php echo $data->unidad; ?></p>
<p> Macroproceso: <?php echo $data->macroproceso; ?></p>
<p> Proceso: <?php echo $data->proceso; ?></p>
<p> Tipo de activo: <?php echo $data->tipo_activo; ?></p>
<p> Categoria de activo: <?php echo $data->categoria_activo; ?></p>
<p> Ubicacion de activo: <?php echo $data->ubicacion_direccion; ?></p>
<p> Valor de activo: <?php echo $data->valor; ?></p>
<p> Comentario: <?php echo $data->ica_comentario; ?></p>
<?php
    if($data->ica_estado == '3'){
        echo '<p>Observaciones: '.$data->observacion.'</p>';
    }
?>