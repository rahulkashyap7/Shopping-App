
class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  /// Json format
  toJson() {
    return {'Name', name, 'Value', values};
  }

  /// MapjSOn oriented document snapshot from firebase to model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document){
    final data = document;

    if (data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Value']),
    );
  }
}