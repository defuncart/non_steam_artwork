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

 int get appId; String get appName; SteamProgramType get programType; DateTime get lastPlayed; File? get icon; File? get cover; File? get hero; File? get logo; LogoPosition? get logoPosition; File? get banner;
/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SteamProgramCopyWith<SteamProgram> get copyWith => _$SteamProgramCopyWithImpl<SteamProgram>(this as SteamProgram, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SteamProgram&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.programType, programType) || other.programType == programType)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.hero, hero) || other.hero == hero)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.logoPosition, logoPosition) || other.logoPosition == logoPosition)&&(identical(other.banner, banner) || other.banner == banner));
}


@override
int get hashCode => Object.hash(runtimeType,appId,appName,programType,lastPlayed,icon,cover,hero,logo,logoPosition,banner);

@override
String toString() {
  return 'SteamProgram(appId: $appId, appName: $appName, programType: $programType, lastPlayed: $lastPlayed, icon: $icon, cover: $cover, hero: $hero, logo: $logo, logoPosition: $logoPosition, banner: $banner)';
}


}

/// @nodoc
abstract mixin class $SteamProgramCopyWith<$Res>  {
  factory $SteamProgramCopyWith(SteamProgram value, $Res Function(SteamProgram) _then) = _$SteamProgramCopyWithImpl;
@useResult
$Res call({
 int appId, String appName, SteamProgramType programType, DateTime lastPlayed, File? icon, File? cover, File? hero, File? logo, LogoPosition? logoPosition, File? banner
});


$LogoPositionCopyWith<$Res>? get logoPosition;

}
/// @nodoc
class _$SteamProgramCopyWithImpl<$Res>
    implements $SteamProgramCopyWith<$Res> {
  _$SteamProgramCopyWithImpl(this._self, this._then);

  final SteamProgram _self;
  final $Res Function(SteamProgram) _then;

/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appId = null,Object? appName = null,Object? programType = null,Object? lastPlayed = null,Object? icon = freezed,Object? cover = freezed,Object? hero = freezed,Object? logo = freezed,Object? logoPosition = freezed,Object? banner = freezed,}) {
  return _then(_self.copyWith(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as int,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,programType: null == programType ? _self.programType : programType // ignore: cast_nullable_to_non_nullable
as SteamProgramType,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as File?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as File?,hero: freezed == hero ? _self.hero : hero // ignore: cast_nullable_to_non_nullable
as File?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as File?,logoPosition: freezed == logoPosition ? _self.logoPosition : logoPosition // ignore: cast_nullable_to_non_nullable
as LogoPosition?,banner: freezed == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}
/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogoPositionCopyWith<$Res>? get logoPosition {
    if (_self.logoPosition == null) {
    return null;
  }

  return $LogoPositionCopyWith<$Res>(_self.logoPosition!, (value) {
    return _then(_self.copyWith(logoPosition: value));
  });
}
}


/// @nodoc


class _SteamProgram implements SteamProgram {
  const _SteamProgram({required this.appId, required this.appName, required this.programType, required this.lastPlayed, this.icon, this.cover, this.hero, this.logo, this.logoPosition, this.banner});
  

@override final  int appId;
@override final  String appName;
@override final  SteamProgramType programType;
@override final  DateTime lastPlayed;
@override final  File? icon;
@override final  File? cover;
@override final  File? hero;
@override final  File? logo;
@override final  LogoPosition? logoPosition;
@override final  File? banner;

/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SteamProgramCopyWith<_SteamProgram> get copyWith => __$SteamProgramCopyWithImpl<_SteamProgram>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SteamProgram&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.programType, programType) || other.programType == programType)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.hero, hero) || other.hero == hero)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.logoPosition, logoPosition) || other.logoPosition == logoPosition)&&(identical(other.banner, banner) || other.banner == banner));
}


@override
int get hashCode => Object.hash(runtimeType,appId,appName,programType,lastPlayed,icon,cover,hero,logo,logoPosition,banner);

@override
String toString() {
  return 'SteamProgram(appId: $appId, appName: $appName, programType: $programType, lastPlayed: $lastPlayed, icon: $icon, cover: $cover, hero: $hero, logo: $logo, logoPosition: $logoPosition, banner: $banner)';
}


}

/// @nodoc
abstract mixin class _$SteamProgramCopyWith<$Res> implements $SteamProgramCopyWith<$Res> {
  factory _$SteamProgramCopyWith(_SteamProgram value, $Res Function(_SteamProgram) _then) = __$SteamProgramCopyWithImpl;
@override @useResult
$Res call({
 int appId, String appName, SteamProgramType programType, DateTime lastPlayed, File? icon, File? cover, File? hero, File? logo, LogoPosition? logoPosition, File? banner
});


@override $LogoPositionCopyWith<$Res>? get logoPosition;

}
/// @nodoc
class __$SteamProgramCopyWithImpl<$Res>
    implements _$SteamProgramCopyWith<$Res> {
  __$SteamProgramCopyWithImpl(this._self, this._then);

  final _SteamProgram _self;
  final $Res Function(_SteamProgram) _then;

/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appId = null,Object? appName = null,Object? programType = null,Object? lastPlayed = null,Object? icon = freezed,Object? cover = freezed,Object? hero = freezed,Object? logo = freezed,Object? logoPosition = freezed,Object? banner = freezed,}) {
  return _then(_SteamProgram(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as int,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,programType: null == programType ? _self.programType : programType // ignore: cast_nullable_to_non_nullable
as SteamProgramType,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as File?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as File?,hero: freezed == hero ? _self.hero : hero // ignore: cast_nullable_to_non_nullable
as File?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as File?,logoPosition: freezed == logoPosition ? _self.logoPosition : logoPosition // ignore: cast_nullable_to_non_nullable
as LogoPosition?,banner: freezed == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

/// Create a copy of SteamProgram
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogoPositionCopyWith<$Res>? get logoPosition {
    if (_self.logoPosition == null) {
    return null;
  }

  return $LogoPositionCopyWith<$Res>(_self.logoPosition!, (value) {
    return _then(_self.copyWith(logoPosition: value));
  });
}
}

/// @nodoc
mixin _$LogoPosition {

 LogoPositionType get position; double get width; double get height;
/// Create a copy of LogoPosition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoPositionCopyWith<LogoPosition> get copyWith => _$LogoPositionCopyWithImpl<LogoPosition>(this as LogoPosition, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoPosition&&(identical(other.position, position) || other.position == position)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,position,width,height);

@override
String toString() {
  return 'LogoPosition(position: $position, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $LogoPositionCopyWith<$Res>  {
  factory $LogoPositionCopyWith(LogoPosition value, $Res Function(LogoPosition) _then) = _$LogoPositionCopyWithImpl;
@useResult
$Res call({
 LogoPositionType position, double width, double height
});




}
/// @nodoc
class _$LogoPositionCopyWithImpl<$Res>
    implements $LogoPositionCopyWith<$Res> {
  _$LogoPositionCopyWithImpl(this._self, this._then);

  final LogoPosition _self;
  final $Res Function(LogoPosition) _then;

/// Create a copy of LogoPosition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? width = null,Object? height = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LogoPositionType,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _LogoPosition implements LogoPosition {
  const _LogoPosition({required this.position, required this.width, required this.height});
  

@override final  LogoPositionType position;
@override final  double width;
@override final  double height;

/// Create a copy of LogoPosition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoPositionCopyWith<_LogoPosition> get copyWith => __$LogoPositionCopyWithImpl<_LogoPosition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoPosition&&(identical(other.position, position) || other.position == position)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,position,width,height);

@override
String toString() {
  return 'LogoPosition(position: $position, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$LogoPositionCopyWith<$Res> implements $LogoPositionCopyWith<$Res> {
  factory _$LogoPositionCopyWith(_LogoPosition value, $Res Function(_LogoPosition) _then) = __$LogoPositionCopyWithImpl;
@override @useResult
$Res call({
 LogoPositionType position, double width, double height
});




}
/// @nodoc
class __$LogoPositionCopyWithImpl<$Res>
    implements _$LogoPositionCopyWith<$Res> {
  __$LogoPositionCopyWithImpl(this._self, this._then);

  final _LogoPosition _self;
  final $Res Function(_LogoPosition) _then;

/// Create a copy of LogoPosition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? width = null,Object? height = null,}) {
  return _then(_LogoPosition(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LogoPositionType,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
