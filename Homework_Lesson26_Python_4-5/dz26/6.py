class Employee:
    # Классовый атрибут, общий для всех сотрудников
    company_name = "TechCorp"

    def __init__(self, name, position):
        self.name = name  # Индивидуальный атрибут
        self.position = position  # Индивидуальный атрибут

    def display_info(self):
        # Метод для отображения информации о сотруднике
        print(f"\nСотрудник: {self.name}")
        print(f"Должность: {self.position}")
        print(f"Компания: {Employee.company_name}")  # Доступ к классовому атрибуту


# Функция для ввода данных сотрудника
def get_employee_info():
    name = input("Введите имя сотрудника: ")
    position = input("Введите должность сотрудника: ")
    return Employee(name, position)


# Пример использования

# Создаем сотрудников, вводя их данные через пользовательский ввод
employee1 = get_employee_info()
employee2 = get_employee_info()

# Выводим информацию о сотрудниках
employee1.display_info()
employee2.display_info()

# Меняем классовый атрибут для всех сотрудников
new_company_name = input("\nВведите новое название компании для всех сотрудников: ")
Employee.company_name = new_company_name

# Выводим информацию о сотрудниках после изменения компании
print("\nПосле изменения компании:")
employee1.display_info()
employee2.display_info()
