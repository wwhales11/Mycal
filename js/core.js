var session = {
		set: function (name, val) {
			sessionStorage["mysns>" + name] = JSON.stringify(val);
		},
		
		get: function (name) {
			var str = sessionStorage["mycal>" + name];
			return (str == null || str == "null") ? null : JSON.parse(str);
		},
		
		clear: function (name) {
			sessionStorage["mycal>" + name] = null;
		},
}

var AJAX = {
	call: function (url, params, onSuccess) {
		jQuery.ajax({
			url: url,	
			type: "post",
			data: params,
			cache: false,
			dataType: "text",
			success: onSuccess,
			error: function (xhr, status, error) {
				if (xhr.status == 0) {
				    alert("네트워크 접속이 원할하지 않습니다.");
				}
				else {
					var str = "code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error;
					console.log(str);
				    alert("에러가 발생하였습니다. 관리자에게 문의해주세요.");
				}
			},
		});
	},

	formCall: function (url, params, onSuccess) {
		var callobj = {};
		callobj["url"] = url;
		callobj["type"] = "POST";
		callobj["data"] = params;
		callobj["processData"] = false;
		callobj["contentType"] = false;
		callobj["cache"] = false;
		callobj["dataType"] = "text";
		callobj["success"] = onSuccess; 
		callobj["error"] = function (xhr, status, error) {
			if (xhr.status == 0) {
			    alert("네트워크 접속이 원할하지 않습니다.");
			}
			else {
				var str = "code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error;
				console.log(str);
			    alert("에러가 발생하였습니다. 관리자에게 문의해주세요.");
			}
		};
		jQuery.ajax(callobj);
	},
};
