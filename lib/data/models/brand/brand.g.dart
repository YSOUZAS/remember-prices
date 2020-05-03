// GENERATED CODE - DO NOT MODIFY BY HAND

part of brand;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Brand> _$brandSerializer = new _$BrandSerializer();

class _$BrandSerializer implements StructuredSerializer<Brand> {
  @override
  final Iterable<Type> types = const [Brand, _$Brand];
  @override
  final String wireName = 'Brand';

  @override
  Iterable<Object> serialize(Serializers serializers, Brand object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'documentID',
      serializers.serialize(object.documentID,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(DataBrand)),
    ];

    return result;
  }

  @override
  Brand deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BrandBuilder();

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
              specifiedType: const FullType(DataBrand)) as DataBrand);
          break;
      }
    }

    return result.build();
  }
}

class _$Brand extends Brand {
  @override
  final String documentID;
  @override
  final DataBrand data;

  factory _$Brand([void Function(BrandBuilder) updates]) =>
      (new BrandBuilder()..update(updates)).build();

  _$Brand._({this.documentID, this.data}) : super._() {
    if (documentID == null) {
      throw new BuiltValueNullFieldError('Brand', 'documentID');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('Brand', 'data');
    }
  }

  @override
  Brand rebuild(void Function(BrandBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrandBuilder toBuilder() => new BrandBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Brand &&
        documentID == other.documentID &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, documentID.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Brand')
          ..add('documentID', documentID)
          ..add('data', data))
        .toString();
  }
}

class BrandBuilder implements Builder<Brand, BrandBuilder> {
  _$Brand _$v;

  String _documentID;
  String get documentID => _$this._documentID;
  set documentID(String documentID) => _$this._documentID = documentID;

  DataBrandBuilder _data;
  DataBrandBuilder get data => _$this._data ??= new DataBrandBuilder();
  set data(DataBrandBuilder data) => _$this._data = data;

  BrandBuilder();

  BrandBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Brand other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Brand;
  }

  @override
  void update(void Function(BrandBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Brand build() {
    _$Brand _$result;
    try {
      _$result =
          _$v ?? new _$Brand._(documentID: documentID, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Brand', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
