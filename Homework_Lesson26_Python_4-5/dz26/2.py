class Car:
    def __init__(self, brand, model, year):
        # Проверка корректности данных
        if not isinstance(brand, str) or not brand:
            raise ValueError("Brand must be a non-empty string")
        if not isinstance(model, str) or not model:
            raise ValueError("Model must be a non-empty string")
        if not isinstance(year, int) or year < 1886:  # Первый автомобиль был изобретен в 1886 году
            raise ValueError("Year must be a positive integer and not earlier than 1886")
        
        self.brand = brand
        self.model = model
        self.year = year

    def get_info(self):
        return f"{self.year} {self.brand} {self.model}"

# Получаем данные от пользователя
def get_car_input():
    brand = input("Enter the car brand: ")
    model = input("Enter the car model: ")
    while True:
        try:
            year = int(input("Enter the car year: "))
            if year < 1886:
                print("Year must be greater than or equal to 1886. Please try again.")
            else:
                break
        except ValueError:
            print("Invalid input for year. Please enter a valid number.")
    
    return brand, model, year

# Пример использования
if __name__ == "__main__":
    brand, model, year = get_car_input()

    try:
        car = Car(brand, model, year)
        print(f"Car Information: {car.get_info()}")
    except ValueError as e:
        print(f"Error: {e}")
