
    	$('#box').on("click",".pageBtn",function(){
    		console.log(this);
    		let page = $(this).attr("data-p");
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		
    		pager(page, search, kind);
    	});
    	
    	$('#box').on("click",".pageBtn2",function(){
    		console.log(this);
    		let page = $(this).attr("data-p");
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		let category = $('.catCheck').attr("data-cat");
    		console.log(category);
    		catPager(page, search, kind, category);
    		
    	});
    	
    	$('#searchBox').on("click","#searchBtn",function(){
			console.log("버튼1");
    		let page = 1;
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		pager(page, search, kind);
    		$('#search').val("");
    	});
    	
    	$('#searchBox').on("click","#searchBtn2",function(){
			console.log("버튼2");
    		let page = 1;
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		let category = $('.catCheck').attr("data-cat");
    		console.log(category);
    		catPager(page, search, kind, category);
    		$('#search').val("");
    	});
    	
    	$('.category').click(function(){
    		let page = 1;
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		let category = $(this).attr("data-cat");
    		console.log(category);
    		catPager(page, search, kind, category);
    		$('#searchBtn').attr("id", "searchBtn2");
    		$('.catCheck').attr("data-cat", category);
    	});
    	
    	$('#total').click(function(){
    		let page = 1;
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		console.log(page);
    		pager(page, search, kind);
    		$('#searchBtn2').attr("id", "searchBtn");
    		$('.catCheck').attr("data-cat", "");
    	});
    	
    	function pager(page, search, kind){
			console.log("pager");
    		$.ajax({
    			type:"get",
    			url:"./totallist",
    			data:{
    				"page":page,
    				"search":search,
    				"kind":kind
    					
    			},
    			success:function(response){
    				// result 페이지를 하나 만들어 준다.
    				
    				if (response != null) {
	    				
	    				$('#box').empty();
	    				$('#box').append(response);

    					} else {
    					console.log("list 가져오기 실패");
    					}
    			},
    			error:function(){
    				console.log("ajax 실패");
    			}
    			})
    	}
    	
    	function catPager(page, search, kind, category){
			console.log("catpager");
    		$.ajax({
    			type:"get",
    			url:"./categorylist",
    			data:{
    				"page":page,
    				"search":search,
    				"kind":kind,
    				"category":category
    					
    			},
    			success:function(response){
    				// result 페이지를 하나 만들어 준다.
    				
    				if (response != null) {
	    				
	    				$('#box').empty();
	    				$('#box').append(response);

    					} else {
    					console.log("list 가져오기 실패");
    					}
    			},
    			error:function(){
    				console.log("ajax 실패");
    			}
    			})
    	}
