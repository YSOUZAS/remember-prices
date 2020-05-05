// GENERATED CODE - DO NOT MODIFY BY HAND

part of data_shopping;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataShopping> _$dataShoppingSerializer =
    new _$DataShoppingSerializer();

class _$DataShoppingSerializer implements StructuredSerializer<DataShopping> {
  @override
  final Iterable<Type> types = const [DataShopping, _$DataShopping];
  @override
  final String wireName = 'DataShopping';

  @override
  Iterable<Object> serialize(Serializers serializers, DataShopping object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'brandId',
      serializers.serialize(object.brandId,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'productId',
      serializers.serialize(object.productId,
          specifiedType: const FullType(String)),
    ];
    if (object.brand != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(object.brand,
            specifiedType: const FullType(Brand)));
    }
    if (object.promotion != null) {
      result
        ..add('promotion')
        ..add(serializers.serialize(object.promotion,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  DataShopping deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataShoppingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'brandId':
          result.brandId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productId':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'brand':
          result.brand.replace(serializers.deserialize(value,
              specifiedType: const FullType(Brand)) as Brand);
          break;
        case 'promotion':
          result.promotion = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$DataShopping extends DataShopping {
  @override
  final String brandId;
  @override
  final double price;
  @override
  final String date;
  @override
  final String productId;
  @override
  final Brand brand;
  @override
  final bool promotion;

  factory _$DataShopping([void Function(DataShoppingBuilder) updates]) =>
      (new DataShoppingBuilder()..update(updates)).build();

  _$DataShopping._(
      {this.brandId,
      this.price,
      this.date,
      this.productId,
      this.brand,
      this.promotion})
      : super._() {
    if (brandId == null) {
      throw new BuiltValueNullFieldError('DataShopping', 'brandId');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('DataShopping', 'price');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('DataShopping', 'date');
    }
    if (productId == null) {
      throw new BuiltValueNullFieldError('DataShopping', 'productId');
    }
  }

  @override
  DataShopping rebuild(void Function(DataShoppingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataShoppingBuilder toBuilder() => new DataShoppingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataShopping &&
        brandId == other.brandId &&
        price == other.price &&
        date == other.date &&
        productId == other.productId &&
        brand == other.brand &&
        promotion == other.promotion;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, brandId.hashCode), price.hashCode),
                    date.hashCode),
                productId.hashCode),
            brand.hashCode),
        promotion.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DataShopping')
          ..add('brandId', brandId)
          ..add('price', price)
          ..add('date', date)
          ..add('productId', productId)
          ..add('brand', brand)
          ..add('promotion', promotion))
        .toString();
  }
}

class DataShoppingBuilder
    implements Builder<DataShopping, DataShoppingBuilder> {
  _$DataShopping _$v;

  String _brandId;
  String get brandId => _$this._brandId;
  set brandId(String brandId) => _$this._brandId = brandId;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _productId;
  String get productId => _$this._productId;
  set productId(String productId) => _$this._productId = productId;

  BrandBuilder _brand;
  BrandBuilder get brand => _$this._brand ??= new BrandBuilder();
  set brand(BrandBuilder brand) => _$this._brand = brand;

  bool _promotion;
  bool get promotion => _$this._promotion;
  set promotion(bool promotion) => _$this._promotion = promotion;

  DataShoppingBuilder();

  DataShoppingBuilder get _$this {
    if (_$v != null) {
      _brandId = _$v.brandId;
      _price = _$v.price;
      _date = _$v.date;
      _productId = _$v.productId;
      _brand = _$v.brand?.toBuilder();
      _promotion = _$v.promotion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataShopping other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DataShopping;
  }

  @override
  void update(void Function(DataShoppingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DataShopping build() {
    _$DataShopping _$result;
    try {
      _$result = _$v ??
          new _$DataShopping._(
              brandId: brandId,
              price: price,
              date: date,
              productId: productId,
              brand: _brand?.build(),
              promotion: promotion);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'brand';
        _brand?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DataShopping', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
