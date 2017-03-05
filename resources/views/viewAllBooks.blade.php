<!DOCTYPE html>
    <head>
        <title>All books</title> 
        @include('assets') 
    </head>
<body>

    @include('navigationBar') 

    <div class="container">
        <div class="row">
           
            <div class="col s12">
                <div class="input-field col s3">
                    <select id="val">
                        <option value="" disabled selected>Sort by Book Status</option>
                        <option value="1">For Rent</option>
                        <option value="2">For Barter</option>
                        <option value="3">For Sale</option>
                        <option value="4">For Bid</option>
                    </select>
                </div>

                <div class="input-field col s3">
                    <select class="bookcategory">
                        <option value="" disabled selected>Sort by Genre</option>
                        <option value="Science Fiction">Science Fiction</option>
                        <option value="Graphic Novels & Comics">Graphic Novels & Comics</option>
                        <option value="Literature">Literature</option>
                        <option value="Mystery & Crime">Mystery & Crime</option>
                        <option value="Poetry">Poetry</option>
                        <option value="Romance">Romance</option>
                        <option value="Thrillers">Thrillers</option>
                        <option value="Humor">Humor</option>
                        <option value="Westerns">Westerns</option>
                    </select>
                </div>
            </div> <br><br>
  
            
            <table style="width:100%" class="allbookstable">  
                <tr> 
                @foreach($getbooks as $b)
                    <td>
                        <div style="overflow: hidden; width:200px;height:420px;" class="card">
                            <div class="card-image "><img src="{{$b->image}}"></div>
                            <div class="card-content">
                                <p>{{ str_limit($b->title, $limit = 20, $end = '...') }}</p>
                            </div>
                            <div class="card-action">
                                <a href="viewBooks/{{$b->isbn}}">{{$b->total}} Book(s) Available</a>
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

    <script type="text/javascript">

        $(document).ready(function() {
            $('select').material_select();
        });

    </script>


</html>