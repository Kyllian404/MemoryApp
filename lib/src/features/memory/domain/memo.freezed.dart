// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Memo _$MemoFromJson(Map<String, dynamic> json) {
  return _Memo.fromJson(json);
}

/// @nodoc
mixin _$Memo {
  DateTime? get datetime => throw _privateConstructorUsedError;
  String get textUser => throw _privateConstructorUsedError;
  String get nameRandom => throw _privateConstructorUsedError;
  bool get guess => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoCopyWith<Memo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCopyWith<$Res> {
  factory $MemoCopyWith(Memo value, $Res Function(Memo) then) =
      _$MemoCopyWithImpl<$Res, Memo>;
  @useResult
  $Res call(
      {DateTime? datetime, String textUser, String nameRandom, bool guess});
}

/// @nodoc
class _$MemoCopyWithImpl<$Res, $Val extends Memo>
    implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = freezed,
    Object? textUser = null,
    Object? nameRandom = null,
    Object? guess = null,
  }) {
    return _then(_value.copyWith(
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      textUser: null == textUser
          ? _value.textUser
          : textUser // ignore: cast_nullable_to_non_nullable
              as String,
      nameRandom: null == nameRandom
          ? _value.nameRandom
          : nameRandom // ignore: cast_nullable_to_non_nullable
              as String,
      guess: null == guess
          ? _value.guess
          : guess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoImplCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$$MemoImplCopyWith(
          _$MemoImpl value, $Res Function(_$MemoImpl) then) =
      __$$MemoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? datetime, String textUser, String nameRandom, bool guess});
}

/// @nodoc
class __$$MemoImplCopyWithImpl<$Res>
    extends _$MemoCopyWithImpl<$Res, _$MemoImpl>
    implements _$$MemoImplCopyWith<$Res> {
  __$$MemoImplCopyWithImpl(_$MemoImpl _value, $Res Function(_$MemoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = freezed,
    Object? textUser = null,
    Object? nameRandom = null,
    Object? guess = null,
  }) {
    return _then(_$MemoImpl(
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      textUser: null == textUser
          ? _value.textUser
          : textUser // ignore: cast_nullable_to_non_nullable
              as String,
      nameRandom: null == nameRandom
          ? _value.nameRandom
          : nameRandom // ignore: cast_nullable_to_non_nullable
              as String,
      guess: null == guess
          ? _value.guess
          : guess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoImpl implements _Memo {
  _$MemoImpl(
      {required this.datetime,
      required this.textUser,
      required this.nameRandom,
      required this.guess});

  factory _$MemoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoImplFromJson(json);

  @override
  final DateTime? datetime;
  @override
  final String textUser;
  @override
  final String nameRandom;
  @override
  final bool guess;

  @override
  String toString() {
    return 'Memo(datetime: $datetime, textUser: $textUser, nameRandom: $nameRandom, guess: $guess)';
  }

  @override
  // ignore: non_nullable_equals_parameter
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoImpl &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.textUser, textUser) ||
                other.textUser == textUser) &&
            (identical(other.nameRandom, nameRandom) ||
                other.nameRandom == nameRandom) &&
            (identical(other.guess, guess) || other.guess == guess));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, datetime, textUser, nameRandom, guess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      __$$MemoImplCopyWithImpl<_$MemoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoImplToJson(
      this,
    );
  }
}

abstract class _Memo implements Memo {
  factory _Memo(
      {required final DateTime? datetime,
      required final String textUser,
      required final String nameRandom,
      required final bool guess}) = _$MemoImpl;

  factory _Memo.fromJson(Map<String, dynamic> json) = _$MemoImpl.fromJson;

  @override
  DateTime? get datetime;
  @override
  String get textUser;
  @override
  String get nameRandom;
  @override
  bool get guess;
  @override
  @JsonKey(ignore: true)
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
