<!DOCTYPE html>
    <head>
        <title>Books</title> 
        <link rel="stylesheet" type="text/css" href="/css/mystyle.css" />
        <link rel="stylesheet" type="text/css" href="/css/materialize.css" />
        <link rel="stylesheet" type="text/css" href="/css/materialize.min.css" />

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        @include('navigationBar') 

        <div class="container">
            <div class="row">

                <table style="width:100%" class="allbookstable">  
                    <tr> 
                    @foreach($getbooks as $b)
                        <td>
                            <div style="overflow: hidden; width:200px;height:450px;" class="card">
                                <div class="card-image "><img src="{{$b->image}}"></div>
                                <div class="card-content">
                                    <p>
                                        @if($b->forSale == 1) 
                                            <div class="chip">forsale</div>
                                        @endif

                                        @if($b->forBid == 1)
                                            
                                            <div class="chip">forBid</div>
                                        @endif

                                        @if($b->forRent == 1)
                                            
                                            <div class="chip">forRent</div>
                                        @endif

                                        @if($b->forBarter == 1)
                                            
                                            <div class="chip">forBarter</div>
                                        @endif
                                    </p>
                                    <p>
                                        Uploaded By: {{$b->name}}
                                    </p>
                                </div>
                                <div class="card-action">
                                    <a href="../viewBook/{{$b->bookId}}">View Book</a><br>
                                </div>
                            </div>
                        </td>    
                    @endforeach
                    {!! $getbooks->links() !!}
                    </tr>
                </table> 

            </div>
        </div>


    </body>
</html>



