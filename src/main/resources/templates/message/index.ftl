<#ftl output_format="HTML">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Default controller</title>
</head>
<body>
<div>
    <div>
        <form action="/login" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Выход</button>
        </form>
    </div>

    <div>
        <form action="/message" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="text" name="text" required placeholder="Введите текст">
            <input type="text" name="tag" placeholder="Тэг">
            <button type="submit">Добавить</button>
        </form>
    </div>

    <div>
        <form action="/message" method="get">
            <input type="text"
                   name="tag"
                   placeholder="Введите тэг"
                   value="${tag}">

            <button type="submit">Фильтровать</button>
        </form>
    </div>

    <#list messages as message>
        <p>
            <b>${ message.id }</b>
            <span>${ message.text }</span>
            <span style="color: red;">${ message.createdAt }</span>
            <strong>${ message.author.login }</strong>
        </p>
    </#list>
</div>
</body>
</html>
