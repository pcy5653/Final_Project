
let check=false;
let lineCheck=false;
var toggler = document.getElementsByClassName("caret");
$("#plusBtn").click(function(){
	console.log("aa")
// 	$("#moneyBody").append('<tr><td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"><input type="date" name="title"></td><td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"><input type="text" name="title"></td><td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"><input type="text" name="money"></td><td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"><input type="text" name="title"></td><td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"><input type="text" name="title"></td></tr>')
 })

$("#okBtn").click(function(){
    $("#middleName").text($("#mLine").attr("data-name"))
    $("#lastName").text($("#lLine").attr("data-name"))
    $("#middlePosition").text($("#mLine").attr("data-position"))
    $("#lastPosition").text($("#lLine").attr("data-position"))
    $("#middle").val($("#mLine").attr("data-empnum"))
    $("#last").val($("#lLine").attr("data-empnum"))
	$('#exampleModal').modal("hide");
})
$(".ceo").click(function(){
	let empnum=$(this).attr("data-empnum")
	$("#selectEmp").empty()
	$("#selectEmp").attr("data-empnum",$(this).attr("data-empnum"))
	$("#selectEmp").attr("data-name",$(this).attr("data-name"))
	$("#selectEmp").attr("data-position","대표")
	$("#selectEmp").html('대표 : '+$(this).attr("data-name"))
})
$(".general").click(function(){
	let empnum=$(this).attr("data-empnum")
	$("#selectEmp").empty()
	$("#selectEmp").attr("data-empnum",$(this).attr("data-empnum"))
	$("#selectEmp").attr("data-name",$(this).attr("data-name"))
	$("#selectEmp").attr("data-position","총괄")
	$("#selectEmp").html('총괄 : '+$(this).attr("data-name"))
})
$(".resources").click(function(){
	let empnum=$(this).attr("data-empnum")
	$("#selectEmp").empty()
	$("#selectEmp").attr("data-empnum",$(this).attr("data-empnum"))
	$("#selectEmp").attr("data-name",$(this).attr("data-name"))
	$("#selectEmp").attr("data-position","인사관리")
	$("#selectEmp").html('인사 : '+$(this).attr("data-name"))
})
$(".facility").click(function(){
	let empnum=$(this).attr("data-empnum")
	$("#selectEmp").empty()
	$("#selectEmp").attr("data-empnum",$(this).attr("data-empnum"))
	$("#selectEmp").attr("data-name",$(this).attr("data-name"))
	$("#selectEmp").attr("data-position","시설관리")
	$("#selectEmp").html('시설관리 : '+$(this).attr("data-name"))
})
$(".customer").click(function(){
	let empnum=$(this).attr("data-empnum")
	$("#selectEmp").empty()
	$("#selectEmp").attr("data-empnum",$(this).attr("data-empnum"))
	$("#selectEmp").attr("data-name",$(this).attr("data-name"))
	$("#selectEmp").attr("data-position","고객관리")
	$("#selectEmp").html('고객관리 : '+$(this).attr("data-name"))
})
$(".trainer").click(function(){
	let empnum=$(this).attr("data-empnum")
	$("#selectEmp").empty()
	$("#selectEmp").attr("data-empnum",$(this).attr("data-empnum"))
	$("#selectEmp").attr("data-name",$(this).attr("data-name"))
	$("#selectEmp").attr("data-position","트레이너")
	$("#selectEmp").html('트레이너 : '+$(this).attr("data-name"))
})
$("#middleBtn").click(function(){
	$("#mLine").empty()
	$("#mLine").attr("data-empnum",$("#selectEmp").attr("data-empnum"))
	$("#mLine").attr("data-name",$("#selectEmp").attr("data-name"))
	$("#mLine").attr("data-position",$("#selectEmp").attr("data-position"))
	$("#mLine").html($("#selectEmp").html())
	$("#selectEmp").empty();
})
$("#lastBtn").click(function(){
	$("#lLine").empty()
	$("#lLine").attr("data-empnum",$("#selectEmp").attr("data-empnum"))
	$("#lLine").attr("data-name",$("#selectEmp").attr("data-name"))
	$("#lLine").attr("data-position",$("#selectEmp").attr("data-position"))
	$("#lLine").html($("#selectEmp").html())
	$("#selectEmp").empty();
})
for (let i = 0; i < toggler.length; i++) {
	toggler[i].addEventListener("click", function() {
	  this.parentElement.querySelector(".nested").classList.toggle("active");
	  this.classList.toggle("caret-down");
	});
}
$("#approvalBtn").click(function(){
	if($("#title").val().length!=0&&$("#leaveSelect").val().length!=0&&$("#startDate").val().length!=0&&
	$("#endDate").val().length!=0&&$("#contents").val().length!=0){
		check=true;
	}else{
		alert("빈칸을 채워주세요.")
	}
	if($("#middleName").text().length!=0&&$("#lastName").text().length!=0){
		lineCheck=true;
	}else{
		alert("결재선을 선택해주세요.")
	}
	if(check==true&&lineCheck==true){
		$("#addForm").submit()
	}
})


function click_add(){
	let url = "line";
	let name = "line";
	let option="width = 600, height = 600, left = 100, top=50,location=no";
	window.open(url,name,option)
}
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}
$("#tempBtn").click(function(){
	$("#addForm").attr("action","tempAdd")
	if(formatDate($("#startDate").val())=='NaN-NaN-NaN'){
		$("#startDate").val(formatDate('2023-01-01'))
	}
	if(formatDate($("#endDate").val())=='NaN-NaN-NaN'){
		$("#endDate").val(formatDate('2023-01-01'))
	}
	
	$("#addForm").submit();
})





function dateDiff(start_date, end_date) {
    let dateDiff =
    (new Date(end_date).getTime() - new Date(start_date).getTime())
    / (1000 * 60 * 60 * 24);
    return dateDiff;
}


$("#leaveSelect").change(function(){
	if($("#leaveSelect").val()=='연차'){
		$("#endDate").change(function(){
			if($("#leaveSelect").val()=='연차'){
			$("#useDate").val(dateDiff($("#startDate").val(),$("#endDate").val())+1)
			}
		})
		if($("#annualRow").length==0){
			$("#leaveReasonRow").before('<tr id="annualRow"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> 연차일수</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3"><input type="text" id="useDate" name="useDate" readonly></td> </tr>')
		}
		$("#offKind").remove()
		
	}
	if($("#leaveSelect").val()=='반차'){
		$("#useDate").val("0.5")
		$("#endDate").change(function(){
			$("#useDate").val("0.5")
		})
		if($("#annualRow").length==0){
			$("#leaveReasonRow").before('<tr id="annualRow"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> 연차일수</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3"><input type="text" id="useDate" name="useDate" readonly></td> </tr>')
		}
		if($("#offKind").length==0){
			$("#regDateRow").after('<tr id="offKind"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> 반차종류</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3"><input type="radio" id="off"name="halfKind" value="오전">오전<input type="radio" id="off"name="halfKind" value="오후">오후</td> </tr>')
		
		}
		
	}
		
	if($("#leaveSelect").val()=='병가'||$("#leaveSelect").val()=='기타'){
		$("#annualRow").remove()
		$("#offKind").remove()
	}
	
	
})

