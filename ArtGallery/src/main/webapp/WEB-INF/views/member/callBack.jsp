<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

   <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
   <script>
      var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "BucDDpnDi4_0v8SAMYoe",
            callbackUrl: "http://localhost:8080/member/memberMain",
            isPopup: false,
            callbackHandle: true
         }
      );
      naverLogin.init();

      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {

            if (status) {
               /* console.log(naverLogin.user); */
               var age = naverLogin.user.getAge();
               var birthday = naverLogin.user.getBirthday();
               var email = naverLogin.user.getEmail();
               var gender = naverLogin.user.getGender();
               var id = naverLogin.user.getId();
               var name = naverLogin.user.getName();
               var nickName = naverLogin.user.getNickName();
               /* console.log(age);
               console.log(birthday);
               console.log(email);
               console.log(gender);
               console.log(id);
               console.log(name);
               console.log(nickName); */
               
               $.ajax({
                   type: 'post',
                   url: 'naverSave',
                   data: {'n_age':age, 'n_birthday':birthday, 'n_email':email, 'n_gender':gender, 'n_id':id, 'n_name':name, 'n_nickName':nickName},
                   dataType: 'text',
                   success: function(result) {
                	   if(result=='ok') {
	                	   console.log('성공')
	                	   location.replace("http://localhost:8080/member/Main")                		   
                	   } else if(result=='no'){
	                	   console.log('실패')
	                	   location.replace("http://localhost:8080/member/login")                		   
                	   }
                   },
                   error: function(result) {
                	   console.log('오류 발생')
                   }
               })
               
               //window.location.replace("http://127.0.0.1/test2.html");
            } else {
               console.log("callback 처리에 실패하였습니다.");
            }
         });
      });
   </script>
</body>
</html>