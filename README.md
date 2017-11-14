# 2017.11.14 7일차

## Sign up & Login

### Post 방식

in new.erb

```ruby
<form action="/user/create" method="post">
    <p>E-mail : <input type="text" name="email"></p>
    <p>Password : <input type="password" name="password"></p>
    <input type="hidden" name="authenticity_token" 
	 value="<%= form_authenticity_token() %>"> #method="POST"방식인 경우 반드시 필요.
```

## Login

1. DB에 유저가 없을 때 (params[:email]를 DB 검색 시 없을 떄) => "회원아님."=>"입력한 회원아이디가 존재하지 않습니다."
2. DB에 유저가 있는데, 패스워드가 다를 때 => "패스워드가 틀렸어"
3. DB에 유저가 있고, 패스워드가 맞을 때 => "로그인"

### 변수(@message)와 flash의 차이.

- 변수는  해당하는 login_process라는 페이지에서만 사용가능.
- 여러 경우에 따라 다른 페이지로 이동.(비밀번호가 틀린 경우 -> login페이지. 없는 회원인 경우 -> sign up 페이지) => 변수에 담고 사용하게되면 다른 페이지 이동 때 이용 할 수 없음.
- flash : 바로 다음 action까지 정보를 넘겨주는 기능.

# Bootstrap

in application.html

```html
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
```

- 전역에 걸쳐 설정(bootstrap)
- Grid
  - 12기준.....

## Login Issue

1. 비밀번호가 잘 못되었을 경우
   - flash[:alert] = "비밀번호 잘못 됐어!!"
2. 아이디가 없을 경우
   - flash[:alert] = "존재하지 않는 계정입니다."
3. 로그인 성공
   - flash[:notice] = "로그인 성공하였습니다."