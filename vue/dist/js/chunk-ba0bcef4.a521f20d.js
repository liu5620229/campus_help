(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-ba0bcef4"],{"00b4":function(t,e,n){"use strict";n.r(e);var l=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"content"},[n("div",{staticClass:"center"},[n("el-input",{staticClass:"input-with-select",attrs:{placeholder:"请输入内容"},nativeOn:{keydown:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.clickSearch(e)}},model:{value:t.input,callback:function(e){t.input=e},expression:"input"}},[n("el-select",{attrs:{slot:"prepend",placeholder:"请选择",value:"1"},slot:"prepend",model:{value:t.select,callback:function(e){t.select=e},expression:"select"}},[n("el-option",{attrs:{label:"学号",value:"1"}}),n("el-option",{attrs:{label:"姓名",value:"2"}})],1),n("el-button",{attrs:{slot:"append",icon:"el-icon-search"},on:{click:t.clickSearch},slot:"append"})],1)],1),n("div",{staticClass:"bottom"},[n("el-table",{staticStyle:{width:"100%"},attrs:{data:t.users,resizable:!1}},[n("el-table-column",{attrs:{prop:"studentId",label:"学号","min-width":"140"}}),n("el-table-column",{attrs:{prop:"username",label:"姓名","min-width":"140"}}),n("el-table-column",{attrs:{prop:"phone",label:"手机号","min-width":"110"}}),n("el-table-column",{attrs:{label:"性别","min-width":"60"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v(" "+t._s(0==e.row.sex?"男":"女")+" ")]}}])}),n("el-table-column",{attrs:{prop:"school.name",label:"学校","min-width":"200"}}),n("el-table-column",{attrs:{prop:"dept.name",label:"所在系","min-width":"140"}}),n("el-table-column",{attrs:{prop:"aclass.name",label:"班级","min-width":"220"}}),n("el-table-column",{attrs:{prop:"balance",label:"余额","min-width":"100"}}),n("el-table-column",{attrs:{label:"禁用用户","min-width":"90"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("el-switch",{attrs:{value:1==e.row.state,"active-color":"#13ce66","inactive-color":"#ff4949"},on:{change:function(n){return t.edit(e.row)}}})]}}])}),n("el-table-column",{attrs:{label:"操作",width:"100"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("el-popconfirm",{attrs:{"confirm-button-text":"好的","cancel-button-text":"不用了",icon:"el-icon-info","icon-color":"red",title:"确定删除该学生吗？"},on:{confirm:function(n){return t.del(e.row.id)}}},[n("el-button",{attrs:{slot:"reference",type:"text",size:"small"},slot:"reference"},[n("i",{staticClass:"el-icon-delete",staticStyle:{color:"red"}})])],1)]}}])})],1)],1)])},s=[],a={name:"Student",methods:{clickSearch:function(){var t=this,e={};this.input?(e=1==this.select?{studentId:this.input}:{username:this.input},this.$get("/user",e).then((function(e){t.users=e.data.user,t.input=""}))):this.newList()},del:function(t){var e=this;this.$del("/user",{id:t}).then((function(t){e.$notifyMsg("成功",t.data.msg,"success"),e.newList()}))},edit:function(t){var e=this;0==t.state?t.state=1:t.state=0,this.$put("/user",{id:t.id,state:t.state}).then((function(t){e.$notifyMsg("成功",t.data.msg,"success"),e.newList()})).catch((function(t){e.$notifyMsg("失败",res.data.msg,"error")}))},newList:function(){var t=this;this.$get("/user").then((function(e){t.users=e.data.user}))}},data:function(){return{users:[],input:"",select:"1"}},created:function(){this.newList()}},i=a,c=(n("c715"),n("2877")),o=Object(c["a"])(i,l,s,!1,null,"35cca588",null);e["default"]=o.exports},"0898":function(t,e,n){},c715:function(t,e,n){"use strict";n("0898")}}]);
//# sourceMappingURL=chunk-ba0bcef4.a521f20d.js.map