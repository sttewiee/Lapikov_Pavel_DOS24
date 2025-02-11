# Создание и запись в файл
with open("test.txt", "w") as file:
    file.write("Это тестовый файл для домашнего задания по программированию")

# Открытие файла в режиме чтения и вывод содержимого
with open("test.txt", "r") as file:
    print(file.read())
