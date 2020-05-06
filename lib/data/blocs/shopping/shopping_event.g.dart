// GENERATED CODE - DO NOT MODIFY BY HAND

part of shopping_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetAllShoppingsFromProductIdStateInitiated
    extends GetAllShoppingsFromProductIdStateInitiated {
  @override
  final String productId;

  factory _$GetAllShoppingsFromProductIdStateInitiated(
          [void Function(GetAllShoppingsFromProductIdStateInitiatedBuilder)
              updates]) =>
      (new GetAllShoppingsFromProductIdStateInitiatedBuilder()..update(updates))
          .build();

  _$GetAllShoppingsFromProductIdStateInitiated._({this.productId}) : super._();

  @override
  GetAllShoppingsFromProductIdStateInitiated rebuild(
          void Function(GetAllShoppingsFromProductIdStateInitiatedBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAllShoppingsFromProductIdStateInitiatedBuilder toBuilder() =>
      new GetAllShoppingsFromProductIdStateInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAllShoppingsFromProductIdStateInitiated &&
        productId == other.productId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, productId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GetAllShoppingsFromProductIdStateInitiated')
          ..add('productId', productId))
        .toString();
  }
}

class GetAllShoppingsFromProductIdStateInitiatedBuilder
    implements
        Builder<GetAllShoppingsFromProductIdStateInitiated,
            GetAllShoppingsFromProductIdStateInitiatedBuilder> {
  _$GetAllShoppingsFromProductIdStateInitiated _$v;

  String _productId;
  String get productId => _$this._productId;
  set productId(String productId) => _$this._productId = productId;

  GetAllShoppingsFromProductIdStateInitiatedBuilder();

  GetAllShoppingsFromProductIdStateInitiatedBuilder get _$this {
    if (_$v != null) {
      _productId = _$v.productId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAllShoppingsFromProductIdStateInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GetAllShoppingsFromProductIdStateInitiated;
  }

  @override
  void update(
      void Function(GetAllShoppingsFromProductIdStateInitiatedBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetAllShoppingsFromProductIdStateInitiated build() {
    final _$result = _$v ??
        new _$GetAllShoppingsFromProductIdStateInitiated._(
            productId: productId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
