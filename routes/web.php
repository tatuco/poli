<?php

Route::redirect('/', '/login');

Route::redirect('/home', '/admin');

Route::resource('/asignaciones','AsignacionesController');
Route::resource('/colores','ColorController');
Route::resource('/componentes','ComponenteController');
Route::resource('/estados','EstadoController');
Route::resource('/mandos','MandoController');
Route::resource('/marcas','MarcaController');
Route::resource('/modelos','ModeloController');
Route::resource('/repuestos','RepuestosController');
Route::resource('/tipos','TipoUnidadController');
Route::resource('/unidades','UnidadesController');
Route::resource('/bitacora','BitacoraController');



Auth::routes();

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin', 'middleware' => ['auth']], function () {
    Route::get('/', 'HomeController@index')->name('home');

    Route::delete('permissions/destroy', 'PermissionsController@massDestroy')->name('permissions.massDestroy');

    Route::resource('permissions', 'PermissionsController');

    Route::delete('roles/destroy', 'RolesController@massDestroy')->name('roles.massDestroy');

    Route::resource('roles', 'RolesController');

    Route::delete('users/destroy', 'UsersController@massDestroy')->name('users.massDestroy');

    Route::resource('users', 'UsersController');

});
