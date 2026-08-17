// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostDraft {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  /// A API exige um autor; sem login, usamos um usuário fixo.
  int get userId => throw _privateConstructorUsedError;

  /// Create a copy of PostDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDraftCopyWith<PostDraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDraftCopyWith<$Res> {
  factory $PostDraftCopyWith(PostDraft value, $Res Function(PostDraft) then) =
      _$PostDraftCopyWithImpl<$Res, PostDraft>;
  @useResult
  $Res call({String title, String body, int userId});
}

/// @nodoc
class _$PostDraftCopyWithImpl<$Res, $Val extends PostDraft>
    implements $PostDraftCopyWith<$Res> {
  _$PostDraftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? userId = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostDraftImplCopyWith<$Res>
    implements $PostDraftCopyWith<$Res> {
  factory _$$PostDraftImplCopyWith(
    _$PostDraftImpl value,
    $Res Function(_$PostDraftImpl) then,
  ) = __$$PostDraftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String body, int userId});
}

/// @nodoc
class __$$PostDraftImplCopyWithImpl<$Res>
    extends _$PostDraftCopyWithImpl<$Res, _$PostDraftImpl>
    implements _$$PostDraftImplCopyWith<$Res> {
  __$$PostDraftImplCopyWithImpl(
    _$PostDraftImpl _value,
    $Res Function(_$PostDraftImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? userId = null,
  }) {
    return _then(
      _$PostDraftImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$PostDraftImpl extends _PostDraft {
  const _$PostDraftImpl({
    required this.title,
    required this.body,
    this.userId = 1,
  }) : super._();

  @override
  final String title;
  @override
  final String body;

  /// A API exige um autor; sem login, usamos um usuário fixo.
  @override
  @JsonKey()
  final int userId;

  @override
  String toString() {
    return 'PostDraft(title: $title, body: $body, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDraftImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, body, userId);

  /// Create a copy of PostDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDraftImplCopyWith<_$PostDraftImpl> get copyWith =>
      __$$PostDraftImplCopyWithImpl<_$PostDraftImpl>(this, _$identity);
}

abstract class _PostDraft extends PostDraft {
  const factory _PostDraft({
    required final String title,
    required final String body,
    final int userId,
  }) = _$PostDraftImpl;
  const _PostDraft._() : super._();

  @override
  String get title;
  @override
  String get body;

  /// A API exige um autor; sem login, usamos um usuário fixo.
  @override
  int get userId;

  /// Create a copy of PostDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostDraftImplCopyWith<_$PostDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
