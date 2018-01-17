$(function(){
	$("#LikBuy").click(function(){
		sendBuyInfo();
	})
	
	$("#LikBasket").click(function(){
		sendCartInfo();
	})
})
function sendBuyInfo(){
	var gid = $("#gid").val();
	var gnum = $("#text_box").val();
	var bid = $("#sub-userid").val();
	
	var key1 = "gid";
	var key2 = "gnum";
	var key3 = "bid";
	var params = [key1,gid,key2,gnum,key3,bid];
	var json = connStr(params);
	
	$.ajax({
		type:"post",
		url:"http://localhost:8080/minishop/buy.action",
		async:true,
		data:json,
		dataType:"json",
		complete:function(data){
			var info = JSON.parse(data["responseText"]);
			if( info["state"]=="success" ){
				alert("购买成功");
			}else{
				alert("购买失败");
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.readyState+"\n"+textStatus+"\n"+errorThrown);
		}
	});
}
function sendCartInfo(){
	var gid = $("#gid").val();
	var gnum = $("#text_box").val();
	
	var key1 = "gid";
	var key2 = "gnum";
	var params = [key1,gid,key2,gnum];
	
	var json = connStr(params);
	$.ajax({
		type:"post",
		url:"http://localhost:8080/minishop/addcart.action",
		async:true,
		data:json,
		dataType:"json",
		complete:function(data){
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
	});
}

//根据参数返回json字符串
function connStr(params)
{
	var ret = getFormatStr("h");
	for( var i=0; i < params.length; i+=2 ){
		if( i!=params.length-2 ){
			ret += (params[i]+getFormatStr("bc")+params[i+1]+getFormatStr("bs"));
		}else{
			ret += (params[i]+getFormatStr("bc")+params[i+1]);
		}
	}
	ret += getFormatStr("t");
	return ret;
}

//head,tail,bodyConcatenon,bodySeparated部分格式字符串
function getFormatStr(type)
{
	var ret = null;
	switch( type ){
		case "h":{
			ret = "{\"";
			break;
		}
		case "t":{
			ret = "\"}";
			break;
		}
		case "bc":{
			ret = "\":\"";
			break;
		}
		case "bs":{
			ret = "\",\"";
			break;
		}
	}
	return ret;
}