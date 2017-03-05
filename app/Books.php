<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Books extends Model
{
    protected $fillable = ['isbn','title','authors','publisher','publishedDate','pageCount','category','ratingsCount','image','description','forSale','forBid','forRent','forBarter','salePrice','bidPrice','rentPrice','bidTimeDuration','bookStatus','uploadersId'];

    
}
