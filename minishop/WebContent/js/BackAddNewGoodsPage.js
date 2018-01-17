$(function(){
	$("#sub-addgoods").click(function(){
		$("#setEditor").val($("#editor").html());
	})
})
/*
function req(){
	var name = $("#sub-name").val();
	var intro = $("#sub-intro").val();
	var price = $("#sub-price").val();
	var surplus = $("#sub-surplus").val();
	var address = $("#sub-address").val();
	var img1 =  document.getElementById("sub-img1").files[0];
	var img2 =  document.getElementById("sub-img2").files[0];
	var img3 =  document.getElementById("sub-img3").files[0];
	var Text = $("#editor").html();
	
	var form = new FormData();
	form.append("name",name);
	form.append("intro",intro);
	form.append("price",price);
	form.append("surplus",surplus);
	form.append("address",address);
	form.append("img1",img1);
	form.append("img2",img2);
	form.append("img3",img3);
	form.append("text",Text);
	
	$.ajax({
		type:"post",
		url:"http://localhost:8080/minishop/addGoods.action",
		async:true,
		cache:false,
		data:form,
		dataType:"json",
		processData: false,
		contentType: false,
		complete: function(date){
			var info = JSON.parse(data["responseText"]);
			if( info["state"]=="success" ){
				alert("添加成功");
			}else{
				alert("添加失败");
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.readyState+"\n"+textStatus+"\n"+errorThrown);
		}
	})
}
*/