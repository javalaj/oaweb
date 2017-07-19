
function messageTag(mess)
{
	$("#messageBox").text(mess);
	top.$.jBox.tip.mess = 1;
	top.$.jBox.tip(mess, "success", {
		persistent : true,
		opacity : 0
	});
	$("#messageBox").show();
}

function messageTypeTag(mess,type)
{
	top.$.jBox.tip.mess = 1;
	top.$.jBox.tip(mess, type, {
		persistent : true,
		opacity : 0
	});
	$("#messageBox").show();
}
