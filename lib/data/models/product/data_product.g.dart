// GENERATED CODE - DO NOT MODIFY BY HAND

part of data_product;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataProduct> _$dataProductSerializer = new _$DataProductSerializer();

class _$DataProductSerializer implements StructuredSerializer<DataProduct> {
  @override
  final Iterable<Type> types = const [DataProduct, _$DataProduct];
  @override
  final String wireName = 'DataProduct';

  @override
  Iterable<Object> serialize(Serializers serializers, DataProduct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'barcode',
      serializers.serialize(object.barcode,
          specifiedType: const FullType(String)),
    ];
    if (object.shoppings != null) {
      result
        ..add('shoppings')
        ..add(serializers.serialize(object.shoppings,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Shopping)])));
    }
    return result;
  }

  @override
  DataProduct deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'barcode':
          result.barcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shoppings':
          result.shoppings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Shopping)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$DataProduct extends DataProduct {
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String barcode;
  @override
  final BuiltList<Shopping> shoppings;

  factory _$DataProduct([void Function(DataProductBuilder) updates]) =>
      (new DataProductBuilder()..update(updates)).build();

  _$DataProduct._({this.name, this.imageUrl, this.barcode, this.shoppings})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('DataProduct', 'name');
    }
    if (imageUrl == null) {
      throw new BuiltValueNullFieldError('DataProduct', 'imageUrl');
    }
    if (barcode == null) {
      throw new BuiltValueNullFieldError('DataProduct', 'barcode');
    }
  }

  @override
  DataProduct rebuild(void Function(DataProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataProductBuilder toBuilder() => new DataProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataProduct &&
        name == other.name &&
        imageUrl == other.imageUrl &&
        barcode == other.barcode &&
        shoppings == other.shoppings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), imageUrl.hashCode), barcode.hashCode),
        shoppings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DataProduct')
          ..add('name', name)
          ..add('imageUrl', imageUrl)
          ..add('barcode', barcode)
          ..add('shoppings', shoppings))
        .toString();
  }
}

class DataProductBuilder implements Builder<DataProduct, DataProductBuilder> {
  _$DataProduct _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _barcode;
  String get barcode => _$this._barcode;
  set barcode(String barcode) => _$this._barcode = barcode;

  ListBuilder<Shopping> _shoppings;
  ListBuilder<Shopping> get shoppings =>
      _$this._shoppings ??= new ListBuilder<Shopping>();
  set shoppings(ListBuilder<Shopping> shoppings) =>
      _$this._shoppings = shoppings;

  DataProductBuilder();

  DataProductBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _imageUrl = _$v.imageUrl;
      _barcode = _$v.barcode;
      _shoppings = _$v.shoppings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataProduct other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DataProduct;
  }

  @override
  void update(void Function(DataProductBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DataProduct build() {
    _$DataProduct _$result;
    try {
      _$result = _$v ??
          new _$DataProduct._(
              name: name,
              imageUrl: imageUrl,
              barcode: barcode,
              shoppings: _shoppings?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'shoppings';
        _shoppings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DataProduct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
