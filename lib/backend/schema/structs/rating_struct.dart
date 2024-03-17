// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingStruct extends FFFirebaseStruct {
  RatingStruct({
    double? rate,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rate = rate,
        _count = count,
        super(firestoreUtilData);

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  set rate(double? val) => _rate = val;
  void incrementRate(double amount) => _rate = rate + amount;
  bool hasRate() => _rate != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;
  void incrementCount(int amount) => _count = count + amount;
  bool hasCount() => _count != null;

  static RatingStruct fromMap(Map<String, dynamic> data) => RatingStruct(
        rate: castToType<double>(data['rate']),
        count: castToType<int>(data['count']),
      );

  static RatingStruct? maybeFromMap(dynamic data) =>
      data is Map ? RatingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'rate': _rate,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rate': serializeParam(
          _rate,
          ParamType.double,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static RatingStruct fromSerializableMap(Map<String, dynamic> data) =>
      RatingStruct(
        rate: deserializeParam(
          data['rate'],
          ParamType.double,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RatingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RatingStruct && rate == other.rate && count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([rate, count]);
}

RatingStruct createRatingStruct({
  double? rate,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RatingStruct(
      rate: rate,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RatingStruct? updateRatingStruct(
  RatingStruct? rating, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rating
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRatingStructData(
  Map<String, dynamic> firestoreData,
  RatingStruct? rating,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rating == null) {
    return;
  }
  if (rating.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rating.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ratingData = getRatingFirestoreData(rating, forFieldValue);
  final nestedData = ratingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = rating.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRatingFirestoreData(
  RatingStruct? rating, [
  bool forFieldValue = false,
]) {
  if (rating == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rating.toMap());

  // Add any Firestore field values
  rating.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRatingListFirestoreData(
  List<RatingStruct>? ratings,
) =>
    ratings?.map((e) => getRatingFirestoreData(e, true)).toList() ?? [];
