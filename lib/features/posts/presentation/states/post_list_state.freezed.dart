// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )
    loaded,
    required TResult Function(Failure failure) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult? Function(Failure failure)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostListInitial value) initial,
    required TResult Function(PostListLoading value) loading,
    required TResult Function(PostListLoaded value) loaded,
    required TResult Function(PostListError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostListInitial value)? initial,
    TResult? Function(PostListLoading value)? loading,
    TResult? Function(PostListLoaded value)? loaded,
    TResult? Function(PostListError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostListInitial value)? initial,
    TResult Function(PostListLoading value)? loading,
    TResult Function(PostListLoaded value)? loaded,
    TResult Function(PostListError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListStateCopyWith<$Res> {
  factory $PostListStateCopyWith(
    PostListState value,
    $Res Function(PostListState) then,
  ) = _$PostListStateCopyWithImpl<$Res, PostListState>;
}

/// @nodoc
class _$PostListStateCopyWithImpl<$Res, $Val extends PostListState>
    implements $PostListStateCopyWith<$Res> {
  _$PostListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PostListInitialImplCopyWith<$Res> {
  factory _$$PostListInitialImplCopyWith(
    _$PostListInitialImpl value,
    $Res Function(_$PostListInitialImpl) then,
  ) = __$$PostListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostListInitialImplCopyWithImpl<$Res>
    extends _$PostListStateCopyWithImpl<$Res, _$PostListInitialImpl>
    implements _$$PostListInitialImplCopyWith<$Res> {
  __$$PostListInitialImplCopyWithImpl(
    _$PostListInitialImpl _value,
    $Res Function(_$PostListInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostListInitialImpl extends PostListInitial {
  const _$PostListInitialImpl() : super._();

  @override
  String toString() {
    return 'PostListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )
    loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostListInitial value) initial,
    required TResult Function(PostListLoading value) loading,
    required TResult Function(PostListLoaded value) loaded,
    required TResult Function(PostListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostListInitial value)? initial,
    TResult? Function(PostListLoading value)? loading,
    TResult? Function(PostListLoaded value)? loaded,
    TResult? Function(PostListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostListInitial value)? initial,
    TResult Function(PostListLoading value)? loading,
    TResult Function(PostListLoaded value)? loaded,
    TResult Function(PostListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PostListInitial extends PostListState {
  const factory PostListInitial() = _$PostListInitialImpl;
  const PostListInitial._() : super._();
}

/// @nodoc
abstract class _$$PostListLoadingImplCopyWith<$Res> {
  factory _$$PostListLoadingImplCopyWith(
    _$PostListLoadingImpl value,
    $Res Function(_$PostListLoadingImpl) then,
  ) = __$$PostListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostListLoadingImplCopyWithImpl<$Res>
    extends _$PostListStateCopyWithImpl<$Res, _$PostListLoadingImpl>
    implements _$$PostListLoadingImplCopyWith<$Res> {
  __$$PostListLoadingImplCopyWithImpl(
    _$PostListLoadingImpl _value,
    $Res Function(_$PostListLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostListLoadingImpl extends PostListLoading {
  const _$PostListLoadingImpl() : super._();

  @override
  String toString() {
    return 'PostListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )
    loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult Function(Failure failure)? error,
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
    required TResult Function(PostListInitial value) initial,
    required TResult Function(PostListLoading value) loading,
    required TResult Function(PostListLoaded value) loaded,
    required TResult Function(PostListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostListInitial value)? initial,
    TResult? Function(PostListLoading value)? loading,
    TResult? Function(PostListLoaded value)? loaded,
    TResult? Function(PostListError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostListInitial value)? initial,
    TResult Function(PostListLoading value)? loading,
    TResult Function(PostListLoaded value)? loaded,
    TResult Function(PostListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PostListLoading extends PostListState {
  const factory PostListLoading() = _$PostListLoadingImpl;
  const PostListLoading._() : super._();
}

/// @nodoc
abstract class _$$PostListLoadedImplCopyWith<$Res> {
  factory _$$PostListLoadedImplCopyWith(
    _$PostListLoadedImpl value,
    $Res Function(_$PostListLoadedImpl) then,
  ) = __$$PostListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Post> posts, bool isRefreshing, Failure? staleFailure});

  $FailureCopyWith<$Res>? get staleFailure;
}

/// @nodoc
class __$$PostListLoadedImplCopyWithImpl<$Res>
    extends _$PostListStateCopyWithImpl<$Res, _$PostListLoadedImpl>
    implements _$$PostListLoadedImplCopyWith<$Res> {
  __$$PostListLoadedImplCopyWithImpl(
    _$PostListLoadedImpl _value,
    $Res Function(_$PostListLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? isRefreshing = null,
    Object? staleFailure = freezed,
  }) {
    return _then(
      _$PostListLoadedImpl(
        posts: null == posts
            ? _value._posts
            : posts // ignore: cast_nullable_to_non_nullable
                  as List<Post>,
        isRefreshing: null == isRefreshing
            ? _value.isRefreshing
            : isRefreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        staleFailure: freezed == staleFailure
            ? _value.staleFailure
            : staleFailure // ignore: cast_nullable_to_non_nullable
                  as Failure?,
      ),
    );
  }

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get staleFailure {
    if (_value.staleFailure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.staleFailure!, (value) {
      return _then(_value.copyWith(staleFailure: value));
    });
  }
}

/// @nodoc

class _$PostListLoadedImpl extends PostListLoaded {
  const _$PostListLoadedImpl({
    required final List<Post> posts,
    this.isRefreshing = false,
    this.staleFailure,
  }) : _posts = posts,
       super._();

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  /// Recarregando por cima de dados já visíveis (pull-to-refresh).
  @override
  @JsonKey()
  final bool isRefreshing;

  /// Preenchido quando os dados vieram do cache após a rede falhar.
  @override
  final Failure? staleFailure;

  @override
  String toString() {
    return 'PostListState.loaded(posts: $posts, isRefreshing: $isRefreshing, staleFailure: $staleFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostListLoadedImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.staleFailure, staleFailure) ||
                other.staleFailure == staleFailure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_posts),
    isRefreshing,
    staleFailure,
  );

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostListLoadedImplCopyWith<_$PostListLoadedImpl> get copyWith =>
      __$$PostListLoadedImplCopyWithImpl<_$PostListLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )
    loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(posts, isRefreshing, staleFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(posts, isRefreshing, staleFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(posts, isRefreshing, staleFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostListInitial value) initial,
    required TResult Function(PostListLoading value) loading,
    required TResult Function(PostListLoaded value) loaded,
    required TResult Function(PostListError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostListInitial value)? initial,
    TResult? Function(PostListLoading value)? loading,
    TResult? Function(PostListLoaded value)? loaded,
    TResult? Function(PostListError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostListInitial value)? initial,
    TResult Function(PostListLoading value)? loading,
    TResult Function(PostListLoaded value)? loaded,
    TResult Function(PostListError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PostListLoaded extends PostListState {
  const factory PostListLoaded({
    required final List<Post> posts,
    final bool isRefreshing,
    final Failure? staleFailure,
  }) = _$PostListLoadedImpl;
  const PostListLoaded._() : super._();

  List<Post> get posts;

  /// Recarregando por cima de dados já visíveis (pull-to-refresh).
  bool get isRefreshing;

  /// Preenchido quando os dados vieram do cache após a rede falhar.
  Failure? get staleFailure;

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostListLoadedImplCopyWith<_$PostListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostListErrorImplCopyWith<$Res> {
  factory _$$PostListErrorImplCopyWith(
    _$PostListErrorImpl value,
    $Res Function(_$PostListErrorImpl) then,
  ) = __$$PostListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$PostListErrorImplCopyWithImpl<$Res>
    extends _$PostListStateCopyWithImpl<$Res, _$PostListErrorImpl>
    implements _$$PostListErrorImplCopyWith<$Res> {
  __$$PostListErrorImplCopyWithImpl(
    _$PostListErrorImpl _value,
    $Res Function(_$PostListErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? failure = null}) {
    return _then(
      _$PostListErrorImpl(
        null == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as Failure,
      ),
    );
  }

  /// Create a copy of PostListState
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

class _$PostListErrorImpl extends PostListError {
  const _$PostListErrorImpl(this.failure) : super._();

  @override
  final Failure failure;

  @override
  String toString() {
    return 'PostListState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostListErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostListErrorImplCopyWith<_$PostListErrorImpl> get copyWith =>
      __$$PostListErrorImplCopyWithImpl<_$PostListErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )
    loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Post> posts,
      bool isRefreshing,
      Failure? staleFailure,
    )?
    loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostListInitial value) initial,
    required TResult Function(PostListLoading value) loading,
    required TResult Function(PostListLoaded value) loaded,
    required TResult Function(PostListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostListInitial value)? initial,
    TResult? Function(PostListLoading value)? loading,
    TResult? Function(PostListLoaded value)? loaded,
    TResult? Function(PostListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostListInitial value)? initial,
    TResult Function(PostListLoading value)? loading,
    TResult Function(PostListLoaded value)? loaded,
    TResult Function(PostListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PostListError extends PostListState {
  const factory PostListError(final Failure failure) = _$PostListErrorImpl;
  const PostListError._() : super._();

  Failure get failure;

  /// Create a copy of PostListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostListErrorImplCopyWith<_$PostListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
