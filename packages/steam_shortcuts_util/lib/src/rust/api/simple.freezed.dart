// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SteamShortcut {

 int get appId; String get appName; String get target; String get launchOptions; String get startDir; String get icon; bool get isHidden; List<String> get tags; int get lastPlayTime;
/// Create a copy of SteamShortcut
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SteamShortcutCopyWith<SteamShortcut> get copyWith => _$SteamShortcutCopyWithImpl<SteamShortcut>(this as SteamShortcut, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SteamShortcut&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.target, target) || other.target == target)&&(identical(other.launchOptions, launchOptions) || other.launchOptions == launchOptions)&&(identical(other.startDir, startDir) || other.startDir == startDir)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isHidden, isHidden) || other.isHidden == isHidden)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.lastPlayTime, lastPlayTime) || other.lastPlayTime == lastPlayTime));
}


@override
int get hashCode => Object.hash(runtimeType,appId,appName,target,launchOptions,startDir,icon,isHidden,const DeepCollectionEquality().hash(tags),lastPlayTime);

@override
String toString() {
  return 'SteamShortcut(appId: $appId, appName: $appName, target: $target, launchOptions: $launchOptions, startDir: $startDir, icon: $icon, isHidden: $isHidden, tags: $tags, lastPlayTime: $lastPlayTime)';
}


}

/// @nodoc
abstract mixin class $SteamShortcutCopyWith<$Res>  {
  factory $SteamShortcutCopyWith(SteamShortcut value, $Res Function(SteamShortcut) _then) = _$SteamShortcutCopyWithImpl;
@useResult
$Res call({
 int appId, String appName, String target, String launchOptions, String startDir, String icon, bool isHidden, List<String> tags, int lastPlayTime
});




}
/// @nodoc
class _$SteamShortcutCopyWithImpl<$Res>
    implements $SteamShortcutCopyWith<$Res> {
  _$SteamShortcutCopyWithImpl(this._self, this._then);

  final SteamShortcut _self;
  final $Res Function(SteamShortcut) _then;

/// Create a copy of SteamShortcut
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appId = null,Object? appName = null,Object? target = null,Object? launchOptions = null,Object? startDir = null,Object? icon = null,Object? isHidden = null,Object? tags = null,Object? lastPlayTime = null,}) {
  return _then(_self.copyWith(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as int,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,launchOptions: null == launchOptions ? _self.launchOptions : launchOptions // ignore: cast_nullable_to_non_nullable
as String,startDir: null == startDir ? _self.startDir : startDir // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,isHidden: null == isHidden ? _self.isHidden : isHidden // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,lastPlayTime: null == lastPlayTime ? _self.lastPlayTime : lastPlayTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _SteamShortcut implements SteamShortcut {
  const _SteamShortcut({required this.appId, required this.appName, required this.target, required this.launchOptions, required this.startDir, required this.icon, required this.isHidden, required final  List<String> tags, required this.lastPlayTime}): _tags = tags;
  

@override final  int appId;
@override final  String appName;
@override final  String target;
@override final  String launchOptions;
@override final  String startDir;
@override final  String icon;
@override final  bool isHidden;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  int lastPlayTime;

/// Create a copy of SteamShortcut
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SteamShortcutCopyWith<_SteamShortcut> get copyWith => __$SteamShortcutCopyWithImpl<_SteamShortcut>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SteamShortcut&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.target, target) || other.target == target)&&(identical(other.launchOptions, launchOptions) || other.launchOptions == launchOptions)&&(identical(other.startDir, startDir) || other.startDir == startDir)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isHidden, isHidden) || other.isHidden == isHidden)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.lastPlayTime, lastPlayTime) || other.lastPlayTime == lastPlayTime));
}


@override
int get hashCode => Object.hash(runtimeType,appId,appName,target,launchOptions,startDir,icon,isHidden,const DeepCollectionEquality().hash(_tags),lastPlayTime);

@override
String toString() {
  return 'SteamShortcut(appId: $appId, appName: $appName, target: $target, launchOptions: $launchOptions, startDir: $startDir, icon: $icon, isHidden: $isHidden, tags: $tags, lastPlayTime: $lastPlayTime)';
}


}

/// @nodoc
abstract mixin class _$SteamShortcutCopyWith<$Res> implements $SteamShortcutCopyWith<$Res> {
  factory _$SteamShortcutCopyWith(_SteamShortcut value, $Res Function(_SteamShortcut) _then) = __$SteamShortcutCopyWithImpl;
@override @useResult
$Res call({
 int appId, String appName, String target, String launchOptions, String startDir, String icon, bool isHidden, List<String> tags, int lastPlayTime
});




}
/// @nodoc
class __$SteamShortcutCopyWithImpl<$Res>
    implements _$SteamShortcutCopyWith<$Res> {
  __$SteamShortcutCopyWithImpl(this._self, this._then);

  final _SteamShortcut _self;
  final $Res Function(_SteamShortcut) _then;

/// Create a copy of SteamShortcut
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appId = null,Object? appName = null,Object? target = null,Object? launchOptions = null,Object? startDir = null,Object? icon = null,Object? isHidden = null,Object? tags = null,Object? lastPlayTime = null,}) {
  return _then(_SteamShortcut(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as int,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,launchOptions: null == launchOptions ? _self.launchOptions : launchOptions // ignore: cast_nullable_to_non_nullable
as String,startDir: null == startDir ? _self.startDir : startDir // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,isHidden: null == isHidden ? _self.isHidden : isHidden // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,lastPlayTime: null == lastPlayTime ? _self.lastPlayTime : lastPlayTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
