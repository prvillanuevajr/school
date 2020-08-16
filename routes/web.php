<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/students', 'StudentController@index')->name('students');
Route::post('/students', 'StudentController@store')->name('create_student');
Route::patch('/students/{user}/update', 'StudentController@update')->name('create_student');
Route::delete('/students/{user}', 'StudentController@destroy')->name('delete_student');
Route::get('/all_students', 'StudentController@students')->name('all_students');

Route::get('/student/{student}/lectures', 'StudentLectureController@index')->name('student_lectures');
Route::post('/student/{student}/lectures/{lecture}', 'StudentLectureController@store')->name('student_lectures_add');
Route::delete('/student/{student}/lectures/{lecture}', 'StudentLectureController@destroy')->name('student_lectures_delete');
