import 'dart:convert';

class RawProductItem {
  final String name;
  final String categoryName;
  final String subcategoryName;
  final DateTime expirationDate;
  final int qty;

  RawProductItem({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    required this.qty,
  });

  @override
  String toString() {
    return 'RawProductItem(name: $name, categoryName: $categoryName, subcategoryName: $subcategoryName, expirationDate: $expirationDate, qty: $qty)';
  }
}

void main() {
  List<RawProductItem> products = [
    RawProductItem(
      name: 'Персик',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2025, 12, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Молоко',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Напитки',
      expirationDate: DateTime(2025, 12, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Кефир',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Напитки',
      expirationDate: DateTime(2025, 12, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Творог',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2025, 12, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Творожок',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2025, 12, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Творог',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2025, 12, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Гауда',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Сыры',
      expirationDate: DateTime(2025, 12, 22),
      qty: 3,
    ),
    RawProductItem(
      name: 'Маасдам',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Сыры',
      expirationDate: DateTime(2025, 12, 22),
      qty: 2,
    ),
    RawProductItem(
      name: 'Яблоко',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2023, 12, 4),
      qty: 4,
    ),
    RawProductItem(
      name: 'Морковь',
      categoryName: 'Растительная пища',
      subcategoryName: 'Овощи',
      expirationDate: DateTime(2025, 12, 23),
      qty: 51,
    ),
    RawProductItem(
      name: 'Черника',
      categoryName: 'Растительная пища',
      subcategoryName: 'Ягоды',
      expirationDate: DateTime(2025, 12, 25),
      qty: 0,
    ),
    RawProductItem(
      name: 'Курица',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2025, 12, 18),
      qty: 2,
    ),
    RawProductItem(
      name: 'Говядина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2025, 12, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Телятина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2025, 12, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Индюшатина',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2023, 12, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Утка',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2025, 12, 18),
      qty: 0,
    ),
    RawProductItem(
      name: 'Гречка',
      categoryName: 'Растительная пища',
      subcategoryName: 'Крупы',
      expirationDate: DateTime(2023, 12, 22),
      qty: 8,
    ),
    RawProductItem(
      name: 'Свинина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2025, 12, 23),
      qty: 5,
    ),
    RawProductItem(
      name: 'Груша',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2025, 12, 25),
      qty: 5,
    ),
  ];

  DateTime today = DateTime.now();

  List<RawProductItem> filtredProducts = products
      .where((product) =>
          product.expirationDate.isAfter(today) && product.qty != 0)
      .toList();

  final result = <String, Map<String, List<String>>>{};

  for (var product in filtredProducts) {
    result.putIfAbsent(product.categoryName, () => {});
    result[product.categoryName]!
        .putIfAbsent(product.subcategoryName, () => []);
    result[product.categoryName]![product.subcategoryName]!.add(product.name);
  }

  for (var product in products.where((product) =>
      product.categoryName == 'Растительная пища' &&
      product.subcategoryName == 'Крупы')) {
    result['Растительная пища']!
        .putIfAbsent('Крупы', () => [])
        .add(product.name);
  }

  print(JsonEncoder.withIndent('  ').convert(result));
}
