class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.isFeatured,
      this.productsCount});

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /// Convert model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic>? document) {
    if (document == null || document.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: document['Id']?.toString() ?? '',
      name: document['Name']?.toString() ?? '',
      image: document['Image']?.toString() ?? '',
      isFeatured: document['IsFeatured'] ?? false,
      productsCount: document['ProductCount'] ?? 0,
    );
  }
}
