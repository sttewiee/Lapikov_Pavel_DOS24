from jinja2 import Template

# Шаблон HTML
html_template = """
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список пользователей</title>
</head>
<body>
    <h1>Список пользователей</h1>
    <ul>
        {% for user in users %}
            <li>
                <strong>Имя:</strong> {{ user.name }} <br>
                <strong>Email:</strong> {{ user.email }}
            </li>
        {% endfor %}
    </ul>
</body>
</html>
"""

# Список пользователей
users = [
    {"name": "Иван Иванов", "email": "ivan@example.com"},
    {"name": "Мария Петрова", "email": "maria@example.com"},
    {"name": "Сергей Смирнов", "email": "sergey@example.com"}
]

# Создаем объект шаблона и рендерим его с данными
template = Template(html_template)
rendered_html = template.render(users=users)

# Выводим результат
print(rendered_html)
