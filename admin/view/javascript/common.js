function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}

$(document).ready(function() {
	//Form Submit for IE Browser
	$('button[type=\'submit\']').on('click', function() {
		$("form[id*='form-']").submit();
	});

	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});

	// Set last page opened on the menu
	$('#menu a[href]').on('click', function() {
		sessionStorage.setItem('menu', $(this).attr('href'));
	});

	if (!sessionStorage.getItem('menu')) {
		$('#menu #dashboard').addClass('active');
	} else {
		// Sets active and open to selected page in the left column menu.
		$('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parents('li').addClass('active open');
	}

	if (localStorage.getItem('column-left') == 'active') {
		$('#button-menu i').replaceWith('<i class="fa fa-dedent fa-lg"></i>');

		$('#column-left').addClass('active');

		// Slide Down Menu
		$('#menu li.active').has('ul').children('ul').addClass('collapse in');
		$('#menu li').not('.active').has('ul').children('ul').addClass('collapse');
	} else {
		$('#button-menu i').replaceWith('<i class="fa fa-indent fa-lg"></i>');

		$('#menu li li.active').has('ul').children('ul').addClass('collapse in');
		$('#menu li li').not('.active').has('ul').children('ul').addClass('collapse');
	}

	// Menu button
	$('#button-menu').on('click', function() {
		// Checks if the left column is active or not.
		if ($('#column-left').hasClass('active')) {
			localStorage.setItem('column-left', '');

			$('#button-menu i').replaceWith('<i class="fa fa-indent fa-lg"></i>');

			$('#column-left').removeClass('active');

			$('#menu > li > ul').removeClass('in collapse');
			$('#menu > li > ul').removeAttr('style');
		} else {
			localStorage.setItem('column-left', 'active');

			$('#button-menu i').replaceWith('<i class="fa fa-dedent fa-lg"></i>');

			$('#column-left').addClass('active');

			// Add the slide down to open menu items
			$('#menu li.open').has('ul').children('ul').addClass('collapse in');
			$('#menu li').not('.open').has('ul').children('ul').addClass('collapse');
		}
	});

	// Menu
	$('#menu').find('li').has('ul').children('a').on('click', function() {
		if ($('#column-left').hasClass('active')) {
			$(this).parent('li').toggleClass('open').children('ul').collapse('toggle');
			$(this).parent('li').siblings().removeClass('open').children('ul.in').collapse('hide');
		} else if (!$(this).parent().parent().is('#menu')) {
			$(this).parent('li').toggleClass('open').children('ul').collapse('toggle');
			$(this).parent('li').siblings().removeClass('open').children('ul.in').collapse('hide');
		}
	});

	// Override summernotes image manager
	$('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');

	$(document).delegate('button[data-toggle=\'image\']', 'click', function() {
		$('#modal-image').remove();

		$(this).parents('.note-editor').find('.note-editable').focus();

		$.ajax({
			url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
			dataType: 'html',
			beforeSend: function() {
				$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
				$('#button-image').prop('disabled', true);
			},
			complete: function() {
				$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
				$('#button-image').prop('disabled', false);
			},
			success: function(html) {
				$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

				$('#modal-image').modal('show');
			}
		});
	});

	// Image Manager
	$(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
		e.preventDefault();

		$('.popover').popover('hide', function() {
			$('.popover').remove();
		});

		var element = this;

		$(element).popover({
			html: true,
			placement: 'right',
			trigger: 'manual',
			content: function() {
				return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
			}
		});

		$(element).popover('show');

		$('#button-image').on('click', function() {
			$('#modal-image').remove();

			$.ajax({
				url: 'index.php?route=common/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
				dataType: 'html',
				beforeSend: function() {
					$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-image').prop('disabled', true);
				},
				complete: function() {
					$('#button-image i').replaceWith('<i class="fa fa-pencil"></i>');
					$('#button-image').prop('disabled', false);
				},
				success: function(html) {
					$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

					$('#modal-image').modal('show');
				}
			});

			$(element).popover('hide', function() {
				$('.popover').remove();
			});
		});

		$('#button-clear').on('click', function() {
			$(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));

			$(element).parent().find('input').attr('value', '');

			$(element).popover('hide', function() {
				$('.popover').remove();
			});
		});
	});

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body', html: true});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});

	// https://github.com/opencart/opencart/issues/2595
	$.event.special.remove = {
		remove: function(o) {
			if (o.handler) {
				o.handler.apply(this, arguments);
			}
		}
	}

	$('[data-toggle=\'tooltip\']').on('remove', function() {
		$(this).tooltip('destroy');
	});
});

// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();

			$.extend(this, option);

			$(this).attr('autocomplete', 'off');

			// Focus
			$(this).on('focus', function() {
				this.request();
			});

			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});

			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});

			// Click
			this.click = function(event) {
				event.preventDefault();

				value = $(event.target).parent().attr('data-value');

				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}

			// Show
			this.show = function() {
				var pos = $(this).position();

				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});

				$(this).siblings('ul.dropdown-menu').show();
			}

			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}

			// Request
			this.request = function() {
				clearTimeout(this.timer);

				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}

			// Response
			this.response = function(json) {
				html = '';

				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}

					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}

					// Get all the ones with a categories
					var category = new Array();

					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}

							category[json[i]['category']]['item'].push(json[i]);
						}
					}

					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}

				if (html) {
					this.show();
				} else {
					this.hide();
				}

				$(this).siblings('ul.dropdown-menu').html(html);
			}

			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));

		});
	}
})(window.jQuery);


// ajax catalog */
$(function(){
	getUrlVars();
	window.loader = $("#loader");
	window.notification = $("#notificCatalogAuto");
	window.Catalog = new Catalog();

});
var Settings = {
	delayedTime: 500,
	delayedTimeSection: 1000
};
var Catalog = function() {
	this.catalogList = [];
	this.sectionList = [];
	var requestUrl = 'https://api2.autotrade.su?json',
		requestUrl2 = 'index.php?route=catalog/product/editCatalog&token=' + token,
		login = 'brylev.pavel@inbox.ru',
		password = '140191a',
		salt = '1>6)/MI~{J',
		buttonStart = $('#editAuto'),
		hash = '',
		lastDelayedTime = null,
		lastDelayedTime2 = null,
		_this = this;
	$.ajaxSetup({
		url: requestUrl,
		type: "POST",
		dataType: "json",
		cache: false
	});
	hash = hex_md5(login + hex_md5(password) + salt);

	this.getCatalogList = function () {
		var request = {
			"auth_key": hash,
			"method": "getCatalogsList"
		};
		var data = 'data=' + JSON.stringify(request);

		$.ajax({
			url: requestUrl,
			data: data,
			beforeSend: function () {
				elemShow(loader);
			},
			success: function (data) {
				if (data != '') {
					if (data["code"]) {
						//console.log(data);
						elemShow(notification, data["message"]);
					}
					else {
						_this.catalogList = data;
						_this.putMainCategory();
					}

				}
			},
			error: function (obj, err) {
				console.log(err);
			}
		}).done(function (data) {
			//elemHide(loader);
		});
	};
	/**
	 * put main category auto
	 */
	this.putMainCategory = function () {
		var request = {
			"action": "putMainCategory",
			"list": _this.catalogList
		};
		ajaxFunc(requestUrl2, request);
		setTimeout(_this.startSectionCicle, Settings.delayedTime);
	};

	this.startSectionCicle = function () {
		var catalog_id,
			delayed_time,
			length = _this.catalogList.length;
		var request = {
			"action": "deleteCetegorySectionName"
		};
		ajaxFunc(requestUrl2, request);

		$.each(_this.catalogList, function () {
			length--;
			catalog_id = $(this)[0].id;
			if (lastDelayedTime == null) {
				delayed_time = Settings.delayedTimeSection;
			}
			else {
				delayed_time = lastDelayedTime;
			}
			lastDelayedTime = lastDelayedTime + 2000;//console.log(lastDelayedTime);
			var arr = {
				"catalog_id": catalog_id
			};

			delayedGet(arr, delayed_time, length, 'section');

		})
	};
	this.getSectionsList = function (arr, length) {
		console.log(length);
		var catalog_id = arr["catalog_id"];
		$.ajaxSetup({
			url: requestUrl,
			dataType: "json",
			type: "POST"
		});
		var request = {
			"auth_key": hash,
			"method": "getSectionsList",
			"params": {
				"catalog_id": catalog_id

			}
		};
		var data = 'data=' + JSON.stringify(request); //console.log(data);

		$.ajax({
			url: requestUrl,
			data: data,
			beforeSend: function () {
				elemShow(loader);
			},
			success: function (data) {
				if (data["code"]) {
					//console.log(data);
					elemShow(notification, data["message"]);
				}
				else {
					//console.log(data);
					var request = {
						"action": "putCategorySectionName",
						"list": data
					};
					ajaxFunc(requestUrl2, request);
					_this.sectionList.push(data);
				}
			},
			error: function (obj, err) {
				console.log(err);
			}
		}).done(function () {
			if (!length) {
				lastDelayedTime = null;
				//elemHide(loader);
				//console.log(_this.sectionList);
				_this.startSubSectionCicle();
			}
			elemHide(notification);
		});
	};
	this.startSubSectionCicle = function () {
		var section_id,
			catalog_id,
			section = null,
			delayed_time,
			length = _this.sectionList.length;
		$.each(_this.sectionList, function (num) {
			section = $(this);
			length--;
			$.each(section, function () {
				var _that = $(this)[0];
				catalog_id = _that.parent_id;
				section_id = _that.id;
				if (lastDelayedTime == null) {
					delayed_time = Settings.delayedTimeSection;
				}
				else {
					delayed_time = lastDelayedTime;
				}
				lastDelayedTime = lastDelayedTime + 2000;//console.log(lastDelayedTime);
				var arr = {
					"catalog_id": catalog_id,
					"section_id": section_id
				};
				delayedGet(arr, delayed_time, length, 'subsection');
			});
		})
	};
	this.getSubSectionsList = function (arr, length) { console.log(length);
		var catalog_id = arr["catalog_id"],
			section_id = arr["section_id"];
		$.ajaxSetup({
			url: requestUrl,
			dataType: "json",
			type: "POST"
		});
		var request = {
			"auth_key": hash,
			"method": "getSubSectionsList",
			"params": {
				"catalog_id": catalog_id,
				"section_id": section_id

			}
		};
		var data = 'data=' + JSON.stringify(request);

		$.ajax({
			url: requestUrl,
			data: data,
			beforeSend: function () {
				elemShow(loader);
			},
			success: function (data) {
				if (data != '') {
					//var data = data['photo'].replace(re, "&amp;"); console.log(data);
					$.map(data, function(val){
						var re = /&/g;
						if(val.photo){
							var str = val.photo;
							val.photo = val.photo.replace(re, " ");
						}
						if(val.name){
							var str2 = val.name;
							val.name = val.name.replace(re, " ");
						}
						return val;
					});
					//console.log(data);
					var request = {
						"action": "putCategorySubSectionName",
						"list": data,
						"catalog_id":catalog_id
					};
					ajaxFunc(requestUrl2, request);
				}
			},
			error: function (obj, err) {
				console.log(err);
			}
		}).done(function () {
			if (!length) {
				lastDelayedTime = null;
				elemHide(loader);
				elemShow(notification, "Загрузка каталога с http://sklad.autotrade.su завершена!");
			}
			elemHide(notification);
		});
	};
	this.getAllowedAndChoosenStoragesList = function(){
	 var request = {
	 	"auth_key":hash,
	 	"method": "getAllowedAndChoosenStoragesList",
	 };
	 var data = 'data=' + JSON.stringify(request);
	 $.ajax({
		 url: requestUrl,
	 	 data: data,
	 success: function(data)
	 {
		 if(data !=''){
			 var request = {
				 "action": "putStoragesList",
				 "list": data,
			 };
			 ajaxFunc(requestUrl2, request);
		 }
	 },
	 error: function(obj, err)
	 {
	 	console.log(err);
	 }
	 });
	 };
	//this.getStorageList();

	buttonStart.on('click', function(){
		var result = confirm("Вы уверены, что хотите запустить обновление каталога Автозапчастей?");
		if(result){
			delayedGet(null, Settings.delayedTime, '', 'getAllowedAndChoosenStoragesList');
			delayedGet(null, Settings.delayedTime + 1000, '', 'getCatalogList');
		}
		else{
			return false;
		}

	});

};

// параметры строки запроса браузера
function getUrlVars(){
	var vars = [], hash;
	var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	for(var i = 0; i < hashes.length; i++)
	{
		hash = hashes[i].split('=');
		vars.push(hash[0]);
		vars[hash[0]] = hash[1];
	}
	window.token = vars['token'];
	return vars;
}

function ajaxFunc(requestUrl, request){
	$.ajaxSetup({
		url:requestUrl,
		dataType:"json",
		type: "POST"
	});

	var data = "data=" + JSON.stringify(request);
	$.ajax({
		data: data,
		success: function(data)
		{
			if(data !=''){
				//_this.getSectionsList();

			}
		},
		error: function(obj, err)
		{
			console.log(err);
		}
	});
}
function elemHide(obj){
	obj.animate(
		{
			opacity: 0
		},
		500,
		function(){
			obj.css("display", "none");
		}
	);
	obj.text('');
}
function elemShow(obj, txt){
	obj.css("display", "block");
	obj.animate({ opacity: 1 }, 500);
	if(txt){
		obj.text(txt);
	}
}
function delayedGet(data, time, length, str){
	setTimeout(function(){
		if(str == 'section'){
			window.Catalog.getSectionsList(data, length);
		}
		else if(str == 'subsection'){
			window.Catalog.getSubSectionsList(data, length);
		}
		else if(str == 'getAllowedAndChoosenStoragesList'){
			window.Catalog.getAllowedAndChoosenStoragesList();
		}
		else if(str == 'getCatalogList'){
			window.Catalog.getCatalogList();
		}
		//console.log(param);
	}, time)
}


