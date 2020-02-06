var pages;
var pageSize;
var pageNum;



var form_data = new Vue({
    el:"#form_data",
    data:{
        userId:"",
    },
    methods:{
        selUser:function(){
            alert("函数执行了");
            $.ajax({
                url:"selOne",
                type:"get",
                data:{"userId":form_data.userId},
                success:function(data){
                    table.arr = data;
                }
            });
        }
    },
    init(){
      this.selUser();
    }
});

function pageCount(args) {
    if(args === 'previous'){
        if(pageNum <= 1){
            selPage(1);
        }else{
            pageNum--;
            selPage(pageNum);
        }
    }
    if(args === 'next'){
        if(pageNum >= pages){
           selPage(pages);
        }else{
            pageNum++;
            selPage(pageNum);
        }
    }
}

function selPage(num) {
    $.ajax({
        url:"selPage",
        type:"get",
        data:{"pageNum":pageNum,"pageSize":pageSize},
        success:function (data) {
            table.arr = data;
        }
    });
}

