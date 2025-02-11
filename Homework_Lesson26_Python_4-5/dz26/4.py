class BankAccount:
    def __init__(self, initial_balance=0):
        self._balance = initial_balance  # Приватный атрибут _balance

    def deposit(self, amount):
        if amount > 0:
            self._balance += amount
            print(f"Депозит: {amount} успешно добавлен.")
        else:
            print("Сумма депозита должна быть больше 0.")

    def withdraw(self, amount):
        if amount > 0 and amount <= self._balance:
            self._balance -= amount
            print(f"Вывод: {amount} успешно снят.")
        else:
            print("Недостаточно средств или некорректная сумма для снятия.")

    def get_balance(self):
        return self._balance


# Создание счета с начальным балансом
initial_balance = float(input("Введите начальный баланс: "))
account = BankAccount(initial_balance)

# Главное меню
while True:
    print("\nМеню:")
    print("1. Сделать депозит")
    print("2. Снять деньги")
    print("3. Проверить баланс")
    print("4. Выход")

    choice = input("Выберите действие (1-4): ")

    if choice == '1':
        amount = float(input("Введите сумму для депозита: "))
        account.deposit(amount)
    elif choice == '2':
        amount = float(input("Введите сумму для снятия: "))
        account.withdraw(amount)
    elif choice == '3':
        print(f"Текущий баланс: {account.get_balance()}")
    elif choice == '4':
        print("До свидания!")
        break
    else:
        print("Некорректный ввод. Попробуйте снова.")
