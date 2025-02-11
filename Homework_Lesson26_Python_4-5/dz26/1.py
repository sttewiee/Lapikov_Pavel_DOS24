class Person:
    def __init__(self, name, age):
        # Проверка корректности данных
        if not isinstance(name, str) or not name:
            raise ValueError("Name must be a non-empty string")
        if not isinstance(age, int) or age < 0:
            raise ValueError("Age must be a positive integer")

        self.name = name
        self.age = age

    def introduce(self):
        return f"Hello, my name is {self.name} and I am {self.age} years old."

# Получаем данные от пользователя
def get_user_input():
    name = input("Enter your name: ")
    while True:
        try:
            age = int(input("Enter your age: "))
            if age < 0:
                print("Age must be a positive integer. Please try again.")
            else:
                break
        except ValueError:
            print("Invalid input for age. Please enter a valid number.")
    
    return name, age

# Пример использования
if __name__ == "__main__":
    name, age = get_user_input()

    try:
        person = Person(name, age)
        print(person.introduce())
    except ValueError as e:
        print(f"Error: {e}")
