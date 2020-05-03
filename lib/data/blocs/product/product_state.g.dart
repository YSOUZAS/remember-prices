// GENERATED CODE - DO NOT MODIFY BY HAND

part of product_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductState extends ProductState {
  @override
  final bool isLoading;
  @override
  final BuiltList<Product> products;
  @override
  final Product product;
  @override
  final String error;

  factory _$ProductState([void Function(ProductStateBuilder) updates]) =>
      (new ProductStateBuilder()..update(updates)).build();

  _$ProductState._({this.isLoading, this.products, this.product, this.error})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('ProductState', 'isLoading');
    }
    if (products == null) {
      throw new BuiltValueNullFieldError('ProductState', 'products');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('ProductState', 'error');
    }
  }

  @override
  ProductState rebuild(void Function(ProductStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductStateBuilder toBuilder() => new ProductStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductState &&
        isLoading == other.isLoading &&
        products == other.products &&
        product == other.product &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), products.hashCode),
            product.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductState')
          ..add('isLoading', isLoading)
          ..add('products', products)
          ..add('product', product)
          ..add('error', error))
        .toString();
  }
}

class ProductStateBuilder
    implements Builder<ProductState, ProductStateBuilder> {
  _$ProductState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  ListBuilder<Product> _products;
  ListBuilder<Product> get products =>
      _$this._products ??= new ListBuilder<Product>();
  set products(ListBuilder<Product> products) => _$this._products = products;

  ProductBuilder _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder product) => _$this._product = product;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  ProductStateBuilder();

  ProductStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _products = _$v.products?.toBuilder();
      _product = _$v.product?.toBuilder();
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductState;
  }

  @override
  void update(void Function(ProductStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductState build() {
    _$ProductState _$result;
    try {
      _$result = _$v ??
          new _$ProductState._(
              isLoading: isLoading,
              products: products.build(),
              product: _product?.build(),
              error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'products';
        products.build();
        _$failedField = 'product';
        _product?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
