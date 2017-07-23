/**
 * Created by Administrator on 2016/4/14.
 */
var selAll = document.getElementById("selAll");
var inp = document.getElementsByTagName('input');
function selectAll() {
    var obj = document.getElementsByName("checkAll");
    if (document.getElementById("selAll").checked == false) {
        for (var i = 0; i < obj.length; i++) {
            obj[i].checked = false;
        }
    } else {
        for (var i = 0; i < obj.length; i++) {
            obj[i].checked = true;
        }
    }
}
function setSelectAll() {
    var obj = document.getElementsByName("checkAll");
    var count = obj.length;
    var selectCount = 0;
    for (var i = 0; i < count; i++) {
        if (obj[i].checked == true) {
            selectCount++;
        }
    }
}



