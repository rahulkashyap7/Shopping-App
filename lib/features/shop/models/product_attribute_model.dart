class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  /// Json format
  toJson() {
    return {
      'Name': name,
      'Value': values,
    };
  }

  /// MapjSOn oriented document snapshot from firebase to model
  factory ProductAttributeModel.fromJson(Map<String, dynamic>? document) {
    if (document == null || document.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: document['Name']?.toString() ?? '',
      values:
          document['Value'] != null ? List<String>.from(document['Value']) : [],
    );
  }
}
