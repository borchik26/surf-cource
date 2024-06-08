class Article {
  final int id;
  final String category;
  final String name;
  final int price;
  final int quantity;

  Article(this.id, this.category, this.name, this.price, this.quantity);

  @override
  String toString() {
    return '$category\t$price рублей\t$quantity шт';
  }
}

abstract class Filter<T> {
  bool apply(T item);
}

class CategoryFilter implements Filter<Article> {
  final String category;

  CategoryFilter(this.category);

  @override
  bool apply(Article article) {
    return article.category == category;
  }
}

class PriceFilter implements Filter<Article> {
  final int maxPrice;

  PriceFilter(this.maxPrice);

  @override
  bool apply(Article article) {
    return article.price <= maxPrice;
  }
}

class QuantityFilter implements Filter<Article> {
  final int maxQuantity;

  QuantityFilter(this.maxQuantity);

  @override
  bool apply(Article article) {
    return article.quantity < maxQuantity;
  }
}

List<T> applyFilter<T>(List<T> items, Filter<T> filter) {
  return items.where((item) => filter.apply(item)).toList();
}

List<Article> parseArticles(String articlesStr) {
  return articlesStr.trim().split('\n').map((line) {
    var parts = line.split(',');
    return Article(
      int.parse(parts[0]),
      parts[1],
      parts[2],
      int.parse(parts[3]),
      int.parse(parts[4]),
    );
  }).toList();
}

void main() {
  final articlesStr = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  var articles = parseArticles(articlesStr);

  var categoryFilter = CategoryFilter('хлеб');
  var filteredByCategory = applyFilter(articles, categoryFilter);
  print('Фильтр по категории "хлеб":');
  filteredByCategory.forEach((article) => print(article));

  var priceFilter = PriceFilter(200);
  var filteredByPrice = applyFilter(articles, priceFilter);
  print('\nФильтр по цене не больше 200 рублей:');
  filteredByPrice.forEach((article) => print(article));

  var quantityFilter = QuantityFilter(20);
  var filteredByQuantity = applyFilter(articles, quantityFilter);
  print('\nФильтр по количеству остатков на складе меньше 20 шт:');
  filteredByQuantity.forEach((article) => print(article));

  var articlesWithPrice500 =
      articles.where((article) => article.price == 500).toList();
  print('\nФильтр по цене равной 500 рублей:');
  articlesWithPrice500.forEach((article) => print(article));
}
