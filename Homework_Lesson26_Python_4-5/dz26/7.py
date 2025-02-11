class Employee:
    # Классовый атрибут, общий для всех сотрудников
    company_name = "TechCorp"

    def __init__(self, name, position, age):
        self.name = name  # Индивидуальный атрибут
        self.position = position  # Индивидуальный атрибут
        self.age = age  # Индивидуальный атрибут

    def display_info(self):
        # Метод для отображения информации о сотруднике
        print(f"\nСотрудник: {self.name}")
        print(f"Должность: {self.position}")
        print(f"Возраст: {self.age}")
        print(f"Компания: {Employee.company_name}")  # Доступ к классовому атрибуту

    @classmethod
    def change_company(cls, new_name):
        # Метод класса для изменения company_name
        cls.company_name = new_name
        print(f"\nКомпания изменена на: {cls.company_name}")

    @staticmethod
    def is_adult(age):
        # Статический метод для проверки возраста
        return age > 18


# Функция для ввода данных сотрудника
def get_employee_info():
    name = input("Введите имя сотрудника: ")
    position = input("Введите должность сотрудника: ")
    age = int(input("Введите возраст сотрудника: "))
    return Employee(name, position, age)


# Пример использования

# Создаем сотрудников, вводя их данные через пользовательский ввод
employee1 = get_employee_info()
employee2 = get_employee_info()

# Выводим информацию о сотрудниках
employee1.display_info()
employee2.display_info()

# Проверяем, взрослые ли сотрудники
print(f"\nСотрудник {employee1.name} совершеннолетний: {Employee.is_adult(employee1.age)}")
print(f"Сотрудник {employee2.name} совершеннолетний: {Employee.is_adult(employee2.age)}")

# Меняем компанию с помощью метода класса
new_company_name = input("\nВведите новое название компании для всех сотрудников: ")
Employee.change_company(new_company_name)

# Выводим информацию о сотрудниках после изменения компании
print("\nПосле изменения компании:")
employee1.display_info()
employee2.display_info()
