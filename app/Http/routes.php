<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('home');
});


Route::post('viewBook/{bookId}',	'CommentsController@insertcomment');
// Route::post('viewBook/{bookId}',	function(Request $request){
// 	// if(Request::ajax())
//  //    {
//  //    	return Response::json(Request::all());
// 	// 	// $id  = Auth::user()->getId();
// 	// 	// $comments   = new Comments;
// 	// 	// $comments->comment = Input::get('getComment');
// 	// 	// $comments->commenter = $id;
// 	//  //    $comments->save();
// 	//  //    return Redirect::back(); 
// 	// }

// 	$input = Input::all();
		
// 			$id         = Auth::user()->getId();
// 			$comments   = new Comments;
// 			$comments->userComment = Input::get('mycomment');
// 			$comments->commenter = $id;
// 		    $comments->save();
// 		    return Redirect::back(); 
// });


Route::get ('viewAllBooks',		 'BookController@getAllBooks');
Route::get ('viewBooks/{isbn}',	 'BookController@getBooks');
Route::get ('viewBook/{bookId}', 'BookController@getBooksDetails');
Route::get ('addBook',	 		 'BookController@bookDetails');
Route::get('addBook',  	 'BookController@bookDetails');
Route::post('addBook',   'BookController@insertBook');


Route::get('/redirect', 'SocialAuthController@redirect');
Route::get('/callback', 'SocialAuthController@callback');
Route::get('logout',	'SocialAuthController@logout');

