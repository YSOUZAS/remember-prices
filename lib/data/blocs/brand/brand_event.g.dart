// GENERATED CODE - DO NOT MODIFY BY HAND

part of brand_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BrandInitiated extends BrandInitiated {
  factory _$BrandInitiated([void Function(BrandInitiatedBuilder) updates]) =>
      (new BrandInitiatedBuilder()..update(updates)).build();

  _$BrandInitiated._() : super._();

  @override
  BrandInitiated rebuild(void Function(BrandInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrandInitiatedBuilder toBuilder() =>
      new BrandInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrandInitiated;
  }

  @override
  int get hashCode {
    return 856928594;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('BrandInitiated').toString();
  }
}

class BrandInitiatedBuilder
    implements Builder<BrandInitiated, BrandInitiatedBuilder> {
  _$BrandInitiated _$v;

  BrandInitiatedBuilder();

  @override
  void replace(BrandInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BrandInitiated;
  }

  @override
  void update(void Function(BrandInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BrandInitiated build() {
    final _$result = _$v ?? new _$BrandInitiated._();
    replace(_$result);
    return _$result;
  }
}

class _$BrandInsert extends BrandInsert {
  @override
  final String name;

  factory _$BrandInsert([void Function(BrandInsertBuilder) updates]) =>
      (new BrandInsertBuilder()..update(updates)).build();

  _$BrandInsert._({this.name}) : super._();

  @override
  BrandInsert rebuild(void Function(BrandInsertBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrandInsertBuilder toBuilder() => new BrandInsertBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrandInsert && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BrandInsert')..add('name', name))
        .toString();
  }
}

class BrandInsertBuilder implements Builder<BrandInsert, BrandInsertBuilder> {
  _$BrandInsert _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  BrandInsertBuilder();

  BrandInsertBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BrandInsert other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BrandInsert;
  }

  @override
  void update(void Function(BrandInsertBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BrandInsert build() {
    final _$result = _$v ?? new _$BrandInsert._(name: name);
    replace(_$result);
    return _$result;
  }
}

class _$BrandDelete extends BrandDelete {
  @override
  final String documentID;

  factory _$BrandDelete([void Function(BrandDeleteBuilder) updates]) =>
      (new BrandDeleteBuilder()..update(updates)).build();

  _$BrandDelete._({this.documentID}) : super._() {
    if (documentID == null) {
      throw new BuiltValueNullFieldError('BrandDelete', 'documentID');
    }
  }

  @override
  BrandDelete rebuild(void Function(BrandDeleteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrandDeleteBuilder toBuilder() => new BrandDeleteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrandDelete && documentID == other.documentID;
  }

  @override
  int get hashCode {
    return $jf($jc(0, documentID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BrandDelete')
          ..add('documentID', documentID))
        .toString();
  }
}

class BrandDeleteBuilder implements Builder<BrandDelete, BrandDeleteBuilder> {
  _$BrandDelete _$v;

  String _documentID;
  String get documentID => _$this._documentID;
  set documentID(String documentID) => _$this._documentID = documentID;

  BrandDeleteBuilder();

  BrandDeleteBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BrandDelete other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BrandDelete;
  }

  @override
  void update(void Function(BrandDeleteBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BrandDelete build() {
    final _$result = _$v ?? new _$BrandDelete._(documentID: documentID);
    replace(_$result);
    return _$result;
  }
}

class _$BrandEdit extends BrandEdit {
  @override
  final String documentID;
  @override
  final String name;

  factory _$BrandEdit([void Function(BrandEditBuilder) updates]) =>
      (new BrandEditBuilder()..update(updates)).build();

  _$BrandEdit._({this.documentID, this.name}) : super._();

  @override
  BrandEdit rebuild(void Function(BrandEditBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrandEditBuilder toBuilder() => new BrandEditBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrandEdit &&
        documentID == other.documentID &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, documentID.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BrandEdit')
          ..add('documentID', documentID)
          ..add('name', name))
        .toString();
  }
}

class BrandEditBuilder implements Builder<BrandEdit, BrandEditBuilder> {
  _$BrandEdit _$v;

  String _documentID;
  String get documentID => _$this._documentID;
  set documentID(String documentID) => _$this._documentID = documentID;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  BrandEditBuilder();

  BrandEditBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BrandEdit other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BrandEdit;
  }

  @override
  void update(void Function(BrandEditBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BrandEdit build() {
    final _$result =
        _$v ?? new _$BrandEdit._(documentID: documentID, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
