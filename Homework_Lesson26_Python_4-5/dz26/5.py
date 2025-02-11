import math

# Базовый класс для всех фигур
class Shape:
    def area(self):
        raise NotImplementedError("Метод 'area()' должен быть реализован в подклассе.")

# Класс Circle (круг), наследует от Shape
class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return math.pi * (self.radius ** 2)

# Класс Rectangle (прямоугольник), наследует от Shape
class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

# Функция для ввода данных и выбора фигуры
def get_shape():
    print("Выберите фигуру для вычисления площади:")
    print("1. Круг")
    print("2. Прямоугольник")
    choice = input("Введите номер фигуры (1 или 2): ")

    if choice == '1':
        radius = float(input("Введите радиус круга: "))
        return Circle(radius)
    elif choice == '2':
        width = float(input("Введите ширину прямоугольника: "))
        height = float(input("Введите высоту прямоугольника: "))
        return Rectangle(width, height)
    else:
        print("Некорректный выбор. Попробуйте снова.")
        return get_shape()

# Пример использования

shape = get_shape()  # Получаем фигуру от пользователя
print(f"Площадь выбранной фигуры: {shape.area()}")  # Выводим площадь
