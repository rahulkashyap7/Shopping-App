class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Create Empty func for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  ///Json Format
  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  /// Map json orientated document snapshot from firebase to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic>? document) {
    if (document == null || document.isEmpty)
      return ProductVariationModel.empty();
    return ProductVariationModel(
      id: document['Id']?.toString() ?? '',
      price: double.parse((document['Price'] ?? 0.0).toString()),
      sku: document['SKU']?.toString() ?? '',
      stock: document['Stock'] is int
          ? document['Stock']
          : int.tryParse(document['Stock']?.toString() ?? '0') ?? 0,
      salePrice: double.parse((document['SalePrice'] ?? 0.0).toString()),
      image: document['Image']?.toString() ?? '',
      attributeValues: document['AttributeValues'] != null
          ? Map<String, String>.from(document['AttributeValues'])
          : {},
    );
  }
}
