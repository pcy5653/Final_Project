let results=[];
$("#BTN").click(function(){
    
    for(let i=0;i<$(".checkBoxs").length;i++){
       if($("#checkBox"+i).is(':checked')){
        results.push($("#checkBox"+i).attr("data-approvalNum"))
       }
    }
    $.ajax({
        type:"get",
        url:"./tempDelete",
        data:{
            "results":results
        },
        success:function(){
            alert("삭제되었습니다.")
            location.reload();
        },
        error:function(){
            alert("삭제되었습니다.")
            location.reload();
        }
        })	
})