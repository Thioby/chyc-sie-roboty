// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShowLoadingOfferCards extends ShowLoadingOfferCards {
  @override
  final String userName;

  factory _$ShowLoadingOfferCards(
          [void Function(ShowLoadingOfferCardsBuilder) updates]) =>
      (new ShowLoadingOfferCardsBuilder()..update(updates)).build();

  _$ShowLoadingOfferCards._({this.userName}) : super._() {
    if (userName == null) {
      throw new BuiltValueNullFieldError('ShowLoadingOfferCards', 'userName');
    }
  }

  @override
  ShowLoadingOfferCards rebuild(
          void Function(ShowLoadingOfferCardsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowLoadingOfferCardsBuilder toBuilder() =>
      new ShowLoadingOfferCardsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowLoadingOfferCards && userName == other.userName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShowLoadingOfferCards')
          ..add('userName', userName))
        .toString();
  }
}

class ShowLoadingOfferCardsBuilder
    implements Builder<ShowLoadingOfferCards, ShowLoadingOfferCardsBuilder> {
  _$ShowLoadingOfferCards _$v;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  ShowLoadingOfferCardsBuilder();

  ShowLoadingOfferCardsBuilder get _$this {
    if (_$v != null) {
      _userName = _$v.userName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowLoadingOfferCards other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ShowLoadingOfferCards;
  }

  @override
  void update(void Function(ShowLoadingOfferCardsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShowLoadingOfferCards build() {
    final _$result = _$v ?? new _$ShowLoadingOfferCards._(userName: userName);
    replace(_$result);
    return _$result;
  }
}

class _$ShowLoadingCourseCards extends ShowLoadingCourseCards {
  @override
  final String userName;

  factory _$ShowLoadingCourseCards(
          [void Function(ShowLoadingCourseCardsBuilder) updates]) =>
      (new ShowLoadingCourseCardsBuilder()..update(updates)).build();

  _$ShowLoadingCourseCards._({this.userName}) : super._() {
    if (userName == null) {
      throw new BuiltValueNullFieldError('ShowLoadingCourseCards', 'userName');
    }
  }

  @override
  ShowLoadingCourseCards rebuild(
          void Function(ShowLoadingCourseCardsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowLoadingCourseCardsBuilder toBuilder() =>
      new ShowLoadingCourseCardsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowLoadingCourseCards && userName == other.userName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShowLoadingCourseCards')
          ..add('userName', userName))
        .toString();
  }
}

class ShowLoadingCourseCardsBuilder
    implements Builder<ShowLoadingCourseCards, ShowLoadingCourseCardsBuilder> {
  _$ShowLoadingCourseCards _$v;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  ShowLoadingCourseCardsBuilder();

  ShowLoadingCourseCardsBuilder get _$this {
    if (_$v != null) {
      _userName = _$v.userName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowLoadingCourseCards other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ShowLoadingCourseCards;
  }

  @override
  void update(void Function(ShowLoadingCourseCardsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShowLoadingCourseCards build() {
    final _$result = _$v ?? new _$ShowLoadingCourseCards._(userName: userName);
    replace(_$result);
    return _$result;
  }
}

class _$ShowOfferCards extends ShowOfferCards {
  @override
  final List<Offer> offers;
  @override
  final String userName;

  factory _$ShowOfferCards([void Function(ShowOfferCardsBuilder) updates]) =>
      (new ShowOfferCardsBuilder()..update(updates)).build();

  _$ShowOfferCards._({this.offers, this.userName}) : super._() {
    if (offers == null) {
      throw new BuiltValueNullFieldError('ShowOfferCards', 'offers');
    }
    if (userName == null) {
      throw new BuiltValueNullFieldError('ShowOfferCards', 'userName');
    }
  }

  @override
  ShowOfferCards rebuild(void Function(ShowOfferCardsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowOfferCardsBuilder toBuilder() =>
      new ShowOfferCardsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowOfferCards &&
        offers == other.offers &&
        userName == other.userName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, offers.hashCode), userName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShowOfferCards')
          ..add('offers', offers)
          ..add('userName', userName))
        .toString();
  }
}

class ShowOfferCardsBuilder
    implements Builder<ShowOfferCards, ShowOfferCardsBuilder> {
  _$ShowOfferCards _$v;

  List<Offer> _offers;
  List<Offer> get offers => _$this._offers;
  set offers(List<Offer> offers) => _$this._offers = offers;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  ShowOfferCardsBuilder();

  ShowOfferCardsBuilder get _$this {
    if (_$v != null) {
      _offers = _$v.offers;
      _userName = _$v.userName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowOfferCards other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ShowOfferCards;
  }

  @override
  void update(void Function(ShowOfferCardsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShowOfferCards build() {
    final _$result =
        _$v ?? new _$ShowOfferCards._(offers: offers, userName: userName);
    replace(_$result);
    return _$result;
  }
}

class _$ShowCourseCards extends ShowCourseCards {
  @override
  final List<Course> courses;
  @override
  final String userName;

  factory _$ShowCourseCards([void Function(ShowCourseCardsBuilder) updates]) =>
      (new ShowCourseCardsBuilder()..update(updates)).build();

  _$ShowCourseCards._({this.courses, this.userName}) : super._() {
    if (courses == null) {
      throw new BuiltValueNullFieldError('ShowCourseCards', 'courses');
    }
    if (userName == null) {
      throw new BuiltValueNullFieldError('ShowCourseCards', 'userName');
    }
  }

  @override
  ShowCourseCards rebuild(void Function(ShowCourseCardsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowCourseCardsBuilder toBuilder() =>
      new ShowCourseCardsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowCourseCards &&
        courses == other.courses &&
        userName == other.userName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, courses.hashCode), userName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShowCourseCards')
          ..add('courses', courses)
          ..add('userName', userName))
        .toString();
  }
}

class ShowCourseCardsBuilder
    implements Builder<ShowCourseCards, ShowCourseCardsBuilder> {
  _$ShowCourseCards _$v;

  List<Course> _courses;
  List<Course> get courses => _$this._courses;
  set courses(List<Course> courses) => _$this._courses = courses;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  ShowCourseCardsBuilder();

  ShowCourseCardsBuilder get _$this {
    if (_$v != null) {
      _courses = _$v.courses;
      _userName = _$v.userName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowCourseCards other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ShowCourseCards;
  }

  @override
  void update(void Function(ShowCourseCardsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShowCourseCards build() {
    final _$result =
        _$v ?? new _$ShowCourseCards._(courses: courses, userName: userName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
