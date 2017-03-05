<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use Illuminate\Pagination\Paginator;


class BookController extends Controller {

	public function getAllBooks()
	{
		$getbooks = DB::table('books')
						->select(array('title','isbn','image',DB::raw('count(*) as total')))
						->where('forSale','=','1')
						->orwhere('forBid','=','1')
						->orwhere('forRent','=','1')
						->orwhere('forBarter','=','1')
						->groupby('ISBN')
						->orderBy('bookId', 'desc')
						->paginate(3);
		return view('viewAllBooks', array('getbooks'=>$getbooks));
	}

	public function getBooks($isbn)
	{
		$getbooks = DB::table('books')
						->join('users','books.uploadersId','=','users.id')
						->select()
						->where(function($query)
						{
							$query->where('forSale','=','1')
								  ->orwhere('forBid','=','1')
								  ->orwhere('forRent','=','1')
								  ->orwhere('forBarter','=','1');
						})
						->where('ISBN','=',$isbn)
						->orderBy('bookId', 'desc')
						->paginate(3);
		return view('viewBooks', array('getbooks'=>$getbooks));
	}

	public function getBooksDetails($bookId)
	{
		$getbooks = DB::table('books')
						->select()
						->where('bookId','=',$bookId)
						->get();
		return view('viewBook', array('getbooks'=>$getbooks));
	}

	public function bookDetails()
	{
		return view('addBook');  
	}

	public function insertBook()
	{
		$id         = Auth::user()->getId();
		$books      = new Books;

		$books->isbn = Input::get('getIsbn');
		$books->title = Input::get('getTitle'); 
	    $books->authors = Input::get('getAuthors'); 
	    $books->publisher = Input::get('getPublisher'); 
	    $books->publishedDate = Input::get('getPublishedDate'); 
	    $books->pageCount = Input::get('getPageCount'); 
	    $books->category = Input::get('getCategory'); 
	    $books->ratingsCount = Input::get('getRatingsCount');
	    $books->image = Input::get('getBookImage'); 
	 //    $books->currentImage = Input::get('getCurrentPhotos'); 

	    $files = Input::get('getCurrentPhotos');
			foreach($files as $file) {  
			    $destinationPath = 'uploads';
			    $filename = $file->getClientOriginalName();
			    $books->currentImage = $filename;
			    $upload_success = $file->move($destinationPath, $filename);
			}


	    $books->description = Input::get('getDescription'); 

	    if (Input::get('checksale') == 'checked') {
		 	$books->forSale = 1;
		 	$books->salePrice = Input::get('getSellingPrice');
		} else {
			$books->forSale = 0;
		}

		if (Input::get('checkbid') == 'checked') {
		 	$books->forBid = 1;
		 	$books->bidPrice = Input::get('getBidPrice');
		 	$books->bidTimeDuration = Input::get('getTimeDuration');
		} else {
			$books->forBid = 0;
		}

		if (Input::get('checkrent') == 'checked') {
		 	$books->forRent =  1;
		 	$books->rentPrice = Input::get('getRentPrice');
		} else {
			$books->forRent = 0;
		}

		if (Input::get('checkbarter') == 'checked') {
		 	$books->forBarter =  1;
		} else {
			$books->forBarter = 0;
		}

		if((Input::get('checksale') == 'checked') || (Input::get('checkbid') == 'checked') || (Input::get('checkrent') === 'checked') || (Input::get('checkbarter') === 'checked')){
			$books->bookStatus = 1;
		} else {
			$books->bookStatus = 0;
		}

	    $books->uploadersID = $id;
	    $books->save();
	    return Redirect::back(); 
		
	}



}
