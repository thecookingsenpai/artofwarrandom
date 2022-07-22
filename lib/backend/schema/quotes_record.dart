import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'quotes_record.g.dart';

abstract class QuotesRecord
    implements Built<QuotesRecord, QuotesRecordBuilder> {
  static Serializer<QuotesRecord> get serializer => _$quotesRecordSerializer;

  String? get username;

  BuiltList<String>? get quotes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(QuotesRecordBuilder builder) => builder
    ..username = ''
    ..quotes = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quotes');

  static Stream<QuotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<QuotesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  QuotesRecord._();
  factory QuotesRecord([void Function(QuotesRecordBuilder) updates]) =
      _$QuotesRecord;

  static QuotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createQuotesRecordData({
  String? username,
}) {
  final firestoreData = serializers.toFirestore(
    QuotesRecord.serializer,
    QuotesRecord(
      (q) => q
        ..username = username
        ..quotes = null,
    ),
  );

  return firestoreData;
}
