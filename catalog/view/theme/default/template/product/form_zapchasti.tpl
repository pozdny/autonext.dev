<div class="row">
    <div class="col-xs-12" >
        <h3 style="margin-top:0;">Для заказа деталей, пожалуйста, заполните форму ниже</h3>

        <form  action="contact_form.php" role="form" method="post" id="formSend">
            <div class="form-group col-xs-6">
                <label><span style="color:red;">*</span>&nbsp;Марка авто</label>
                <input type="text" id="disabledTextInput" class="form-control required" name="marka" >
                <span class="gh-1" style="color:red;"></span>
            </div>
            <div class="form-group col-xs-6">
                <label><span style="color:red;">*</span>&nbsp;Номер кузова (VIN)</label>
                <input type="text" id="disabledTextInput2" class="form-control required" name="kuzov">
                <span class="gh-1" style="color:red;"></span>
            </div>
            <div class="form-group col-xs-12">
                <label><span style="color:red;">*</span>&nbsp;Перечень запчастей</label>
                <textarea class="form-control ftopm required" rows="3" name="zip"></textarea>
                <span class="gh-1" style="color:red;"></span>
            </div>
            <div class="form-group col-xs-4">
                <label><span style="color:red;">*</span>&nbsp;Имя</label>
                <input type="text" id="disabledTextInput3" class="form-control required latter-only" name="name">
                <span class="gh-1" style="color:red;"></span>
            </div>
            <div class="form-group col-xs-4">
                <label><span style="color:red;">*</span>&nbsp;Телефон</label>
                <input type="text" id="disabledTextInput4" class="form-control required int-only" name="telefon">
                <span class="gh-1" style="color:red;"></span>
            </div>
            <div class="form-group col-xs-4">
                <label>E-mail</label>
                <input type="text" id="disabledTextInput5" class="form-control character" name="email">
                <span class="gh-em" style="color:red;"></span>
            </div>
            <div class="form-group col-xs-12">
                <button type="submit" class="btn btn-primary" name="order_zapchasti" >Отправить</button>
            </div>
        </form>
    </div>

</div>

<script type="text/javascript">
    $(document).ready(function () {
        $.mask.definitions['~'] = "[+-]";
        $("#disabledTextInput4").mask("+7(999) 999-9999");
    });

</script>
<script>


    function validate(form){
        var f = true;
        var inputs = form.find('.required');
        var val;
        inputs.each(function(){
            val = $(this).val();
            if(val.length == 0){
                $(this).addClass('er-in') ;
                $(this).next('span').html("*заполните поле");
                f = false;
            }
            $(this).on("keyup, keydown", function(){
                $(this).removeClass('er-in') ;
                $(this).next('span').html("");
            })

        });
        if(f){
            return true;
        }
        else{
            return false;
        }
    }

    function validatecount(form){
        var f = true;
        var inputs = form.find('.required');
        var val_count;
        inputs.each(function(){
            val_count = $(this).val();
            if(val_count.length < 3 && val_count.length > 0){
                $(this).addClass('er-in') ;
                $(this).next('span').html("введено мало символов");
                f = false;
            }
            $(this).on("keyup, keydown", function(){
                $(this).removeClass('er-in') ;
                $(this).next('span').html("");
            })
        });
        if(f){
            return true;
        }
        else{
            return false;
        }
    }

    function validatechar(form){
        var f = true;
        var inputs = form.find('.character');
        var val_char;
        inputs.each(function(){
            val_char = $(this).val();
            var der = val_char.indexOf("@");
            var ser = val_char.indexOf(".");
            if(der < 1 && ser < 1 && val_char.length > 0){
                $(this).addClass('er-in') ;
                $(this).next('span').html("Некорректный E-mail");
                f = false;
            }

            $(this).on("keyup, keydown", function(){
                $(this).removeClass('er-in') ;
                $(this).next('span').html("");
            })

        });

        if(f){
            return true;
        }
        else{
            return false;
        }
    }


    function validateint(form){
        var f = true;
        var inputs = form.find('.int-only');
        var val_int;
        inputs.each(function(){
            val_int = $(this).val();
            var re = /^\+?\d[\d\(\)\ \-\+]{4,15}\d$/;
            var myPhone = $('.int-only').val();
            var valid = re.test(myPhone);
            if(!valid && val_int.length > 0){
                $(this).addClass('er-in') ;
                $(this).next('span').html("Некорректный номер");
                f = false;
            }

            $(this).on("keyup, keydown", function(){
                $(this).removeClass('er-in') ;
                $(this).next('span').html("");
            })

        });

        if(f){
            return true;
        }
        else{
            return false;
        }
    }
    var respForm = $("#formSend");
    respForm.submit(function(e)
    {
        e.preventDefault(); //STOP default action
        var a = validate($(this));
        var b = validatecount($(this));
        var c = validatecount($(this));
        var e = validatechar($(this));
        var b = validateint($(this));
        if(a && b && c && e && b){
            var postData = $(this).serializeArray();
            var formURL = $(this).attr("action");
            $.ajax(
                    {
                        url : formURL,
                        type: "POST",
                        data : {
                            str: 'zapchasti',
                            arr: postData
                        },
                        success:function(data, textStatus, jqXHR)
                        {
                            if(data == 'ok'){
                                respForm.get(0).reset();
                                var content = $('#content');
                                var mess = $('<p class="ok_info">').append('Ваше сообщение отправлено! Наши специалисты свяжутся с Вами в ближайшее время');
                                mess.prependTo(content);

                                setTimeout(function(){
                                    var ok = $('.ok_info');
                                    ok.fadeOut(400);
                                }, 2500);
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown)
                        {

                        }
                    });
        }
        else{
            return false;
        }



    });



    var input2 = $(".latter-only");
    input2.on('keyup input', function(e){
        var val2 = $(this).val();
        reg = /[^a-zA-Zа-яА-Я]/;
        if(reg.test(val2)){
            $(this).val(val2.slice(0,-1));
        }
    });
</script>


