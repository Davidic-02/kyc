// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasicInfoModel {

 String get firstName; String get lastName; String get gender; String get dob; String get age; String get country;
/// Create a copy of BasicInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicInfoModelCopyWith<BasicInfoModel> get copyWith => _$BasicInfoModelCopyWithImpl<BasicInfoModel>(this as BasicInfoModel, _$identity);

  /// Serializes this BasicInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicInfoModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.age, age) || other.age == age)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,gender,dob,age,country);

@override
String toString() {
  return 'BasicInfoModel(firstName: $firstName, lastName: $lastName, gender: $gender, dob: $dob, age: $age, country: $country)';
}


}

/// @nodoc
abstract mixin class $BasicInfoModelCopyWith<$Res>  {
  factory $BasicInfoModelCopyWith(BasicInfoModel value, $Res Function(BasicInfoModel) _then) = _$BasicInfoModelCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String gender, String dob, String age, String country
});




}
/// @nodoc
class _$BasicInfoModelCopyWithImpl<$Res>
    implements $BasicInfoModelCopyWith<$Res> {
  _$BasicInfoModelCopyWithImpl(this._self, this._then);

  final BasicInfoModel _self;
  final $Res Function(BasicInfoModel) _then;

/// Create a copy of BasicInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? gender = null,Object? dob = null,Object? age = null,Object? country = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BasicInfoModel].
extension BasicInfoModelPatterns on BasicInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasicInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasicInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasicInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _BasicInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasicInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _BasicInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String gender,  String dob,  String age,  String country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasicInfoModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.gender,_that.dob,_that.age,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String gender,  String dob,  String age,  String country)  $default,) {final _that = this;
switch (_that) {
case _BasicInfoModel():
return $default(_that.firstName,_that.lastName,_that.gender,_that.dob,_that.age,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String gender,  String dob,  String age,  String country)?  $default,) {final _that = this;
switch (_that) {
case _BasicInfoModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.gender,_that.dob,_that.age,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasicInfoModel implements BasicInfoModel {
  const _BasicInfoModel({required this.firstName, required this.lastName, required this.gender, required this.dob, required this.age, required this.country});
  factory _BasicInfoModel.fromJson(Map<String, dynamic> json) => _$BasicInfoModelFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String gender;
@override final  String dob;
@override final  String age;
@override final  String country;

/// Create a copy of BasicInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicInfoModelCopyWith<_BasicInfoModel> get copyWith => __$BasicInfoModelCopyWithImpl<_BasicInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasicInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicInfoModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.age, age) || other.age == age)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,gender,dob,age,country);

@override
String toString() {
  return 'BasicInfoModel(firstName: $firstName, lastName: $lastName, gender: $gender, dob: $dob, age: $age, country: $country)';
}


}

/// @nodoc
abstract mixin class _$BasicInfoModelCopyWith<$Res> implements $BasicInfoModelCopyWith<$Res> {
  factory _$BasicInfoModelCopyWith(_BasicInfoModel value, $Res Function(_BasicInfoModel) _then) = __$BasicInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String gender, String dob, String age, String country
});




}
/// @nodoc
class __$BasicInfoModelCopyWithImpl<$Res>
    implements _$BasicInfoModelCopyWith<$Res> {
  __$BasicInfoModelCopyWithImpl(this._self, this._then);

  final _BasicInfoModel _self;
  final $Res Function(_BasicInfoModel) _then;

/// Create a copy of BasicInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? gender = null,Object? dob = null,Object? age = null,Object? country = null,}) {
  return _then(_BasicInfoModel(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TwoFactorAuthModel {

 String get secretKey; String get qrData; bool get isSetupComplete; bool get isVerified; bool get isEnabled; DateTime? get enabledAt;
/// Create a copy of TwoFactorAuthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TwoFactorAuthModelCopyWith<TwoFactorAuthModel> get copyWith => _$TwoFactorAuthModelCopyWithImpl<TwoFactorAuthModel>(this as TwoFactorAuthModel, _$identity);

  /// Serializes this TwoFactorAuthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TwoFactorAuthModel&&(identical(other.secretKey, secretKey) || other.secretKey == secretKey)&&(identical(other.qrData, qrData) || other.qrData == qrData)&&(identical(other.isSetupComplete, isSetupComplete) || other.isSetupComplete == isSetupComplete)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.enabledAt, enabledAt) || other.enabledAt == enabledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secretKey,qrData,isSetupComplete,isVerified,isEnabled,enabledAt);

@override
String toString() {
  return 'TwoFactorAuthModel(secretKey: $secretKey, qrData: $qrData, isSetupComplete: $isSetupComplete, isVerified: $isVerified, isEnabled: $isEnabled, enabledAt: $enabledAt)';
}


}

/// @nodoc
abstract mixin class $TwoFactorAuthModelCopyWith<$Res>  {
  factory $TwoFactorAuthModelCopyWith(TwoFactorAuthModel value, $Res Function(TwoFactorAuthModel) _then) = _$TwoFactorAuthModelCopyWithImpl;
@useResult
$Res call({
 String secretKey, String qrData, bool isSetupComplete, bool isVerified, bool isEnabled, DateTime? enabledAt
});




}
/// @nodoc
class _$TwoFactorAuthModelCopyWithImpl<$Res>
    implements $TwoFactorAuthModelCopyWith<$Res> {
  _$TwoFactorAuthModelCopyWithImpl(this._self, this._then);

  final TwoFactorAuthModel _self;
  final $Res Function(TwoFactorAuthModel) _then;

/// Create a copy of TwoFactorAuthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? secretKey = null,Object? qrData = null,Object? isSetupComplete = null,Object? isVerified = null,Object? isEnabled = null,Object? enabledAt = freezed,}) {
  return _then(_self.copyWith(
secretKey: null == secretKey ? _self.secretKey : secretKey // ignore: cast_nullable_to_non_nullable
as String,qrData: null == qrData ? _self.qrData : qrData // ignore: cast_nullable_to_non_nullable
as String,isSetupComplete: null == isSetupComplete ? _self.isSetupComplete : isSetupComplete // ignore: cast_nullable_to_non_nullable
as bool,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,enabledAt: freezed == enabledAt ? _self.enabledAt : enabledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TwoFactorAuthModel].
extension TwoFactorAuthModelPatterns on TwoFactorAuthModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TwoFactorAuthModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TwoFactorAuthModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TwoFactorAuthModel value)  $default,){
final _that = this;
switch (_that) {
case _TwoFactorAuthModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TwoFactorAuthModel value)?  $default,){
final _that = this;
switch (_that) {
case _TwoFactorAuthModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String secretKey,  String qrData,  bool isSetupComplete,  bool isVerified,  bool isEnabled,  DateTime? enabledAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TwoFactorAuthModel() when $default != null:
return $default(_that.secretKey,_that.qrData,_that.isSetupComplete,_that.isVerified,_that.isEnabled,_that.enabledAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String secretKey,  String qrData,  bool isSetupComplete,  bool isVerified,  bool isEnabled,  DateTime? enabledAt)  $default,) {final _that = this;
switch (_that) {
case _TwoFactorAuthModel():
return $default(_that.secretKey,_that.qrData,_that.isSetupComplete,_that.isVerified,_that.isEnabled,_that.enabledAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String secretKey,  String qrData,  bool isSetupComplete,  bool isVerified,  bool isEnabled,  DateTime? enabledAt)?  $default,) {final _that = this;
switch (_that) {
case _TwoFactorAuthModel() when $default != null:
return $default(_that.secretKey,_that.qrData,_that.isSetupComplete,_that.isVerified,_that.isEnabled,_that.enabledAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TwoFactorAuthModel implements TwoFactorAuthModel {
  const _TwoFactorAuthModel({required this.secretKey, required this.qrData, this.isSetupComplete = false, this.isVerified = false, this.isEnabled = false, this.enabledAt});
  factory _TwoFactorAuthModel.fromJson(Map<String, dynamic> json) => _$TwoFactorAuthModelFromJson(json);

@override final  String secretKey;
@override final  String qrData;
@override@JsonKey() final  bool isSetupComplete;
@override@JsonKey() final  bool isVerified;
@override@JsonKey() final  bool isEnabled;
@override final  DateTime? enabledAt;

/// Create a copy of TwoFactorAuthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TwoFactorAuthModelCopyWith<_TwoFactorAuthModel> get copyWith => __$TwoFactorAuthModelCopyWithImpl<_TwoFactorAuthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TwoFactorAuthModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TwoFactorAuthModel&&(identical(other.secretKey, secretKey) || other.secretKey == secretKey)&&(identical(other.qrData, qrData) || other.qrData == qrData)&&(identical(other.isSetupComplete, isSetupComplete) || other.isSetupComplete == isSetupComplete)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.enabledAt, enabledAt) || other.enabledAt == enabledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secretKey,qrData,isSetupComplete,isVerified,isEnabled,enabledAt);

@override
String toString() {
  return 'TwoFactorAuthModel(secretKey: $secretKey, qrData: $qrData, isSetupComplete: $isSetupComplete, isVerified: $isVerified, isEnabled: $isEnabled, enabledAt: $enabledAt)';
}


}

/// @nodoc
abstract mixin class _$TwoFactorAuthModelCopyWith<$Res> implements $TwoFactorAuthModelCopyWith<$Res> {
  factory _$TwoFactorAuthModelCopyWith(_TwoFactorAuthModel value, $Res Function(_TwoFactorAuthModel) _then) = __$TwoFactorAuthModelCopyWithImpl;
@override @useResult
$Res call({
 String secretKey, String qrData, bool isSetupComplete, bool isVerified, bool isEnabled, DateTime? enabledAt
});




}
/// @nodoc
class __$TwoFactorAuthModelCopyWithImpl<$Res>
    implements _$TwoFactorAuthModelCopyWith<$Res> {
  __$TwoFactorAuthModelCopyWithImpl(this._self, this._then);

  final _TwoFactorAuthModel _self;
  final $Res Function(_TwoFactorAuthModel) _then;

/// Create a copy of TwoFactorAuthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? secretKey = null,Object? qrData = null,Object? isSetupComplete = null,Object? isVerified = null,Object? isEnabled = null,Object? enabledAt = freezed,}) {
  return _then(_TwoFactorAuthModel(
secretKey: null == secretKey ? _self.secretKey : secretKey // ignore: cast_nullable_to_non_nullable
as String,qrData: null == qrData ? _self.qrData : qrData // ignore: cast_nullable_to_non_nullable
as String,isSetupComplete: null == isSetupComplete ? _self.isSetupComplete : isSetupComplete // ignore: cast_nullable_to_non_nullable
as bool,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,enabledAt: freezed == enabledAt ? _self.enabledAt : enabledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DocumentVerificationModel {

 String get documentType; String get documentNumber; String get documentUrl; bool get isVerified;
/// Create a copy of DocumentVerificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentVerificationModelCopyWith<DocumentVerificationModel> get copyWith => _$DocumentVerificationModelCopyWithImpl<DocumentVerificationModel>(this as DocumentVerificationModel, _$identity);

  /// Serializes this DocumentVerificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentVerificationModel&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.documentUrl, documentUrl) || other.documentUrl == documentUrl)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentType,documentNumber,documentUrl,isVerified);

@override
String toString() {
  return 'DocumentVerificationModel(documentType: $documentType, documentNumber: $documentNumber, documentUrl: $documentUrl, isVerified: $isVerified)';
}


}

/// @nodoc
abstract mixin class $DocumentVerificationModelCopyWith<$Res>  {
  factory $DocumentVerificationModelCopyWith(DocumentVerificationModel value, $Res Function(DocumentVerificationModel) _then) = _$DocumentVerificationModelCopyWithImpl;
@useResult
$Res call({
 String documentType, String documentNumber, String documentUrl, bool isVerified
});




}
/// @nodoc
class _$DocumentVerificationModelCopyWithImpl<$Res>
    implements $DocumentVerificationModelCopyWith<$Res> {
  _$DocumentVerificationModelCopyWithImpl(this._self, this._then);

  final DocumentVerificationModel _self;
  final $Res Function(DocumentVerificationModel) _then;

/// Create a copy of DocumentVerificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documentType = null,Object? documentNumber = null,Object? documentUrl = null,Object? isVerified = null,}) {
  return _then(_self.copyWith(
documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String,documentNumber: null == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String,documentUrl: null == documentUrl ? _self.documentUrl : documentUrl // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentVerificationModel].
extension DocumentVerificationModelPatterns on DocumentVerificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentVerificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentVerificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentVerificationModel value)  $default,){
final _that = this;
switch (_that) {
case _DocumentVerificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentVerificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentVerificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String documentType,  String documentNumber,  String documentUrl,  bool isVerified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentVerificationModel() when $default != null:
return $default(_that.documentType,_that.documentNumber,_that.documentUrl,_that.isVerified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String documentType,  String documentNumber,  String documentUrl,  bool isVerified)  $default,) {final _that = this;
switch (_that) {
case _DocumentVerificationModel():
return $default(_that.documentType,_that.documentNumber,_that.documentUrl,_that.isVerified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String documentType,  String documentNumber,  String documentUrl,  bool isVerified)?  $default,) {final _that = this;
switch (_that) {
case _DocumentVerificationModel() when $default != null:
return $default(_that.documentType,_that.documentNumber,_that.documentUrl,_that.isVerified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentVerificationModel implements DocumentVerificationModel {
  const _DocumentVerificationModel({required this.documentType, required this.documentNumber, required this.documentUrl, this.isVerified = false});
  factory _DocumentVerificationModel.fromJson(Map<String, dynamic> json) => _$DocumentVerificationModelFromJson(json);

@override final  String documentType;
@override final  String documentNumber;
@override final  String documentUrl;
@override@JsonKey() final  bool isVerified;

/// Create a copy of DocumentVerificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentVerificationModelCopyWith<_DocumentVerificationModel> get copyWith => __$DocumentVerificationModelCopyWithImpl<_DocumentVerificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentVerificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentVerificationModel&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.documentUrl, documentUrl) || other.documentUrl == documentUrl)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentType,documentNumber,documentUrl,isVerified);

@override
String toString() {
  return 'DocumentVerificationModel(documentType: $documentType, documentNumber: $documentNumber, documentUrl: $documentUrl, isVerified: $isVerified)';
}


}

/// @nodoc
abstract mixin class _$DocumentVerificationModelCopyWith<$Res> implements $DocumentVerificationModelCopyWith<$Res> {
  factory _$DocumentVerificationModelCopyWith(_DocumentVerificationModel value, $Res Function(_DocumentVerificationModel) _then) = __$DocumentVerificationModelCopyWithImpl;
@override @useResult
$Res call({
 String documentType, String documentNumber, String documentUrl, bool isVerified
});




}
/// @nodoc
class __$DocumentVerificationModelCopyWithImpl<$Res>
    implements _$DocumentVerificationModelCopyWith<$Res> {
  __$DocumentVerificationModelCopyWithImpl(this._self, this._then);

  final _DocumentVerificationModel _self;
  final $Res Function(_DocumentVerificationModel) _then;

/// Create a copy of DocumentVerificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documentType = null,Object? documentNumber = null,Object? documentUrl = null,Object? isVerified = null,}) {
  return _then(_DocumentVerificationModel(
documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String,documentNumber: null == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String,documentUrl: null == documentUrl ? _self.documentUrl : documentUrl // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Tier2Model {

// Step 4 — Selfie
 String get selfieUrl; bool get selfieReviewed;// set to true by admin/backend
 bool get selfieApproved;// Step 5 — Location
 double get latitude; double get longitude; String get detectedCountry; bool get isVpnSuspected;// Step 6 — Proof of address
 String get proofOfAddressDocType; String get proofOfAddressFrontUrl; String get proofOfAddressBackUrl; bool get proofReviewed; bool get proofApproved;// Overall
 String get status;// status values:
//   'pending_review'   — submitted, awaiting manual check
//   'approved'         — all checks passed
//   'rejected'         — failed verification
//   'needs_resubmit'   — one or more docs need resubmission
 DateTime? get submittedAt; DateTime? get reviewedAt;
/// Create a copy of Tier2Model
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Tier2ModelCopyWith<Tier2Model> get copyWith => _$Tier2ModelCopyWithImpl<Tier2Model>(this as Tier2Model, _$identity);

  /// Serializes this Tier2Model to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tier2Model&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.selfieReviewed, selfieReviewed) || other.selfieReviewed == selfieReviewed)&&(identical(other.selfieApproved, selfieApproved) || other.selfieApproved == selfieApproved)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.detectedCountry, detectedCountry) || other.detectedCountry == detectedCountry)&&(identical(other.isVpnSuspected, isVpnSuspected) || other.isVpnSuspected == isVpnSuspected)&&(identical(other.proofOfAddressDocType, proofOfAddressDocType) || other.proofOfAddressDocType == proofOfAddressDocType)&&(identical(other.proofOfAddressFrontUrl, proofOfAddressFrontUrl) || other.proofOfAddressFrontUrl == proofOfAddressFrontUrl)&&(identical(other.proofOfAddressBackUrl, proofOfAddressBackUrl) || other.proofOfAddressBackUrl == proofOfAddressBackUrl)&&(identical(other.proofReviewed, proofReviewed) || other.proofReviewed == proofReviewed)&&(identical(other.proofApproved, proofApproved) || other.proofApproved == proofApproved)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selfieUrl,selfieReviewed,selfieApproved,latitude,longitude,detectedCountry,isVpnSuspected,proofOfAddressDocType,proofOfAddressFrontUrl,proofOfAddressBackUrl,proofReviewed,proofApproved,status,submittedAt,reviewedAt);

@override
String toString() {
  return 'Tier2Model(selfieUrl: $selfieUrl, selfieReviewed: $selfieReviewed, selfieApproved: $selfieApproved, latitude: $latitude, longitude: $longitude, detectedCountry: $detectedCountry, isVpnSuspected: $isVpnSuspected, proofOfAddressDocType: $proofOfAddressDocType, proofOfAddressFrontUrl: $proofOfAddressFrontUrl, proofOfAddressBackUrl: $proofOfAddressBackUrl, proofReviewed: $proofReviewed, proofApproved: $proofApproved, status: $status, submittedAt: $submittedAt, reviewedAt: $reviewedAt)';
}


}

/// @nodoc
abstract mixin class $Tier2ModelCopyWith<$Res>  {
  factory $Tier2ModelCopyWith(Tier2Model value, $Res Function(Tier2Model) _then) = _$Tier2ModelCopyWithImpl;
@useResult
$Res call({
 String selfieUrl, bool selfieReviewed, bool selfieApproved, double latitude, double longitude, String detectedCountry, bool isVpnSuspected, String proofOfAddressDocType, String proofOfAddressFrontUrl, String proofOfAddressBackUrl, bool proofReviewed, bool proofApproved, String status, DateTime? submittedAt, DateTime? reviewedAt
});




}
/// @nodoc
class _$Tier2ModelCopyWithImpl<$Res>
    implements $Tier2ModelCopyWith<$Res> {
  _$Tier2ModelCopyWithImpl(this._self, this._then);

  final Tier2Model _self;
  final $Res Function(Tier2Model) _then;

/// Create a copy of Tier2Model
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selfieUrl = null,Object? selfieReviewed = null,Object? selfieApproved = null,Object? latitude = null,Object? longitude = null,Object? detectedCountry = null,Object? isVpnSuspected = null,Object? proofOfAddressDocType = null,Object? proofOfAddressFrontUrl = null,Object? proofOfAddressBackUrl = null,Object? proofReviewed = null,Object? proofApproved = null,Object? status = null,Object? submittedAt = freezed,Object? reviewedAt = freezed,}) {
  return _then(_self.copyWith(
selfieUrl: null == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String,selfieReviewed: null == selfieReviewed ? _self.selfieReviewed : selfieReviewed // ignore: cast_nullable_to_non_nullable
as bool,selfieApproved: null == selfieApproved ? _self.selfieApproved : selfieApproved // ignore: cast_nullable_to_non_nullable
as bool,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,detectedCountry: null == detectedCountry ? _self.detectedCountry : detectedCountry // ignore: cast_nullable_to_non_nullable
as String,isVpnSuspected: null == isVpnSuspected ? _self.isVpnSuspected : isVpnSuspected // ignore: cast_nullable_to_non_nullable
as bool,proofOfAddressDocType: null == proofOfAddressDocType ? _self.proofOfAddressDocType : proofOfAddressDocType // ignore: cast_nullable_to_non_nullable
as String,proofOfAddressFrontUrl: null == proofOfAddressFrontUrl ? _self.proofOfAddressFrontUrl : proofOfAddressFrontUrl // ignore: cast_nullable_to_non_nullable
as String,proofOfAddressBackUrl: null == proofOfAddressBackUrl ? _self.proofOfAddressBackUrl : proofOfAddressBackUrl // ignore: cast_nullable_to_non_nullable
as String,proofReviewed: null == proofReviewed ? _self.proofReviewed : proofReviewed // ignore: cast_nullable_to_non_nullable
as bool,proofApproved: null == proofApproved ? _self.proofApproved : proofApproved // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tier2Model].
extension Tier2ModelPatterns on Tier2Model {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tier2Model value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tier2Model() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tier2Model value)  $default,){
final _that = this;
switch (_that) {
case _Tier2Model():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tier2Model value)?  $default,){
final _that = this;
switch (_that) {
case _Tier2Model() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selfieUrl,  bool selfieReviewed,  bool selfieApproved,  double latitude,  double longitude,  String detectedCountry,  bool isVpnSuspected,  String proofOfAddressDocType,  String proofOfAddressFrontUrl,  String proofOfAddressBackUrl,  bool proofReviewed,  bool proofApproved,  String status,  DateTime? submittedAt,  DateTime? reviewedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tier2Model() when $default != null:
return $default(_that.selfieUrl,_that.selfieReviewed,_that.selfieApproved,_that.latitude,_that.longitude,_that.detectedCountry,_that.isVpnSuspected,_that.proofOfAddressDocType,_that.proofOfAddressFrontUrl,_that.proofOfAddressBackUrl,_that.proofReviewed,_that.proofApproved,_that.status,_that.submittedAt,_that.reviewedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selfieUrl,  bool selfieReviewed,  bool selfieApproved,  double latitude,  double longitude,  String detectedCountry,  bool isVpnSuspected,  String proofOfAddressDocType,  String proofOfAddressFrontUrl,  String proofOfAddressBackUrl,  bool proofReviewed,  bool proofApproved,  String status,  DateTime? submittedAt,  DateTime? reviewedAt)  $default,) {final _that = this;
switch (_that) {
case _Tier2Model():
return $default(_that.selfieUrl,_that.selfieReviewed,_that.selfieApproved,_that.latitude,_that.longitude,_that.detectedCountry,_that.isVpnSuspected,_that.proofOfAddressDocType,_that.proofOfAddressFrontUrl,_that.proofOfAddressBackUrl,_that.proofReviewed,_that.proofApproved,_that.status,_that.submittedAt,_that.reviewedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selfieUrl,  bool selfieReviewed,  bool selfieApproved,  double latitude,  double longitude,  String detectedCountry,  bool isVpnSuspected,  String proofOfAddressDocType,  String proofOfAddressFrontUrl,  String proofOfAddressBackUrl,  bool proofReviewed,  bool proofApproved,  String status,  DateTime? submittedAt,  DateTime? reviewedAt)?  $default,) {final _that = this;
switch (_that) {
case _Tier2Model() when $default != null:
return $default(_that.selfieUrl,_that.selfieReviewed,_that.selfieApproved,_that.latitude,_that.longitude,_that.detectedCountry,_that.isVpnSuspected,_that.proofOfAddressDocType,_that.proofOfAddressFrontUrl,_that.proofOfAddressBackUrl,_that.proofReviewed,_that.proofApproved,_that.status,_that.submittedAt,_that.reviewedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tier2Model implements Tier2Model {
  const _Tier2Model({required this.selfieUrl, this.selfieReviewed = false, this.selfieApproved = false, required this.latitude, required this.longitude, required this.detectedCountry, this.isVpnSuspected = false, required this.proofOfAddressDocType, required this.proofOfAddressFrontUrl, required this.proofOfAddressBackUrl, this.proofReviewed = false, this.proofApproved = false, this.status = 'pending_review', this.submittedAt, this.reviewedAt});
  factory _Tier2Model.fromJson(Map<String, dynamic> json) => _$Tier2ModelFromJson(json);

// Step 4 — Selfie
@override final  String selfieUrl;
@override@JsonKey() final  bool selfieReviewed;
// set to true by admin/backend
@override@JsonKey() final  bool selfieApproved;
// Step 5 — Location
@override final  double latitude;
@override final  double longitude;
@override final  String detectedCountry;
@override@JsonKey() final  bool isVpnSuspected;
// Step 6 — Proof of address
@override final  String proofOfAddressDocType;
@override final  String proofOfAddressFrontUrl;
@override final  String proofOfAddressBackUrl;
@override@JsonKey() final  bool proofReviewed;
@override@JsonKey() final  bool proofApproved;
// Overall
@override@JsonKey() final  String status;
// status values:
//   'pending_review'   — submitted, awaiting manual check
//   'approved'         — all checks passed
//   'rejected'         — failed verification
//   'needs_resubmit'   — one or more docs need resubmission
@override final  DateTime? submittedAt;
@override final  DateTime? reviewedAt;

/// Create a copy of Tier2Model
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Tier2ModelCopyWith<_Tier2Model> get copyWith => __$Tier2ModelCopyWithImpl<_Tier2Model>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Tier2ModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tier2Model&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.selfieReviewed, selfieReviewed) || other.selfieReviewed == selfieReviewed)&&(identical(other.selfieApproved, selfieApproved) || other.selfieApproved == selfieApproved)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.detectedCountry, detectedCountry) || other.detectedCountry == detectedCountry)&&(identical(other.isVpnSuspected, isVpnSuspected) || other.isVpnSuspected == isVpnSuspected)&&(identical(other.proofOfAddressDocType, proofOfAddressDocType) || other.proofOfAddressDocType == proofOfAddressDocType)&&(identical(other.proofOfAddressFrontUrl, proofOfAddressFrontUrl) || other.proofOfAddressFrontUrl == proofOfAddressFrontUrl)&&(identical(other.proofOfAddressBackUrl, proofOfAddressBackUrl) || other.proofOfAddressBackUrl == proofOfAddressBackUrl)&&(identical(other.proofReviewed, proofReviewed) || other.proofReviewed == proofReviewed)&&(identical(other.proofApproved, proofApproved) || other.proofApproved == proofApproved)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selfieUrl,selfieReviewed,selfieApproved,latitude,longitude,detectedCountry,isVpnSuspected,proofOfAddressDocType,proofOfAddressFrontUrl,proofOfAddressBackUrl,proofReviewed,proofApproved,status,submittedAt,reviewedAt);

@override
String toString() {
  return 'Tier2Model(selfieUrl: $selfieUrl, selfieReviewed: $selfieReviewed, selfieApproved: $selfieApproved, latitude: $latitude, longitude: $longitude, detectedCountry: $detectedCountry, isVpnSuspected: $isVpnSuspected, proofOfAddressDocType: $proofOfAddressDocType, proofOfAddressFrontUrl: $proofOfAddressFrontUrl, proofOfAddressBackUrl: $proofOfAddressBackUrl, proofReviewed: $proofReviewed, proofApproved: $proofApproved, status: $status, submittedAt: $submittedAt, reviewedAt: $reviewedAt)';
}


}

/// @nodoc
abstract mixin class _$Tier2ModelCopyWith<$Res> implements $Tier2ModelCopyWith<$Res> {
  factory _$Tier2ModelCopyWith(_Tier2Model value, $Res Function(_Tier2Model) _then) = __$Tier2ModelCopyWithImpl;
@override @useResult
$Res call({
 String selfieUrl, bool selfieReviewed, bool selfieApproved, double latitude, double longitude, String detectedCountry, bool isVpnSuspected, String proofOfAddressDocType, String proofOfAddressFrontUrl, String proofOfAddressBackUrl, bool proofReviewed, bool proofApproved, String status, DateTime? submittedAt, DateTime? reviewedAt
});




}
/// @nodoc
class __$Tier2ModelCopyWithImpl<$Res>
    implements _$Tier2ModelCopyWith<$Res> {
  __$Tier2ModelCopyWithImpl(this._self, this._then);

  final _Tier2Model _self;
  final $Res Function(_Tier2Model) _then;

/// Create a copy of Tier2Model
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selfieUrl = null,Object? selfieReviewed = null,Object? selfieApproved = null,Object? latitude = null,Object? longitude = null,Object? detectedCountry = null,Object? isVpnSuspected = null,Object? proofOfAddressDocType = null,Object? proofOfAddressFrontUrl = null,Object? proofOfAddressBackUrl = null,Object? proofReviewed = null,Object? proofApproved = null,Object? status = null,Object? submittedAt = freezed,Object? reviewedAt = freezed,}) {
  return _then(_Tier2Model(
selfieUrl: null == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String,selfieReviewed: null == selfieReviewed ? _self.selfieReviewed : selfieReviewed // ignore: cast_nullable_to_non_nullable
as bool,selfieApproved: null == selfieApproved ? _self.selfieApproved : selfieApproved // ignore: cast_nullable_to_non_nullable
as bool,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,detectedCountry: null == detectedCountry ? _self.detectedCountry : detectedCountry // ignore: cast_nullable_to_non_nullable
as String,isVpnSuspected: null == isVpnSuspected ? _self.isVpnSuspected : isVpnSuspected // ignore: cast_nullable_to_non_nullable
as bool,proofOfAddressDocType: null == proofOfAddressDocType ? _self.proofOfAddressDocType : proofOfAddressDocType // ignore: cast_nullable_to_non_nullable
as String,proofOfAddressFrontUrl: null == proofOfAddressFrontUrl ? _self.proofOfAddressFrontUrl : proofOfAddressFrontUrl // ignore: cast_nullable_to_non_nullable
as String,proofOfAddressBackUrl: null == proofOfAddressBackUrl ? _self.proofOfAddressBackUrl : proofOfAddressBackUrl // ignore: cast_nullable_to_non_nullable
as String,proofReviewed: null == proofReviewed ? _self.proofReviewed : proofReviewed // ignore: cast_nullable_to_non_nullable
as bool,proofApproved: null == proofApproved ? _self.proofApproved : proofApproved // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$KycProgressModel {

 String get uid;// Tier 1
 BasicInfoModel? get basicInfo; TwoFactorAuthModel? get twoFactorAuth; DocumentVerificationModel? get documentVerification;// Tier 2
 Tier2Model? get tier2;@JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson) List<KycSteps> get completedSteps;@JsonKey(fromJson: stepFromInt, toJson: stepToInt) KycSteps get currentStep;// 'in_progress' | 'tier1_submitted' | 'tier1_verified'
// | 'tier2_pending_review' | 'tier2_approved' | 'tier2_rejected'
 String get status; DateTime? get createdAt; DateTime? get tier1CompletedAt; DateTime? get tier2SubmittedAt;
/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KycProgressModelCopyWith<KycProgressModel> get copyWith => _$KycProgressModelCopyWithImpl<KycProgressModel>(this as KycProgressModel, _$identity);

  /// Serializes this KycProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KycProgressModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.basicInfo, basicInfo) || other.basicInfo == basicInfo)&&(identical(other.twoFactorAuth, twoFactorAuth) || other.twoFactorAuth == twoFactorAuth)&&(identical(other.documentVerification, documentVerification) || other.documentVerification == documentVerification)&&(identical(other.tier2, tier2) || other.tier2 == tier2)&&const DeepCollectionEquality().equals(other.completedSteps, completedSteps)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tier1CompletedAt, tier1CompletedAt) || other.tier1CompletedAt == tier1CompletedAt)&&(identical(other.tier2SubmittedAt, tier2SubmittedAt) || other.tier2SubmittedAt == tier2SubmittedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,basicInfo,twoFactorAuth,documentVerification,tier2,const DeepCollectionEquality().hash(completedSteps),currentStep,status,createdAt,tier1CompletedAt,tier2SubmittedAt);

@override
String toString() {
  return 'KycProgressModel(uid: $uid, basicInfo: $basicInfo, twoFactorAuth: $twoFactorAuth, documentVerification: $documentVerification, tier2: $tier2, completedSteps: $completedSteps, currentStep: $currentStep, status: $status, createdAt: $createdAt, tier1CompletedAt: $tier1CompletedAt, tier2SubmittedAt: $tier2SubmittedAt)';
}


}

/// @nodoc
abstract mixin class $KycProgressModelCopyWith<$Res>  {
  factory $KycProgressModelCopyWith(KycProgressModel value, $Res Function(KycProgressModel) _then) = _$KycProgressModelCopyWithImpl;
@useResult
$Res call({
 String uid, BasicInfoModel? basicInfo, TwoFactorAuthModel? twoFactorAuth, DocumentVerificationModel? documentVerification, Tier2Model? tier2,@JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson) List<KycSteps> completedSteps,@JsonKey(fromJson: stepFromInt, toJson: stepToInt) KycSteps currentStep, String status, DateTime? createdAt, DateTime? tier1CompletedAt, DateTime? tier2SubmittedAt
});


$BasicInfoModelCopyWith<$Res>? get basicInfo;$TwoFactorAuthModelCopyWith<$Res>? get twoFactorAuth;$DocumentVerificationModelCopyWith<$Res>? get documentVerification;$Tier2ModelCopyWith<$Res>? get tier2;

}
/// @nodoc
class _$KycProgressModelCopyWithImpl<$Res>
    implements $KycProgressModelCopyWith<$Res> {
  _$KycProgressModelCopyWithImpl(this._self, this._then);

  final KycProgressModel _self;
  final $Res Function(KycProgressModel) _then;

/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? basicInfo = freezed,Object? twoFactorAuth = freezed,Object? documentVerification = freezed,Object? tier2 = freezed,Object? completedSteps = null,Object? currentStep = null,Object? status = null,Object? createdAt = freezed,Object? tier1CompletedAt = freezed,Object? tier2SubmittedAt = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,basicInfo: freezed == basicInfo ? _self.basicInfo : basicInfo // ignore: cast_nullable_to_non_nullable
as BasicInfoModel?,twoFactorAuth: freezed == twoFactorAuth ? _self.twoFactorAuth : twoFactorAuth // ignore: cast_nullable_to_non_nullable
as TwoFactorAuthModel?,documentVerification: freezed == documentVerification ? _self.documentVerification : documentVerification // ignore: cast_nullable_to_non_nullable
as DocumentVerificationModel?,tier2: freezed == tier2 ? _self.tier2 : tier2 // ignore: cast_nullable_to_non_nullable
as Tier2Model?,completedSteps: null == completedSteps ? _self.completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as List<KycSteps>,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as KycSteps,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tier1CompletedAt: freezed == tier1CompletedAt ? _self.tier1CompletedAt : tier1CompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tier2SubmittedAt: freezed == tier2SubmittedAt ? _self.tier2SubmittedAt : tier2SubmittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicInfoModelCopyWith<$Res>? get basicInfo {
    if (_self.basicInfo == null) {
    return null;
  }

  return $BasicInfoModelCopyWith<$Res>(_self.basicInfo!, (value) {
    return _then(_self.copyWith(basicInfo: value));
  });
}/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TwoFactorAuthModelCopyWith<$Res>? get twoFactorAuth {
    if (_self.twoFactorAuth == null) {
    return null;
  }

  return $TwoFactorAuthModelCopyWith<$Res>(_self.twoFactorAuth!, (value) {
    return _then(_self.copyWith(twoFactorAuth: value));
  });
}/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentVerificationModelCopyWith<$Res>? get documentVerification {
    if (_self.documentVerification == null) {
    return null;
  }

  return $DocumentVerificationModelCopyWith<$Res>(_self.documentVerification!, (value) {
    return _then(_self.copyWith(documentVerification: value));
  });
}/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Tier2ModelCopyWith<$Res>? get tier2 {
    if (_self.tier2 == null) {
    return null;
  }

  return $Tier2ModelCopyWith<$Res>(_self.tier2!, (value) {
    return _then(_self.copyWith(tier2: value));
  });
}
}


/// Adds pattern-matching-related methods to [KycProgressModel].
extension KycProgressModelPatterns on KycProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KycProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KycProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KycProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _KycProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KycProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _KycProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  BasicInfoModel? basicInfo,  TwoFactorAuthModel? twoFactorAuth,  DocumentVerificationModel? documentVerification,  Tier2Model? tier2, @JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson)  List<KycSteps> completedSteps, @JsonKey(fromJson: stepFromInt, toJson: stepToInt)  KycSteps currentStep,  String status,  DateTime? createdAt,  DateTime? tier1CompletedAt,  DateTime? tier2SubmittedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KycProgressModel() when $default != null:
return $default(_that.uid,_that.basicInfo,_that.twoFactorAuth,_that.documentVerification,_that.tier2,_that.completedSteps,_that.currentStep,_that.status,_that.createdAt,_that.tier1CompletedAt,_that.tier2SubmittedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  BasicInfoModel? basicInfo,  TwoFactorAuthModel? twoFactorAuth,  DocumentVerificationModel? documentVerification,  Tier2Model? tier2, @JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson)  List<KycSteps> completedSteps, @JsonKey(fromJson: stepFromInt, toJson: stepToInt)  KycSteps currentStep,  String status,  DateTime? createdAt,  DateTime? tier1CompletedAt,  DateTime? tier2SubmittedAt)  $default,) {final _that = this;
switch (_that) {
case _KycProgressModel():
return $default(_that.uid,_that.basicInfo,_that.twoFactorAuth,_that.documentVerification,_that.tier2,_that.completedSteps,_that.currentStep,_that.status,_that.createdAt,_that.tier1CompletedAt,_that.tier2SubmittedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  BasicInfoModel? basicInfo,  TwoFactorAuthModel? twoFactorAuth,  DocumentVerificationModel? documentVerification,  Tier2Model? tier2, @JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson)  List<KycSteps> completedSteps, @JsonKey(fromJson: stepFromInt, toJson: stepToInt)  KycSteps currentStep,  String status,  DateTime? createdAt,  DateTime? tier1CompletedAt,  DateTime? tier2SubmittedAt)?  $default,) {final _that = this;
switch (_that) {
case _KycProgressModel() when $default != null:
return $default(_that.uid,_that.basicInfo,_that.twoFactorAuth,_that.documentVerification,_that.tier2,_that.completedSteps,_that.currentStep,_that.status,_that.createdAt,_that.tier1CompletedAt,_that.tier2SubmittedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KycProgressModel implements KycProgressModel {
  const _KycProgressModel({required this.uid, this.basicInfo, this.twoFactorAuth, this.documentVerification, this.tier2, @JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson) final  List<KycSteps> completedSteps = const [], @JsonKey(fromJson: stepFromInt, toJson: stepToInt) this.currentStep = KycSteps.intro, this.status = 'in_progress', this.createdAt, this.tier1CompletedAt, this.tier2SubmittedAt}): _completedSteps = completedSteps;
  factory _KycProgressModel.fromJson(Map<String, dynamic> json) => _$KycProgressModelFromJson(json);

@override final  String uid;
// Tier 1
@override final  BasicInfoModel? basicInfo;
@override final  TwoFactorAuthModel? twoFactorAuth;
@override final  DocumentVerificationModel? documentVerification;
// Tier 2
@override final  Tier2Model? tier2;
 final  List<KycSteps> _completedSteps;
@override@JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson) List<KycSteps> get completedSteps {
  if (_completedSteps is EqualUnmodifiableListView) return _completedSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedSteps);
}

@override@JsonKey(fromJson: stepFromInt, toJson: stepToInt) final  KycSteps currentStep;
// 'in_progress' | 'tier1_submitted' | 'tier1_verified'
// | 'tier2_pending_review' | 'tier2_approved' | 'tier2_rejected'
@override@JsonKey() final  String status;
@override final  DateTime? createdAt;
@override final  DateTime? tier1CompletedAt;
@override final  DateTime? tier2SubmittedAt;

/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KycProgressModelCopyWith<_KycProgressModel> get copyWith => __$KycProgressModelCopyWithImpl<_KycProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KycProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KycProgressModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.basicInfo, basicInfo) || other.basicInfo == basicInfo)&&(identical(other.twoFactorAuth, twoFactorAuth) || other.twoFactorAuth == twoFactorAuth)&&(identical(other.documentVerification, documentVerification) || other.documentVerification == documentVerification)&&(identical(other.tier2, tier2) || other.tier2 == tier2)&&const DeepCollectionEquality().equals(other._completedSteps, _completedSteps)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tier1CompletedAt, tier1CompletedAt) || other.tier1CompletedAt == tier1CompletedAt)&&(identical(other.tier2SubmittedAt, tier2SubmittedAt) || other.tier2SubmittedAt == tier2SubmittedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,basicInfo,twoFactorAuth,documentVerification,tier2,const DeepCollectionEquality().hash(_completedSteps),currentStep,status,createdAt,tier1CompletedAt,tier2SubmittedAt);

@override
String toString() {
  return 'KycProgressModel(uid: $uid, basicInfo: $basicInfo, twoFactorAuth: $twoFactorAuth, documentVerification: $documentVerification, tier2: $tier2, completedSteps: $completedSteps, currentStep: $currentStep, status: $status, createdAt: $createdAt, tier1CompletedAt: $tier1CompletedAt, tier2SubmittedAt: $tier2SubmittedAt)';
}


}

/// @nodoc
abstract mixin class _$KycProgressModelCopyWith<$Res> implements $KycProgressModelCopyWith<$Res> {
  factory _$KycProgressModelCopyWith(_KycProgressModel value, $Res Function(_KycProgressModel) _then) = __$KycProgressModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, BasicInfoModel? basicInfo, TwoFactorAuthModel? twoFactorAuth, DocumentVerificationModel? documentVerification, Tier2Model? tier2,@JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson) List<KycSteps> completedSteps,@JsonKey(fromJson: stepFromInt, toJson: stepToInt) KycSteps currentStep, String status, DateTime? createdAt, DateTime? tier1CompletedAt, DateTime? tier2SubmittedAt
});


@override $BasicInfoModelCopyWith<$Res>? get basicInfo;@override $TwoFactorAuthModelCopyWith<$Res>? get twoFactorAuth;@override $DocumentVerificationModelCopyWith<$Res>? get documentVerification;@override $Tier2ModelCopyWith<$Res>? get tier2;

}
/// @nodoc
class __$KycProgressModelCopyWithImpl<$Res>
    implements _$KycProgressModelCopyWith<$Res> {
  __$KycProgressModelCopyWithImpl(this._self, this._then);

  final _KycProgressModel _self;
  final $Res Function(_KycProgressModel) _then;

/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? basicInfo = freezed,Object? twoFactorAuth = freezed,Object? documentVerification = freezed,Object? tier2 = freezed,Object? completedSteps = null,Object? currentStep = null,Object? status = null,Object? createdAt = freezed,Object? tier1CompletedAt = freezed,Object? tier2SubmittedAt = freezed,}) {
  return _then(_KycProgressModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,basicInfo: freezed == basicInfo ? _self.basicInfo : basicInfo // ignore: cast_nullable_to_non_nullable
as BasicInfoModel?,twoFactorAuth: freezed == twoFactorAuth ? _self.twoFactorAuth : twoFactorAuth // ignore: cast_nullable_to_non_nullable
as TwoFactorAuthModel?,documentVerification: freezed == documentVerification ? _self.documentVerification : documentVerification // ignore: cast_nullable_to_non_nullable
as DocumentVerificationModel?,tier2: freezed == tier2 ? _self.tier2 : tier2 // ignore: cast_nullable_to_non_nullable
as Tier2Model?,completedSteps: null == completedSteps ? _self._completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as List<KycSteps>,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as KycSteps,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tier1CompletedAt: freezed == tier1CompletedAt ? _self.tier1CompletedAt : tier1CompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tier2SubmittedAt: freezed == tier2SubmittedAt ? _self.tier2SubmittedAt : tier2SubmittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicInfoModelCopyWith<$Res>? get basicInfo {
    if (_self.basicInfo == null) {
    return null;
  }

  return $BasicInfoModelCopyWith<$Res>(_self.basicInfo!, (value) {
    return _then(_self.copyWith(basicInfo: value));
  });
}/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TwoFactorAuthModelCopyWith<$Res>? get twoFactorAuth {
    if (_self.twoFactorAuth == null) {
    return null;
  }

  return $TwoFactorAuthModelCopyWith<$Res>(_self.twoFactorAuth!, (value) {
    return _then(_self.copyWith(twoFactorAuth: value));
  });
}/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentVerificationModelCopyWith<$Res>? get documentVerification {
    if (_self.documentVerification == null) {
    return null;
  }

  return $DocumentVerificationModelCopyWith<$Res>(_self.documentVerification!, (value) {
    return _then(_self.copyWith(documentVerification: value));
  });
}/// Create a copy of KycProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Tier2ModelCopyWith<$Res>? get tier2 {
    if (_self.tier2 == null) {
    return null;
  }

  return $Tier2ModelCopyWith<$Res>(_self.tier2!, (value) {
    return _then(_self.copyWith(tier2: value));
  });
}
}

// dart format on
