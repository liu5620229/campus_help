(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-6001c293"],{"1d5d":function(t,s,e){"use strict";var n=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("van-form",{on:{submit:t.onSubmit}},[e("van-field",{attrs:{name:"学号","left-icon":"friends-o",placeholder:"请输入学号",rules:[{required:!0,message:"请填写用户名"}]},model:{value:t.studentId,callback:function(s){t.studentId=s},expression:"studentId"}}),e("van-field",{attrs:{type:"password",name:"密码","left-icon":"closed-eye",placeholder:"请输入密码",rules:[{required:!0,message:"请填写密码"}]},model:{value:t.password,callback:function(s){t.password=s},expression:"password"}}),e("van-field",{attrs:{readonly:"",clickable:"",name:"picker",value:t.value,"left-icon":"newspaper-o",placeholder:"点击选择学校"},on:{click:function(s){t.showPicker=!0}}}),e("van-popup",{attrs:{position:"bottom"},model:{value:t.showPicker,callback:function(s){t.showPicker=s},expression:"showPicker"}},[e("van-picker",{attrs:{"show-toolbar":"",columns:t.school,"value-key":"name"},on:{confirm:t.onConfirm,cancel:function(s){t.showPicker=!1}}})],1),t._t("prompt"),e("div",{staticStyle:{margin:"16px 0"}},[e("van-button",{attrs:{round:"",block:"","native-type":"submit"}},[t._v(" "+t._s(t.btn)+" ")])],1),e("van-checkbox",{staticStyle:{"font-size":"10px"},model:{value:t.checked,callback:function(s){t.checked=s},expression:"checked"}},[t._v("已同意"),e("a",{staticStyle:{color:"red"},attrs:{href:"#"}},[t._v("《平台登陆协议》")]),t._v("及"),e("a",{staticStyle:{color:"red"},attrs:{href:"#"}},[t._v("《隐私政策》")])])],2)},o=[],a=(e("b0c0"),{name:"LoginInput",props:["btn"],data:function(){return{studentId:"",password:"",value:"",schoolId:"",school:[],showPicker:!1,checked:!0}},methods:{onConfirm:function(t){this.value=t.name,this.schoolId=t.id,this.showPicker=!1},onSubmit:function(){var t=this;""!=this.value&&this.checked?"登录"===this.btn?this.$get("/user/login",{studentId:this.studentId,password:this.$md5(this.password),schoolId:this.schoolId}).then((function(s){if(s.data.status)if(0==s.data.user.state){var e=s.data.user.username?s.data.user.username:s.data.user.studentId;sessionStorage.setItem("user",JSON.stringify(s.data.user)),t.$msg(e+"，登录成功","success"),t.$router.push("/m/home")}else t.$msg("该用户已被冻结，请联系管理员","error");else t.$msg(s.data.msg,"error")})):this.$post("/user",{studentId:this.studentId,password:this.$md5(this.password),schoolId:this.schoolId}).then((function(s){s.data.status?(t.$msg(s.data.msg,"success"),t.$router.push("/m/login")):t.$msg(s.data.msg,"error")})):""==this.value?this.$msg("请选择学校","error"):this.$msg("请勾选用户协议","error")}},created:function(){var t=this;this.$get("/school").then((function(s){t.school=s.data.school}))}}),i=a,r=(e("d9a2"),e("2877")),c=Object(r["a"])(i,n,o,!1,null,"2ff9136e",null);s["a"]=c.exports},"891d":function(t,s,e){"use strict";e.r(s);var n=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{staticClass:"login"},[e("div",{staticClass:"login_top"},[e("div",{staticClass:"login_ba"}),t._m(0),e("div",{staticClass:"login_window"},[e("login-input",{attrs:{btn:"登录"},scopedSlots:t._u([{key:"prompt",fn:function(){return[e("p",[e("span",{on:{click:function(s){return t.$router.push({name:"mRegistered"})}}},[t._v("去注册")]),e("span",{staticStyle:{float:"right"}},[t._v("忘记密码")])])]},proxy:!0}])})],1)])])},o=[function(){var t=this,s=t.$createElement,n=t._self._c||s;return n("div",{staticClass:"login_nav"},[n("img",{staticClass:"pic",attrs:{src:e("c2fb")}})])}],a=e("1d5d"),i={name:"Login",components:{LoginInput:a["a"]},data:function(){return{}},methods:{}},r=i,c=(e("d443"),e("2877")),u=Object(c["a"])(r,n,o,!1,null,"c5bf3544",null);s["default"]=u.exports},b0c0:function(t,s,e){var n=e("83ab"),o=e("9bf2").f,a=Function.prototype,i=a.toString,r=/^\s*function ([^ (]*)/,c="name";n&&!(c in a)&&o(a,c,{configurable:!0,get:function(){try{return i.call(this).match(r)[1]}catch(t){return""}}})},c2fb:function(t,s,e){t.exports=e.p+"img/logo_transparent.64b63582.png"},d443:function(t,s,e){"use strict";e("e5a7")},d9a2:function(t,s,e){"use strict";e("e329")},e329:function(t,s,e){},e5a7:function(t,s,e){}}]);
//# sourceMappingURL=chunk-6001c293.c8ac167b.js.map