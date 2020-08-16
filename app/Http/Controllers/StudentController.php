<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class StudentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('students.index');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
        ]);
        $validated['password'] = Hash::make('password');
        $validated['role_id'] = 1;
        return User::create($validated);
    }

    public function update(User $user, Request $request)
    {
        $fill_ables = [
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
        ];
        $field = $request->field;
        $validated = $request->validate([
            $field => $fill_ables[$field]
        ]);
        $user->$field = $validated[$field];
        $user->save();
        return $user->fresh();
    }

    public function destroy(User $user)
    {
        return $user->delete();
    }

    public function students()
    {
        return User::students();
    }
}
