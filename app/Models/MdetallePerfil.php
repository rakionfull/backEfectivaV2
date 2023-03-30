<?php

namespace App\Models;

use CodeIgniter\Model;

class MdetallePerfil extends Model
{
    protected $table = 'tb_detalle_perfil';
    protected $primaryKey       = 'id_perfil';
    protected $useSoftDeletes   = false;
    // Dates
    protected $useTimestamps = true;
    
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'date_add';
    protected $updatedField  = 'date_modify';
    protected $deletedField  = 'date_deleted';
    protected $allowedFields    = [
        'id',
        'date_add',
        'date_modify',
        'date_deleted',
        'id_user_added',
        'id_user_modify',
        'id_user_deleted',
        'is_deleted'
    ];
}