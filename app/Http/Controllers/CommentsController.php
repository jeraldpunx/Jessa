<?php

namespace App\Http\Controllers;

use DB;
use Auth;
use Input;

use Response;
use App\Comments;
use Request;


class CommentsController extends Controller {

	public function insertcomment(Request $request)
	{
			
		if(Request::ajax()){
			// $id         = Auth::user()->getId();
			$comments   = new Comments;
			$comments->userComment = Input::get('getComment');
			$comments->commenter = 1;
		    $comments->save();
		    return Redirect::back(); 

			// $data=DB::table('comments')
			// 				->select('comment')
			// 				->get();
	  //       return response()->json($data);
		}
    	

	}



}
