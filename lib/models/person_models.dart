// ignore_for_file: unused_element

class PersonModel {
  final String name;
  final double mealNumber;
  final double deposit;
  final double totalCost;
  final double balance;

  PersonModel({
    required this.name,
    required this.mealNumber,
    required this.deposit,
    required this.totalCost,
    required this.balance,
  });
}

List<PersonModel> _items = [
  PersonModel(
    name: 'Rasel Hossen',
    mealNumber: 0.00,
    deposit: 0.00,
    totalCost: 0.00,
    balance: 0.00,
  ),
  PersonModel(
    name: 'Rasel',
    mealNumber: 0.00,
    deposit: 0.00,
    totalCost: 0.00,
    balance: 0.00,
  ),
];
