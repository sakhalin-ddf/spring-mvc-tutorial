<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Security Page</title>
</head>
<body>
<h1>Registration</h1>
<p>
    <a href="/login">Already has a account?</a>
</p>

<form action="/registration" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <div>
        <label for="auth-login-input">Логин</label>
        <input id="auth-login-input" type="text" name="login" required>
    </div>
    <div>
        <label for="auth-password-input">Пароль</label>
        <input id="auth-password-input" type="password" name="password" required>
    </div>
    <div>
        <button type="submit">Авторизация</button>
    </div>
</form>
</body>
</html>