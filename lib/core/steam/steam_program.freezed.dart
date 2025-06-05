// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'steam_program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SteamProgram {

 int get appId; String get appName; SteamProgramType get programType; DateTime get lastPlayed; File? get icon; File? get cover; File? get hero; File? get logo; File? get banner;
/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SteamProgramCopyWith<SteamProgram> get copyWith => _$SteamProgramCopyWithImpl<SteamProgram>(this as SteamProgram, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SteamProgram&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.programType, programType) || other.programType == programType)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.hero, hero) || other.hero == hero)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.banner, banner) || other.banner == banner));
}


@override
int get hashCode => Object.hash(runtimeType,appId,appName,programType,lastPlayed,icon,cover,hero,logo,banner);

@override
String toString() {
  return 'SteamProgram(appId: $appId, appName: $appName, programType: $programType, lastPlayed: $lastPlayed, icon: $icon, cover: $cover, hero: $hero, logo: $logo, banner: $banner)';
}


}

/// @nodoc
abstract mixin class $SteamProgramCopyWith<$Res>  {
  factory $SteamProgramCopyWith(SteamProgram value, $Res Function(SteamProgram) _then) = _$SteamProgramCopyWithImpl;
@useResult
$Res call({
 int appId, String appName, SteamProgramType programType, DateTime lastPlayed, File? icon, File? cover, File? hero, File? logo, File? banner
});




}
/// @nodoc
class _$SteamProgramCopyWithImpl<$Res>
    implements $SteamProgramCopyWith<$Res> {
  _$SteamProgramCopyWithImpl(this._self, this._then);

  final SteamProgram _self;
  final $Res Function(SteamProgram) _then;

/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appId = null,Object? appName = null,Object? programType = null,Object? lastPlayed = null,Object? icon = freezed,Object? cover = freezed,Object? hero = freezed,Object? logo = freezed,Object? banner = freezed,}) {
  return _then(_self.copyWith(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as int,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,programType: null == programType ? _self.programType : programType // ignore: cast_nullable_to_non_nullable
as SteamProgramType,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as File?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as File?,hero: freezed == hero ? _self.hero : hero // ignore: cast_nullable_to_non_nullable
as File?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as File?,banner: freezed == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

}


/// @nodoc


class _SteamProgram implements SteamProgram {
  const _SteamProgram({required this.appId, required this.appName, required this.programType, required this.lastPlayed, this.icon, this.cover, this.hero, this.logo, this.banner});
  

@override final  int appId;
@override final  String appName;
@override final  SteamProgramType programType;
@override final  DateTime lastPlayed;
@override final  File? icon;
@override final  File? cover;
@override final  File? hero;
@override final  File? logo;
@override final  File? banner;

/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SteamProgramCopyWith<_SteamProgram> get copyWith => __$SteamProgramCopyWithImpl<_SteamProgram>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SteamProgram&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.programType, programType) || other.programType == programType)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.hero, hero) || other.hero == hero)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.banner, banner) || other.banner == banner));
}


@override
int get hashCode => Object.hash(runtimeType,appId,appName,programType,lastPlayed,icon,cover,hero,logo,banner);

@override
String toString() {
  return 'SteamProgram(appId: $appId, appName: $appName, programType: $programType, lastPlayed: $lastPlayed, icon: $icon, cover: $cover, hero: $hero, logo: $logo, banner: $banner)';
}


}

/// @nodoc
abstract mixin class _$SteamProgramCopyWith<$Res> implements $SteamProgramCopyWith<$Res> {
  factory _$SteamProgramCopyWith(_SteamProgram value, $Res Function(_SteamProgram) _then) = __$SteamProgramCopyWithImpl;
@override @useResult
$Res call({
 int appId, String appName, SteamProgramType programType, DateTime lastPlayed, File? icon, File? cover, File? hero, File? logo, File? banner
});




}
/// @nodoc
class __$SteamProgramCopyWithImpl<$Res>
    implements _$SteamProgramCopyWith<$Res> {
  __$SteamProgramCopyWithImpl(this._self, this._then);

  final _SteamProgram _self;
  final $Res Function(_SteamProgram) _then;

/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appId = null,Object? appName = null,Object? programType = null,Object? lastPlayed = null,Object? icon = freezed,Object? cover = freezed,Object? hero = freezed,Object? logo = freezed,Object? banner = freezed,}) {
  return _then(_SteamProgram(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as int,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,programType: null == programType ? _self.programType : programType // ignore: cast_nullable_to_non_nullable
as SteamProgramType,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as File?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as File?,hero: freezed == hero ? _self.hero : hero // ignore: cast_nullable_to_non_nullable
as File?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as File?,banner: freezed == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

// dart format on
