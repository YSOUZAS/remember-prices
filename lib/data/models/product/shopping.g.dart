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
      'brandId',
      serializers.serialize(object.brandId,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
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
  Shopping deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShoppingBuilder();

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

class _$Shopping extends Shopping {
  @override
  final String brandId;
  @override
  final double price;
  @override
  final String date;
  @override
  final Brand brand;
  @override
  final bool promotion;

  factory _$Shopping([void Function(ShoppingBuilder) updates]) =>
      (new ShoppingBuilder()..update(updates)).build();

  _$Shopping._(
      {this.brandId, this.price, this.date, this.brand, this.promotion})
      : super._() {
    if (brandId == null) {
      throw new BuiltValueNullFieldError('Shopping', 'brandId');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('Shopping', 'price');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('Shopping', 'date');
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
        brandId == other.brandId &&
        price == other.price &&
        date == other.date &&
        brand == other.brand &&
        promotion == other.promotion;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, brandId.hashCode), price.hashCode), date.hashCode),
            brand.hashCode),
        promotion.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Shopping')
          ..add('brandId', brandId)
          ..add('price', price)
          ..add('date', date)
          ..add('brand', brand)
          ..add('promotion', promotion))
        .toString();
  }
}

class ShoppingBuilder implements Builder<Shopping, ShoppingBuilder> {
  _$Shopping _$v;

  String _brandId;
  String get brandId => _$this._brandId;
  set brandId(String brandId) => _$this._brandId = brandId;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  BrandBuilder _brand;
  BrandBuilder get brand => _$this._brand ??= new BrandBuilder();
  set brand(BrandBuilder brand) => _$this._brand = brand;

  bool _promotion;
  bool get promotion => _$this._promotion;
  set promotion(bool promotion) => _$this._promotion = promotion;

  ShoppingBuilder();

  ShoppingBuilder get _$this {
    if (_$v != null) {
      _brandId = _$v.brandId;
      _price = _$v.price;
      _date = _$v.date;
      _brand = _$v.brand?.toBuilder();
      _promotion = _$v.promotion;
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
      _$result = _$v ??
          new _$Shopping._(
              brandId: brandId,
              price: price,
              date: date,
              brand: _brand?.build(),
              promotion: promotion);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'brand';
        _brand?.build();
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
