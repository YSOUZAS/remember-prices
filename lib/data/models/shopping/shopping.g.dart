// GENERATED CODE - DO NOT MODIFY BY HAND

part of shopping;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Shopping> _$shoppingSerializer = new _$ShoppingSerializer();

class _$ShoppingSerializer implements StructuredSerializer<Shopping> {
  @override
  final Iterable<Type> types = const [Shopping, _$Shopping];
  @override
  final String wireName = 'Shopping';

  @override
  Iterable<Object> serialize(Serializers serializers, Shopping object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'documentID',
      serializers.serialize(object.documentID,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(DataShopping)),
    ];

    return result;
  }

  @override
  Shopping deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShoppingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'documentID':
          result.documentID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(DataShopping)) as DataShopping);
          break;
      }
    }

    return result.build();
  }
}

class _$Shopping extends Shopping {
  @override
  final String documentID;
  @override
  final DataShopping data;

  factory _$Shopping([void Function(ShoppingBuilder) updates]) =>
      (new ShoppingBuilder()..update(updates)).build();

  _$Shopping._({this.documentID, this.data}) : super._() {
    if (documentID == null) {
      throw new BuiltValueNullFieldError('Shopping', 'documentID');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('Shopping', 'data');
    }
  }

  @override
  Shopping rebuild(void Function(ShoppingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShoppingBuilder toBuilder() => new ShoppingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Shopping &&
        documentID == other.documentID &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, documentID.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Shopping')
          ..add('documentID', documentID)
          ..add('data', data))
        .toString();
  }
}

class ShoppingBuilder implements Builder<Shopping, ShoppingBuilder> {
  _$Shopping _$v;

  String _documentID;
  String get documentID => _$this._documentID;
  set documentID(String documentID) => _$this._documentID = documentID;

  DataShoppingBuilder _data;
  DataShoppingBuilder get data => _$this._data ??= new DataShoppingBuilder();
  set data(DataShoppingBuilder data) => _$this._data = data;

  ShoppingBuilder();

  ShoppingBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Shopping other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Shopping;
  }

  @override
  void update(void Function(ShoppingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Shopping build() {
    _$Shopping _$result;
    try {
      _$result =
          _$v ?? new _$Shopping._(documentID: documentID, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Shopping', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
