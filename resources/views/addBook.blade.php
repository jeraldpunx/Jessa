
	    

	    
	</head>
	<!DOCTYPE html>
    <head>
        <title>Add books</title> 
        @include('assets') 
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    </head>

	<body class="sellbookbody">
	  	 @include('navigationBar')  
	  	<br>

	  	<div class="container">
	  		<div class="row">
			  	<div class="col s4">
			  		Enter ISBN
					<input id="isbn" type="text" class="num" value="">
					<button class="search btn teal">Get Book Details</button>
			  	</div> <br>
		  	</div>
		  	<div class="row bookdetails">
			  	<div class="col s4 bookimage">
		      		<img src="" id="bookImage">
		      	</div>
	      		<div class="col s8 push-s1">
	  				<div id="title" style="font-size:30px;"></div>
	  				<div id="authors" style="font-size:20px;"></div>
	  				<div id="publisher"></div>
	  				<div id="publishedDate"></div>
	  				<div id="pageCount"></div>
	  				<div id="ratingsCount"></div>
	  				<div id="description" style="font-style:Italic;"></div> <br>

	  				<div class="input-field col s5">
					    <select  id="category">
					        <option value="" disabled selected>Choose Genre</option>
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
					</div><br><br><br><br>

					<div>
	  					<input type="checkbox" name="test5" id="test5" value="">
	  					<label for="test5">For Sale</label>
	  					<b class="saleform">
							<label for="test5">Sale Price &#8369; </label>
							<input type="numeric" id="sellingprice" class="num" size="5" maxlength="3">
		  					<label for="test5">.00</label>
	  					</b>
	  				</div>

	  				<div>
	  					<input type="checkbox" id="test6">
	  					<label for="test6">Open for bidding</label>
	  					<t class="numberdiv">
	  						<input type="numeric" class="num" id="time"  size="2" maxlength="5">
	  						<label for="test5"> hour(s) Bidding Duration</label> | 
	  						<label for="test5">Price Starts at &#8369;</label>
	  						<input type="numeric" class="num" id="bidprice" size="5" maxlength="4">
	  						<label for="test5">.00</label>
	  					</t> 
	  				</div>

	  				

	  				<div>
	  					<input type="checkbox" id="test7">
	  					<label for="test7">For Rent</label>
	  					<r class="rentform">
							<label for="test5">Rent Price &#8369; </label>
							<input type="numeric" id="rentprice" class="num" size="5" maxlength="3">
		  					<label for="test5">.00</label>
	  					</r>
	  				</div>
	  				<div>
	  					<input type="checkbox" id="test8">
	  					<label for="test8">For Barter</label>

	  				</div>
	  				

				   <!--  <div class="file-field input-field">
				      	<div class="btn">
				       		<span>File</span>
				        	<input id="currentphoto" type="file" multiple>
				      	</div>
				      	<div class="file-path-wrapper">
				        	<input id="currentphoto" class="file-path validate" type="text" placeholder="Upload one or more files">
				      	</div>
				    </div> -->
	        
	  				<button id="save" class="waves-effect waves-light save btn teal">Save</button>
	  			</div>	
			</div>
		</div>

	  	<script type="text/javascript">
	  		$(document).ready(function() {
	  		$(".bookdetails").hide();
		  	$(".search").click(function(){
		  		
		       	var getisbn = document.getElementById('isbn').value;
		  		var getbookdetails = "https://www.googleapis.com/books/v1/volumes?q=isbn:"+getisbn;

				$.getJSON(getbookdetails, function (response) {
				    console.log("JSON Data: " + response.items);
				    for (var i = 0; i < response.items.length; i++) {
				        var item = response.items[i];

				        document.getElementById("title").innerHTML            = item.volumeInfo.title;
				        document.getElementById("authors").innerHTML          = item.volumeInfo.authors;
				        document.getElementById("publisher").innerHTML        = item.volumeInfo.publisher;
				        document.getElementById("publishedDate").innerHTML    = item.volumeInfo.publishedDate;
				        document.getElementById("pageCount").innerHTML        = item.volumeInfo.pageCount;
				        var ratings =  item.volumeInfo.ratingsCount;
						if (ratings != null) {
							document.getElementById("ratingsCount").innerHTML = item.volumeInfo.ratingsCount;
						}
						else{
						}
				        document.getElementById("description").innerHTML      = item.volumeInfo.description;
				        document.getElementById("bookImage").src              = item.volumeInfo.imageLinks["smallThumbnail"];
				      }
				});
				$(".bookdetails").show('slow');
			});

			$('.save').click(function() {
				
	            var getIsbn          = document.getElementById('isbn').value;
	            var getTitle         = $('#title').html();
				var getAuthors       = $('#authors').html();
				var getPublisher     = $('#publisher').html();
				var getPublishedDate = $('#publishedDate').html();
				var getPageCount     = $('#pageCount').html();
				var c                = document.getElementById("category");
				var getCategory      = c.options[c.selectedIndex].value;
				var getRatingsCount  = $('#ratingsCount').html();
				var getBookImage     = document.getElementById('bookImage').src;
				var getDescription   = $('#description').html();
				var getTimeDuration  = document.getElementById("time").value;
				
				var getSellingPrice  = document.getElementById("sellingprice").value;
				var checksale   	 = document.getElementById("test5").value;
				var checkbid   		 = document.getElementById("test6").value;
				var checkrent   	 = document.getElementById("test7").value;
				var checkbarter   	 = document.getElementById("test8").value;
				var getBidPrice    	 = document.getElementById("bidprice").value;
				var getRentPrice     = document.getElementById("rentprice").value;
				
				
				// var getCurrentpic    = document.getElementById("currentphoto");
				// var getCurrentpic = document.getElementById('currentphoto').files;
				var currentPhotos  = document.getElementById('currentphoto');
				for (var i = 0; i < currentPhotos.files.length; ++i) {
				  var getCurrentPhotos = currentPhotos.files.item(i).getCurrentPhotos;

				}
	 
	 			var $savealert = $('<span>Saved!</span>');

	            $.ajax({
	                method: 'post',
	                url: 'addBook',
	                data:  {
	                		getIsbn          : getIsbn,
			            	getTitle         : getTitle,
			            	getAuthors       : getAuthors,
			            	getPublisher     : getPublisher,
			            	getPublishedDate : getPublishedDate,
			            	getPageCount     : getPageCount,
			            	getCategory      : getCategory,
			            	getRatingsCount  : getRatingsCount,
			            	getBookImage     : getBookImage,
			            	getDescription   : getDescription,
			             	getTimeDuration  : getTimeDuration,
			            	getSellingPrice  : getSellingPrice,
			            	checksale		 : checksale,
			            	checkbid 		 : checkbid,
			            	checkrent 		 : checkrent,
			            	checkbarter 	 : checkbarter,
			            	getBidPrice      : getBidPrice,
			            	getRentPrice     : getRentPrice,
			            	getCurrentPhotos : getCurrentPhotos
	                		},
	                success: function(data) {  
	 						Materialize.toast($savealert, 5000);
	                		location.reload();  
	                }
	            });
	        });


		 	$(".numberdiv").hide();
		 	$(".saleform").hide();
		 	$(".rentform").hide();
		 	$('input[type="checkbox"]').click(function(){
	            if($('#test5').prop("checked") == true){	
	            	$(".saleform").show();
	            	document.getElementById("test5").value = "checked";
	            }
	            else{ 	
	            	$(".saleform").hide();
	            	document.getElementById("test5").value = "check";
	            }

	            if($('#test6').prop("checked") == true){
	            	$(".numberdiv").show();
	            	document.getElementById("test6").value = "checked";
	            }
	            else{
	            	$(".numberdiv").hide();
	            	document.getElementById("test6").value = "check";
	            }

	            if($('#test7').prop("checked") == true){
	            	$(".rentform").show();
	            	document.getElementById("test7").value = "checked";
	            }
	            else{
	            	$(".rentform").hide();
	            	document.getElementById("test7").value = "check";
	            }

	            if($('#test8').prop("checked") == true){
	            	document.getElementById("test8").value = "checked";
	            }
	            else{
	            	document.getElementById("test8").value = "check";
	            }
	        });


	   		$(document).ready(function(){
			    $('[class^=num]').keypress(validateNumber);
			
				function validateNumber(event) {
				    var key = window.event ? event.keyCode : event.which;

				    if (event.keyCode === 8 || event.keyCode === 46
				        || event.keyCode === 37 || event.keyCode === 39) {
				        return true;
				    }
				    else if ( key < 48 || key > 57 ) {
				        return false;
				    }
				    else return true;
				};
			});
			

			
		    	$('select').material_select();


		  	});
			  	
	  	</script>

	</body>
</html>
