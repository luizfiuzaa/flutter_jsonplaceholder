// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostFormState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() editing,
    required TResult Function() submitting,
    required TResult Function(Post post) success,
    required TResult Function(Failure failure) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? editing,
    TResult? Function()? submitting,
    TResult? Function(Post post)? success,
    TResult? Function(Failure failure)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? editing,
    TResult Function()? submitting,
    TResult Function(Post post)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostFormEditing value) editing,
    required TResult Function(PostFormSubmitting value) submitting,
    required TResult Function(PostFormSuccess value) success,
    required TResult Function(PostFormFailure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostFormEditing value)? editing,
    TResult? Function(PostFormSubmitting value)? submitting,
    TResult? Function(PostFormSuccess value)? success,
    TResult? Function(PostFormFailure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostFormEditing value)? editing,
    TResult Function(PostFormSubmitting value)? submitting,
    TResult Function(PostFormSuccess value)? success,
    TResult Function(PostFormFailure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFormStateCopyWith<$Res> {
  factory $PostFormStateCopyWith(
    PostFormState value,
    $Res Function(PostFormState) then,
  ) = _$PostFormStateCopyWithImpl<$Res, PostFormState>;
}

/// @nodoc
class _$PostFormStateCopyWithImpl<$Res, $Val extends PostFormState>
    implements $PostFormStateCopyWith<$Res> {
  _$PostFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PostFormEditingImplCopyWith<$Res> {
  factory _$$PostFormEditingImplCopyWith(
    _$PostFormEditingImpl value,
    $Res Function(_$PostFormEditingImpl) then,
  ) = __$$PostFormEditingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostFormEditingImplCopyWithImpl<$Res>
    extends _$PostFormStateCopyWithImpl<$Res, _$PostFormEditingImpl>
    implements _$$PostFormEditingImplCopyWith<$Res> {
  __$$PostFormEditingImplCopyWithImpl(
    _$PostFormEditingImpl _value,
    $Res Function(_$PostFormEditingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostFormEditingImpl extends PostFormEditing {
  const _$PostFormEditingImpl() : super._();

  @override
  String toString() {
    return 'PostFormState.editing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostFormEditingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() editing,
    required TResult Function() submitting,
    required TResult Function(Post post) success,
    required TResult Function(Failure failure) failure,
  }) {
    return editing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? editing,
    TResult? Function()? submitting,
    TResult? Function(Post post)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return editing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? editing,
    TResult Function()? submitting,
    TResult Function(Post post)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostFormEditing value) editing,
    required TResult Function(PostFormSubmitting value) submitting,
    required TResult Function(PostFormSuccess value) success,
    required TResult Function(PostFormFailure value) failure,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostFormEditing value)? editing,
    TResult? Function(PostFormSubmitting value)? submitting,
    TResult? Function(PostFormSuccess value)? success,
    TResult? Function(PostFormFailure value)? failure,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostFormEditing value)? editing,
    TResult Function(PostFormSubmitting value)? submitting,
    TResult Function(PostFormSuccess value)? success,
    TResult Function(PostFormFailure value)? failure,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class PostFormEditing extends PostFormState {
  const factory PostFormEditing() = _$PostFormEditingImpl;
  const PostFormEditing._() : super._();
}

/// @nodoc
abstract class _$$PostFormSubmittingImplCopyWith<$Res> {
  factory _$$PostFormSubmittingImplCopyWith(
    _$PostFormSubmittingImpl value,
    $Res Function(_$PostFormSubmittingImpl) then,
  ) = __$$PostFormSubmittingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostFormSubmittingImplCopyWithImpl<$Res>
    extends _$PostFormStateCopyWithImpl<$Res, _$PostFormSubmittingImpl>
    implements _$$PostFormSubmittingImplCopyWith<$Res> {
  __$$PostFormSubmittingImplCopyWithImpl(
    _$PostFormSubmittingImpl _value,
    $Res Function(_$PostFormSubmittingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostFormSubmittingImpl extends PostFormSubmitting {
  const _$PostFormSubmittingImpl() : super._();

  @override
  String toString() {
    return 'PostFormState.submitting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostFormSubmittingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() editing,
    required TResult Function() submitting,
    required TResult Function(Post post) success,
    required TResult Function(Failure failure) failure,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? editing,
    TResult? Function()? submitting,
    TResult? Function(Post post)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? editing,
    TResult Function()? submitting,
    TResult Function(Post post)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostFormEditing value) editing,
    required TResult Function(PostFormSubmitting value) submitting,
    required TResult Function(PostFormSuccess value) success,
    required TResult Function(PostFormFailure value) failure,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostFormEditing value)? editing,
    TResult? Function(PostFormSubmitting value)? submitting,
    TResult? Function(PostFormSuccess value)? success,
    TResult? Function(PostFormFailure value)? failure,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostFormEditing value)? editing,
    TResult Function(PostFormSubmitting value)? submitting,
    TResult Function(PostFormSuccess value)? success,
    TResult Function(PostFormFailure value)? failure,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class PostFormSubmitting extends PostFormState {
  const factory PostFormSubmitting() = _$PostFormSubmittingImpl;
  const PostFormSubmitting._() : super._();
}

/// @nodoc
abstract class _$$PostFormSuccessImplCopyWith<$Res> {
  factory _$$PostFormSuccessImplCopyWith(
    _$PostFormSuccessImpl value,
    $Res Function(_$PostFormSuccessImpl) then,
  ) = __$$PostFormSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Post post});

  $PostCopyWith<$Res> get post;
}

/// @nodoc
class __$$PostFormSuccessImplCopyWithImpl<$Res>
    extends _$PostFormStateCopyWithImpl<$Res, _$PostFormSuccessImpl>
    implements _$$PostFormSuccessImplCopyWith<$Res> {
  __$$PostFormSuccessImplCopyWithImpl(
    _$PostFormSuccessImpl _value,
    $Res Function(_$PostFormSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? post = null}) {
    return _then(
      _$PostFormSuccessImpl(
        null == post
            ? _value.post
            : post // ignore: cast_nullable_to_non_nullable
                  as Post,
      ),
    );
  }

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value));
    });
  }
}

/// @nodoc

class _$PostFormSuccessImpl extends PostFormSuccess {
  const _$PostFormSuccessImpl(this.post) : super._();

  @override
  final Post post;

  @override
  String toString() {
    return 'PostFormState.success(post: $post)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFormSuccessImpl &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFormSuccessImplCopyWith<_$PostFormSuccessImpl> get copyWith =>
      __$$PostFormSuccessImplCopyWithImpl<_$PostFormSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() editing,
    required TResult Function() submitting,
    required TResult Function(Post post) success,
    required TResult Function(Failure failure) failure,
  }) {
    return success(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? editing,
    TResult? Function()? submitting,
    TResult? Function(Post post)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return success?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? editing,
    TResult Function()? submitting,
    TResult Function(Post post)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostFormEditing value) editing,
    required TResult Function(PostFormSubmitting value) submitting,
    required TResult Function(PostFormSuccess value) success,
    required TResult Function(PostFormFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostFormEditing value)? editing,
    TResult? Function(PostFormSubmitting value)? submitting,
    TResult? Function(PostFormSuccess value)? success,
    TResult? Function(PostFormFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostFormEditing value)? editing,
    TResult Function(PostFormSubmitting value)? submitting,
    TResult Function(PostFormSuccess value)? success,
    TResult Function(PostFormFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PostFormSuccess extends PostFormState {
  const factory PostFormSuccess(final Post post) = _$PostFormSuccessImpl;
  const PostFormSuccess._() : super._();

  Post get post;

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostFormSuccessImplCopyWith<_$PostFormSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostFormFailureImplCopyWith<$Res> {
  factory _$$PostFormFailureImplCopyWith(
    _$PostFormFailureImpl value,
    $Res Function(_$PostFormFailureImpl) then,
  ) = __$$PostFormFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$PostFormFailureImplCopyWithImpl<$Res>
    extends _$PostFormStateCopyWithImpl<$Res, _$PostFormFailureImpl>
    implements _$$PostFormFailureImplCopyWith<$Res> {
  __$$PostFormFailureImplCopyWithImpl(
    _$PostFormFailureImpl _value,
    $Res Function(_$PostFormFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? failure = null}) {
    return _then(
      _$PostFormFailureImpl(
        null == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as Failure,
      ),
    );
  }

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$PostFormFailureImpl extends PostFormFailure {
  const _$PostFormFailureImpl(this.failure) : super._();

  @override
  final Failure failure;

  @override
  String toString() {
    return 'PostFormState.failure(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFormFailureImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFormFailureImplCopyWith<_$PostFormFailureImpl> get copyWith =>
      __$$PostFormFailureImplCopyWithImpl<_$PostFormFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() editing,
    required TResult Function() submitting,
    required TResult Function(Post post) success,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? editing,
    TResult? Function()? submitting,
    TResult? Function(Post post)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? editing,
    TResult Function()? submitting,
    TResult Function(Post post)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostFormEditing value) editing,
    required TResult Function(PostFormSubmitting value) submitting,
    required TResult Function(PostFormSuccess value) success,
    required TResult Function(PostFormFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostFormEditing value)? editing,
    TResult? Function(PostFormSubmitting value)? submitting,
    TResult? Function(PostFormSuccess value)? success,
    TResult? Function(PostFormFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostFormEditing value)? editing,
    TResult Function(PostFormSubmitting value)? submitting,
    TResult Function(PostFormSuccess value)? success,
    TResult Function(PostFormFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PostFormFailure extends PostFormState {
  const factory PostFormFailure(final Failure failure) = _$PostFormFailureImpl;
  const PostFormFailure._() : super._();

  Failure get failure;

  /// Create a copy of PostFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostFormFailureImplCopyWith<_$PostFormFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
