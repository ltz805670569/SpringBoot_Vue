var pages;
var pageSize;
var pageNum;

var m = new Vue({
   el:"#ceshi",
   data:{
       hello:"hello"
   }
});

var v = new Vue({
    el: "#main",
    data: {
        heihei:"",
        hello:"hello"
    }
    // methods: {
    //     selAll: function () {
    //
    //     }
    // },
    // mounted() {
    //     this.selAll();
    // }
});

$(function () {
    $.ajax({
        url: "selAll",
        type: "get",
        success: function (data) {
            pages = data.pages;
            pageSize = data.pageSize;
            pageNum = data.pageNum;
            v.heihei = data.userList;
            console.log(v.heihei);
        }
    });
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

// function selPage(num) {
//     $.ajax({
//         url:"selPage",
//         type:"get",
//         data:{"pageNum":pageNum,"pageSize":pageSize},
//         success:function (data) {
//             table.arr = data;
//         }
//     });
// }