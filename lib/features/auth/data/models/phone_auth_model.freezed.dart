// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhoneAuthModel {

 String get phoneNumber; String get verificationId; String get otp; bool get isVerified; DateTime? get createdAt;
/// Create a copy of PhoneAuthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneAuthModelCopyWith<PhoneAuthModel> get copyWith => _$PhoneAuthModelCopyWithImpl<PhoneAuthModel>(this as PhoneAuthModel, _$identity);

  /// Serializes this PhoneAuthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneAuthModel&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,verificationId,otp,isVerified,createdAt);

@override
String toString() {
  return 'PhoneAuthModel(phoneNumber: $phoneNumber, verificationId: $verificationId, otp: $otp, isVerified: $isVerified, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PhoneAuthModelCopyWith<$Res>  {
  factory $PhoneAuthModelCopyWith(PhoneAuthModel value, $Res Function(PhoneAuthModel) _then) = _$PhoneAuthModelCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String verificationId, String otp, bool isVerified, DateTime? createdAt
});




}
/// @nodoc
class _$PhoneAuthModelCopyWithImpl<$Res>
    implements $PhoneAuthModelCopyWith<$Res> {
  _$PhoneAuthModelCopyWithImpl(this._self, this._then);

  final PhoneAuthModel _self;
  final $Res Function(PhoneAuthModel) _then;

/// Create a copy of PhoneAuthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? verificationId = null,Object? otp = null,Object? isVerified = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneAuthModel].
extension PhoneAuthModelPatterns on PhoneAuthModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneAuthModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneAuthModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneAuthModel value)  $default,){
final _that = this;
switch (_that) {
case _PhoneAuthModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneAuthModel value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneAuthModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneNumber,  String verificationId,  String otp,  bool isVerified,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneAuthModel() when $default != null:
return $default(_that.phoneNumber,_that.verificationId,_that.otp,_that.isVerified,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneNumber,  String verificationId,  String otp,  bool isVerified,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PhoneAuthModel():
return $default(_that.phoneNumber,_that.verificationId,_that.otp,_that.isVerified,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneNumber,  String verificationId,  String otp,  bool isVerified,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PhoneAuthModel() when $default != null:
return $default(_that.phoneNumber,_that.verificationId,_that.otp,_that.isVerified,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhoneAuthModel implements PhoneAuthModel {
  const _PhoneAuthModel({required this.phoneNumber, required this.verificationId, this.otp = '', this.isVerified = false, this.createdAt});
  factory _PhoneAuthModel.fromJson(Map<String, dynamic> json) => _$PhoneAuthModelFromJson(json);

@override final  String phoneNumber;
@override final  String verificationId;
@override@JsonKey() final  String otp;
@override@JsonKey() final  bool isVerified;
@override final  DateTime? createdAt;

/// Create a copy of PhoneAuthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneAuthModelCopyWith<_PhoneAuthModel> get copyWith => __$PhoneAuthModelCopyWithImpl<_PhoneAuthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhoneAuthModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneAuthModel&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,verificationId,otp,isVerified,createdAt);

@override
String toString() {
  return 'PhoneAuthModel(phoneNumber: $phoneNumber, verificationId: $verificationId, otp: $otp, isVerified: $isVerified, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PhoneAuthModelCopyWith<$Res> implements $PhoneAuthModelCopyWith<$Res> {
  factory _$PhoneAuthModelCopyWith(_PhoneAuthModel value, $Res Function(_PhoneAuthModel) _then) = __$PhoneAuthModelCopyWithImpl;
@override @useResult
$Res call({
 String phoneNumber, String verificationId, String otp, bool isVerified, DateTime? createdAt
});




}
/// @nodoc
class __$PhoneAuthModelCopyWithImpl<$Res>
    implements _$PhoneAuthModelCopyWith<$Res> {
  __$PhoneAuthModelCopyWithImpl(this._self, this._then);

  final _PhoneAuthModel _self;
  final $Res Function(_PhoneAuthModel) _then;

/// Create a copy of PhoneAuthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? verificationId = null,Object? otp = null,Object? isVerified = null,Object? createdAt = freezed,}) {
  return _then(_PhoneAuthModel(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$OtpModel {

 String get code; DateTime get sentAt; int get expiresInSeconds;
/// Create a copy of OtpModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpModelCopyWith<OtpModel> get copyWith => _$OtpModelCopyWithImpl<OtpModel>(this as OtpModel, _$identity);

  /// Serializes this OtpModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpModel&&(identical(other.code, code) || other.code == code)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,sentAt,expiresInSeconds);

@override
String toString() {
  return 'OtpModel(code: $code, sentAt: $sentAt, expiresInSeconds: $expiresInSeconds)';
}


}

/// @nodoc
abstract mixin class $OtpModelCopyWith<$Res>  {
  factory $OtpModelCopyWith(OtpModel value, $Res Function(OtpModel) _then) = _$OtpModelCopyWithImpl;
@useResult
$Res call({
 String code, DateTime sentAt, int expiresInSeconds
});




}
/// @nodoc
class _$OtpModelCopyWithImpl<$Res>
    implements $OtpModelCopyWith<$Res> {
  _$OtpModelCopyWithImpl(this._self, this._then);

  final OtpModel _self;
  final $Res Function(OtpModel) _then;

/// Create a copy of OtpModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? sentAt = null,Object? expiresInSeconds = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpModel].
extension OtpModelPatterns on OtpModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpModel value)  $default,){
final _that = this;
switch (_that) {
case _OtpModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpModel value)?  $default,){
final _that = this;
switch (_that) {
case _OtpModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  DateTime sentAt,  int expiresInSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpModel() when $default != null:
return $default(_that.code,_that.sentAt,_that.expiresInSeconds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  DateTime sentAt,  int expiresInSeconds)  $default,) {final _that = this;
switch (_that) {
case _OtpModel():
return $default(_that.code,_that.sentAt,_that.expiresInSeconds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  DateTime sentAt,  int expiresInSeconds)?  $default,) {final _that = this;
switch (_that) {
case _OtpModel() when $default != null:
return $default(_that.code,_that.sentAt,_that.expiresInSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpModel implements OtpModel {
  const _OtpModel({required this.code, required this.sentAt, this.expiresInSeconds = 300});
  factory _OtpModel.fromJson(Map<String, dynamic> json) => _$OtpModelFromJson(json);

@override final  String code;
@override final  DateTime sentAt;
@override@JsonKey() final  int expiresInSeconds;

/// Create a copy of OtpModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpModelCopyWith<_OtpModel> get copyWith => __$OtpModelCopyWithImpl<_OtpModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpModel&&(identical(other.code, code) || other.code == code)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,sentAt,expiresInSeconds);

@override
String toString() {
  return 'OtpModel(code: $code, sentAt: $sentAt, expiresInSeconds: $expiresInSeconds)';
}


}

/// @nodoc
abstract mixin class _$OtpModelCopyWith<$Res> implements $OtpModelCopyWith<$Res> {
  factory _$OtpModelCopyWith(_OtpModel value, $Res Function(_OtpModel) _then) = __$OtpModelCopyWithImpl;
@override @useResult
$Res call({
 String code, DateTime sentAt, int expiresInSeconds
});




}
/// @nodoc
class __$OtpModelCopyWithImpl<$Res>
    implements _$OtpModelCopyWith<$Res> {
  __$OtpModelCopyWithImpl(this._self, this._then);

  final _OtpModel _self;
  final $Res Function(_OtpModel) _then;

/// Create a copy of OtpModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? sentAt = null,Object? expiresInSeconds = null,}) {
  return _then(_OtpModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
