// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostFeed {
  List<Post> get posts => throw _privateConstructorUsedError;
  PostFeedSource get source => throw _privateConstructorUsedError;
  Failure? get syncFailure => throw _privateConstructorUsedError;

  /// Create a copy of PostFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostFeedCopyWith<PostFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFeedCopyWith<$Res> {
  factory $PostFeedCopyWith(PostFeed value, $Res Function(PostFeed) then) =
      _$PostFeedCopyWithImpl<$Res, PostFeed>;
  @useResult
  $Res call({List<Post> posts, PostFeedSource source, Failure? syncFailure});

  $FailureCopyWith<$Res>? get syncFailure;
}

/// @nodoc
class _$PostFeedCopyWithImpl<$Res, $Val extends PostFeed>
    implements $PostFeedCopyWith<$Res> {
  _$PostFeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostFeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? source = null,
    Object? syncFailure = freezed,
  }) {
    return _then(
      _value.copyWith(
            posts: null == posts
                ? _value.posts
                : posts // ignore: cast_nullable_to_non_nullable
                      as List<Post>,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as PostFeedSource,
            syncFailure: freezed == syncFailure
                ? _value.syncFailure
                : syncFailure // ignore: cast_nullable_to_non_nullable
                      as Failure?,
          )
          as $Val,
    );
  }

  /// Create a copy of PostFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get syncFailure {
    if (_value.syncFailure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.syncFailure!, (value) {
      return _then(_value.copyWith(syncFailure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostFeedImplCopyWith<$Res>
    implements $PostFeedCopyWith<$Res> {
  factory _$$PostFeedImplCopyWith(
    _$PostFeedImpl value,
    $Res Function(_$PostFeedImpl) then,
  ) = __$$PostFeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Post> posts, PostFeedSource source, Failure? syncFailure});

  @override
  $FailureCopyWith<$Res>? get syncFailure;
}

/// @nodoc
class __$$PostFeedImplCopyWithImpl<$Res>
    extends _$PostFeedCopyWithImpl<$Res, _$PostFeedImpl>
    implements _$$PostFeedImplCopyWith<$Res> {
  __$$PostFeedImplCopyWithImpl(
    _$PostFeedImpl _value,
    $Res Function(_$PostFeedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostFeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? source = null,
    Object? syncFailure = freezed,
  }) {
    return _then(
      _$PostFeedImpl(
        posts: null == posts
            ? _value._posts
            : posts // ignore: cast_nullable_to_non_nullable
                  as List<Post>,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as PostFeedSource,
        syncFailure: freezed == syncFailure
            ? _value.syncFailure
            : syncFailure // ignore: cast_nullable_to_non_nullable
                  as Failure?,
      ),
    );
  }
}

/// @nodoc

class _$PostFeedImpl extends _PostFeed {
  const _$PostFeedImpl({
    required final List<Post> posts,
    required this.source,
    this.syncFailure,
  }) : _posts = posts,
       super._();

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final PostFeedSource source;
  @override
  final Failure? syncFailure;

  @override
  String toString() {
    return 'PostFeed(posts: $posts, source: $source, syncFailure: $syncFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFeedImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.syncFailure, syncFailure) ||
                other.syncFailure == syncFailure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_posts),
    source,
    syncFailure,
  );

  /// Create a copy of PostFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFeedImplCopyWith<_$PostFeedImpl> get copyWith =>
      __$$PostFeedImplCopyWithImpl<_$PostFeedImpl>(this, _$identity);
}

abstract class _PostFeed extends PostFeed {
  const factory _PostFeed({
    required final List<Post> posts,
    required final PostFeedSource source,
    final Failure? syncFailure,
  }) = _$PostFeedImpl;
  const _PostFeed._() : super._();

  @override
  List<Post> get posts;
  @override
  PostFeedSource get source;
  @override
  Failure? get syncFailure;

  /// Create a copy of PostFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostFeedImplCopyWith<_$PostFeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
