<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lecture extends Model
{
    public function students()
    {
        return $this->belongsToMany(User::class,'lecture_user','lecture_id','student_id');
    }
}
