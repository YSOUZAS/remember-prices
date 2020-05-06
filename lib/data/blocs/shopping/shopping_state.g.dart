// GENERATED CODE - DO NOT MODIFY BY HAND

part of shopping_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetAllShoppingsFromProductIdState
    extends GetAllShoppingsFromProductIdState {
  @override
  final bool isLoading;
  @override
  final BuiltList<Shopping> shoppings;
  @override
  final String error;

  factory _$GetAllShoppingsFromProductIdState(
          [void Function(GetAllShoppingsFromProductIdStateBuilder) updates]) =>
      (new GetAllShoppingsFromProductIdStateBuilder()..update(updates)).build();

  _$GetAllShoppingsFromProductIdState._(
      {this.isLoading, this.shoppings, this.error})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError(
          'GetAllShoppingsFromProductIdState', 'isLoading');
    }
    if (shoppings == null) {
      throw new BuiltValueNullFieldError(
          'GetAllShoppingsFromProductIdState', 'shoppings');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError(
          'GetAllShoppingsFromProductIdState', 'error');
    }
  }

  @override
  GetAllShoppingsFromProductIdState rebuild(
          void Function(GetAllShoppingsFromProductIdStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAllShoppingsFromProductIdStateBuilder toBuilder() =>
      new GetAllShoppingsFromProductIdStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAllShoppingsFromProductIdState &&
        isLoading == other.isLoading &&
        shoppings == other.shoppings &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), shoppings.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetAllShoppingsFromProductIdState')
          ..add('isLoading', isLoading)
          ..add('shoppings', shoppings)
          ..add('error', error))
        .toString();
  }
}

class GetAllShoppingsFromProductIdStateBuilder
    implements
        Builder<GetAllShoppingsFromProductIdState,
            GetAllShoppingsFromProductIdStateBuilder> {
  _$GetAllShoppingsFromProductIdState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  ListBuilder<Shopping> _shoppings;
  ListBuilder<Shopping> get shoppings =>
      _$this._shoppings ??= new ListBuilder<Shopping>();
  set shoppings(ListBuilder<Shopping> shoppings) =>
      _$this._shoppings = shoppings;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  GetAllShoppingsFromProductIdStateBuilder();

  GetAllShoppingsFromProductIdStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _shoppings = _$v.shoppings?.toBuilder();
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAllShoppingsFromProductIdState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GetAllShoppingsFromProductIdState;
  }

  @override
  void update(void Function(GetAllShoppingsFromProductIdStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetAllShoppingsFromProductIdState build() {
    _$GetAllShoppingsFromProductIdState _$result;
    try {
      _$result = _$v ??
          new _$GetAllShoppingsFromProductIdState._(
              isLoading: isLoading, shoppings: shoppings.build(), error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'shoppings';
        shoppings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetAllShoppingsFromProductIdState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
