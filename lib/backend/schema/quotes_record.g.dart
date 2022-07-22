// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuotesRecord> _$quotesRecordSerializer =
    new _$QuotesRecordSerializer();

class _$QuotesRecordSerializer implements StructuredSerializer<QuotesRecord> {
  @override
  final Iterable<Type> types = const [QuotesRecord, _$QuotesRecord];
  @override
  final String wireName = 'QuotesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuotesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.quotes;
    if (value != null) {
      result
        ..add('quotes')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  QuotesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuotesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'quotes':
          result.quotes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$QuotesRecord extends QuotesRecord {
  @override
  final String? username;
  @override
  final BuiltList<String>? quotes;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$QuotesRecord([void Function(QuotesRecordBuilder)? updates]) =>
      (new QuotesRecordBuilder()..update(updates)).build();

  _$QuotesRecord._({this.username, this.quotes, this.ffRef}) : super._();

  @override
  QuotesRecord rebuild(void Function(QuotesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuotesRecordBuilder toBuilder() => new QuotesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuotesRecord &&
        username == other.username &&
        quotes == other.quotes &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, username.hashCode), quotes.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuotesRecord')
          ..add('username', username)
          ..add('quotes', quotes)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class QuotesRecordBuilder
    implements Builder<QuotesRecord, QuotesRecordBuilder> {
  _$QuotesRecord? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  ListBuilder<String>? _quotes;
  ListBuilder<String> get quotes =>
      _$this._quotes ??= new ListBuilder<String>();
  set quotes(ListBuilder<String>? quotes) => _$this._quotes = quotes;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  QuotesRecordBuilder() {
    QuotesRecord._initializeBuilder(this);
  }

  QuotesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _quotes = $v.quotes?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuotesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuotesRecord;
  }

  @override
  void update(void Function(QuotesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuotesRecord build() {
    _$QuotesRecord _$result;
    try {
      _$result = _$v ??
          new _$QuotesRecord._(
              username: username, quotes: _quotes?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'quotes';
        _quotes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'QuotesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
