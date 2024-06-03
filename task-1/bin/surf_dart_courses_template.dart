class computer {
  final String type;
  final String brand;
  final String model;
  final String memory_type;
  final int access_memory;
  int? year_of_release;

  computer(this.type, this.brand, this.model, this.memory_type,
      this.access_memory, this.year_of_release) {
    parseYearFromModel();
  }

  // Метод для извлечения года из модели и обновления year_of_release
  void parseYearFromModel() {
    // Регулярное выражение для поиска года в скобках
    final RegExp regExp = RegExp(r'\((\d{4})\)');

    // Поиск совпадения в строке модели
    final match = regExp.firstMatch(model);

    if (match != null && match.groupCount >= 1) {
      // Пытаемся преобразовать найденную группу в число
      final year = int.tryParse(match.group(1)!);
      // Обновляем переменную, если удалось преобразовать
      if (year != null) {
        year_of_release = year;
      }
    }
  }

  @override
  String toString() {
    return ' Тип устройства: $type, Бренд:  $brand, Модель: $model,  Тип памяти: $memory_type,  Оперативная память: $access_memory, Год выпуска: $year_of_release';
  }
}

void main() {
  computer macbook = computer(
      'laptop', 'apple', 'MacBook Pro 15 (2015) A1398', 'DDR3', 16, null);

  print(macbook);
}
