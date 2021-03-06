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
	window.notification = $("#notificCatalogAuto");
	window.Catalog = new Catalog();
});
var Settings = {
	delayedTime: 1000,
	delayedTime2: 100
};
var Catalog = function(){
	var requestUrl = 'https://api2.autotrade.su?json',
		requestUrl2 = 'index.php?route=product/category/getApiData',
		requestUrl3 = 'index.php?route=product/category/searchApiResult',
		login = 'brylev.pavel@inbox.ru',
		password = '140191a',
		salt = '1>6)/MI~{J',
		hash = hex_md5(login + hex_md5(password) + salt),
		_this = this,
		href = '',
		lastDelayedTime = null,
		lastDelayedTime2 = null,
		itemsArr = {};

	var htmlCElems = {
		apiContent:     $('#content'),
		//placeTo:        $('#content').find('h1'),
		placeTo:        $('#content'),
		buttonSearch:   '#searchItems',
		buttonCloseN:   notification.find('.close'),
		buttonCategory: $('.getSectionsList'),
		buttonSection:  '.getSubSectionsList',
		itemsSection:  '.getItemsByCatalog',
		sectionBody:   '#sectionBody'
	};
	$.ajaxSetup({
		url:requestUrl2,
		type: "POST",
		dataType:"json",
		cache:false
	});
    this.getHref = function(){
		var arrUrl = getUrlVars(),
			host = location.host,
			pathname = location.pathname,
			protocol = location.protocol + '//',
			href = '',
			pathname   = location.pathname;
		    var arrUrl = getUrlVars();
		   if(arrUrl.length > 1){
			   var search = arrUrl[0];
			   history.pushState(null, null, search);
			   href = search;
			}
		    else{
				href = protocol + host + pathname;
			}
			return href;
	};
	this.getCurrentHref = function(){
		var arrUrl = getUrlVars(),
			host = location.host,
			pathname = location.pathname,
			protocol = location.protocol + '//',
			href = '',
			pathname   = location.pathname;
		var arrUrl = getUrlVars();
			href = protocol + host + pathname;

		return href;
	};
	this.startAction = function(){
		$(htmlCElems.buttonCategory).on('click', function(e){
			e.preventDefault();
			href = _this.getHref();
			var catalog_id = $(this).data("key");
			history.pushState(null, null, href + '&apisearch=catalogs&catalog_id=' + catalog_id);
			_this.getSectionsList(catalog_id);

		});
		$(htmlCElems.apiContent).on('click', htmlCElems.buttonSection, function(e){
			var section_id = $(this).data("key");
			var href = _this.getCurrentHref();
			history.pushState(null, null, href + '&section_id=' + section_id);
			_this.getSubSectionsList(section_id);
		});
		$(htmlCElems.apiContent).on('click', htmlCElems.itemsSection, function(e){
			var that = $(this);
			var act = false;
			that.toggleClass('active');
			$.each($(htmlCElems.itemsSection), function(ind){
				if($(this).hasClass('active')){
					act = true;
				}
			});
			if(act){
				$.each($(htmlCElems.itemsSection), function(ind){
					if(!$(this).hasClass('active')){
						$(this).addClass('disabled').attr({disabled:true});
					}
				});
				$(htmlCElems.buttonSearch).removeClass('disabled').attr({disabled:false});
			}
			else{
				$.each($(htmlCElems.itemsSection), function(ind){
					$(this).removeClass('disabled').attr({disabled:false});
				});
				$(htmlCElems.buttonSearch).addClass('disabled').attr({disabled:true});
			}
		});
		$(htmlCElems.apiContent).on('click', htmlCElems.buttonSearch, function(e){
			var items = $('.getItemsByCatalog.active');
			var items_arr = [];
			$.each(items, function(){
				items_arr.push($(this).data("key"));
			});
			var item_id = items_arr[0];
			$(htmlCElems.apiContent).data('item_id', item_id);
			var href = _this.getCurrentHref();
			var patt = new RegExp("subsection_id=" + item_id);
			var res = patt.test(href);
			console.log(res);
			if(!res) history.pushState(null, null, href + '&subsection_id=' + item_id);
			_this.getItemsByCatalog(items_arr, 1);
		});
		htmlCElems.buttonCloseN.on('click', function(e){
			elemHide($(this).parent());
		});
	};
	this.getSectionsList = function(catalog_id){
		var  request = {
			action: "getSectionsList",
			catalog_id: catalog_id
		};
		var data = 'data=' + JSON.stringify(request);
		$.ajax({
			url:requestUrl2,
			data: data,
			beforeSend: function () {
				elemShow(loader);
			},
			success: function (data) {
				if(isError(data)) return false;
				var body = new BodySection(data);
				_this.pushBody(body);
				$('body,html').animate({scrollTop:0},800);
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
			url:requestUrl2,
			data: data,
			beforeSend: function () {
				elemShow(loader);
			},
			success: function (data) {
				if(isError(data)) return false;
				var body = new BodySection(data);
				_this.pushBody(body);
				_this.attachPhoto();
				$('body,html').animate({scrollTop:0},800);
			},
			error: function (obj, err) {
				console.log(err);
			}
		}).done(function () {
			elemHide(loader);
		});
	};
	this.getItemsByCatalog = function(items, page){
		var catalog_id = $(htmlCElems.apiContent).data('catalog_id'),
			section_id = $(htmlCElems.apiContent).data('section_id');
		var request = {
			"auth_key":hash,
			"method": "getItemsByCatalog",
			"params":{
				"catalog_id":catalog_id,
				"section_id":section_id,
				"subsection_ids":items,
				"filter_part_types":[],
				"filter_brands":[],
				"filter_names":[],
				"orderBy":"",
				"orderDirection":"",
				"page":page,
				"limit":"20",
				"with_stocks":0
			},
			"search_requests":"1"
		};
		var data = 'data=' + JSON.stringify(request);
		$.ajax({
			url:requestUrl,
			data: data,
			beforeSend: function () {
				elemShow(loader);
			},
			success: function (data) {
				if (data["code"] > 0) {
					//console.log('error');
					/*elemShow(notification, data["message"] + " <br>Попробуйте еще раз!");
					setTimeout(function () {
						elemHide(notification);
					}, 2500);*/
				}
				else {
					if(data['items']){
						var items_arr = data['items'];
						var page_total = Math.ceil(data['total']/20),
							delayed_time;
						$.map(items_arr, function(ind, val){
							var re = /&/g;
							if(ind.photo){
								var str = ind.photo;
								ind.photo = ind.photo.replace(re, " ");
							}
							return ind;
						});
						var request = {
							"catalog_id": catalog_id,
							"section_id": section_id,
							"action": "putData",
							"list": data
						};
						ajaxFunc(requestUrl3, request);
						var mass = {};
						$.each(items_arr, function(ind, val){
							mass[val['article']] = "1";
						});
						//delayedGet(mass, Settings.delayedTime);
						if(page_total > 1){
							$.each(items_arr, function(ind, val){
								itemsArr[val['article']] = "1";
							});
							var time = Settings.delayedTime2 + 2000;console.log(time);
							delayedGet(itemsArr,  time, 0, 1);
							var length = page_total;
							for(var i = 1; i < page_total; i++ ){
							 length--;
								if (lastDelayedTime == null) {
									delayed_time = time + 1000;
								}
								else {
									delayed_time = lastDelayedTime;
								}
							  lastDelayedTime = lastDelayedTime + 5000;//console.log(lastDelayedTime);
							   delayedGet(items, delayed_time, i+1, length, 'itemsCicle');
							}

						}
						else{
							delayedGet(mass,  Settings.delayedTime, 0, 0);
						}
					}
				}
				$('body,html').animate({scrollTop:0},800);
			},
			error: function (obj, err) {
				console.log(err);
			}
		});

	};
	this.getStocksAndPrices = function(list, page, length){
		var request = {
			"auth_key":hash,
			"method": "getStocksAndPrices",
			"params": {
				"storages": 0,
				"items": list
			}
		};
		var data = 'data=' + JSON.stringify(request); //console.log(data);
		$.ajax({
			url:requestUrl,
			data: data,
			success: function (data) {
				if (data["code"] > 0) {
					/*elemShow(notification, data["message"] + " <br>Попробуйте еще раз!");
					setTimeout(function () {
						elemHide(notification);
					}, 2500);*/
				}
				else {
					_this.putItemsQuantity(data["items"], page, length);
				}

			},
			error: function (obj, err) {
				console.log(err);
			}
		});
	};
	this.putItemsQuantity = function(list, num, length){console.log(num);
		var request = {
			"action": "putItemsQuantity",
			"list": list
		};
		var data = 'data=' + JSON.stringify(request); //console.log(data);
		$.ajax({
			url:requestUrl3,
			data: data,
			success: function (data) {
				if(!length){
					_this.loadBody();
				}
				if(num == 1){
					_this.loadBody();
					elemHide(loader);
				}
			},
			error: function (obj, err) {
				console.log(err);
			}
		}).done(function () {
			if (!length ) {
				elemHide(loader);
			}

		});
	};
	this.getItemsByCatalogCicle = function(items, page, length){
		var catalog_id = $(htmlCElems.apiContent).data('catalog_id'),
			section_id = $(htmlCElems.apiContent).data('section_id');
		var request = {
			"auth_key":hash,
			"method": "getItemsByCatalog",
			"params":{
				"catalog_id":catalog_id,
				"section_id":section_id,
				"subsection_ids":items,
				"filter_part_types":[],
				"filter_brands":[],
				"filter_names":[],
				"orderBy":"",
				"orderDirection":"",
				"page":page,
				"limit":"20",
				"with_stocks":0
			},
			"search_requests":"1"
		};
		var data = 'data=' + JSON.stringify(request);
		 $.ajax({
			url:requestUrl,
			data: data,
			beforeSend: function () {
				elemShow(loader);
			},
			success: function (data) {
				if (data["code"] > 0) {
					/*elemShow(notification, data["message"] + " <br>Попробуйте еще раз!");
					setTimeout(function () {
						elemHide(notification);
					}, 2500);*/
				}
				else {
					if(data['items']){
						var items_arr = data['items'];
						var delayed_time;
						$.map(items_arr, function(ind, val){
							var re = /&/g;
							if(ind.photo){
								var str = ind.photo;
								ind.photo = ind.photo.replace(re, " ");
							}
							return ind;
						});
						var request = {
							"catalog_id": catalog_id,
							"section_id": section_id,
							"action": "putData",
							"list": data
						};
						ajaxFunc(requestUrl3, request);
						itemsArr = {};
						$.each(items_arr, function(ind, val){
							itemsArr[val['article']] = "1";
						});
						if (lastDelayedTime2 == null) {
							delayed_time = Settings.delayedTime;
						}
						else {
							delayed_time = lastDelayedTime2;
						}
						lastDelayedTime2 = lastDelayedTime2 + 500;
						delayedGet(itemsArr, delayed_time, length, 1);
					}
				}

			},
			error: function (obj, err) {
				console.log(err);
			}
		 }).done(function () {
			  if (length == 1) {
			  	  lastDelayedTime = null;
			  	  //elemHide(loader);
				  //_this.loadBody();
			  }
		 });

	};
	this.loadBody = function(){
		var catalog_id = $(htmlCElems.apiContent).data('catalog_id'),
		 section_id = $(htmlCElems.apiContent).data('section_id'),
		 item_id = $(htmlCElems.apiContent).data('item_id');
		 $(htmlCElems.sectionBody).load('index.php?route=product/category/api_search_result&catalog_id=' + catalog_id + '&section_id=' + section_id + '&subsection_id=' + item_id,
		 function(){
		 _this.attachPhoto();
		 }

		 );
	};
	this.attachPhoto = function(){
		var sectionPhoto = $('.section-photo');
		$.each(sectionPhoto, function(){
			$(this).magnificPopup({
				type:'image',
			});
			$(this).on('click', function(e){
				e.preventDefault();
			})
		});
	};
	this.pushBody = function(body){
		if (!(body instanceof BodySection)) {
			return;
		}
		htmlCElems.placeTo.empty();
		//htmlCElems.placeTo.after(body.getBody());
		htmlCElems.placeTo.append(body.getBody());
	};
	_this.startAction();
	//href = _this.getHref();
	getURLVar();
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
		title: '<h1></h1>',
		sectionMain: '<div id="sectionMain"></div>',
		breadCrumbElem: '<ul class="breadcrumb"></ul>',
		breadCrumbElemLi: '<li></li>',
		sectionBody: '<div id="sectionBody"></div>',
		spanElem: '<div class="chooseInfo"></div>',
		rowElem: '<div class="row rowBody"></div>',
		sectionElem: '<div class="col-xs-4 getSubSectionsList list-group-item"></div>',
		itemsElem: '<div class="col-xs-4 getItemsByCatalog list-group-item"></div>',
		photoElem:'<i class="fa fa-camera"></i>',
		searchElem:'<button class="btn btn-warning disabled" id="searchItems" disabled="disabled">Найти</button>'

	};
	var sectionMain = $('#sectionMain');
	options = $.extend(default_options, options);
	this.title = options.title;
	this.response = options['response'];
	if(this.response == 0){
		return;
	}
    this.parent_name = this.response['parent_name'];
	this.parent_id = this.response['parent_id'];
	if(this.response['parent_section_id']){
		this.parent_section_id = this.response['parent_section_id'];
	}
	this.sections = this.response['sections'];
	this.getBody = function(){
		if(this.response == 0){
			var body = $(htmlMsgElems.sectionMain);
			body.append('Данных нет');
			sectionMain.remove();
			return body;
		}
		var title = $(htmlMsgElems.title).append(this.title);
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
			//textChoose = 'Выберите подраздел: <span class="small-grey">(можно выбрать сразу несколько)</span>';
			textChoose = 'Выберите подраздел:';
			photo = htmlMsgElems.photoElem;
			$('#content').data('section_id', this.parent_section_id);
		}
		$.each(this.parent_name, function(ind, val){ console.log(ind);
			breadcrumb
				.append($(htmlMsgElems.breadCrumbElemLi)
					.append($('<a href="' + val.href + '">')
						.append(val.name)
				));


		});
		$.each(this.sections, function(ind, val){
			var data_key = val.category_id;
			if(parentLength == 1){
				sectionBody
					.append($(htmlMsgElems.sectionElem).attr("data-key", data_key)
						.append($('<h5>')
							.append($('<strong>')
								.append(val.name)))
				);
			}
			else if(parentLength == 2){
				var href = '';
				if(val.photo){
					href = $('<a class="section-photo">').attr('href', val.photo).append(photo);
				}
				sectionBody
					.append($(htmlMsgElems.itemsElem).attr("data-key", data_key)
						.append(href)
						.append($('<h5>')
							.append($('<strong>')
								.append(val.name)))
				);
			}

		});
		if(parentLength == 2){
			var searchButton = htmlMsgElems.searchElem;
		}
        body
			.append(title)
			.append(breadcrumb)
			.append($(htmlMsgElems.sectionBody)
				.append($(htmlMsgElems.spanElem).addClass('chooseInfo')
					.append(textChoose))
				.append(searchButton)
				.append(sectionBody)


		);
		sectionMain.remove();
		return body;
	}
};
function elemHide(obj){
	obj
		.animate(
		{
			opacity: 0
		},
		500,
		function(){
			obj.css("display", "none");
			obj.find('.body').empty();
		});
	//obj.css("display", "none");
}
function elemShow(obj, txt){
	obj.css("display", "block");
	obj.animate({ opacity: 1 }, 500);
	if(txt){
		var body = obj.find('.body');
		body.append(txt);
	}
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
				if (data['redirect']) {
					var re = /&amp;/g;
					data['redirect'] = data['redirect'].replace(re, "&");

					//location = data['redirect'];
				}
			}
		},
		error: function(obj, err)
		{
			console.log(err);
		}
	});
}
function isError(replay){
	return (replay.error != null);
}
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

function delayedGet(data, time, page, length, str){
	setTimeout(function(){
		if(str == 'itemsCicle'){
			window.Catalog.getItemsByCatalogCicle(data, page, length);
		}
		else{
			window.Catalog.getStocksAndPrices(data, page, length);
		}
		//console.log(param);
	}, time)
}

