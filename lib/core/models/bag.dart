class Bag {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;

  final String category;
  final String subCategory;
  final String brand;

  Bag({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.subCategory,
    required this.brand,
  });

  factory Bag.fromJson(Map<String, dynamic> json) {
    return Bag(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'].toDouble(),
      category: json['category'],
      subCategory: json['subCategory'],
      brand: json['brand'],
    );
  }
}
