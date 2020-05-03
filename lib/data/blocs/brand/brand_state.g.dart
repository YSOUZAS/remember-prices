// GENERATED CODE - DO NOT MODIFY BY HAND

part of brand_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BrandState extends BrandState {
  @override
  final bool isLoading;
  @override
  final BuiltList<Brand> brands;
  @override
  final String error;

  factory _$BrandState([void Function(BrandStateBuilder) updates]) =>
      (new BrandStateBuilder()..update(updates)).build();

  _$BrandState._({this.isLoading, this.brands, this.error}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('BrandState', 'isLoading');
    }
    if (brands == null) {
      throw new BuiltValueNullFieldError('BrandState', 'brands');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('BrandState', 'error');
    }
  }

  @override
  BrandState rebuild(void Function(BrandStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrandStateBuilder toBuilder() => new BrandStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrandState &&
        isLoading == other.isLoading &&
        brands == other.brands &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, isLoading.hashCode), brands.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BrandState')
          ..add('isLoading', isLoading)
          ..add('brands', brands)
          ..add('error', error))
        .toString();
  }
}

class BrandStateBuilder implements Builder<BrandState, BrandStateBuilder> {
  _$BrandState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  ListBuilder<Brand> _brands;
  ListBuilder<Brand> get brands => _$this._brands ??= new ListBuilder<Brand>();
  set brands(ListBuilder<Brand> brands) => _$this._brands = brands;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  BrandStateBuilder();

  BrandStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _brands = _$v.brands?.toBuilder();
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BrandState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BrandState;
  }

  @override
  void update(void Function(BrandStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BrandState build() {
    _$BrandState _$result;
    try {
      _$result = _$v ??
          new _$BrandState._(
              isLoading: isLoading, brands: brands.build(), error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'brands';
        brands.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BrandState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
