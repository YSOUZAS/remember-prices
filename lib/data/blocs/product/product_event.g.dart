// GENERATED CODE - DO NOT MODIFY BY HAND

part of product_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductInitiated extends ProductInitiated {
  factory _$ProductInitiated(
          [void Function(ProductInitiatedBuilder) updates]) =>
      (new ProductInitiatedBuilder()..update(updates)).build();

  _$ProductInitiated._() : super._();

  @override
  ProductInitiated rebuild(void Function(ProductInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductInitiatedBuilder toBuilder() =>
      new ProductInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductInitiated;
  }

  @override
  int get hashCode {
    return 925286876;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ProductInitiated').toString();
  }
}

class ProductInitiatedBuilder
    implements Builder<ProductInitiated, ProductInitiatedBuilder> {
  _$ProductInitiated _$v;

  ProductInitiatedBuilder();

  @override
  void replace(ProductInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductInitiated;
  }

  @override
  void update(void Function(ProductInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductInitiated build() {
    final _$result = _$v ?? new _$ProductInitiated._();
    replace(_$result);
    return _$result;
  }
}

class _$ProductInsert extends ProductInsert {
  @override
  final String name;

  factory _$ProductInsert([void Function(ProductInsertBuilder) updates]) =>
      (new ProductInsertBuilder()..update(updates)).build();

  _$ProductInsert._({this.name}) : super._();

  @override
  ProductInsert rebuild(void Function(ProductInsertBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductInsertBuilder toBuilder() => new ProductInsertBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductInsert && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductInsert')..add('name', name))
        .toString();
  }
}

class ProductInsertBuilder
    implements Builder<ProductInsert, ProductInsertBuilder> {
  _$ProductInsert _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ProductInsertBuilder();

  ProductInsertBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductInsert other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductInsert;
  }

  @override
  void update(void Function(ProductInsertBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductInsert build() {
    final _$result = _$v ?? new _$ProductInsert._(name: name);
    replace(_$result);
    return _$result;
  }
}

class _$ProductDelete extends ProductDelete {
  @override
  final String documentID;

  factory _$ProductDelete([void Function(ProductDeleteBuilder) updates]) =>
      (new ProductDeleteBuilder()..update(updates)).build();

  _$ProductDelete._({this.documentID}) : super._() {
    if (documentID == null) {
      throw new BuiltValueNullFieldError('ProductDelete', 'documentID');
    }
  }

  @override
  ProductDelete rebuild(void Function(ProductDeleteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductDeleteBuilder toBuilder() => new ProductDeleteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductDelete && documentID == other.documentID;
  }

  @override
  int get hashCode {
    return $jf($jc(0, documentID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductDelete')
          ..add('documentID', documentID))
        .toString();
  }
}

class ProductDeleteBuilder
    implements Builder<ProductDelete, ProductDeleteBuilder> {
  _$ProductDelete _$v;

  String _documentID;
  String get documentID => _$this._documentID;
  set documentID(String documentID) => _$this._documentID = documentID;

  ProductDeleteBuilder();

  ProductDeleteBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductDelete other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductDelete;
  }

  @override
  void update(void Function(ProductDeleteBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductDelete build() {
    final _$result = _$v ?? new _$ProductDelete._(documentID: documentID);
    replace(_$result);
    return _$result;
  }
}

class _$ProductEdit extends ProductEdit {
  @override
  final String documentId;
  @override
  final Map<String, dynamic> data;

  factory _$ProductEdit([void Function(ProductEditBuilder) updates]) =>
      (new ProductEditBuilder()..update(updates)).build();

  _$ProductEdit._({this.documentId, this.data}) : super._() {
    if (documentId == null) {
      throw new BuiltValueNullFieldError('ProductEdit', 'documentId');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('ProductEdit', 'data');
    }
  }

  @override
  ProductEdit rebuild(void Function(ProductEditBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductEditBuilder toBuilder() => new ProductEditBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductEdit &&
        documentId == other.documentId &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, documentId.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductEdit')
          ..add('documentId', documentId)
          ..add('data', data))
        .toString();
  }
}

class ProductEditBuilder implements Builder<ProductEdit, ProductEditBuilder> {
  _$ProductEdit _$v;

  String _documentId;
  String get documentId => _$this._documentId;
  set documentId(String documentId) => _$this._documentId = documentId;

  Map<String, dynamic> _data;
  Map<String, dynamic> get data => _$this._data;
  set data(Map<String, dynamic> data) => _$this._data = data;

  ProductEditBuilder();

  ProductEditBuilder get _$this {
    if (_$v != null) {
      _documentId = _$v.documentId;
      _data = _$v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductEdit other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductEdit;
  }

  @override
  void update(void Function(ProductEditBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductEdit build() {
    final _$result =
        _$v ?? new _$ProductEdit._(documentId: documentId, data: data);
    replace(_$result);
    return _$result;
  }
}

class _$ProductGetById extends ProductGetById {
  @override
  final String documentID;

  factory _$ProductGetById([void Function(ProductGetByIdBuilder) updates]) =>
      (new ProductGetByIdBuilder()..update(updates)).build();

  _$ProductGetById._({this.documentID}) : super._();

  @override
  ProductGetById rebuild(void Function(ProductGetByIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductGetByIdBuilder toBuilder() =>
      new ProductGetByIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductGetById && documentID == other.documentID;
  }

  @override
  int get hashCode {
    return $jf($jc(0, documentID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductGetById')
          ..add('documentID', documentID))
        .toString();
  }
}

class ProductGetByIdBuilder
    implements Builder<ProductGetById, ProductGetByIdBuilder> {
  _$ProductGetById _$v;

  String _documentID;
  String get documentID => _$this._documentID;
  set documentID(String documentID) => _$this._documentID = documentID;

  ProductGetByIdBuilder();

  ProductGetByIdBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductGetById other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductGetById;
  }

  @override
  void update(void Function(ProductGetByIdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductGetById build() {
    final _$result = _$v ?? new _$ProductGetById._(documentID: documentID);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
