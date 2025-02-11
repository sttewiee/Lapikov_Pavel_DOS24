import os

# Создание пустой директории
os.makedirs("mydir", exist_ok=True)

# Переход в директорию
os.chdir("mydir")

# Создание трех пустых файлов
open("file1.txt", "w").close()
open("file2.txt", "w").close()
open("file3.txt", "w").close()

# Вывод списка файлов в директории
print(os.listdir())
