// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SteamShortcut {
  int get appId => throw _privateConstructorUsedError;
  String get appName => throw _privateConstructorUsedError;
  String get launchOptions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SteamShortcutCopyWith<SteamShortcut> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SteamShortcutCopyWith<$Res> {
  factory $SteamShortcutCopyWith(SteamShortcut value, $Res Function(SteamShortcut) then) =
      _$SteamShortcutCopyWithImpl<$Res, SteamShortcut>;
  @useResult
  $Res call({int appId, String appName, String launchOptions});
}

/// @nodoc
class _$SteamShortcutCopyWithImpl<$Res, $Val extends SteamShortcut> implements $SteamShortcutCopyWith<$Res> {
  _$SteamShortcutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? appName = null,
    Object? launchOptions = null,
  }) {
    return _then(_value.copyWith(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as int,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      launchOptions: null == launchOptions
          ? _value.launchOptions
          : launchOptions // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SteamShortcutImplCopyWith<$Res> implements $SteamShortcutCopyWith<$Res> {
  factory _$$SteamShortcutImplCopyWith(_$SteamShortcutImpl value, $Res Function(_$SteamShortcutImpl) then) =
      __$$SteamShortcutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int appId, String appName, String launchOptions});
}

/// @nodoc
class __$$SteamShortcutImplCopyWithImpl<$Res> extends _$SteamShortcutCopyWithImpl<$Res, _$SteamShortcutImpl>
    implements _$$SteamShortcutImplCopyWith<$Res> {
  __$$SteamShortcutImplCopyWithImpl(_$SteamShortcutImpl _value, $Res Function(_$SteamShortcutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? appName = null,
    Object? launchOptions = null,
  }) {
    return _then(_$SteamShortcutImpl(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as int,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      launchOptions: null == launchOptions
          ? _value.launchOptions
          : launchOptions // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SteamShortcutImpl implements _SteamShortcut {
  const _$SteamShortcutImpl({required this.appId, required this.appName, required this.launchOptions});

  @override
  final int appId;
  @override
  final String appName;
  @override
  final String launchOptions;

  @override
  String toString() {
    return 'SteamShortcut(appId: $appId, appName: $appName, launchOptions: $launchOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SteamShortcutImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.launchOptions, launchOptions) || other.launchOptions == launchOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appId, appName, launchOptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SteamShortcutImplCopyWith<_$SteamShortcutImpl> get copyWith =>
      __$$SteamShortcutImplCopyWithImpl<_$SteamShortcutImpl>(this, _$identity);
}

abstract class _SteamShortcut implements SteamShortcut {
  const factory _SteamShortcut(
      {required final int appId,
      required final String appName,
      required final String launchOptions}) = _$SteamShortcutImpl;

  @override
  int get appId;
  @override
  String get appName;
  @override
  String get launchOptions;
  @override
  @JsonKey(ignore: true)
  _$$SteamShortcutImplCopyWith<_$SteamShortcutImpl> get copyWith => throw _privateConstructorUsedError;
}
