// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KycEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KycEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent()';
}


}

/// @nodoc
class $KycEventCopyWith<$Res>  {
$KycEventCopyWith(KycEvent _, $Res Function(KycEvent) __);
}


/// Adds pattern-matching-related methods to [KycEvent].
extension KycEventPatterns on KycEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadExistingProgress value)?  loadExistingProgress,TResult Function( _NextStep value)?  nextStep,TResult Function( _PreviousStep value)?  previousStep,TResult Function( _NavigateToStep value)?  navigateToStep,TResult Function( _BasicInfoSaved value)?  basicInfoSaved,TResult Function( _TwoFactorSetupCompleted value)?  twoFactorSetupCompleted,TResult Function( _TwoFactorVerificationRequested value)?  twoFactorVerificationRequested,TResult Function( _DocumentSaved value)?  documentSaved,TResult Function( _Submitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadExistingProgress() when loadExistingProgress != null:
return loadExistingProgress(_that);case _NextStep() when nextStep != null:
return nextStep(_that);case _PreviousStep() when previousStep != null:
return previousStep(_that);case _NavigateToStep() when navigateToStep != null:
return navigateToStep(_that);case _BasicInfoSaved() when basicInfoSaved != null:
return basicInfoSaved(_that);case _TwoFactorSetupCompleted() when twoFactorSetupCompleted != null:
return twoFactorSetupCompleted(_that);case _TwoFactorVerificationRequested() when twoFactorVerificationRequested != null:
return twoFactorVerificationRequested(_that);case _DocumentSaved() when documentSaved != null:
return documentSaved(_that);case _Submitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadExistingProgress value)  loadExistingProgress,required TResult Function( _NextStep value)  nextStep,required TResult Function( _PreviousStep value)  previousStep,required TResult Function( _NavigateToStep value)  navigateToStep,required TResult Function( _BasicInfoSaved value)  basicInfoSaved,required TResult Function( _TwoFactorSetupCompleted value)  twoFactorSetupCompleted,required TResult Function( _TwoFactorVerificationRequested value)  twoFactorVerificationRequested,required TResult Function( _DocumentSaved value)  documentSaved,required TResult Function( _Submitted value)  submitted,}){
final _that = this;
switch (_that) {
case _LoadExistingProgress():
return loadExistingProgress(_that);case _NextStep():
return nextStep(_that);case _PreviousStep():
return previousStep(_that);case _NavigateToStep():
return navigateToStep(_that);case _BasicInfoSaved():
return basicInfoSaved(_that);case _TwoFactorSetupCompleted():
return twoFactorSetupCompleted(_that);case _TwoFactorVerificationRequested():
return twoFactorVerificationRequested(_that);case _DocumentSaved():
return documentSaved(_that);case _Submitted():
return submitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadExistingProgress value)?  loadExistingProgress,TResult? Function( _NextStep value)?  nextStep,TResult? Function( _PreviousStep value)?  previousStep,TResult? Function( _NavigateToStep value)?  navigateToStep,TResult? Function( _BasicInfoSaved value)?  basicInfoSaved,TResult? Function( _TwoFactorSetupCompleted value)?  twoFactorSetupCompleted,TResult? Function( _TwoFactorVerificationRequested value)?  twoFactorVerificationRequested,TResult? Function( _DocumentSaved value)?  documentSaved,TResult? Function( _Submitted value)?  submitted,}){
final _that = this;
switch (_that) {
case _LoadExistingProgress() when loadExistingProgress != null:
return loadExistingProgress(_that);case _NextStep() when nextStep != null:
return nextStep(_that);case _PreviousStep() when previousStep != null:
return previousStep(_that);case _NavigateToStep() when navigateToStep != null:
return navigateToStep(_that);case _BasicInfoSaved() when basicInfoSaved != null:
return basicInfoSaved(_that);case _TwoFactorSetupCompleted() when twoFactorSetupCompleted != null:
return twoFactorSetupCompleted(_that);case _TwoFactorVerificationRequested() when twoFactorVerificationRequested != null:
return twoFactorVerificationRequested(_that);case _DocumentSaved() when documentSaved != null:
return documentSaved(_that);case _Submitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadExistingProgress,TResult Function()?  nextStep,TResult Function()?  previousStep,TResult Function( KycSteps step)?  navigateToStep,TResult Function( String firstName,  String lastName,  String gender,  String age,  String country)?  basicInfoSaved,TResult Function( String secretKey,  String qrData)?  twoFactorSetupCompleted,TResult Function( String verificationCode)?  twoFactorVerificationRequested,TResult Function( String documentType,  String documentNumber,  String documentUrl)?  documentSaved,TResult Function()?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadExistingProgress() when loadExistingProgress != null:
return loadExistingProgress();case _NextStep() when nextStep != null:
return nextStep();case _PreviousStep() when previousStep != null:
return previousStep();case _NavigateToStep() when navigateToStep != null:
return navigateToStep(_that.step);case _BasicInfoSaved() when basicInfoSaved != null:
return basicInfoSaved(_that.firstName,_that.lastName,_that.gender,_that.age,_that.country);case _TwoFactorSetupCompleted() when twoFactorSetupCompleted != null:
return twoFactorSetupCompleted(_that.secretKey,_that.qrData);case _TwoFactorVerificationRequested() when twoFactorVerificationRequested != null:
return twoFactorVerificationRequested(_that.verificationCode);case _DocumentSaved() when documentSaved != null:
return documentSaved(_that.documentType,_that.documentNumber,_that.documentUrl);case _Submitted() when submitted != null:
return submitted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadExistingProgress,required TResult Function()  nextStep,required TResult Function()  previousStep,required TResult Function( KycSteps step)  navigateToStep,required TResult Function( String firstName,  String lastName,  String gender,  String age,  String country)  basicInfoSaved,required TResult Function( String secretKey,  String qrData)  twoFactorSetupCompleted,required TResult Function( String verificationCode)  twoFactorVerificationRequested,required TResult Function( String documentType,  String documentNumber,  String documentUrl)  documentSaved,required TResult Function()  submitted,}) {final _that = this;
switch (_that) {
case _LoadExistingProgress():
return loadExistingProgress();case _NextStep():
return nextStep();case _PreviousStep():
return previousStep();case _NavigateToStep():
return navigateToStep(_that.step);case _BasicInfoSaved():
return basicInfoSaved(_that.firstName,_that.lastName,_that.gender,_that.age,_that.country);case _TwoFactorSetupCompleted():
return twoFactorSetupCompleted(_that.secretKey,_that.qrData);case _TwoFactorVerificationRequested():
return twoFactorVerificationRequested(_that.verificationCode);case _DocumentSaved():
return documentSaved(_that.documentType,_that.documentNumber,_that.documentUrl);case _Submitted():
return submitted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadExistingProgress,TResult? Function()?  nextStep,TResult? Function()?  previousStep,TResult? Function( KycSteps step)?  navigateToStep,TResult? Function( String firstName,  String lastName,  String gender,  String age,  String country)?  basicInfoSaved,TResult? Function( String secretKey,  String qrData)?  twoFactorSetupCompleted,TResult? Function( String verificationCode)?  twoFactorVerificationRequested,TResult? Function( String documentType,  String documentNumber,  String documentUrl)?  documentSaved,TResult? Function()?  submitted,}) {final _that = this;
switch (_that) {
case _LoadExistingProgress() when loadExistingProgress != null:
return loadExistingProgress();case _NextStep() when nextStep != null:
return nextStep();case _PreviousStep() when previousStep != null:
return previousStep();case _NavigateToStep() when navigateToStep != null:
return navigateToStep(_that.step);case _BasicInfoSaved() when basicInfoSaved != null:
return basicInfoSaved(_that.firstName,_that.lastName,_that.gender,_that.age,_that.country);case _TwoFactorSetupCompleted() when twoFactorSetupCompleted != null:
return twoFactorSetupCompleted(_that.secretKey,_that.qrData);case _TwoFactorVerificationRequested() when twoFactorVerificationRequested != null:
return twoFactorVerificationRequested(_that.verificationCode);case _DocumentSaved() when documentSaved != null:
return documentSaved(_that.documentType,_that.documentNumber,_that.documentUrl);case _Submitted() when submitted != null:
return submitted();case _:
  return null;

}
}

}

/// @nodoc


class _LoadExistingProgress implements KycEvent {
  const _LoadExistingProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadExistingProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.loadExistingProgress()';
}


}




/// @nodoc


class _NextStep implements KycEvent {
  const _NextStep();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.nextStep()';
}


}




/// @nodoc


class _PreviousStep implements KycEvent {
  const _PreviousStep();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviousStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.previousStep()';
}


}




/// @nodoc


class _NavigateToStep implements KycEvent {
  const _NavigateToStep(this.step);
  

 final  KycSteps step;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigateToStepCopyWith<_NavigateToStep> get copyWith => __$NavigateToStepCopyWithImpl<_NavigateToStep>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateToStep&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'KycEvent.navigateToStep(step: $step)';
}


}

/// @nodoc
abstract mixin class _$NavigateToStepCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$NavigateToStepCopyWith(_NavigateToStep value, $Res Function(_NavigateToStep) _then) = __$NavigateToStepCopyWithImpl;
@useResult
$Res call({
 KycSteps step
});




}
/// @nodoc
class __$NavigateToStepCopyWithImpl<$Res>
    implements _$NavigateToStepCopyWith<$Res> {
  __$NavigateToStepCopyWithImpl(this._self, this._then);

  final _NavigateToStep _self;
  final $Res Function(_NavigateToStep) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(_NavigateToStep(
null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as KycSteps,
  ));
}


}

/// @nodoc


class _BasicInfoSaved implements KycEvent {
  const _BasicInfoSaved({required this.firstName, required this.lastName, required this.gender, required this.age, required this.country});
  

 final  String firstName;
 final  String lastName;
 final  String gender;
 final  String age;
 final  String country;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicInfoSavedCopyWith<_BasicInfoSaved> get copyWith => __$BasicInfoSavedCopyWithImpl<_BasicInfoSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicInfoSaved&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.age, age) || other.age == age)&&(identical(other.country, country) || other.country == country));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,gender,age,country);

@override
String toString() {
  return 'KycEvent.basicInfoSaved(firstName: $firstName, lastName: $lastName, gender: $gender, age: $age, country: $country)';
}


}

/// @nodoc
abstract mixin class _$BasicInfoSavedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$BasicInfoSavedCopyWith(_BasicInfoSaved value, $Res Function(_BasicInfoSaved) _then) = __$BasicInfoSavedCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String gender, String age, String country
});




}
/// @nodoc
class __$BasicInfoSavedCopyWithImpl<$Res>
    implements _$BasicInfoSavedCopyWith<$Res> {
  __$BasicInfoSavedCopyWithImpl(this._self, this._then);

  final _BasicInfoSaved _self;
  final $Res Function(_BasicInfoSaved) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? gender = null,Object? age = null,Object? country = null,}) {
  return _then(_BasicInfoSaved(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TwoFactorSetupCompleted implements KycEvent {
  const _TwoFactorSetupCompleted({required this.secretKey, required this.qrData});
  

 final  String secretKey;
 final  String qrData;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TwoFactorSetupCompletedCopyWith<_TwoFactorSetupCompleted> get copyWith => __$TwoFactorSetupCompletedCopyWithImpl<_TwoFactorSetupCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TwoFactorSetupCompleted&&(identical(other.secretKey, secretKey) || other.secretKey == secretKey)&&(identical(other.qrData, qrData) || other.qrData == qrData));
}


@override
int get hashCode => Object.hash(runtimeType,secretKey,qrData);

@override
String toString() {
  return 'KycEvent.twoFactorSetupCompleted(secretKey: $secretKey, qrData: $qrData)';
}


}

/// @nodoc
abstract mixin class _$TwoFactorSetupCompletedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$TwoFactorSetupCompletedCopyWith(_TwoFactorSetupCompleted value, $Res Function(_TwoFactorSetupCompleted) _then) = __$TwoFactorSetupCompletedCopyWithImpl;
@useResult
$Res call({
 String secretKey, String qrData
});




}
/// @nodoc
class __$TwoFactorSetupCompletedCopyWithImpl<$Res>
    implements _$TwoFactorSetupCompletedCopyWith<$Res> {
  __$TwoFactorSetupCompletedCopyWithImpl(this._self, this._then);

  final _TwoFactorSetupCompleted _self;
  final $Res Function(_TwoFactorSetupCompleted) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? secretKey = null,Object? qrData = null,}) {
  return _then(_TwoFactorSetupCompleted(
secretKey: null == secretKey ? _self.secretKey : secretKey // ignore: cast_nullable_to_non_nullable
as String,qrData: null == qrData ? _self.qrData : qrData // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TwoFactorVerificationRequested implements KycEvent {
  const _TwoFactorVerificationRequested({required this.verificationCode});
  

 final  String verificationCode;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TwoFactorVerificationRequestedCopyWith<_TwoFactorVerificationRequested> get copyWith => __$TwoFactorVerificationRequestedCopyWithImpl<_TwoFactorVerificationRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TwoFactorVerificationRequested&&(identical(other.verificationCode, verificationCode) || other.verificationCode == verificationCode));
}


@override
int get hashCode => Object.hash(runtimeType,verificationCode);

@override
String toString() {
  return 'KycEvent.twoFactorVerificationRequested(verificationCode: $verificationCode)';
}


}

/// @nodoc
abstract mixin class _$TwoFactorVerificationRequestedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$TwoFactorVerificationRequestedCopyWith(_TwoFactorVerificationRequested value, $Res Function(_TwoFactorVerificationRequested) _then) = __$TwoFactorVerificationRequestedCopyWithImpl;
@useResult
$Res call({
 String verificationCode
});




}
/// @nodoc
class __$TwoFactorVerificationRequestedCopyWithImpl<$Res>
    implements _$TwoFactorVerificationRequestedCopyWith<$Res> {
  __$TwoFactorVerificationRequestedCopyWithImpl(this._self, this._then);

  final _TwoFactorVerificationRequested _self;
  final $Res Function(_TwoFactorVerificationRequested) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verificationCode = null,}) {
  return _then(_TwoFactorVerificationRequested(
verificationCode: null == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DocumentSaved implements KycEvent {
  const _DocumentSaved({required this.documentType, required this.documentNumber, required this.documentUrl});
  

 final  String documentType;
 final  String documentNumber;
 final  String documentUrl;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentSavedCopyWith<_DocumentSaved> get copyWith => __$DocumentSavedCopyWithImpl<_DocumentSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentSaved&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.documentUrl, documentUrl) || other.documentUrl == documentUrl));
}


@override
int get hashCode => Object.hash(runtimeType,documentType,documentNumber,documentUrl);

@override
String toString() {
  return 'KycEvent.documentSaved(documentType: $documentType, documentNumber: $documentNumber, documentUrl: $documentUrl)';
}


}

/// @nodoc
abstract mixin class _$DocumentSavedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$DocumentSavedCopyWith(_DocumentSaved value, $Res Function(_DocumentSaved) _then) = __$DocumentSavedCopyWithImpl;
@useResult
$Res call({
 String documentType, String documentNumber, String documentUrl
});




}
/// @nodoc
class __$DocumentSavedCopyWithImpl<$Res>
    implements _$DocumentSavedCopyWith<$Res> {
  __$DocumentSavedCopyWithImpl(this._self, this._then);

  final _DocumentSaved _self;
  final $Res Function(_DocumentSaved) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documentType = null,Object? documentNumber = null,Object? documentUrl = null,}) {
  return _then(_DocumentSaved(
documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String,documentNumber: null == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String,documentUrl: null == documentUrl ? _self.documentUrl : documentUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Submitted implements KycEvent {
  const _Submitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.submitted()';
}


}




/// @nodoc
mixin _$KycState {

// =========================
// FLOW CONTROL (BLOC OWNED)
// =========================
 KycSteps get currentStep; List<KycSteps> get completedSteps;// =========================
// DATA
// =========================
 BasicInfoModel? get basicInfo; TwoFactorAuthModel? get twoFactorAuth; DocumentVerificationModel? get documentVerification;// =========================
// STEP STATUSES
// =========================
 KycStepStatus get basicInfoStatus; KycStepStatus get twoFactorSetupStatus; KycStepStatus get twoFactorVerifyStatus; KycStepStatus get documentStatus; KycStepStatus get submitStatus;// =========================
// ERROR HANDLING
// =========================
 String get errorMessage;
/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KycStateCopyWith<KycState> get copyWith => _$KycStateCopyWithImpl<KycState>(this as KycState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KycState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other.completedSteps, completedSteps)&&(identical(other.basicInfo, basicInfo) || other.basicInfo == basicInfo)&&(identical(other.twoFactorAuth, twoFactorAuth) || other.twoFactorAuth == twoFactorAuth)&&(identical(other.documentVerification, documentVerification) || other.documentVerification == documentVerification)&&(identical(other.basicInfoStatus, basicInfoStatus) || other.basicInfoStatus == basicInfoStatus)&&(identical(other.twoFactorSetupStatus, twoFactorSetupStatus) || other.twoFactorSetupStatus == twoFactorSetupStatus)&&(identical(other.twoFactorVerifyStatus, twoFactorVerifyStatus) || other.twoFactorVerifyStatus == twoFactorVerifyStatus)&&(identical(other.documentStatus, documentStatus) || other.documentStatus == documentStatus)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,const DeepCollectionEquality().hash(completedSteps),basicInfo,twoFactorAuth,documentVerification,basicInfoStatus,twoFactorSetupStatus,twoFactorVerifyStatus,documentStatus,submitStatus,errorMessage);

@override
String toString() {
  return 'KycState(currentStep: $currentStep, completedSteps: $completedSteps, basicInfo: $basicInfo, twoFactorAuth: $twoFactorAuth, documentVerification: $documentVerification, basicInfoStatus: $basicInfoStatus, twoFactorSetupStatus: $twoFactorSetupStatus, twoFactorVerifyStatus: $twoFactorVerifyStatus, documentStatus: $documentStatus, submitStatus: $submitStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $KycStateCopyWith<$Res>  {
  factory $KycStateCopyWith(KycState value, $Res Function(KycState) _then) = _$KycStateCopyWithImpl;
@useResult
$Res call({
 KycSteps currentStep, List<KycSteps> completedSteps, BasicInfoModel? basicInfo, TwoFactorAuthModel? twoFactorAuth, DocumentVerificationModel? documentVerification, KycStepStatus basicInfoStatus, KycStepStatus twoFactorSetupStatus, KycStepStatus twoFactorVerifyStatus, KycStepStatus documentStatus, KycStepStatus submitStatus, String errorMessage
});


$BasicInfoModelCopyWith<$Res>? get basicInfo;$TwoFactorAuthModelCopyWith<$Res>? get twoFactorAuth;$DocumentVerificationModelCopyWith<$Res>? get documentVerification;

}
/// @nodoc
class _$KycStateCopyWithImpl<$Res>
    implements $KycStateCopyWith<$Res> {
  _$KycStateCopyWithImpl(this._self, this._then);

  final KycState _self;
  final $Res Function(KycState) _then;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? completedSteps = null,Object? basicInfo = freezed,Object? twoFactorAuth = freezed,Object? documentVerification = freezed,Object? basicInfoStatus = null,Object? twoFactorSetupStatus = null,Object? twoFactorVerifyStatus = null,Object? documentStatus = null,Object? submitStatus = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as KycSteps,completedSteps: null == completedSteps ? _self.completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as List<KycSteps>,basicInfo: freezed == basicInfo ? _self.basicInfo : basicInfo // ignore: cast_nullable_to_non_nullable
as BasicInfoModel?,twoFactorAuth: freezed == twoFactorAuth ? _self.twoFactorAuth : twoFactorAuth // ignore: cast_nullable_to_non_nullable
as TwoFactorAuthModel?,documentVerification: freezed == documentVerification ? _self.documentVerification : documentVerification // ignore: cast_nullable_to_non_nullable
as DocumentVerificationModel?,basicInfoStatus: null == basicInfoStatus ? _self.basicInfoStatus : basicInfoStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,twoFactorSetupStatus: null == twoFactorSetupStatus ? _self.twoFactorSetupStatus : twoFactorSetupStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,twoFactorVerifyStatus: null == twoFactorVerifyStatus ? _self.twoFactorVerifyStatus : twoFactorVerifyStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,documentStatus: null == documentStatus ? _self.documentStatus : documentStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of KycState
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
}/// Create a copy of KycState
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
}/// Create a copy of KycState
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
}
}


/// Adds pattern-matching-related methods to [KycState].
extension KycStatePatterns on KycState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KycState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KycState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KycState value)  $default,){
final _that = this;
switch (_that) {
case _KycState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KycState value)?  $default,){
final _that = this;
switch (_that) {
case _KycState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( KycSteps currentStep,  List<KycSteps> completedSteps,  BasicInfoModel? basicInfo,  TwoFactorAuthModel? twoFactorAuth,  DocumentVerificationModel? documentVerification,  KycStepStatus basicInfoStatus,  KycStepStatus twoFactorSetupStatus,  KycStepStatus twoFactorVerifyStatus,  KycStepStatus documentStatus,  KycStepStatus submitStatus,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KycState() when $default != null:
return $default(_that.currentStep,_that.completedSteps,_that.basicInfo,_that.twoFactorAuth,_that.documentVerification,_that.basicInfoStatus,_that.twoFactorSetupStatus,_that.twoFactorVerifyStatus,_that.documentStatus,_that.submitStatus,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( KycSteps currentStep,  List<KycSteps> completedSteps,  BasicInfoModel? basicInfo,  TwoFactorAuthModel? twoFactorAuth,  DocumentVerificationModel? documentVerification,  KycStepStatus basicInfoStatus,  KycStepStatus twoFactorSetupStatus,  KycStepStatus twoFactorVerifyStatus,  KycStepStatus documentStatus,  KycStepStatus submitStatus,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _KycState():
return $default(_that.currentStep,_that.completedSteps,_that.basicInfo,_that.twoFactorAuth,_that.documentVerification,_that.basicInfoStatus,_that.twoFactorSetupStatus,_that.twoFactorVerifyStatus,_that.documentStatus,_that.submitStatus,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( KycSteps currentStep,  List<KycSteps> completedSteps,  BasicInfoModel? basicInfo,  TwoFactorAuthModel? twoFactorAuth,  DocumentVerificationModel? documentVerification,  KycStepStatus basicInfoStatus,  KycStepStatus twoFactorSetupStatus,  KycStepStatus twoFactorVerifyStatus,  KycStepStatus documentStatus,  KycStepStatus submitStatus,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _KycState() when $default != null:
return $default(_that.currentStep,_that.completedSteps,_that.basicInfo,_that.twoFactorAuth,_that.documentVerification,_that.basicInfoStatus,_that.twoFactorSetupStatus,_that.twoFactorVerifyStatus,_that.documentStatus,_that.submitStatus,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _KycState extends KycState {
  const _KycState({this.currentStep = KycSteps.intro, final  List<KycSteps> completedSteps = const [], this.basicInfo, this.twoFactorAuth, this.documentVerification, this.basicInfoStatus = KycStepStatus.initial, this.twoFactorSetupStatus = KycStepStatus.initial, this.twoFactorVerifyStatus = KycStepStatus.initial, this.documentStatus = KycStepStatus.initial, this.submitStatus = KycStepStatus.initial, this.errorMessage = ''}): _completedSteps = completedSteps,super._();
  

// =========================
// FLOW CONTROL (BLOC OWNED)
// =========================
@override@JsonKey() final  KycSteps currentStep;
 final  List<KycSteps> _completedSteps;
@override@JsonKey() List<KycSteps> get completedSteps {
  if (_completedSteps is EqualUnmodifiableListView) return _completedSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedSteps);
}

// =========================
// DATA
// =========================
@override final  BasicInfoModel? basicInfo;
@override final  TwoFactorAuthModel? twoFactorAuth;
@override final  DocumentVerificationModel? documentVerification;
// =========================
// STEP STATUSES
// =========================
@override@JsonKey() final  KycStepStatus basicInfoStatus;
@override@JsonKey() final  KycStepStatus twoFactorSetupStatus;
@override@JsonKey() final  KycStepStatus twoFactorVerifyStatus;
@override@JsonKey() final  KycStepStatus documentStatus;
@override@JsonKey() final  KycStepStatus submitStatus;
// =========================
// ERROR HANDLING
// =========================
@override@JsonKey() final  String errorMessage;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KycStateCopyWith<_KycState> get copyWith => __$KycStateCopyWithImpl<_KycState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KycState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other._completedSteps, _completedSteps)&&(identical(other.basicInfo, basicInfo) || other.basicInfo == basicInfo)&&(identical(other.twoFactorAuth, twoFactorAuth) || other.twoFactorAuth == twoFactorAuth)&&(identical(other.documentVerification, documentVerification) || other.documentVerification == documentVerification)&&(identical(other.basicInfoStatus, basicInfoStatus) || other.basicInfoStatus == basicInfoStatus)&&(identical(other.twoFactorSetupStatus, twoFactorSetupStatus) || other.twoFactorSetupStatus == twoFactorSetupStatus)&&(identical(other.twoFactorVerifyStatus, twoFactorVerifyStatus) || other.twoFactorVerifyStatus == twoFactorVerifyStatus)&&(identical(other.documentStatus, documentStatus) || other.documentStatus == documentStatus)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,const DeepCollectionEquality().hash(_completedSteps),basicInfo,twoFactorAuth,documentVerification,basicInfoStatus,twoFactorSetupStatus,twoFactorVerifyStatus,documentStatus,submitStatus,errorMessage);

@override
String toString() {
  return 'KycState(currentStep: $currentStep, completedSteps: $completedSteps, basicInfo: $basicInfo, twoFactorAuth: $twoFactorAuth, documentVerification: $documentVerification, basicInfoStatus: $basicInfoStatus, twoFactorSetupStatus: $twoFactorSetupStatus, twoFactorVerifyStatus: $twoFactorVerifyStatus, documentStatus: $documentStatus, submitStatus: $submitStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$KycStateCopyWith<$Res> implements $KycStateCopyWith<$Res> {
  factory _$KycStateCopyWith(_KycState value, $Res Function(_KycState) _then) = __$KycStateCopyWithImpl;
@override @useResult
$Res call({
 KycSteps currentStep, List<KycSteps> completedSteps, BasicInfoModel? basicInfo, TwoFactorAuthModel? twoFactorAuth, DocumentVerificationModel? documentVerification, KycStepStatus basicInfoStatus, KycStepStatus twoFactorSetupStatus, KycStepStatus twoFactorVerifyStatus, KycStepStatus documentStatus, KycStepStatus submitStatus, String errorMessage
});


@override $BasicInfoModelCopyWith<$Res>? get basicInfo;@override $TwoFactorAuthModelCopyWith<$Res>? get twoFactorAuth;@override $DocumentVerificationModelCopyWith<$Res>? get documentVerification;

}
/// @nodoc
class __$KycStateCopyWithImpl<$Res>
    implements _$KycStateCopyWith<$Res> {
  __$KycStateCopyWithImpl(this._self, this._then);

  final _KycState _self;
  final $Res Function(_KycState) _then;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? completedSteps = null,Object? basicInfo = freezed,Object? twoFactorAuth = freezed,Object? documentVerification = freezed,Object? basicInfoStatus = null,Object? twoFactorSetupStatus = null,Object? twoFactorVerifyStatus = null,Object? documentStatus = null,Object? submitStatus = null,Object? errorMessage = null,}) {
  return _then(_KycState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as KycSteps,completedSteps: null == completedSteps ? _self._completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as List<KycSteps>,basicInfo: freezed == basicInfo ? _self.basicInfo : basicInfo // ignore: cast_nullable_to_non_nullable
as BasicInfoModel?,twoFactorAuth: freezed == twoFactorAuth ? _self.twoFactorAuth : twoFactorAuth // ignore: cast_nullable_to_non_nullable
as TwoFactorAuthModel?,documentVerification: freezed == documentVerification ? _self.documentVerification : documentVerification // ignore: cast_nullable_to_non_nullable
as DocumentVerificationModel?,basicInfoStatus: null == basicInfoStatus ? _self.basicInfoStatus : basicInfoStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,twoFactorSetupStatus: null == twoFactorSetupStatus ? _self.twoFactorSetupStatus : twoFactorSetupStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,twoFactorVerifyStatus: null == twoFactorVerifyStatus ? _self.twoFactorVerifyStatus : twoFactorVerifyStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,documentStatus: null == documentStatus ? _self.documentStatus : documentStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of KycState
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
}/// Create a copy of KycState
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
}/// Create a copy of KycState
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
}
}

// dart format on
