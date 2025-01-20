// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_machine_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CashMachineEvent {
  int get amount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int amount) tryToGetCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int amount)? tryToGetCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int amount)? tryToGetCache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CashMachineEventTryToGetCache value)
        tryToGetCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CashMachineEventTryToGetCache value)? tryToGetCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CashMachineEventTryToGetCache value)? tryToGetCache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CashMachineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashMachineEventCopyWith<CashMachineEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashMachineEventCopyWith<$Res> {
  factory $CashMachineEventCopyWith(
          CashMachineEvent value, $Res Function(CashMachineEvent) then) =
      _$CashMachineEventCopyWithImpl<$Res, CashMachineEvent>;
  @useResult
  $Res call({int amount});
}

/// @nodoc
class _$CashMachineEventCopyWithImpl<$Res, $Val extends CashMachineEvent>
    implements $CashMachineEventCopyWith<$Res> {
  _$CashMachineEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashMachineEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashMachineEventTryToGetCacheImplCopyWith<$Res>
    implements $CashMachineEventCopyWith<$Res> {
  factory _$$CashMachineEventTryToGetCacheImplCopyWith(
          _$CashMachineEventTryToGetCacheImpl value,
          $Res Function(_$CashMachineEventTryToGetCacheImpl) then) =
      __$$CashMachineEventTryToGetCacheImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount});
}

/// @nodoc
class __$$CashMachineEventTryToGetCacheImplCopyWithImpl<$Res>
    extends _$CashMachineEventCopyWithImpl<$Res,
        _$CashMachineEventTryToGetCacheImpl>
    implements _$$CashMachineEventTryToGetCacheImplCopyWith<$Res> {
  __$$CashMachineEventTryToGetCacheImplCopyWithImpl(
      _$CashMachineEventTryToGetCacheImpl _value,
      $Res Function(_$CashMachineEventTryToGetCacheImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashMachineEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$CashMachineEventTryToGetCacheImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CashMachineEventTryToGetCacheImpl
    implements _CashMachineEventTryToGetCache {
  const _$CashMachineEventTryToGetCacheImpl(this.amount);

  @override
  final int amount;

  @override
  String toString() {
    return 'CashMachineEvent.tryToGetCache(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashMachineEventTryToGetCacheImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  /// Create a copy of CashMachineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashMachineEventTryToGetCacheImplCopyWith<
          _$CashMachineEventTryToGetCacheImpl>
      get copyWith => __$$CashMachineEventTryToGetCacheImplCopyWithImpl<
          _$CashMachineEventTryToGetCacheImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int amount) tryToGetCache,
  }) {
    return tryToGetCache(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int amount)? tryToGetCache,
  }) {
    return tryToGetCache?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int amount)? tryToGetCache,
    required TResult orElse(),
  }) {
    if (tryToGetCache != null) {
      return tryToGetCache(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CashMachineEventTryToGetCache value)
        tryToGetCache,
  }) {
    return tryToGetCache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CashMachineEventTryToGetCache value)? tryToGetCache,
  }) {
    return tryToGetCache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CashMachineEventTryToGetCache value)? tryToGetCache,
    required TResult orElse(),
  }) {
    if (tryToGetCache != null) {
      return tryToGetCache(this);
    }
    return orElse();
  }
}

abstract class _CashMachineEventTryToGetCache implements CashMachineEvent {
  const factory _CashMachineEventTryToGetCache(final int amount) =
      _$CashMachineEventTryToGetCacheImpl;

  @override
  int get amount;

  /// Create a copy of CashMachineEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashMachineEventTryToGetCacheImplCopyWith<
          _$CashMachineEventTryToGetCacheImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CashMachineState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CashResultDto result) initial,
    required TResult Function() loading,
    required TResult Function(CashResultDto result) success,
    required TResult Function(CashResultDto result) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CashResultDto result)? initial,
    TResult? Function()? loading,
    TResult? Function(CashResultDto result)? success,
    TResult? Function(CashResultDto result)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CashResultDto result)? initial,
    TResult Function()? loading,
    TResult Function(CashResultDto result)? success,
    TResult Function(CashResultDto result)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CashMachineStateInitial value) initial,
    required TResult Function(_CashMachineStateLoading value) loading,
    required TResult Function(_CashMachineStateSuccess value) success,
    required TResult Function(_CashMachineStateFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CashMachineStateInitial value)? initial,
    TResult? Function(_CashMachineStateLoading value)? loading,
    TResult? Function(_CashMachineStateSuccess value)? success,
    TResult? Function(_CashMachineStateFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CashMachineStateInitial value)? initial,
    TResult Function(_CashMachineStateLoading value)? loading,
    TResult Function(_CashMachineStateSuccess value)? success,
    TResult Function(_CashMachineStateFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashMachineStateCopyWith<$Res> {
  factory $CashMachineStateCopyWith(
          CashMachineState value, $Res Function(CashMachineState) then) =
      _$CashMachineStateCopyWithImpl<$Res, CashMachineState>;
}

/// @nodoc
class _$CashMachineStateCopyWithImpl<$Res, $Val extends CashMachineState>
    implements $CashMachineStateCopyWith<$Res> {
  _$CashMachineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CashMachineStateInitialImplCopyWith<$Res> {
  factory _$$CashMachineStateInitialImplCopyWith(
          _$CashMachineStateInitialImpl value,
          $Res Function(_$CashMachineStateInitialImpl) then) =
      __$$CashMachineStateInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CashResultDto result});
}

/// @nodoc
class __$$CashMachineStateInitialImplCopyWithImpl<$Res>
    extends _$CashMachineStateCopyWithImpl<$Res, _$CashMachineStateInitialImpl>
    implements _$$CashMachineStateInitialImplCopyWith<$Res> {
  __$$CashMachineStateInitialImplCopyWithImpl(
      _$CashMachineStateInitialImpl _value,
      $Res Function(_$CashMachineStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CashMachineStateInitialImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CashResultDto,
    ));
  }
}

/// @nodoc

class _$CashMachineStateInitialImpl implements _CashMachineStateInitial {
  const _$CashMachineStateInitialImpl(this.result);

  @override
  final CashResultDto result;

  @override
  String toString() {
    return 'CashMachineState.initial(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashMachineStateInitialImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashMachineStateInitialImplCopyWith<_$CashMachineStateInitialImpl>
      get copyWith => __$$CashMachineStateInitialImplCopyWithImpl<
          _$CashMachineStateInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CashResultDto result) initial,
    required TResult Function() loading,
    required TResult Function(CashResultDto result) success,
    required TResult Function(CashResultDto result) failure,
  }) {
    return initial(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CashResultDto result)? initial,
    TResult? Function()? loading,
    TResult? Function(CashResultDto result)? success,
    TResult? Function(CashResultDto result)? failure,
  }) {
    return initial?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CashResultDto result)? initial,
    TResult Function()? loading,
    TResult Function(CashResultDto result)? success,
    TResult Function(CashResultDto result)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CashMachineStateInitial value) initial,
    required TResult Function(_CashMachineStateLoading value) loading,
    required TResult Function(_CashMachineStateSuccess value) success,
    required TResult Function(_CashMachineStateFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CashMachineStateInitial value)? initial,
    TResult? Function(_CashMachineStateLoading value)? loading,
    TResult? Function(_CashMachineStateSuccess value)? success,
    TResult? Function(_CashMachineStateFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CashMachineStateInitial value)? initial,
    TResult Function(_CashMachineStateLoading value)? loading,
    TResult Function(_CashMachineStateSuccess value)? success,
    TResult Function(_CashMachineStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _CashMachineStateInitial implements CashMachineState {
  const factory _CashMachineStateInitial(final CashResultDto result) =
      _$CashMachineStateInitialImpl;

  CashResultDto get result;

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashMachineStateInitialImplCopyWith<_$CashMachineStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CashMachineStateLoadingImplCopyWith<$Res> {
  factory _$$CashMachineStateLoadingImplCopyWith(
          _$CashMachineStateLoadingImpl value,
          $Res Function(_$CashMachineStateLoadingImpl) then) =
      __$$CashMachineStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CashMachineStateLoadingImplCopyWithImpl<$Res>
    extends _$CashMachineStateCopyWithImpl<$Res, _$CashMachineStateLoadingImpl>
    implements _$$CashMachineStateLoadingImplCopyWith<$Res> {
  __$$CashMachineStateLoadingImplCopyWithImpl(
      _$CashMachineStateLoadingImpl _value,
      $Res Function(_$CashMachineStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CashMachineStateLoadingImpl implements _CashMachineStateLoading {
  const _$CashMachineStateLoadingImpl();

  @override
  String toString() {
    return 'CashMachineState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashMachineStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CashResultDto result) initial,
    required TResult Function() loading,
    required TResult Function(CashResultDto result) success,
    required TResult Function(CashResultDto result) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CashResultDto result)? initial,
    TResult? Function()? loading,
    TResult? Function(CashResultDto result)? success,
    TResult? Function(CashResultDto result)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CashResultDto result)? initial,
    TResult Function()? loading,
    TResult Function(CashResultDto result)? success,
    TResult Function(CashResultDto result)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CashMachineStateInitial value) initial,
    required TResult Function(_CashMachineStateLoading value) loading,
    required TResult Function(_CashMachineStateSuccess value) success,
    required TResult Function(_CashMachineStateFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CashMachineStateInitial value)? initial,
    TResult? Function(_CashMachineStateLoading value)? loading,
    TResult? Function(_CashMachineStateSuccess value)? success,
    TResult? Function(_CashMachineStateFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CashMachineStateInitial value)? initial,
    TResult Function(_CashMachineStateLoading value)? loading,
    TResult Function(_CashMachineStateSuccess value)? success,
    TResult Function(_CashMachineStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CashMachineStateLoading implements CashMachineState {
  const factory _CashMachineStateLoading() = _$CashMachineStateLoadingImpl;
}

/// @nodoc
abstract class _$$CashMachineStateSuccessImplCopyWith<$Res> {
  factory _$$CashMachineStateSuccessImplCopyWith(
          _$CashMachineStateSuccessImpl value,
          $Res Function(_$CashMachineStateSuccessImpl) then) =
      __$$CashMachineStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CashResultDto result});
}

/// @nodoc
class __$$CashMachineStateSuccessImplCopyWithImpl<$Res>
    extends _$CashMachineStateCopyWithImpl<$Res, _$CashMachineStateSuccessImpl>
    implements _$$CashMachineStateSuccessImplCopyWith<$Res> {
  __$$CashMachineStateSuccessImplCopyWithImpl(
      _$CashMachineStateSuccessImpl _value,
      $Res Function(_$CashMachineStateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CashMachineStateSuccessImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CashResultDto,
    ));
  }
}

/// @nodoc

class _$CashMachineStateSuccessImpl implements _CashMachineStateSuccess {
  const _$CashMachineStateSuccessImpl(this.result);

  @override
  final CashResultDto result;

  @override
  String toString() {
    return 'CashMachineState.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashMachineStateSuccessImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashMachineStateSuccessImplCopyWith<_$CashMachineStateSuccessImpl>
      get copyWith => __$$CashMachineStateSuccessImplCopyWithImpl<
          _$CashMachineStateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CashResultDto result) initial,
    required TResult Function() loading,
    required TResult Function(CashResultDto result) success,
    required TResult Function(CashResultDto result) failure,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CashResultDto result)? initial,
    TResult? Function()? loading,
    TResult? Function(CashResultDto result)? success,
    TResult? Function(CashResultDto result)? failure,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CashResultDto result)? initial,
    TResult Function()? loading,
    TResult Function(CashResultDto result)? success,
    TResult Function(CashResultDto result)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CashMachineStateInitial value) initial,
    required TResult Function(_CashMachineStateLoading value) loading,
    required TResult Function(_CashMachineStateSuccess value) success,
    required TResult Function(_CashMachineStateFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CashMachineStateInitial value)? initial,
    TResult? Function(_CashMachineStateLoading value)? loading,
    TResult? Function(_CashMachineStateSuccess value)? success,
    TResult? Function(_CashMachineStateFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CashMachineStateInitial value)? initial,
    TResult Function(_CashMachineStateLoading value)? loading,
    TResult Function(_CashMachineStateSuccess value)? success,
    TResult Function(_CashMachineStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _CashMachineStateSuccess implements CashMachineState {
  const factory _CashMachineStateSuccess(final CashResultDto result) =
      _$CashMachineStateSuccessImpl;

  CashResultDto get result;

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashMachineStateSuccessImplCopyWith<_$CashMachineStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CashMachineStateFailureImplCopyWith<$Res> {
  factory _$$CashMachineStateFailureImplCopyWith(
          _$CashMachineStateFailureImpl value,
          $Res Function(_$CashMachineStateFailureImpl) then) =
      __$$CashMachineStateFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CashResultDto result});
}

/// @nodoc
class __$$CashMachineStateFailureImplCopyWithImpl<$Res>
    extends _$CashMachineStateCopyWithImpl<$Res, _$CashMachineStateFailureImpl>
    implements _$$CashMachineStateFailureImplCopyWith<$Res> {
  __$$CashMachineStateFailureImplCopyWithImpl(
      _$CashMachineStateFailureImpl _value,
      $Res Function(_$CashMachineStateFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CashMachineStateFailureImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CashResultDto,
    ));
  }
}

/// @nodoc

class _$CashMachineStateFailureImpl implements _CashMachineStateFailure {
  const _$CashMachineStateFailureImpl(this.result);

  @override
  final CashResultDto result;

  @override
  String toString() {
    return 'CashMachineState.failure(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashMachineStateFailureImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashMachineStateFailureImplCopyWith<_$CashMachineStateFailureImpl>
      get copyWith => __$$CashMachineStateFailureImplCopyWithImpl<
          _$CashMachineStateFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CashResultDto result) initial,
    required TResult Function() loading,
    required TResult Function(CashResultDto result) success,
    required TResult Function(CashResultDto result) failure,
  }) {
    return failure(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CashResultDto result)? initial,
    TResult? Function()? loading,
    TResult? Function(CashResultDto result)? success,
    TResult? Function(CashResultDto result)? failure,
  }) {
    return failure?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CashResultDto result)? initial,
    TResult Function()? loading,
    TResult Function(CashResultDto result)? success,
    TResult Function(CashResultDto result)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CashMachineStateInitial value) initial,
    required TResult Function(_CashMachineStateLoading value) loading,
    required TResult Function(_CashMachineStateSuccess value) success,
    required TResult Function(_CashMachineStateFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CashMachineStateInitial value)? initial,
    TResult? Function(_CashMachineStateLoading value)? loading,
    TResult? Function(_CashMachineStateSuccess value)? success,
    TResult? Function(_CashMachineStateFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CashMachineStateInitial value)? initial,
    TResult Function(_CashMachineStateLoading value)? loading,
    TResult Function(_CashMachineStateSuccess value)? success,
    TResult Function(_CashMachineStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _CashMachineStateFailure implements CashMachineState {
  const factory _CashMachineStateFailure(final CashResultDto result) =
      _$CashMachineStateFailureImpl;

  CashResultDto get result;

  /// Create a copy of CashMachineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashMachineStateFailureImplCopyWith<_$CashMachineStateFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
