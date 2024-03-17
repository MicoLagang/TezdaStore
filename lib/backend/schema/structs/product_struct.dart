// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStruct extends FFFirebaseStruct {
  ProductStruct({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    RatingStruct? rating,
    String? imageUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _price = price,
        _description = description,
        _category = category,
        _rating = rating,
        _imageUrl = imageUrl,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "rating" field.
  RatingStruct? _rating;
  RatingStruct get rating => _rating ?? RatingStruct();
  set rating(RatingStruct? val) => _rating = val;
  void updateRating(Function(RatingStruct) updateFn) =>
      updateFn(_rating ??= RatingStruct());
  bool hasRating() => _rating != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;
  bool hasImageUrl() => _imageUrl != null;

  static ProductStruct fromMap(Map<String, dynamic> data) => ProductStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        price: castToType<double>(data['price']),
        description: data['description'] as String?,
        category: data['category'] as String?,
        rating: RatingStruct.maybeFromMap(data['rating']),
        imageUrl: data['image_url'] as String?,
      );

  static ProductStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'price': _price,
        'description': _description,
        'category': _category,
        'rating': _rating?.toMap(),
        'image_url': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.DataStruct,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        rating: deserializeStructParam(
          data['rating'],
          ParamType.DataStruct,
          false,
          structBuilder: RatingStruct.fromSerializableMap,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductStruct &&
        id == other.id &&
        title == other.title &&
        price == other.price &&
        description == other.description &&
        category == other.category &&
        rating == other.rating &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, title, price, description, category, rating, imageUrl]);
}

ProductStruct createProductStruct({
  int? id,
  String? title,
  double? price,
  String? description,
  String? category,
  RatingStruct? rating,
  String? imageUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStruct(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      rating: rating ?? (clearUnsetFields ? RatingStruct() : null),
      imageUrl: imageUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStruct? updateProductStruct(
  ProductStruct? product, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    product
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStructData(
  Map<String, dynamic> firestoreData,
  ProductStruct? product,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (product == null) {
    return;
  }
  if (product.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && product.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productData = getProductFirestoreData(product, forFieldValue);
  final nestedData = productData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = product.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductFirestoreData(
  ProductStruct? product, [
  bool forFieldValue = false,
]) {
  if (product == null) {
    return {};
  }
  final firestoreData = mapToFirestore(product.toMap());

  // Handle nested data for "rating" field.
  addRatingStructData(
    firestoreData,
    product.hasRating() ? product.rating : null,
    'rating',
    forFieldValue,
  );

  // Add any Firestore field values
  product.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListFirestoreData(
  List<ProductStruct>? products,
) =>
    products?.map((e) => getProductFirestoreData(e, true)).toList() ?? [];
