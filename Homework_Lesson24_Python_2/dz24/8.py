# Определяем функцию, которая принимает список чисел и минимальное значение
def remove_numbers_less_than(input_list, threshold):
    # Используем генератор списка, чтобы оставить только числа, которые больше или равны threshold
    result = [num for num in input_list if num >= threshold]
    
    # Возвращаем новый список
    return result

# Запрашиваем ввод списка чисел у пользователя
input_str = input("Введите список чисел (через пробел): ")
input_list = list(map(int, input_str.split()))  # Преобразуем строку в список целых чисел

# Запрашиваем минимальное значение для фильтрации
threshold = int(input("Введите минимальное значение для фильтрации: "))

# Вызываем функцию для удаления чисел, меньших заданного значения
output_list = remove_numbers_less_than(input_list, threshold)

# Выводим результат
print("Результат:", output_list)
