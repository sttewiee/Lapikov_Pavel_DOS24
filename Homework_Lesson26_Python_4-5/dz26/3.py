class Animal:
    def make_sound(self):
        raise NotImplementedError("Subclasses should implement this method")

class Dog(Animal):
    def make_sound(self):
        return "Woof! Woof!"  # Характерный звук для собаки

class Cat(Animal):
    def make_sound(self):
        return "Meow! Meow!"  # Характерный звук для кошки

# Пример использования
if __name__ == "__main__":
    # Создаем объекты Dog и Cat
    dog = Dog()
    cat = Cat()

    # Вызываем метод make_sound() для каждого объекта
    print("Dog says:", dog.make_sound())
    print("Cat says:", cat.make_sound())
