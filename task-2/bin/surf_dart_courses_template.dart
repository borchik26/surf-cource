class Computer {
  final String type;
  final String brand;
  final String model;
  String memory_type;
  int access_memory;
  int? year_of_release;

  Computer(this.type, this.brand, this.model, this.memory_type,
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

class Smartphone {
  final String brand;
  final String model;
  String? memory;
  int? accessMemory;
  int? yearOfRelease;
  final int priceOld;
  int? priceNew;
  final int discount;

  Smartphone.fromDetails({
    required this.brand,
    required this.model,
    required this.accessMemory,
    required this.yearOfRelease,
    required this.priceOld,
    this.priceNew,
    required this.discount,
  }) {
    parseYearFromModel();
    parseMemory();
    parseAccessMemory();
    calculateNewPrice();
  }

  void parseYearFromModel() {
    final RegExp regExp = RegExp(r'\((\d{4})\)');
    final match = regExp.firstMatch(model);
    if (match != null) {
      yearOfRelease = int.tryParse(match.group(1)!);
    }
  }

  void parseMemory() {
    final RegExp regExp = RegExp(r' (\d+)/');
    final match = regExp.firstMatch(model);
    if (match != null) {
      memory = '${match.group(1)!} ГБ';
    }
  }

  void parseAccessMemory() {
    final RegExp regExp = RegExp(r'/(\d+) ГБ');
    final match = regExp.firstMatch(model);
    if (match != null) {
      accessMemory = int.tryParse(match.group(1)!);
    }
  }

  void calculateNewPrice() {
    priceNew = priceOld - (priceOld * discount ~/ 100);
  }

  @override
  String toString() {
    return 'Бренд: $brand, Модель: $model, Память: $memory, Оперативная память: $accessMemory ГБ, Год выпуска: $yearOfRelease, Старая цена: $priceOld, Новая цена после $discount% скидки: $priceNew';
  }
}

class Engine {
  final String type;
  final String model;
  int power;
  final double volume;
  final int numberOfCylinders;
  final String fuelSystem;
  final String manufacturer;

  Engine({
    required this.type,
    required this.model,
    required this.power,
    required this.volume,
    required this.numberOfCylinders,
    required this.fuelSystem,
    this.manufacturer = 'ВАЗ',
  });

  @override
  String toString() {
    return 'Тип двигателя: $type, Модель: $model, Мощность двигателя в лошадиных силах: $power, Объем двигателя: $volume, Количество цилиндров: $numberOfCylinders, Система питания двигателя: $fuelSystem, Название производителя двигателя: $manufacturer';
  }
}

class Flower {
  final String name;
  int height;
  final String soilType;
  final String bloomingPeriod;
  final String wateringNeeds;
  final String lightRequirements;
  final bool pestResistance;
  int? lifeSpan;
  final String originCountry;
  final CareInstructions careInstructions;

  Flower({
    required this.name,
    required this.height,
    required this.soilType,
    required this.bloomingPeriod,
    required this.wateringNeeds,
    required this.lightRequirements,
    required this.pestResistance,
    required this.lifeSpan,
    required this.originCountry,
    required this.careInstructions,
  });

  @override
  String toString() {
    return 'Flower{\n'
        '  Название цветка: $name,\n'
        '  Высота растения: ${height}см,\n'
        '  Тип почвы: $soilType,\n'
        '  Период цветения: $bloomingPeriod,\n'
        '  Потребности в поливе: $wateringNeeds,\n'
        '  Требования к свету: $lightRequirements,\n'
        '  Устойчивость к вредителям: ${pestResistance ? "Устойчив" : "Не устойчив"},\n'
        '  Срок жизни: ${lifeSpan} лет,\n'
        '  Страна происхождения: $originCountry,\n'
        '  Как ухаживать за цветком: ${careInstructions.toString()}\n'
        '}';
  }
}

class CareInstructions {
  final String wateringSchedule;
  final String fertilizerType;

  CareInstructions({
    required this.wateringSchedule,
    required this.fertilizerType,
  });

  @override
  String toString() {
    return 'CareInstructions{ Полив: $wateringSchedule, Удобрения: $fertilizerType }';
  }
}

void main() {
  Smartphone samsung = Smartphone.fromDetails(
    brand: 'Samsung',
    model: 'Galaxy A24 4/128 ГБ, Dual nano SIM, зеленый (2024)',
    accessMemory: null,
    yearOfRelease: null,
    priceOld: 20000,
    discount: 10,
  );
  Smartphone iphone = Smartphone.fromDetails(
    brand: 'Apple',
    model: 'iPhone 15 Pro 3/128 ГБ, Dual: nano SIM + eSIM, титан (2023)',
    accessMemory: null,
    yearOfRelease: null,
    priceOld: 80000,
    discount: 7,
  );

  Computer macbook = Computer(
      'Ноутбук', 'Apple', 'MacBook Pro 15 (2015) A1398', 'DDR3', 16, null);
  Computer pc =
      Computer('PC', 'ASUS ', 'ROG Strix G10DK (2018)', 'DDR4', 32, null);

  Engine vaz_2103 = Engine(
      type: 'Бензиновый',
      model: 'ВАЗ 2103',
      power: 110,
      volume: 1.5,
      numberOfCylinders: 4,
      fuelSystem: 'Карбюраторная');

  Engine vaz_2110 = Engine(
      type: 'Дизельный',
      model: 'ВАЗ 2110',
      power: 120,
      volume: 1.6,
      numberOfCylinders: 6,
      fuelSystem: 'Инжекторная');

  CareInstructions careInstructions = CareInstructions(
    wateringSchedule: "Еженедельно",
    fertilizerType: "Органический каждый месяц весной и летом",
  );

  Flower rose = Flower(
    name: "Роза",
    height: 30,
    soilType: "Суглинистая",
    bloomingPeriod: "Июнь-Сентябрь",
    wateringNeeds: "Умеренный",
    lightRequirements: "Полный солнечный свет",
    pestResistance: true,
    lifeSpan: 5,
    originCountry: "Китай",
    careInstructions: careInstructions,
  );

  CareInstructions orchidCareInstructions = CareInstructions(
    wateringSchedule: "Каждые 7-10 дней",
    fertilizerType:
        "Специализированный для орхидей каждые две недели в период активного роста",
  );

  Flower orchid = Flower(
    name: "Орхидея",
    height: 25,
    soilType: "Кора сфагнума",
    bloomingPeriod: "Зима-Весна",
    wateringNeeds: "Низкий",
    lightRequirements: "Яркий, рассеянный свет",
    pestResistance: false,
    lifeSpan: 30,
    originCountry: "Юго-Восточная Азия",
    careInstructions: orchidCareInstructions,
  );

  print('-- КОМПЬЮТЕРЫ ----------------------------------------');
  print('---------- MacBook ----------');
  print('$macbook\n');
  print('---------- PC ----------');
  print('$pc\n');

  print('-- СМАРТФОНЫ ----------------------------------------');
  print('---------- Samsung ----------');
  print('$samsung\n');
  print('---------- iPhone ----------');
  print('$iphone\n');

  print('-- ДВИГАТЕЛИ ----------------------------------------');
  print('---------- ВАЗ 2103 ----------');
  print('$vaz_2103\n');
  print('---------- ВАЗ 2110 ----------');
  print('$vaz_2110\n');

  print('-- ЦВЕТЫ ----------------------------------------');
  print('---------- Роза ----------');
  print('$rose\n');
  print('---------- Орхидея ----------');
  print('$orchid\n');
}
