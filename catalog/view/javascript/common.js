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
	} else { 			// Изменения для seo_url от Русской сборки OpenCart 2x
		var query = String(document.location.pathname).split('/');
		if (query[query.length - 1] == 'cart') value['route'] = 'checkout/cart';
		if (query[query.length - 1] == 'checkout') value['route'] = 'checkout/checkout';

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}

$(document).ready(function() {
	// Adding the clear Fix
	cols1 = $('#column-right, #column-left').length;

	if (cols1 == 2) {
		$('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
	} else if (cols1 == 1) {
		$('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix visible-lg"></div>');
	} else {
		$('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix"></div>');
	}

	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});

	// Currency
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('#currency').submit();
	});

	// Language
	$('#language a').on('click', function(e) {
		e.preventDefault();

		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('#language').submit();
	});

	/* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('header input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('#content .product-layout > .clearfix').remove();

		//$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');
		$('#content .row > .product-layout').attr('class', 'product-layout product-list col-xs-12');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		$('#content .product-layout > .clearfix').remove();

		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}

		 localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else {
		$('#grid-view').trigger('click');
	}

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});
});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
					}, 100);

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['info']) {
					$('#content').parent().before('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				$('#wishlist-total span').html(json['total']);
				$('#wishlist-total').attr('title', json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		});
	},
	'remove': function() {

	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#compare-total').html(json['total']);

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			}
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
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

/* ========================================================================
 * API http://sklad.autotrade.su
 * ======================================================================== */
/**
 * @catalog logic
 * @constructor
 */
// ajax catalog */
$(function(){
	window.loader = $("#loader");
	window.Catalog = new Catalog();

});

var Catalog = function(){
	var requestUrl = 'https://api2.autotrade.su?json',
		requestUrl2 = 'index.php?route=product/category/getApiData',
		login = 'brylev.pavel@inbox.ru',
		password = '140191a',
		salt = '1>6)/MI~{J',
		hash = hex_md5(login + hex_md5(password) + salt),
		_this = this;
	var htmlCElems = {
		apiContent:     $('#content'),
		placeTo:        $('#content').find('h1'),
		buttonSearch:   $('#searchAuto'),
		buttonCategory: $('.getSectionsList'),
		buttonSection:  '.getSubSectionsList'
	};
	$.ajaxSetup({
		url:requestUrl2,
		type: "POST",
		dataType:"json",
		cache:false
	});

	this.startAction = function(){
		$(htmlCElems.buttonCategory).on('click', function(e){
			e.preventDefault();
			var catalog_id = $(this).data("key");
			_this.getSectionsList(catalog_id);

		});
		$(htmlCElems.apiContent).on('click', htmlCElems.buttonSection, function(e){
			var section_id = $(this).data("key"); console.log(section_id);
			_this.getSubSectionsList(section_id);
		});
	};
	this.getSectionsList = function(catalog_id){
		var  request = {
			action: "getSectionsList",
			catalog_id: catalog_id
		};
		var data = 'data=' + JSON.stringify(request);
		$.ajax({
			data: data,
			beforeSend: function () {
				elemShow(loader);
			},
			success: function (data) {
				if(isError(data)) return false;
				var body = new BodySection(data);
				_this.pushBody(body);
			},
			error: function (obj, err) {
				console.log(err);
			}
		}).done(function () {
			elemHide(loader);
		});

	};
	this.getSubSectionsList = function(section_id){
		var catalog_id = $(htmlCElems.apiContent).data('catalog_id');
		var request = {
			"action": "getSubSectionsList",
			"params": {
				"catalog_id": catalog_id,
				"section_id": section_id
			}
		};
		var data = 'data=' + JSON.stringify(request); //console.log(data);
		$.ajax({
			data: data,
			beforeSend: function () {
				elemShow(loader);
			},
			success: function (data) {
				if(isError(data)) return false;
				var body = new BodySection(data);
				_this.pushBody(body);
			},
			error: function (obj, err) {
				console.log(err);
			}
		}).done(function () {
			elemHide(loader);
		});
	};
	this.pushBody = function(body){
		if (!(body instanceof BodySection)) {
			return;
		}
		htmlCElems.placeTo.after(body.getBody());


	};
	_this.startAction();
};
/* ========================================================================
 * BODY_SECTIONS
 * ======================================================================== */
/**
 * @param options {title}
 * @constructor
 */
var BodySection = function(options){
	var default_options = {
		title: "Автозапчасти"
	};
	var htmlMsgElems = {
		sectionMain: '<div id="sectionMain"></div>',
		breadCrumbElem: '<ol class="breadcrumb"></ol>',
		breadCrumbElemLi: '<li class="active"></li>',
		sectionBody: '<div id="sectionBody"></div>',
		spanElem: '<span></span>',
		rowElem: '<div class="row"></div>',
		sectionElem: '<div class="col-xs-4 getSubSectionsList list-group-item"></div>',
		photoElem:'<a href="" class="thumbnail"><i class="fa fa-camera"></li></a>'

	};
	var sectionMain = $('#sectionMain');
	options = $.extend(default_options, options);
	this.title = options.title;
	this.response = options['response'];
    this.parent_name = this.response['parent_name'];
	this.parent_id = this.response['parent_id'];
	this.sections = this.response['sections'];
	this.getBody = function(){
		var body = $(htmlMsgElems.sectionMain),
			breadcrumb = $(htmlMsgElems.breadCrumbElem),
			sectionBody = $(htmlMsgElems.rowElem),
			textChoose = '',
			photo = '',
			parentLength = this.parent_name.length;
		if(parentLength == 1){
			textChoose = "Выберите раздел:";
			$('#content').data('catalog_id', this.parent_id);
		}
		else if(parentLength == 2){
			textChoose = "Выберите подраздел:";
			photo = htmlMsgElems.photoElem;
		}
		console.log(photo);
		$.each(this.parent_name, function(ind, val){
			breadcrumb
				.append($(htmlMsgElems.breadCrumbElemLi)
				   .append(val));

		});
		$.each(this.sections, function(ind, val){
			var data_key = val.category_id;
			
			sectionBody
				.append($(htmlMsgElems.sectionElem).attr("data-key", data_key)
					.append(photo)
					.append($('<h5>')
						.append($('<strong>')
							.append(val.name)))
					);
		});
        body
			.append(breadcrumb)
			.append($(htmlMsgElems.sectionBody)
				.append($(htmlMsgElems.spanElem).addClass('chooseInfo')
					.append(textChoose))
				.append(sectionBody)


		);
		sectionMain.remove();
		return body;
	}
};
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

ajaxFunc = function(requestUrl, arrayList){
	$.ajaxSetup({
		url:requestUrl,
		dataType:"json",
		type: "POST"
	});
	var request = {
		"action":"putMainCategory",
		"list": arrayList
	};
	var data = "data=" + JSON.stringify(request);
	$.ajax({
		data: data,
		success: function(data)
		{
			if(data !=''){
				console.log('234');
				//_this.getSectionsList();

			}
		},
		error: function(obj, err)
		{
			console.log(err);
		}
	});
};
function isError(replay){
	return (replay.error != null);
}


