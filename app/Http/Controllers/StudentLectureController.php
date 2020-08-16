<?php

namespace App\Http\Controllers;

use App\Lecture;
use App\User;
use Illuminate\Http\Request;

class StudentLectureController extends Controller
{

    public function index(User $student)
    {
        return [
            'enrolled_in' => $student->lectures,
            'all' => Lecture::all(),
        ];
    }

    public function store(User $student, Request $request, Lecture $lecture)
    {
        $student->lectures()->attach($lecture->id);
    }

    public function destroy(User $student, Request $request, Lecture $lecture)
    {
        $student->lectures()->detach($lecture->id);
    }
}
