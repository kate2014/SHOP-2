/**
 * Created by Administrator on 2016/4/12.
 */
$(document).ready(function(){
    $('.a-upload').on("change","input[type='file']",function(){
        var filePath = $(this).val();
        if(filePath.indexOf("jpg")!=-1||
            filePath.indexOf("png")!=-1){
            $(".fileerrorTip").html("").hide();
            var arr=filePath.split('\\');
            var fileName = arr[arr.length-1];
            $('.showFileName').html(fileName);
        }else{
            $(".showFieName").html("");
            $(".fileerrorTip").html("您未上传文件，或您上传的文件类型有误！").show();
            return false;
        }
    });
});
