/*
 * 对textare的长度进行验证
 */
$.validator.addMethod('extMaxLength', function (value, element, maxlen){
    if (maxlen > 0) {
        var remaining = (maxlen - (parseInt($(element).val().replace(/(\r\n|\n|\r)/gm, '\n').length, 10)));
        if (remaining < 0) {
            return false;
        }
    }
    return true;
});
