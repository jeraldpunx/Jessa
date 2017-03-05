<!DOCTYPE html>
    <head>
        <title>Books</title> 
        <meta name="csrf-token" content="{{ csrf_token() }}" />
        <link rel="stylesheet" type="text/css" href="/css/mystyle.css" />
        <link rel="stylesheet" type="text/css" href="/css/materialize.css" />
        <link rel="stylesheet" type="text/css" href="/css/materialize.min.css" />

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script type="text/javascript" src="/js/jquery.slimscroll.js"></script>

    </head>
    <body>
        @include('navigationBar') 

        <div class="booktimeline"></div>
            <div class="container">
                @foreach($getbooks as $b)
                    
                
                    <form class="form-horizontal" role="form" method="POST" action="{{ url('viewBook/'.$b->bookId) }}">
                    {!! csrf_field() !!}
                            
                                <div class="row">
                                    <div class="col s4">
                                        <div class="timelinebookphoto ">
                                            <img class="hoverable" src="{{$b->image}}">
                                        </div>
                                        <div class="timelinebookdescription">
                                            <p>"{{$b->description}}"</p>
                                        </div>
                                    </div>

                                    <div class="col s8">
                                        <div class="timelinebooktitle">
                                            <h5>{{$b->title}}</h5>
                                        </div>
                                        <div class="timelinebookauthor">
                                            {{$b->authors}}
                                        </div>
                                
                            @endforeach
                                        <br>
                                        <h5>Comment(s)</h5>
                                        <div class="commentsection" id="comment">
                                            <div class="chipcomment">
                                                <div class="chip ">
                                                    <img src="images/yuna.jpg" alt="">
                                                    Jane Doe
                                                </div>
                                                Nice Book!
                                            </div>
                                            <div class="divider"></div>
                                        </div>

                                       
                                        <div class="writecomment">
                                            <!-- <textarea id="comment" class="col s8" placeholder="Write comment..."></textarea> -->
                                            <input type="text" id="mycomment" name="mycomment" value="">
                                           <!--  <input type="hidden" name="_token" value="{{ csrf_token() }}"> -->
                                            <!-- <i class="commentbtn small material-icons">send</i>
                                             --> &nbsp;
                                             <!-- <a class="commentbtn btn">Go!</a> -->
                                             <button class="waves-effect waves-light commentbtn btn teal">Save</button>
                                        </div>
                                   
                    </form>
                </div>
            </div>
            

        </div>


    
  



<script type="text/javascript">
    $(function(){
      $('#comment').slimscroll({
        size: '10px'
      });
    });

    $(document).ready(function() {
        //  $.ajaxSetup({
        //         header:{ 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        //     }   
        // });

        $(".commentbtn").click(function(){

            // $.ajaxSetup({
            //     header:$('meta[name="_token"]').attr('content')
            // })
            // e.preventDefault(e);

            var getComment = document.getElementById('mycomment').value;;         

            $.ajax({
                url: "viewBook",
                method: "POST",
                data:{
                        getComment : getComment
                    },
                success: function(data) {
                    
                }
            });
            
        });
    });
</script>



</body>
</html>