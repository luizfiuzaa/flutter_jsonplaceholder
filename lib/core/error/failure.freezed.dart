// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() noConnection,
    required TResult Function(int? statusCode, String? body) server,
    required TResult Function(String details) serialization,
    required TResult Function(String details) cache,
    required TResult Function(Map<String, String> fieldErrors) validation,
    required TResult Function(String details) unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? noConnection,
    TResult? Function(int? statusCode, String? body)? server,
    TResult? Function(String details)? serialization,
    TResult? Function(String details)? cache,
    TResult? Function(Map<String, String> fieldErrors)? validation,
    TResult? Function(String details)? unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? noConnection,
    TResult Function(int? statusCode, String? body)? server,
    TResult Function(String details)? serialization,
    TResult Function(String details)? cache,
    TResult Function(Map<String, String> fieldErrors)? validation,
    TResult Function(String details)? unexpected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerFailure value) server,
    required TResult Function(SerializationFailure value) serialization,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(SerializationFailure value)? serialization,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerFailure value)? server,
    TResult Function(SerializationFailure value)? serialization,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TimeoutFailureImplCopyWith<$Res> {
  factory _$$TimeoutFailureImplCopyWith(
    _$TimeoutFailureImpl value,
    $Res Function(_$TimeoutFailureImpl) then,
  ) = __$$TimeoutFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimeoutFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$TimeoutFailureImpl>
    implements _$$TimeoutFailureImplCopyWith<$Res> {
  __$$TimeoutFailureImplCopyWithImpl(
    _$TimeoutFailureImpl _value,
    $Res Function(_$TimeoutFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimeoutFailureImpl extends TimeoutFailure {
  const _$TimeoutFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimeoutFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() noConnection,
    required TResult Function(int? statusCode, String? body) server,
    required TResult Function(String details) serialization,
    required TResult Function(String details) cache,
    required TResult Function(Map<String, String> fieldErrors) validation,
    required TResult Function(String details) unexpected,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? noConnection,
    TResult? Function(int? statusCode, String? body)? server,
    TResult? Function(String details)? serialization,
    TResult? Function(String details)? cache,
    TResult? Function(Map<String, String> fieldErrors)? validation,
    TResult? Function(String details)? unexpected,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? noConnection,
    TResult Function(int? statusCode, String? body)? server,
    TResult Function(String details)? serialization,
    TResult Function(String details)? cache,
    TResult Function(Map<String, String> fieldErrors)? validation,
    TResult Function(String details)? unexpected,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerFailure value) server,
    required TResult Function(SerializationFailure value) serialization,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(SerializationFailure value)? serialization,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerFailure value)? server,
    TResult Function(SerializationFailure value)? serialization,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class TimeoutFailure extends Failure {
  const factory TimeoutFailure() = _$TimeoutFailureImpl;
  const TimeoutFailure._() : super._();
}

/// @nodoc
abstract class _$$NoConnectionFailureImplCopyWith<$Res> {
  factory _$$NoConnectionFailureImplCopyWith(
    _$NoConnectionFailureImpl value,
    $Res Function(_$NoConnectionFailureImpl) then,
  ) = __$$NoConnectionFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoConnectionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NoConnectionFailureImpl>
    implements _$$NoConnectionFailureImplCopyWith<$Res> {
  __$$NoConnectionFailureImplCopyWithImpl(
    _$NoConnectionFailureImpl _value,
    $Res Function(_$NoConnectionFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoConnectionFailureImpl extends NoConnectionFailure {
  const _$NoConnectionFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoConnectionFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() noConnection,
    required TResult Function(int? statusCode, String? body) server,
    required TResult Function(String details) serialization,
    required TResult Function(String details) cache,
    required TResult Function(Map<String, String> fieldErrors) validation,
    required TResult Function(String details) unexpected,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? noConnection,
    TResult? Function(int? statusCode, String? body)? server,
    TResult? Function(String details)? serialization,
    TResult? Function(String details)? cache,
    TResult? Function(Map<String, String> fieldErrors)? validation,
    TResult? Function(String details)? unexpected,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? noConnection,
    TResult Function(int? statusCode, String? body)? server,
    TResult Function(String details)? serialization,
    TResult Function(String details)? cache,
    TResult Function(Map<String, String> fieldErrors)? validation,
    TResult Function(String details)? unexpected,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerFailure value) server,
    required TResult Function(SerializationFailure value) serialization,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(SerializationFailure value)? serialization,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerFailure value)? server,
    TResult Function(SerializationFailure value)? serialization,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnectionFailure extends Failure {
  const factory NoConnectionFailure() = _$NoConnectionFailureImpl;
  const NoConnectionFailure._() : super._();
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
    _$ServerFailureImpl value,
    $Res Function(_$ServerFailureImpl) then,
  ) = __$$ServerFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? statusCode, String? body});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
    _$ServerFailureImpl _value,
    $Res Function(_$ServerFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? statusCode = freezed, Object? body = freezed}) {
    return _then(
      _$ServerFailureImpl(
        statusCode: freezed == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        body: freezed == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ServerFailureImpl extends ServerFailure {
  const _$ServerFailureImpl({this.statusCode, this.body}) : super._();

  @override
  final int? statusCode;
  @override
  final String? body;

  @override
  String toString() {
    return 'Failure.server(statusCode: $statusCode, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, body);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() noConnection,
    required TResult Function(int? statusCode, String? body) server,
    required TResult Function(String details) serialization,
    required TResult Function(String details) cache,
    required TResult Function(Map<String, String> fieldErrors) validation,
    required TResult Function(String details) unexpected,
  }) {
    return server(statusCode, body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? noConnection,
    TResult? Function(int? statusCode, String? body)? server,
    TResult? Function(String details)? serialization,
    TResult? Function(String details)? cache,
    TResult? Function(Map<String, String> fieldErrors)? validation,
    TResult? Function(String details)? unexpected,
  }) {
    return server?.call(statusCode, body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? noConnection,
    TResult Function(int? statusCode, String? body)? server,
    TResult Function(String details)? serialization,
    TResult Function(String details)? cache,
    TResult Function(Map<String, String> fieldErrors)? validation,
    TResult Function(String details)? unexpected,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(statusCode, body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerFailure value) server,
    required TResult Function(SerializationFailure value) serialization,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(SerializationFailure value)? serialization,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerFailure value)? server,
    TResult Function(SerializationFailure value)? serialization,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure extends Failure {
  const factory ServerFailure({final int? statusCode, final String? body}) =
      _$ServerFailureImpl;
  const ServerFailure._() : super._();

  int? get statusCode;
  String? get body;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SerializationFailureImplCopyWith<$Res> {
  factory _$$SerializationFailureImplCopyWith(
    _$SerializationFailureImpl value,
    $Res Function(_$SerializationFailureImpl) then,
  ) = __$$SerializationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String details});
}

/// @nodoc
class __$$SerializationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$SerializationFailureImpl>
    implements _$$SerializationFailureImplCopyWith<$Res> {
  __$$SerializationFailureImplCopyWithImpl(
    _$SerializationFailureImpl _value,
    $Res Function(_$SerializationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? details = null}) {
    return _then(
      _$SerializationFailureImpl(
        null == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SerializationFailureImpl extends SerializationFailure {
  const _$SerializationFailureImpl(this.details) : super._();

  @override
  final String details;

  @override
  String toString() {
    return 'Failure.serialization(details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SerializationFailureImpl &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SerializationFailureImplCopyWith<_$SerializationFailureImpl>
  get copyWith =>
      __$$SerializationFailureImplCopyWithImpl<_$SerializationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() noConnection,
    required TResult Function(int? statusCode, String? body) server,
    required TResult Function(String details) serialization,
    required TResult Function(String details) cache,
    required TResult Function(Map<String, String> fieldErrors) validation,
    required TResult Function(String details) unexpected,
  }) {
    return serialization(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? noConnection,
    TResult? Function(int? statusCode, String? body)? server,
    TResult? Function(String details)? serialization,
    TResult? Function(String details)? cache,
    TResult? Function(Map<String, String> fieldErrors)? validation,
    TResult? Function(String details)? unexpected,
  }) {
    return serialization?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? noConnection,
    TResult Function(int? statusCode, String? body)? server,
    TResult Function(String details)? serialization,
    TResult Function(String details)? cache,
    TResult Function(Map<String, String> fieldErrors)? validation,
    TResult Function(String details)? unexpected,
    required TResult orElse(),
  }) {
    if (serialization != null) {
      return serialization(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerFailure value) server,
    required TResult Function(SerializationFailure value) serialization,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return serialization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(SerializationFailure value)? serialization,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return serialization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerFailure value)? server,
    TResult Function(SerializationFailure value)? serialization,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (serialization != null) {
      return serialization(this);
    }
    return orElse();
  }
}

abstract class SerializationFailure extends Failure {
  const factory SerializationFailure(final String details) =
      _$SerializationFailureImpl;
  const SerializationFailure._() : super._();

  String get details;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SerializationFailureImplCopyWith<_$SerializationFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheFailureImplCopyWith<$Res> {
  factory _$$CacheFailureImplCopyWith(
    _$CacheFailureImpl value,
    $Res Function(_$CacheFailureImpl) then,
  ) = __$$CacheFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String details});
}

/// @nodoc
class __$$CacheFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CacheFailureImpl>
    implements _$$CacheFailureImplCopyWith<$Res> {
  __$$CacheFailureImplCopyWithImpl(
    _$CacheFailureImpl _value,
    $Res Function(_$CacheFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? details = null}) {
    return _then(
      _$CacheFailureImpl(
        null == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CacheFailureImpl extends CacheFailure {
  const _$CacheFailureImpl(this.details) : super._();

  @override
  final String details;

  @override
  String toString() {
    return 'Failure.cache(details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheFailureImpl &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      __$$CacheFailureImplCopyWithImpl<_$CacheFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() noConnection,
    required TResult Function(int? statusCode, String? body) server,
    required TResult Function(String details) serialization,
    required TResult Function(String details) cache,
    required TResult Function(Map<String, String> fieldErrors) validation,
    required TResult Function(String details) unexpected,
  }) {
    return cache(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? noConnection,
    TResult? Function(int? statusCode, String? body)? server,
    TResult? Function(String details)? serialization,
    TResult? Function(String details)? cache,
    TResult? Function(Map<String, String> fieldErrors)? validation,
    TResult? Function(String details)? unexpected,
  }) {
    return cache?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? noConnection,
    TResult Function(int? statusCode, String? body)? server,
    TResult Function(String details)? serialization,
    TResult Function(String details)? cache,
    TResult Function(Map<String, String> fieldErrors)? validation,
    TResult Function(String details)? unexpected,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerFailure value) server,
    required TResult Function(SerializationFailure value) serialization,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(SerializationFailure value)? serialization,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerFailure value)? server,
    TResult Function(SerializationFailure value)? serialization,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheFailure extends Failure {
  const factory CacheFailure(final String details) = _$CacheFailureImpl;
  const CacheFailure._() : super._();

  String get details;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(
    _$ValidationFailureImpl value,
    $Res Function(_$ValidationFailureImpl) then,
  ) = __$$ValidationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, String> fieldErrors});
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(
    _$ValidationFailureImpl _value,
    $Res Function(_$ValidationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fieldErrors = null}) {
    return _then(
      _$ValidationFailureImpl(
        null == fieldErrors
            ? _value._fieldErrors
            : fieldErrors // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
      ),
    );
  }
}

/// @nodoc

class _$ValidationFailureImpl extends ValidationFailure {
  const _$ValidationFailureImpl(final Map<String, String> fieldErrors)
    : _fieldErrors = fieldErrors,
      super._();

  final Map<String, String> _fieldErrors;
  @override
  Map<String, String> get fieldErrors {
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fieldErrors);
  }

  @override
  String toString() {
    return 'Failure.validation(fieldErrors: $fieldErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            const DeepCollectionEquality().equals(
              other._fieldErrors,
              _fieldErrors,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_fieldErrors),
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() noConnection,
    required TResult Function(int? statusCode, String? body) server,
    required TResult Function(String details) serialization,
    required TResult Function(String details) cache,
    required TResult Function(Map<String, String> fieldErrors) validation,
    required TResult Function(String details) unexpected,
  }) {
    return validation(fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? noConnection,
    TResult? Function(int? statusCode, String? body)? server,
    TResult? Function(String details)? serialization,
    TResult? Function(String details)? cache,
    TResult? Function(Map<String, String> fieldErrors)? validation,
    TResult? Function(String details)? unexpected,
  }) {
    return validation?.call(fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? noConnection,
    TResult Function(int? statusCode, String? body)? server,
    TResult Function(String details)? serialization,
    TResult Function(String details)? cache,
    TResult Function(Map<String, String> fieldErrors)? validation,
    TResult Function(String details)? unexpected,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(fieldErrors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerFailure value) server,
    required TResult Function(SerializationFailure value) serialization,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(SerializationFailure value)? serialization,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerFailure value)? server,
    TResult Function(SerializationFailure value)? serialization,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure extends Failure {
  const factory ValidationFailure(final Map<String, String> fieldErrors) =
      _$ValidationFailureImpl;
  const ValidationFailure._() : super._();

  Map<String, String> get fieldErrors;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(
    _$UnexpectedFailureImpl value,
    $Res Function(_$UnexpectedFailureImpl) then,
  ) = __$$UnexpectedFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String details});
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(
    _$UnexpectedFailureImpl _value,
    $Res Function(_$UnexpectedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? details = null}) {
    return _then(
      _$UnexpectedFailureImpl(
        null == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UnexpectedFailureImpl extends UnexpectedFailure {
  const _$UnexpectedFailureImpl(this.details) : super._();

  @override
  final String details;

  @override
  String toString() {
    return 'Failure.unexpected(details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedFailureImpl &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      __$$UnexpectedFailureImplCopyWithImpl<_$UnexpectedFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() noConnection,
    required TResult Function(int? statusCode, String? body) server,
    required TResult Function(String details) serialization,
    required TResult Function(String details) cache,
    required TResult Function(Map<String, String> fieldErrors) validation,
    required TResult Function(String details) unexpected,
  }) {
    return unexpected(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? noConnection,
    TResult? Function(int? statusCode, String? body)? server,
    TResult? Function(String details)? serialization,
    TResult? Function(String details)? cache,
    TResult? Function(Map<String, String> fieldErrors)? validation,
    TResult? Function(String details)? unexpected,
  }) {
    return unexpected?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? noConnection,
    TResult Function(int? statusCode, String? body)? server,
    TResult Function(String details)? serialization,
    TResult Function(String details)? cache,
    TResult Function(Map<String, String> fieldErrors)? validation,
    TResult Function(String details)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerFailure value) server,
    required TResult Function(SerializationFailure value) serialization,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(SerializationFailure value)? serialization,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerFailure value)? server,
    TResult Function(SerializationFailure value)? serialization,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure extends Failure {
  const factory UnexpectedFailure(final String details) =
      _$UnexpectedFailureImpl;
  const UnexpectedFailure._() : super._();

  String get details;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
