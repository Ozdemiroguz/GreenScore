class ProductRecycle {
  String id;
  String company_id;
  String name;
  String description;
  String image;
  double refund;
  String category;
  double nature_point;
  int decomposition_year;
  int recycling_rate;

  ProductRecycle({
    required this.id,
    required this.company_id,
    required this.name,
    required this.description,
    required this.image,
    required this.refund,
    required this.category,
    required this.nature_point,
    required this.decomposition_year,
    required this.recycling_rate,
  });

  factory ProductRecycle.fromJson(Map<String, dynamic> json) {
    return ProductRecycle(
      id: json['id'],
      company_id: json['company_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      refund: json['refund'],
      category: json['category'],
      nature_point: json['nature_point'].toDouble(),
      decomposition_year: json['decomposition_year'],
      recycling_rate: json['recycling_rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': company_id,
      'name': name,
      'description': description,
      'image': image,
      'refund': refund,
      'category': category,
      'nature_point': nature_point.toDouble(),
      'decomposition_year': decomposition_year,
      'recycling_rate': recycling_rate,
    };
  }
}
