/**
 * Created by Administrator on 2016/4/14.
 */
window.onload = function(){
    var modalChuang = document.getElementById("modal-1");
    var dailog = document.getElementById("dailog");
    var modalTian = document.getElementById("modal");
    var cha = document.getElementById("cha");
    var closebtn = document.getElementById("closebtn");
    var okbtn = document.getElementById("okbtn");

    modalTian.onclick = function(){
        modalChuang.style.display = "block";
        dailog.style.animation = "dropdown .8s forwards";
    };

    function closedialog(){
        dailog.style.animation = "dropup .8s forwards";
        setTimeout(function(){
        modalChuang.style.display = "none";
        },1000)
    }

    //function submitform(){
    //    var uname = document.getElementById("uname");
    //    var pwd = document.getElementById("pwd");
    //    var repwd = document.getElementById("repwd");
    //    var gender = document.getElementsByName("gender");
    //    var hobby = document.getElementsByName("hobby");
    //    var pro = document.getElementById("pro");
    //    var remark = document.getElementById("remark");
    //
    //    return;
    //    document.forms[0].submit();
    //
    //}

    closebtn.onclick = closedialog;
    cha.onclick = closedialog;
    //okbtn.onclick = submitform;
};
