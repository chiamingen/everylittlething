function move_images(url) {
	if (get_ticked_image_ids().length > 0) {
		var form = $('form')[0];
		form.action = url;
		form.submit();
	} else {
		alert('Please select some images');
	}
}

function tick_image(e, img_id) {
	var target = get_target(e);
	var checkbox = $("#" + img_id);

	if (checkbox.attr('checked')) {
		checkbox.attr('checked', false);
		$(target).next().remove();
		$(target).fadeTo("normal", 1)
	} else {
		if ($.browser.msie) {
			var check_img = $("<img border='0' src='/images/check.gif' />"); 
		} else {
			var check_img = $("<img border='0' src='/images/check.png' />");
		}
		check_img.css("position", "absolute");
		check_img.css("top", find_pos_y(target) + target.offsetHeight - 32 + "px");
		check_img.css("left", find_pos_x(target) + target.offsetWidth - 33 + "px");
		$(target).parent().append(check_img);
		checkbox.attr('checked', true);
		$(target).fadeTo("fast", 0.3)
	}
}

function get_ticked_image_ids() {
	var image_ids = jQuery.map($("input:checkbox:checked"), function(n, i) {
		return $(n).val();
	})
	return image_ids;
}

function show_menu(e, menu_id) {
	var target = get_target(e)
	$("#test").html($("#test").html() + " | " + $(target).parent().attr("id"));
	var menu = $("#" + menu_id);
	if (menu.css("display") == "block") {
		menu.css("display", "none")
	} else {
		$(document).bind("mouseup", function(e) {
			if (!(e.target == target)) {
				$(document).unbind("mouseup");
				menu.css("display", "none");
			}
		});
		var top = find_pos_y(target) + target.offsetHeight;
		var left = find_pos_x(target);
		menu.css("top", top + "px")
		menu.css("left", left + "px")
		menu.css("display", "block");
	}
}

function get_target(e) {
	var targ;
	if (!e) var e = window.event;
	if (e.target) targ = e.target;
	else if (e.srcElement) targ = e.srcElement;
	if (targ.nodeType == 3) // defeat Safari bug
		targ = targ.parentNode;
	return targ

}
function find_pos_x(obj) {
    var curleft = 0;
    if(obj.offsetParent)
        while(1) {
          curleft += obj.offsetLeft;
          if(!obj.offsetParent)
            break;
          obj = obj.offsetParent;
        }
    else if(obj.x)
        curleft += obj.x;
    return curleft;
}

function find_pos_y(obj) {
    var curtop = 0;
    if(obj.offsetParent)
        while(1) {
          curtop += obj.offsetTop;
          if(!obj.offsetParent)
            break;
          obj = obj.offsetParent;
        }
    else if(obj.y)
        curtop += obj.y;
    return curtop;
}
