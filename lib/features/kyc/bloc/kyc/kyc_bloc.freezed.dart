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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadExistingProgress value)?  loadExistingProgress,TResult Function( _NextStep value)?  nextStep,TResult Function( _PreviousStep value)?  previousStep,TResult Function( _NavigateToStep value)?  navigateToStep,TResult Function( _FirstNameChanged value)?  firstNameChanged,TResult Function( _LastNameChanged value)?  lastNameChanged,TResult Function( _AgeChanged value)?  ageChanged,TResult Function( _GenderChanged value)?  genderChanged,TResult Function( _CountryChanged value)?  countryChanged,TResult Function( _BasicInfoSaved value)?  basicInfoSaved,TResult Function( _TwoFactorSetupCompleted value)?  twoFactorSetupCompleted,TResult Function( _OtpDigitChanged value)?  otpDigitChanged,TResult Function( _TwoFactorVerificationRequested value)?  twoFactorVerificationRequested,TResult Function( _DocTypeChanged value)?  docTypeChanged,TResult Function( _DocNumberChanged value)?  docNumberChanged,TResult Function( _DocumentSaved value)?  documentSaved,TResult Function( _Submitted value)?  submitted,TResult Function( _StartTier2 value)?  startTier2,TResult Function( _SkipTier2 value)?  skipTier2,TResult Function( _SelfieCaptureDone value)?  selfieCaptureDone,TResult Function( _LocationCaptured value)?  locationCaptured,TResult Function( _ProofOfAddressDocTypeChanged value)?  proofOfAddressDocTypeChanged,TResult Function( _ProofOfAddressUploaded value)?  proofOfAddressUploaded,TResult Function( _Tier2Submitted value)?  tier2Submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadExistingProgress() when loadExistingProgress != null:
return loadExistingProgress(_that);case _NextStep() when nextStep != null:
return nextStep(_that);case _PreviousStep() when previousStep != null:
return previousStep(_that);case _NavigateToStep() when navigateToStep != null:
return navigateToStep(_that);case _FirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that);case _LastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that);case _AgeChanged() when ageChanged != null:
return ageChanged(_that);case _GenderChanged() when genderChanged != null:
return genderChanged(_that);case _CountryChanged() when countryChanged != null:
return countryChanged(_that);case _BasicInfoSaved() when basicInfoSaved != null:
return basicInfoSaved(_that);case _TwoFactorSetupCompleted() when twoFactorSetupCompleted != null:
return twoFactorSetupCompleted(_that);case _OtpDigitChanged() when otpDigitChanged != null:
return otpDigitChanged(_that);case _TwoFactorVerificationRequested() when twoFactorVerificationRequested != null:
return twoFactorVerificationRequested(_that);case _DocTypeChanged() when docTypeChanged != null:
return docTypeChanged(_that);case _DocNumberChanged() when docNumberChanged != null:
return docNumberChanged(_that);case _DocumentSaved() when documentSaved != null:
return documentSaved(_that);case _Submitted() when submitted != null:
return submitted(_that);case _StartTier2() when startTier2 != null:
return startTier2(_that);case _SkipTier2() when skipTier2 != null:
return skipTier2(_that);case _SelfieCaptureDone() when selfieCaptureDone != null:
return selfieCaptureDone(_that);case _LocationCaptured() when locationCaptured != null:
return locationCaptured(_that);case _ProofOfAddressDocTypeChanged() when proofOfAddressDocTypeChanged != null:
return proofOfAddressDocTypeChanged(_that);case _ProofOfAddressUploaded() when proofOfAddressUploaded != null:
return proofOfAddressUploaded(_that);case _Tier2Submitted() when tier2Submitted != null:
return tier2Submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadExistingProgress value)  loadExistingProgress,required TResult Function( _NextStep value)  nextStep,required TResult Function( _PreviousStep value)  previousStep,required TResult Function( _NavigateToStep value)  navigateToStep,required TResult Function( _FirstNameChanged value)  firstNameChanged,required TResult Function( _LastNameChanged value)  lastNameChanged,required TResult Function( _AgeChanged value)  ageChanged,required TResult Function( _GenderChanged value)  genderChanged,required TResult Function( _CountryChanged value)  countryChanged,required TResult Function( _BasicInfoSaved value)  basicInfoSaved,required TResult Function( _TwoFactorSetupCompleted value)  twoFactorSetupCompleted,required TResult Function( _OtpDigitChanged value)  otpDigitChanged,required TResult Function( _TwoFactorVerificationRequested value)  twoFactorVerificationRequested,required TResult Function( _DocTypeChanged value)  docTypeChanged,required TResult Function( _DocNumberChanged value)  docNumberChanged,required TResult Function( _DocumentSaved value)  documentSaved,required TResult Function( _Submitted value)  submitted,required TResult Function( _StartTier2 value)  startTier2,required TResult Function( _SkipTier2 value)  skipTier2,required TResult Function( _SelfieCaptureDone value)  selfieCaptureDone,required TResult Function( _LocationCaptured value)  locationCaptured,required TResult Function( _ProofOfAddressDocTypeChanged value)  proofOfAddressDocTypeChanged,required TResult Function( _ProofOfAddressUploaded value)  proofOfAddressUploaded,required TResult Function( _Tier2Submitted value)  tier2Submitted,}){
final _that = this;
switch (_that) {
case _LoadExistingProgress():
return loadExistingProgress(_that);case _NextStep():
return nextStep(_that);case _PreviousStep():
return previousStep(_that);case _NavigateToStep():
return navigateToStep(_that);case _FirstNameChanged():
return firstNameChanged(_that);case _LastNameChanged():
return lastNameChanged(_that);case _AgeChanged():
return ageChanged(_that);case _GenderChanged():
return genderChanged(_that);case _CountryChanged():
return countryChanged(_that);case _BasicInfoSaved():
return basicInfoSaved(_that);case _TwoFactorSetupCompleted():
return twoFactorSetupCompleted(_that);case _OtpDigitChanged():
return otpDigitChanged(_that);case _TwoFactorVerificationRequested():
return twoFactorVerificationRequested(_that);case _DocTypeChanged():
return docTypeChanged(_that);case _DocNumberChanged():
return docNumberChanged(_that);case _DocumentSaved():
return documentSaved(_that);case _Submitted():
return submitted(_that);case _StartTier2():
return startTier2(_that);case _SkipTier2():
return skipTier2(_that);case _SelfieCaptureDone():
return selfieCaptureDone(_that);case _LocationCaptured():
return locationCaptured(_that);case _ProofOfAddressDocTypeChanged():
return proofOfAddressDocTypeChanged(_that);case _ProofOfAddressUploaded():
return proofOfAddressUploaded(_that);case _Tier2Submitted():
return tier2Submitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadExistingProgress value)?  loadExistingProgress,TResult? Function( _NextStep value)?  nextStep,TResult? Function( _PreviousStep value)?  previousStep,TResult? Function( _NavigateToStep value)?  navigateToStep,TResult? Function( _FirstNameChanged value)?  firstNameChanged,TResult? Function( _LastNameChanged value)?  lastNameChanged,TResult? Function( _AgeChanged value)?  ageChanged,TResult? Function( _GenderChanged value)?  genderChanged,TResult? Function( _CountryChanged value)?  countryChanged,TResult? Function( _BasicInfoSaved value)?  basicInfoSaved,TResult? Function( _TwoFactorSetupCompleted value)?  twoFactorSetupCompleted,TResult? Function( _OtpDigitChanged value)?  otpDigitChanged,TResult? Function( _TwoFactorVerificationRequested value)?  twoFactorVerificationRequested,TResult? Function( _DocTypeChanged value)?  docTypeChanged,TResult? Function( _DocNumberChanged value)?  docNumberChanged,TResult? Function( _DocumentSaved value)?  documentSaved,TResult? Function( _Submitted value)?  submitted,TResult? Function( _StartTier2 value)?  startTier2,TResult? Function( _SkipTier2 value)?  skipTier2,TResult? Function( _SelfieCaptureDone value)?  selfieCaptureDone,TResult? Function( _LocationCaptured value)?  locationCaptured,TResult? Function( _ProofOfAddressDocTypeChanged value)?  proofOfAddressDocTypeChanged,TResult? Function( _ProofOfAddressUploaded value)?  proofOfAddressUploaded,TResult? Function( _Tier2Submitted value)?  tier2Submitted,}){
final _that = this;
switch (_that) {
case _LoadExistingProgress() when loadExistingProgress != null:
return loadExistingProgress(_that);case _NextStep() when nextStep != null:
return nextStep(_that);case _PreviousStep() when previousStep != null:
return previousStep(_that);case _NavigateToStep() when navigateToStep != null:
return navigateToStep(_that);case _FirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that);case _LastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that);case _AgeChanged() when ageChanged != null:
return ageChanged(_that);case _GenderChanged() when genderChanged != null:
return genderChanged(_that);case _CountryChanged() when countryChanged != null:
return countryChanged(_that);case _BasicInfoSaved() when basicInfoSaved != null:
return basicInfoSaved(_that);case _TwoFactorSetupCompleted() when twoFactorSetupCompleted != null:
return twoFactorSetupCompleted(_that);case _OtpDigitChanged() when otpDigitChanged != null:
return otpDigitChanged(_that);case _TwoFactorVerificationRequested() when twoFactorVerificationRequested != null:
return twoFactorVerificationRequested(_that);case _DocTypeChanged() when docTypeChanged != null:
return docTypeChanged(_that);case _DocNumberChanged() when docNumberChanged != null:
return docNumberChanged(_that);case _DocumentSaved() when documentSaved != null:
return documentSaved(_that);case _Submitted() when submitted != null:
return submitted(_that);case _StartTier2() when startTier2 != null:
return startTier2(_that);case _SkipTier2() when skipTier2 != null:
return skipTier2(_that);case _SelfieCaptureDone() when selfieCaptureDone != null:
return selfieCaptureDone(_that);case _LocationCaptured() when locationCaptured != null:
return locationCaptured(_that);case _ProofOfAddressDocTypeChanged() when proofOfAddressDocTypeChanged != null:
return proofOfAddressDocTypeChanged(_that);case _ProofOfAddressUploaded() when proofOfAddressUploaded != null:
return proofOfAddressUploaded(_that);case _Tier2Submitted() when tier2Submitted != null:
return tier2Submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadExistingProgress,TResult Function()?  nextStep,TResult Function()?  previousStep,TResult Function( KycSteps step)?  navigateToStep,TResult Function( String value)?  firstNameChanged,TResult Function( String value)?  lastNameChanged,TResult Function( String value)?  ageChanged,TResult Function( String value)?  genderChanged,TResult Function( String value)?  countryChanged,TResult Function()?  basicInfoSaved,TResult Function( String secretKey,  String qrData)?  twoFactorSetupCompleted,TResult Function( int index,  String digit)?  otpDigitChanged,TResult Function()?  twoFactorVerificationRequested,TResult Function( String value)?  docTypeChanged,TResult Function( String value)?  docNumberChanged,TResult Function()?  documentSaved,TResult Function()?  submitted,TResult Function()?  startTier2,TResult Function()?  skipTier2,TResult Function( String selfieUrl)?  selfieCaptureDone,TResult Function( double latitude,  double longitude,  String detectedCountry,  bool isVpnSuspected)?  locationCaptured,TResult Function( String value)?  proofOfAddressDocTypeChanged,TResult Function( String documentUrl)?  proofOfAddressUploaded,TResult Function()?  tier2Submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadExistingProgress() when loadExistingProgress != null:
return loadExistingProgress();case _NextStep() when nextStep != null:
return nextStep();case _PreviousStep() when previousStep != null:
return previousStep();case _NavigateToStep() when navigateToStep != null:
return navigateToStep(_that.step);case _FirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that.value);case _LastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that.value);case _AgeChanged() when ageChanged != null:
return ageChanged(_that.value);case _GenderChanged() when genderChanged != null:
return genderChanged(_that.value);case _CountryChanged() when countryChanged != null:
return countryChanged(_that.value);case _BasicInfoSaved() when basicInfoSaved != null:
return basicInfoSaved();case _TwoFactorSetupCompleted() when twoFactorSetupCompleted != null:
return twoFactorSetupCompleted(_that.secretKey,_that.qrData);case _OtpDigitChanged() when otpDigitChanged != null:
return otpDigitChanged(_that.index,_that.digit);case _TwoFactorVerificationRequested() when twoFactorVerificationRequested != null:
return twoFactorVerificationRequested();case _DocTypeChanged() when docTypeChanged != null:
return docTypeChanged(_that.value);case _DocNumberChanged() when docNumberChanged != null:
return docNumberChanged(_that.value);case _DocumentSaved() when documentSaved != null:
return documentSaved();case _Submitted() when submitted != null:
return submitted();case _StartTier2() when startTier2 != null:
return startTier2();case _SkipTier2() when skipTier2 != null:
return skipTier2();case _SelfieCaptureDone() when selfieCaptureDone != null:
return selfieCaptureDone(_that.selfieUrl);case _LocationCaptured() when locationCaptured != null:
return locationCaptured(_that.latitude,_that.longitude,_that.detectedCountry,_that.isVpnSuspected);case _ProofOfAddressDocTypeChanged() when proofOfAddressDocTypeChanged != null:
return proofOfAddressDocTypeChanged(_that.value);case _ProofOfAddressUploaded() when proofOfAddressUploaded != null:
return proofOfAddressUploaded(_that.documentUrl);case _Tier2Submitted() when tier2Submitted != null:
return tier2Submitted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadExistingProgress,required TResult Function()  nextStep,required TResult Function()  previousStep,required TResult Function( KycSteps step)  navigateToStep,required TResult Function( String value)  firstNameChanged,required TResult Function( String value)  lastNameChanged,required TResult Function( String value)  ageChanged,required TResult Function( String value)  genderChanged,required TResult Function( String value)  countryChanged,required TResult Function()  basicInfoSaved,required TResult Function( String secretKey,  String qrData)  twoFactorSetupCompleted,required TResult Function( int index,  String digit)  otpDigitChanged,required TResult Function()  twoFactorVerificationRequested,required TResult Function( String value)  docTypeChanged,required TResult Function( String value)  docNumberChanged,required TResult Function()  documentSaved,required TResult Function()  submitted,required TResult Function()  startTier2,required TResult Function()  skipTier2,required TResult Function( String selfieUrl)  selfieCaptureDone,required TResult Function( double latitude,  double longitude,  String detectedCountry,  bool isVpnSuspected)  locationCaptured,required TResult Function( String value)  proofOfAddressDocTypeChanged,required TResult Function( String documentUrl)  proofOfAddressUploaded,required TResult Function()  tier2Submitted,}) {final _that = this;
switch (_that) {
case _LoadExistingProgress():
return loadExistingProgress();case _NextStep():
return nextStep();case _PreviousStep():
return previousStep();case _NavigateToStep():
return navigateToStep(_that.step);case _FirstNameChanged():
return firstNameChanged(_that.value);case _LastNameChanged():
return lastNameChanged(_that.value);case _AgeChanged():
return ageChanged(_that.value);case _GenderChanged():
return genderChanged(_that.value);case _CountryChanged():
return countryChanged(_that.value);case _BasicInfoSaved():
return basicInfoSaved();case _TwoFactorSetupCompleted():
return twoFactorSetupCompleted(_that.secretKey,_that.qrData);case _OtpDigitChanged():
return otpDigitChanged(_that.index,_that.digit);case _TwoFactorVerificationRequested():
return twoFactorVerificationRequested();case _DocTypeChanged():
return docTypeChanged(_that.value);case _DocNumberChanged():
return docNumberChanged(_that.value);case _DocumentSaved():
return documentSaved();case _Submitted():
return submitted();case _StartTier2():
return startTier2();case _SkipTier2():
return skipTier2();case _SelfieCaptureDone():
return selfieCaptureDone(_that.selfieUrl);case _LocationCaptured():
return locationCaptured(_that.latitude,_that.longitude,_that.detectedCountry,_that.isVpnSuspected);case _ProofOfAddressDocTypeChanged():
return proofOfAddressDocTypeChanged(_that.value);case _ProofOfAddressUploaded():
return proofOfAddressUploaded(_that.documentUrl);case _Tier2Submitted():
return tier2Submitted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadExistingProgress,TResult? Function()?  nextStep,TResult? Function()?  previousStep,TResult? Function( KycSteps step)?  navigateToStep,TResult? Function( String value)?  firstNameChanged,TResult? Function( String value)?  lastNameChanged,TResult? Function( String value)?  ageChanged,TResult? Function( String value)?  genderChanged,TResult? Function( String value)?  countryChanged,TResult? Function()?  basicInfoSaved,TResult? Function( String secretKey,  String qrData)?  twoFactorSetupCompleted,TResult? Function( int index,  String digit)?  otpDigitChanged,TResult? Function()?  twoFactorVerificationRequested,TResult? Function( String value)?  docTypeChanged,TResult? Function( String value)?  docNumberChanged,TResult? Function()?  documentSaved,TResult? Function()?  submitted,TResult? Function()?  startTier2,TResult? Function()?  skipTier2,TResult? Function( String selfieUrl)?  selfieCaptureDone,TResult? Function( double latitude,  double longitude,  String detectedCountry,  bool isVpnSuspected)?  locationCaptured,TResult? Function( String value)?  proofOfAddressDocTypeChanged,TResult? Function( String documentUrl)?  proofOfAddressUploaded,TResult? Function()?  tier2Submitted,}) {final _that = this;
switch (_that) {
case _LoadExistingProgress() when loadExistingProgress != null:
return loadExistingProgress();case _NextStep() when nextStep != null:
return nextStep();case _PreviousStep() when previousStep != null:
return previousStep();case _NavigateToStep() when navigateToStep != null:
return navigateToStep(_that.step);case _FirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that.value);case _LastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that.value);case _AgeChanged() when ageChanged != null:
return ageChanged(_that.value);case _GenderChanged() when genderChanged != null:
return genderChanged(_that.value);case _CountryChanged() when countryChanged != null:
return countryChanged(_that.value);case _BasicInfoSaved() when basicInfoSaved != null:
return basicInfoSaved();case _TwoFactorSetupCompleted() when twoFactorSetupCompleted != null:
return twoFactorSetupCompleted(_that.secretKey,_that.qrData);case _OtpDigitChanged() when otpDigitChanged != null:
return otpDigitChanged(_that.index,_that.digit);case _TwoFactorVerificationRequested() when twoFactorVerificationRequested != null:
return twoFactorVerificationRequested();case _DocTypeChanged() when docTypeChanged != null:
return docTypeChanged(_that.value);case _DocNumberChanged() when docNumberChanged != null:
return docNumberChanged(_that.value);case _DocumentSaved() when documentSaved != null:
return documentSaved();case _Submitted() when submitted != null:
return submitted();case _StartTier2() when startTier2 != null:
return startTier2();case _SkipTier2() when skipTier2 != null:
return skipTier2();case _SelfieCaptureDone() when selfieCaptureDone != null:
return selfieCaptureDone(_that.selfieUrl);case _LocationCaptured() when locationCaptured != null:
return locationCaptured(_that.latitude,_that.longitude,_that.detectedCountry,_that.isVpnSuspected);case _ProofOfAddressDocTypeChanged() when proofOfAddressDocTypeChanged != null:
return proofOfAddressDocTypeChanged(_that.value);case _ProofOfAddressUploaded() when proofOfAddressUploaded != null:
return proofOfAddressUploaded(_that.documentUrl);case _Tier2Submitted() when tier2Submitted != null:
return tier2Submitted();case _:
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


class _FirstNameChanged implements KycEvent {
  const _FirstNameChanged(this.value);
  

 final  String value;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirstNameChangedCopyWith<_FirstNameChanged> get copyWith => __$FirstNameChangedCopyWithImpl<_FirstNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirstNameChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'KycEvent.firstNameChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$FirstNameChangedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$FirstNameChangedCopyWith(_FirstNameChanged value, $Res Function(_FirstNameChanged) _then) = __$FirstNameChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$FirstNameChangedCopyWithImpl<$Res>
    implements _$FirstNameChangedCopyWith<$Res> {
  __$FirstNameChangedCopyWithImpl(this._self, this._then);

  final _FirstNameChanged _self;
  final $Res Function(_FirstNameChanged) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_FirstNameChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LastNameChanged implements KycEvent {
  const _LastNameChanged(this.value);
  

 final  String value;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LastNameChangedCopyWith<_LastNameChanged> get copyWith => __$LastNameChangedCopyWithImpl<_LastNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LastNameChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'KycEvent.lastNameChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$LastNameChangedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$LastNameChangedCopyWith(_LastNameChanged value, $Res Function(_LastNameChanged) _then) = __$LastNameChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$LastNameChangedCopyWithImpl<$Res>
    implements _$LastNameChangedCopyWith<$Res> {
  __$LastNameChangedCopyWithImpl(this._self, this._then);

  final _LastNameChanged _self;
  final $Res Function(_LastNameChanged) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_LastNameChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AgeChanged implements KycEvent {
  const _AgeChanged(this.value);
  

 final  String value;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgeChangedCopyWith<_AgeChanged> get copyWith => __$AgeChangedCopyWithImpl<_AgeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgeChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'KycEvent.ageChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$AgeChangedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$AgeChangedCopyWith(_AgeChanged value, $Res Function(_AgeChanged) _then) = __$AgeChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$AgeChangedCopyWithImpl<$Res>
    implements _$AgeChangedCopyWith<$Res> {
  __$AgeChangedCopyWithImpl(this._self, this._then);

  final _AgeChanged _self;
  final $Res Function(_AgeChanged) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_AgeChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GenderChanged implements KycEvent {
  const _GenderChanged(this.value);
  

 final  String value;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenderChangedCopyWith<_GenderChanged> get copyWith => __$GenderChangedCopyWithImpl<_GenderChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenderChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'KycEvent.genderChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$GenderChangedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$GenderChangedCopyWith(_GenderChanged value, $Res Function(_GenderChanged) _then) = __$GenderChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$GenderChangedCopyWithImpl<$Res>
    implements _$GenderChangedCopyWith<$Res> {
  __$GenderChangedCopyWithImpl(this._self, this._then);

  final _GenderChanged _self;
  final $Res Function(_GenderChanged) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_GenderChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CountryChanged implements KycEvent {
  const _CountryChanged(this.value);
  

 final  String value;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryChangedCopyWith<_CountryChanged> get copyWith => __$CountryChangedCopyWithImpl<_CountryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'KycEvent.countryChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$CountryChangedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$CountryChangedCopyWith(_CountryChanged value, $Res Function(_CountryChanged) _then) = __$CountryChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$CountryChangedCopyWithImpl<$Res>
    implements _$CountryChangedCopyWith<$Res> {
  __$CountryChangedCopyWithImpl(this._self, this._then);

  final _CountryChanged _self;
  final $Res Function(_CountryChanged) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_CountryChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BasicInfoSaved implements KycEvent {
  const _BasicInfoSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicInfoSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.basicInfoSaved()';
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


class _OtpDigitChanged implements KycEvent {
  const _OtpDigitChanged({required this.index, required this.digit});
  

 final  int index;
 final  String digit;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpDigitChangedCopyWith<_OtpDigitChanged> get copyWith => __$OtpDigitChangedCopyWithImpl<_OtpDigitChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpDigitChanged&&(identical(other.index, index) || other.index == index)&&(identical(other.digit, digit) || other.digit == digit));
}


@override
int get hashCode => Object.hash(runtimeType,index,digit);

@override
String toString() {
  return 'KycEvent.otpDigitChanged(index: $index, digit: $digit)';
}


}

/// @nodoc
abstract mixin class _$OtpDigitChangedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$OtpDigitChangedCopyWith(_OtpDigitChanged value, $Res Function(_OtpDigitChanged) _then) = __$OtpDigitChangedCopyWithImpl;
@useResult
$Res call({
 int index, String digit
});




}
/// @nodoc
class __$OtpDigitChangedCopyWithImpl<$Res>
    implements _$OtpDigitChangedCopyWith<$Res> {
  __$OtpDigitChangedCopyWithImpl(this._self, this._then);

  final _OtpDigitChanged _self;
  final $Res Function(_OtpDigitChanged) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,Object? digit = null,}) {
  return _then(_OtpDigitChanged(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,digit: null == digit ? _self.digit : digit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TwoFactorVerificationRequested implements KycEvent {
  const _TwoFactorVerificationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TwoFactorVerificationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.twoFactorVerificationRequested()';
}


}




/// @nodoc


class _DocTypeChanged implements KycEvent {
  const _DocTypeChanged(this.value);
  

 final  String value;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocTypeChangedCopyWith<_DocTypeChanged> get copyWith => __$DocTypeChangedCopyWithImpl<_DocTypeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocTypeChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'KycEvent.docTypeChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$DocTypeChangedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$DocTypeChangedCopyWith(_DocTypeChanged value, $Res Function(_DocTypeChanged) _then) = __$DocTypeChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$DocTypeChangedCopyWithImpl<$Res>
    implements _$DocTypeChangedCopyWith<$Res> {
  __$DocTypeChangedCopyWithImpl(this._self, this._then);

  final _DocTypeChanged _self;
  final $Res Function(_DocTypeChanged) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_DocTypeChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DocNumberChanged implements KycEvent {
  const _DocNumberChanged(this.value);
  

 final  String value;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocNumberChangedCopyWith<_DocNumberChanged> get copyWith => __$DocNumberChangedCopyWithImpl<_DocNumberChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocNumberChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'KycEvent.docNumberChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$DocNumberChangedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$DocNumberChangedCopyWith(_DocNumberChanged value, $Res Function(_DocNumberChanged) _then) = __$DocNumberChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$DocNumberChangedCopyWithImpl<$Res>
    implements _$DocNumberChangedCopyWith<$Res> {
  __$DocNumberChangedCopyWithImpl(this._self, this._then);

  final _DocNumberChanged _self;
  final $Res Function(_DocNumberChanged) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_DocNumberChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DocumentSaved implements KycEvent {
  const _DocumentSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.documentSaved()';
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


class _StartTier2 implements KycEvent {
  const _StartTier2();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartTier2);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.startTier2()';
}


}




/// @nodoc


class _SkipTier2 implements KycEvent {
  const _SkipTier2();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkipTier2);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.skipTier2()';
}


}




/// @nodoc


class _SelfieCaptureDone implements KycEvent {
  const _SelfieCaptureDone({required this.selfieUrl});
  

 final  String selfieUrl;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelfieCaptureDoneCopyWith<_SelfieCaptureDone> get copyWith => __$SelfieCaptureDoneCopyWithImpl<_SelfieCaptureDone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelfieCaptureDone&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl));
}


@override
int get hashCode => Object.hash(runtimeType,selfieUrl);

@override
String toString() {
  return 'KycEvent.selfieCaptureDone(selfieUrl: $selfieUrl)';
}


}

/// @nodoc
abstract mixin class _$SelfieCaptureDoneCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$SelfieCaptureDoneCopyWith(_SelfieCaptureDone value, $Res Function(_SelfieCaptureDone) _then) = __$SelfieCaptureDoneCopyWithImpl;
@useResult
$Res call({
 String selfieUrl
});




}
/// @nodoc
class __$SelfieCaptureDoneCopyWithImpl<$Res>
    implements _$SelfieCaptureDoneCopyWith<$Res> {
  __$SelfieCaptureDoneCopyWithImpl(this._self, this._then);

  final _SelfieCaptureDone _self;
  final $Res Function(_SelfieCaptureDone) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selfieUrl = null,}) {
  return _then(_SelfieCaptureDone(
selfieUrl: null == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LocationCaptured implements KycEvent {
  const _LocationCaptured({required this.latitude, required this.longitude, required this.detectedCountry, required this.isVpnSuspected});
  

 final  double latitude;
 final  double longitude;
 final  String detectedCountry;
 final  bool isVpnSuspected;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCapturedCopyWith<_LocationCaptured> get copyWith => __$LocationCapturedCopyWithImpl<_LocationCaptured>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationCaptured&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.detectedCountry, detectedCountry) || other.detectedCountry == detectedCountry)&&(identical(other.isVpnSuspected, isVpnSuspected) || other.isVpnSuspected == isVpnSuspected));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,detectedCountry,isVpnSuspected);

@override
String toString() {
  return 'KycEvent.locationCaptured(latitude: $latitude, longitude: $longitude, detectedCountry: $detectedCountry, isVpnSuspected: $isVpnSuspected)';
}


}

/// @nodoc
abstract mixin class _$LocationCapturedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$LocationCapturedCopyWith(_LocationCaptured value, $Res Function(_LocationCaptured) _then) = __$LocationCapturedCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, String detectedCountry, bool isVpnSuspected
});




}
/// @nodoc
class __$LocationCapturedCopyWithImpl<$Res>
    implements _$LocationCapturedCopyWith<$Res> {
  __$LocationCapturedCopyWithImpl(this._self, this._then);

  final _LocationCaptured _self;
  final $Res Function(_LocationCaptured) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? detectedCountry = null,Object? isVpnSuspected = null,}) {
  return _then(_LocationCaptured(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,detectedCountry: null == detectedCountry ? _self.detectedCountry : detectedCountry // ignore: cast_nullable_to_non_nullable
as String,isVpnSuspected: null == isVpnSuspected ? _self.isVpnSuspected : isVpnSuspected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ProofOfAddressDocTypeChanged implements KycEvent {
  const _ProofOfAddressDocTypeChanged(this.value);
  

 final  String value;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProofOfAddressDocTypeChangedCopyWith<_ProofOfAddressDocTypeChanged> get copyWith => __$ProofOfAddressDocTypeChangedCopyWithImpl<_ProofOfAddressDocTypeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProofOfAddressDocTypeChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'KycEvent.proofOfAddressDocTypeChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$ProofOfAddressDocTypeChangedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$ProofOfAddressDocTypeChangedCopyWith(_ProofOfAddressDocTypeChanged value, $Res Function(_ProofOfAddressDocTypeChanged) _then) = __$ProofOfAddressDocTypeChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$ProofOfAddressDocTypeChangedCopyWithImpl<$Res>
    implements _$ProofOfAddressDocTypeChangedCopyWith<$Res> {
  __$ProofOfAddressDocTypeChangedCopyWithImpl(this._self, this._then);

  final _ProofOfAddressDocTypeChanged _self;
  final $Res Function(_ProofOfAddressDocTypeChanged) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_ProofOfAddressDocTypeChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ProofOfAddressUploaded implements KycEvent {
  const _ProofOfAddressUploaded({required this.documentUrl});
  

 final  String documentUrl;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProofOfAddressUploadedCopyWith<_ProofOfAddressUploaded> get copyWith => __$ProofOfAddressUploadedCopyWithImpl<_ProofOfAddressUploaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProofOfAddressUploaded&&(identical(other.documentUrl, documentUrl) || other.documentUrl == documentUrl));
}


@override
int get hashCode => Object.hash(runtimeType,documentUrl);

@override
String toString() {
  return 'KycEvent.proofOfAddressUploaded(documentUrl: $documentUrl)';
}


}

/// @nodoc
abstract mixin class _$ProofOfAddressUploadedCopyWith<$Res> implements $KycEventCopyWith<$Res> {
  factory _$ProofOfAddressUploadedCopyWith(_ProofOfAddressUploaded value, $Res Function(_ProofOfAddressUploaded) _then) = __$ProofOfAddressUploadedCopyWithImpl;
@useResult
$Res call({
 String documentUrl
});




}
/// @nodoc
class __$ProofOfAddressUploadedCopyWithImpl<$Res>
    implements _$ProofOfAddressUploadedCopyWith<$Res> {
  __$ProofOfAddressUploadedCopyWithImpl(this._self, this._then);

  final _ProofOfAddressUploaded _self;
  final $Res Function(_ProofOfAddressUploaded) _then;

/// Create a copy of KycEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documentUrl = null,}) {
  return _then(_ProofOfAddressUploaded(
documentUrl: null == documentUrl ? _self.documentUrl : documentUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Tier2Submitted implements KycEvent {
  const _Tier2Submitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tier2Submitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KycEvent.tier2Submitted()';
}


}




/// @nodoc
mixin _$KycState {

// ── FLOW ──────────────────────────────────────────────────────────
 KycSteps get currentStep; List<KycSteps> get completedSteps;// Firestore-driven status — backend sets this, app reads it
 KycStatus get kycStatus;// ── TIER 1 SAVED DATA ─────────────────────────────────────────────
 BasicInfoModel? get basicInfo; TwoFactorAuthModel? get twoFactorAuth; DocumentVerificationModel? get documentVerification;// ── TIER 1 FIELD VALUES (no TextControllers in UI) ────────────────
 String get firstName; String get lastName; String get age; String get gender; String get country; List<String> get otpDigits; String get docType; String get docNumber;// ── TIER 2 SAVED DATA ─────────────────────────────────────────────
 Tier2Model? get tier2Data;// ── TIER 2 FIELD VALUES ───────────────────────────────────────────
 String get selfieUrl; double get latitude; double get longitude; String get detectedCountry; bool get isVpnSuspected; String get proofOfAddressDocType; String get proofOfAddressUrl;// ── STEP STATUSES ─────────────────────────────────────────────────
 KycStepStatus get basicInfoStatus; KycStepStatus get twoFactorSetupStatus; KycStepStatus get twoFactorVerifyStatus; KycStepStatus get documentStatus; KycStepStatus get submitStatus; KycStepStatus get selfieStatus; KycStepStatus get locationStatus; KycStepStatus get proofOfAddressStatus; KycStepStatus get tier2SubmitStatus;// ── ERROR ─────────────────────────────────────────────────────────
 String get errorMessage;
/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KycStateCopyWith<KycState> get copyWith => _$KycStateCopyWithImpl<KycState>(this as KycState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KycState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other.completedSteps, completedSteps)&&(identical(other.kycStatus, kycStatus) || other.kycStatus == kycStatus)&&(identical(other.basicInfo, basicInfo) || other.basicInfo == basicInfo)&&(identical(other.twoFactorAuth, twoFactorAuth) || other.twoFactorAuth == twoFactorAuth)&&(identical(other.documentVerification, documentVerification) || other.documentVerification == documentVerification)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.otpDigits, otpDigits)&&(identical(other.docType, docType) || other.docType == docType)&&(identical(other.docNumber, docNumber) || other.docNumber == docNumber)&&(identical(other.tier2Data, tier2Data) || other.tier2Data == tier2Data)&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.detectedCountry, detectedCountry) || other.detectedCountry == detectedCountry)&&(identical(other.isVpnSuspected, isVpnSuspected) || other.isVpnSuspected == isVpnSuspected)&&(identical(other.proofOfAddressDocType, proofOfAddressDocType) || other.proofOfAddressDocType == proofOfAddressDocType)&&(identical(other.proofOfAddressUrl, proofOfAddressUrl) || other.proofOfAddressUrl == proofOfAddressUrl)&&(identical(other.basicInfoStatus, basicInfoStatus) || other.basicInfoStatus == basicInfoStatus)&&(identical(other.twoFactorSetupStatus, twoFactorSetupStatus) || other.twoFactorSetupStatus == twoFactorSetupStatus)&&(identical(other.twoFactorVerifyStatus, twoFactorVerifyStatus) || other.twoFactorVerifyStatus == twoFactorVerifyStatus)&&(identical(other.documentStatus, documentStatus) || other.documentStatus == documentStatus)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.selfieStatus, selfieStatus) || other.selfieStatus == selfieStatus)&&(identical(other.locationStatus, locationStatus) || other.locationStatus == locationStatus)&&(identical(other.proofOfAddressStatus, proofOfAddressStatus) || other.proofOfAddressStatus == proofOfAddressStatus)&&(identical(other.tier2SubmitStatus, tier2SubmitStatus) || other.tier2SubmitStatus == tier2SubmitStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,const DeepCollectionEquality().hash(completedSteps),kycStatus,basicInfo,twoFactorAuth,documentVerification,firstName,lastName,age,gender,country,const DeepCollectionEquality().hash(otpDigits),docType,docNumber,tier2Data,selfieUrl,latitude,longitude,detectedCountry,isVpnSuspected,proofOfAddressDocType,proofOfAddressUrl,basicInfoStatus,twoFactorSetupStatus,twoFactorVerifyStatus,documentStatus,submitStatus,selfieStatus,locationStatus,proofOfAddressStatus,tier2SubmitStatus,errorMessage]);

@override
String toString() {
  return 'KycState(currentStep: $currentStep, completedSteps: $completedSteps, kycStatus: $kycStatus, basicInfo: $basicInfo, twoFactorAuth: $twoFactorAuth, documentVerification: $documentVerification, firstName: $firstName, lastName: $lastName, age: $age, gender: $gender, country: $country, otpDigits: $otpDigits, docType: $docType, docNumber: $docNumber, tier2Data: $tier2Data, selfieUrl: $selfieUrl, latitude: $latitude, longitude: $longitude, detectedCountry: $detectedCountry, isVpnSuspected: $isVpnSuspected, proofOfAddressDocType: $proofOfAddressDocType, proofOfAddressUrl: $proofOfAddressUrl, basicInfoStatus: $basicInfoStatus, twoFactorSetupStatus: $twoFactorSetupStatus, twoFactorVerifyStatus: $twoFactorVerifyStatus, documentStatus: $documentStatus, submitStatus: $submitStatus, selfieStatus: $selfieStatus, locationStatus: $locationStatus, proofOfAddressStatus: $proofOfAddressStatus, tier2SubmitStatus: $tier2SubmitStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $KycStateCopyWith<$Res>  {
  factory $KycStateCopyWith(KycState value, $Res Function(KycState) _then) = _$KycStateCopyWithImpl;
@useResult
$Res call({
 KycSteps currentStep, List<KycSteps> completedSteps, KycStatus kycStatus, BasicInfoModel? basicInfo, TwoFactorAuthModel? twoFactorAuth, DocumentVerificationModel? documentVerification, String firstName, String lastName, String age, String gender, String country, List<String> otpDigits, String docType, String docNumber, Tier2Model? tier2Data, String selfieUrl, double latitude, double longitude, String detectedCountry, bool isVpnSuspected, String proofOfAddressDocType, String proofOfAddressUrl, KycStepStatus basicInfoStatus, KycStepStatus twoFactorSetupStatus, KycStepStatus twoFactorVerifyStatus, KycStepStatus documentStatus, KycStepStatus submitStatus, KycStepStatus selfieStatus, KycStepStatus locationStatus, KycStepStatus proofOfAddressStatus, KycStepStatus tier2SubmitStatus, String errorMessage
});


$BasicInfoModelCopyWith<$Res>? get basicInfo;$TwoFactorAuthModelCopyWith<$Res>? get twoFactorAuth;$DocumentVerificationModelCopyWith<$Res>? get documentVerification;$Tier2ModelCopyWith<$Res>? get tier2Data;

}
/// @nodoc
class _$KycStateCopyWithImpl<$Res>
    implements $KycStateCopyWith<$Res> {
  _$KycStateCopyWithImpl(this._self, this._then);

  final KycState _self;
  final $Res Function(KycState) _then;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? completedSteps = null,Object? kycStatus = null,Object? basicInfo = freezed,Object? twoFactorAuth = freezed,Object? documentVerification = freezed,Object? firstName = null,Object? lastName = null,Object? age = null,Object? gender = null,Object? country = null,Object? otpDigits = null,Object? docType = null,Object? docNumber = null,Object? tier2Data = freezed,Object? selfieUrl = null,Object? latitude = null,Object? longitude = null,Object? detectedCountry = null,Object? isVpnSuspected = null,Object? proofOfAddressDocType = null,Object? proofOfAddressUrl = null,Object? basicInfoStatus = null,Object? twoFactorSetupStatus = null,Object? twoFactorVerifyStatus = null,Object? documentStatus = null,Object? submitStatus = null,Object? selfieStatus = null,Object? locationStatus = null,Object? proofOfAddressStatus = null,Object? tier2SubmitStatus = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as KycSteps,completedSteps: null == completedSteps ? _self.completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as List<KycSteps>,kycStatus: null == kycStatus ? _self.kycStatus : kycStatus // ignore: cast_nullable_to_non_nullable
as KycStatus,basicInfo: freezed == basicInfo ? _self.basicInfo : basicInfo // ignore: cast_nullable_to_non_nullable
as BasicInfoModel?,twoFactorAuth: freezed == twoFactorAuth ? _self.twoFactorAuth : twoFactorAuth // ignore: cast_nullable_to_non_nullable
as TwoFactorAuthModel?,documentVerification: freezed == documentVerification ? _self.documentVerification : documentVerification // ignore: cast_nullable_to_non_nullable
as DocumentVerificationModel?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,otpDigits: null == otpDigits ? _self.otpDigits : otpDigits // ignore: cast_nullable_to_non_nullable
as List<String>,docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as String,docNumber: null == docNumber ? _self.docNumber : docNumber // ignore: cast_nullable_to_non_nullable
as String,tier2Data: freezed == tier2Data ? _self.tier2Data : tier2Data // ignore: cast_nullable_to_non_nullable
as Tier2Model?,selfieUrl: null == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,detectedCountry: null == detectedCountry ? _self.detectedCountry : detectedCountry // ignore: cast_nullable_to_non_nullable
as String,isVpnSuspected: null == isVpnSuspected ? _self.isVpnSuspected : isVpnSuspected // ignore: cast_nullable_to_non_nullable
as bool,proofOfAddressDocType: null == proofOfAddressDocType ? _self.proofOfAddressDocType : proofOfAddressDocType // ignore: cast_nullable_to_non_nullable
as String,proofOfAddressUrl: null == proofOfAddressUrl ? _self.proofOfAddressUrl : proofOfAddressUrl // ignore: cast_nullable_to_non_nullable
as String,basicInfoStatus: null == basicInfoStatus ? _self.basicInfoStatus : basicInfoStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,twoFactorSetupStatus: null == twoFactorSetupStatus ? _self.twoFactorSetupStatus : twoFactorSetupStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,twoFactorVerifyStatus: null == twoFactorVerifyStatus ? _self.twoFactorVerifyStatus : twoFactorVerifyStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,documentStatus: null == documentStatus ? _self.documentStatus : documentStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,selfieStatus: null == selfieStatus ? _self.selfieStatus : selfieStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,locationStatus: null == locationStatus ? _self.locationStatus : locationStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,proofOfAddressStatus: null == proofOfAddressStatus ? _self.proofOfAddressStatus : proofOfAddressStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,tier2SubmitStatus: null == tier2SubmitStatus ? _self.tier2SubmitStatus : tier2SubmitStatus // ignore: cast_nullable_to_non_nullable
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
}/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Tier2ModelCopyWith<$Res>? get tier2Data {
    if (_self.tier2Data == null) {
    return null;
  }

  return $Tier2ModelCopyWith<$Res>(_self.tier2Data!, (value) {
    return _then(_self.copyWith(tier2Data: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( KycSteps currentStep,  List<KycSteps> completedSteps,  KycStatus kycStatus,  BasicInfoModel? basicInfo,  TwoFactorAuthModel? twoFactorAuth,  DocumentVerificationModel? documentVerification,  String firstName,  String lastName,  String age,  String gender,  String country,  List<String> otpDigits,  String docType,  String docNumber,  Tier2Model? tier2Data,  String selfieUrl,  double latitude,  double longitude,  String detectedCountry,  bool isVpnSuspected,  String proofOfAddressDocType,  String proofOfAddressUrl,  KycStepStatus basicInfoStatus,  KycStepStatus twoFactorSetupStatus,  KycStepStatus twoFactorVerifyStatus,  KycStepStatus documentStatus,  KycStepStatus submitStatus,  KycStepStatus selfieStatus,  KycStepStatus locationStatus,  KycStepStatus proofOfAddressStatus,  KycStepStatus tier2SubmitStatus,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KycState() when $default != null:
return $default(_that.currentStep,_that.completedSteps,_that.kycStatus,_that.basicInfo,_that.twoFactorAuth,_that.documentVerification,_that.firstName,_that.lastName,_that.age,_that.gender,_that.country,_that.otpDigits,_that.docType,_that.docNumber,_that.tier2Data,_that.selfieUrl,_that.latitude,_that.longitude,_that.detectedCountry,_that.isVpnSuspected,_that.proofOfAddressDocType,_that.proofOfAddressUrl,_that.basicInfoStatus,_that.twoFactorSetupStatus,_that.twoFactorVerifyStatus,_that.documentStatus,_that.submitStatus,_that.selfieStatus,_that.locationStatus,_that.proofOfAddressStatus,_that.tier2SubmitStatus,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( KycSteps currentStep,  List<KycSteps> completedSteps,  KycStatus kycStatus,  BasicInfoModel? basicInfo,  TwoFactorAuthModel? twoFactorAuth,  DocumentVerificationModel? documentVerification,  String firstName,  String lastName,  String age,  String gender,  String country,  List<String> otpDigits,  String docType,  String docNumber,  Tier2Model? tier2Data,  String selfieUrl,  double latitude,  double longitude,  String detectedCountry,  bool isVpnSuspected,  String proofOfAddressDocType,  String proofOfAddressUrl,  KycStepStatus basicInfoStatus,  KycStepStatus twoFactorSetupStatus,  KycStepStatus twoFactorVerifyStatus,  KycStepStatus documentStatus,  KycStepStatus submitStatus,  KycStepStatus selfieStatus,  KycStepStatus locationStatus,  KycStepStatus proofOfAddressStatus,  KycStepStatus tier2SubmitStatus,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _KycState():
return $default(_that.currentStep,_that.completedSteps,_that.kycStatus,_that.basicInfo,_that.twoFactorAuth,_that.documentVerification,_that.firstName,_that.lastName,_that.age,_that.gender,_that.country,_that.otpDigits,_that.docType,_that.docNumber,_that.tier2Data,_that.selfieUrl,_that.latitude,_that.longitude,_that.detectedCountry,_that.isVpnSuspected,_that.proofOfAddressDocType,_that.proofOfAddressUrl,_that.basicInfoStatus,_that.twoFactorSetupStatus,_that.twoFactorVerifyStatus,_that.documentStatus,_that.submitStatus,_that.selfieStatus,_that.locationStatus,_that.proofOfAddressStatus,_that.tier2SubmitStatus,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( KycSteps currentStep,  List<KycSteps> completedSteps,  KycStatus kycStatus,  BasicInfoModel? basicInfo,  TwoFactorAuthModel? twoFactorAuth,  DocumentVerificationModel? documentVerification,  String firstName,  String lastName,  String age,  String gender,  String country,  List<String> otpDigits,  String docType,  String docNumber,  Tier2Model? tier2Data,  String selfieUrl,  double latitude,  double longitude,  String detectedCountry,  bool isVpnSuspected,  String proofOfAddressDocType,  String proofOfAddressUrl,  KycStepStatus basicInfoStatus,  KycStepStatus twoFactorSetupStatus,  KycStepStatus twoFactorVerifyStatus,  KycStepStatus documentStatus,  KycStepStatus submitStatus,  KycStepStatus selfieStatus,  KycStepStatus locationStatus,  KycStepStatus proofOfAddressStatus,  KycStepStatus tier2SubmitStatus,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _KycState() when $default != null:
return $default(_that.currentStep,_that.completedSteps,_that.kycStatus,_that.basicInfo,_that.twoFactorAuth,_that.documentVerification,_that.firstName,_that.lastName,_that.age,_that.gender,_that.country,_that.otpDigits,_that.docType,_that.docNumber,_that.tier2Data,_that.selfieUrl,_that.latitude,_that.longitude,_that.detectedCountry,_that.isVpnSuspected,_that.proofOfAddressDocType,_that.proofOfAddressUrl,_that.basicInfoStatus,_that.twoFactorSetupStatus,_that.twoFactorVerifyStatus,_that.documentStatus,_that.submitStatus,_that.selfieStatus,_that.locationStatus,_that.proofOfAddressStatus,_that.tier2SubmitStatus,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _KycState extends KycState {
  const _KycState({this.currentStep = KycSteps.intro, final  List<KycSteps> completedSteps = const [], this.kycStatus = KycStatus.inProgress, this.basicInfo, this.twoFactorAuth, this.documentVerification, this.firstName = '', this.lastName = '', this.age = '', this.gender = '', this.country = '', final  List<String> otpDigits = const ['', '', '', '', '', ''], this.docType = 'NIN', this.docNumber = '', this.tier2Data, this.selfieUrl = '', this.latitude = 0.0, this.longitude = 0.0, this.detectedCountry = '', this.isVpnSuspected = false, this.proofOfAddressDocType = 'Utility Bill', this.proofOfAddressUrl = '', this.basicInfoStatus = KycStepStatus.initial, this.twoFactorSetupStatus = KycStepStatus.initial, this.twoFactorVerifyStatus = KycStepStatus.initial, this.documentStatus = KycStepStatus.initial, this.submitStatus = KycStepStatus.initial, this.selfieStatus = KycStepStatus.initial, this.locationStatus = KycStepStatus.initial, this.proofOfAddressStatus = KycStepStatus.initial, this.tier2SubmitStatus = KycStepStatus.initial, this.errorMessage = ''}): _completedSteps = completedSteps,_otpDigits = otpDigits,super._();
  

// ── FLOW ──────────────────────────────────────────────────────────
@override@JsonKey() final  KycSteps currentStep;
 final  List<KycSteps> _completedSteps;
@override@JsonKey() List<KycSteps> get completedSteps {
  if (_completedSteps is EqualUnmodifiableListView) return _completedSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedSteps);
}

// Firestore-driven status — backend sets this, app reads it
@override@JsonKey() final  KycStatus kycStatus;
// ── TIER 1 SAVED DATA ─────────────────────────────────────────────
@override final  BasicInfoModel? basicInfo;
@override final  TwoFactorAuthModel? twoFactorAuth;
@override final  DocumentVerificationModel? documentVerification;
// ── TIER 1 FIELD VALUES (no TextControllers in UI) ────────────────
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  String age;
@override@JsonKey() final  String gender;
@override@JsonKey() final  String country;
 final  List<String> _otpDigits;
@override@JsonKey() List<String> get otpDigits {
  if (_otpDigits is EqualUnmodifiableListView) return _otpDigits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_otpDigits);
}

@override@JsonKey() final  String docType;
@override@JsonKey() final  String docNumber;
// ── TIER 2 SAVED DATA ─────────────────────────────────────────────
@override final  Tier2Model? tier2Data;
// ── TIER 2 FIELD VALUES ───────────────────────────────────────────
@override@JsonKey() final  String selfieUrl;
@override@JsonKey() final  double latitude;
@override@JsonKey() final  double longitude;
@override@JsonKey() final  String detectedCountry;
@override@JsonKey() final  bool isVpnSuspected;
@override@JsonKey() final  String proofOfAddressDocType;
@override@JsonKey() final  String proofOfAddressUrl;
// ── STEP STATUSES ─────────────────────────────────────────────────
@override@JsonKey() final  KycStepStatus basicInfoStatus;
@override@JsonKey() final  KycStepStatus twoFactorSetupStatus;
@override@JsonKey() final  KycStepStatus twoFactorVerifyStatus;
@override@JsonKey() final  KycStepStatus documentStatus;
@override@JsonKey() final  KycStepStatus submitStatus;
@override@JsonKey() final  KycStepStatus selfieStatus;
@override@JsonKey() final  KycStepStatus locationStatus;
@override@JsonKey() final  KycStepStatus proofOfAddressStatus;
@override@JsonKey() final  KycStepStatus tier2SubmitStatus;
// ── ERROR ─────────────────────────────────────────────────────────
@override@JsonKey() final  String errorMessage;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KycStateCopyWith<_KycState> get copyWith => __$KycStateCopyWithImpl<_KycState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KycState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other._completedSteps, _completedSteps)&&(identical(other.kycStatus, kycStatus) || other.kycStatus == kycStatus)&&(identical(other.basicInfo, basicInfo) || other.basicInfo == basicInfo)&&(identical(other.twoFactorAuth, twoFactorAuth) || other.twoFactorAuth == twoFactorAuth)&&(identical(other.documentVerification, documentVerification) || other.documentVerification == documentVerification)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other._otpDigits, _otpDigits)&&(identical(other.docType, docType) || other.docType == docType)&&(identical(other.docNumber, docNumber) || other.docNumber == docNumber)&&(identical(other.tier2Data, tier2Data) || other.tier2Data == tier2Data)&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.detectedCountry, detectedCountry) || other.detectedCountry == detectedCountry)&&(identical(other.isVpnSuspected, isVpnSuspected) || other.isVpnSuspected == isVpnSuspected)&&(identical(other.proofOfAddressDocType, proofOfAddressDocType) || other.proofOfAddressDocType == proofOfAddressDocType)&&(identical(other.proofOfAddressUrl, proofOfAddressUrl) || other.proofOfAddressUrl == proofOfAddressUrl)&&(identical(other.basicInfoStatus, basicInfoStatus) || other.basicInfoStatus == basicInfoStatus)&&(identical(other.twoFactorSetupStatus, twoFactorSetupStatus) || other.twoFactorSetupStatus == twoFactorSetupStatus)&&(identical(other.twoFactorVerifyStatus, twoFactorVerifyStatus) || other.twoFactorVerifyStatus == twoFactorVerifyStatus)&&(identical(other.documentStatus, documentStatus) || other.documentStatus == documentStatus)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.selfieStatus, selfieStatus) || other.selfieStatus == selfieStatus)&&(identical(other.locationStatus, locationStatus) || other.locationStatus == locationStatus)&&(identical(other.proofOfAddressStatus, proofOfAddressStatus) || other.proofOfAddressStatus == proofOfAddressStatus)&&(identical(other.tier2SubmitStatus, tier2SubmitStatus) || other.tier2SubmitStatus == tier2SubmitStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,const DeepCollectionEquality().hash(_completedSteps),kycStatus,basicInfo,twoFactorAuth,documentVerification,firstName,lastName,age,gender,country,const DeepCollectionEquality().hash(_otpDigits),docType,docNumber,tier2Data,selfieUrl,latitude,longitude,detectedCountry,isVpnSuspected,proofOfAddressDocType,proofOfAddressUrl,basicInfoStatus,twoFactorSetupStatus,twoFactorVerifyStatus,documentStatus,submitStatus,selfieStatus,locationStatus,proofOfAddressStatus,tier2SubmitStatus,errorMessage]);

@override
String toString() {
  return 'KycState(currentStep: $currentStep, completedSteps: $completedSteps, kycStatus: $kycStatus, basicInfo: $basicInfo, twoFactorAuth: $twoFactorAuth, documentVerification: $documentVerification, firstName: $firstName, lastName: $lastName, age: $age, gender: $gender, country: $country, otpDigits: $otpDigits, docType: $docType, docNumber: $docNumber, tier2Data: $tier2Data, selfieUrl: $selfieUrl, latitude: $latitude, longitude: $longitude, detectedCountry: $detectedCountry, isVpnSuspected: $isVpnSuspected, proofOfAddressDocType: $proofOfAddressDocType, proofOfAddressUrl: $proofOfAddressUrl, basicInfoStatus: $basicInfoStatus, twoFactorSetupStatus: $twoFactorSetupStatus, twoFactorVerifyStatus: $twoFactorVerifyStatus, documentStatus: $documentStatus, submitStatus: $submitStatus, selfieStatus: $selfieStatus, locationStatus: $locationStatus, proofOfAddressStatus: $proofOfAddressStatus, tier2SubmitStatus: $tier2SubmitStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$KycStateCopyWith<$Res> implements $KycStateCopyWith<$Res> {
  factory _$KycStateCopyWith(_KycState value, $Res Function(_KycState) _then) = __$KycStateCopyWithImpl;
@override @useResult
$Res call({
 KycSteps currentStep, List<KycSteps> completedSteps, KycStatus kycStatus, BasicInfoModel? basicInfo, TwoFactorAuthModel? twoFactorAuth, DocumentVerificationModel? documentVerification, String firstName, String lastName, String age, String gender, String country, List<String> otpDigits, String docType, String docNumber, Tier2Model? tier2Data, String selfieUrl, double latitude, double longitude, String detectedCountry, bool isVpnSuspected, String proofOfAddressDocType, String proofOfAddressUrl, KycStepStatus basicInfoStatus, KycStepStatus twoFactorSetupStatus, KycStepStatus twoFactorVerifyStatus, KycStepStatus documentStatus, KycStepStatus submitStatus, KycStepStatus selfieStatus, KycStepStatus locationStatus, KycStepStatus proofOfAddressStatus, KycStepStatus tier2SubmitStatus, String errorMessage
});


@override $BasicInfoModelCopyWith<$Res>? get basicInfo;@override $TwoFactorAuthModelCopyWith<$Res>? get twoFactorAuth;@override $DocumentVerificationModelCopyWith<$Res>? get documentVerification;@override $Tier2ModelCopyWith<$Res>? get tier2Data;

}
/// @nodoc
class __$KycStateCopyWithImpl<$Res>
    implements _$KycStateCopyWith<$Res> {
  __$KycStateCopyWithImpl(this._self, this._then);

  final _KycState _self;
  final $Res Function(_KycState) _then;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? completedSteps = null,Object? kycStatus = null,Object? basicInfo = freezed,Object? twoFactorAuth = freezed,Object? documentVerification = freezed,Object? firstName = null,Object? lastName = null,Object? age = null,Object? gender = null,Object? country = null,Object? otpDigits = null,Object? docType = null,Object? docNumber = null,Object? tier2Data = freezed,Object? selfieUrl = null,Object? latitude = null,Object? longitude = null,Object? detectedCountry = null,Object? isVpnSuspected = null,Object? proofOfAddressDocType = null,Object? proofOfAddressUrl = null,Object? basicInfoStatus = null,Object? twoFactorSetupStatus = null,Object? twoFactorVerifyStatus = null,Object? documentStatus = null,Object? submitStatus = null,Object? selfieStatus = null,Object? locationStatus = null,Object? proofOfAddressStatus = null,Object? tier2SubmitStatus = null,Object? errorMessage = null,}) {
  return _then(_KycState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as KycSteps,completedSteps: null == completedSteps ? _self._completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as List<KycSteps>,kycStatus: null == kycStatus ? _self.kycStatus : kycStatus // ignore: cast_nullable_to_non_nullable
as KycStatus,basicInfo: freezed == basicInfo ? _self.basicInfo : basicInfo // ignore: cast_nullable_to_non_nullable
as BasicInfoModel?,twoFactorAuth: freezed == twoFactorAuth ? _self.twoFactorAuth : twoFactorAuth // ignore: cast_nullable_to_non_nullable
as TwoFactorAuthModel?,documentVerification: freezed == documentVerification ? _self.documentVerification : documentVerification // ignore: cast_nullable_to_non_nullable
as DocumentVerificationModel?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,otpDigits: null == otpDigits ? _self._otpDigits : otpDigits // ignore: cast_nullable_to_non_nullable
as List<String>,docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as String,docNumber: null == docNumber ? _self.docNumber : docNumber // ignore: cast_nullable_to_non_nullable
as String,tier2Data: freezed == tier2Data ? _self.tier2Data : tier2Data // ignore: cast_nullable_to_non_nullable
as Tier2Model?,selfieUrl: null == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,detectedCountry: null == detectedCountry ? _self.detectedCountry : detectedCountry // ignore: cast_nullable_to_non_nullable
as String,isVpnSuspected: null == isVpnSuspected ? _self.isVpnSuspected : isVpnSuspected // ignore: cast_nullable_to_non_nullable
as bool,proofOfAddressDocType: null == proofOfAddressDocType ? _self.proofOfAddressDocType : proofOfAddressDocType // ignore: cast_nullable_to_non_nullable
as String,proofOfAddressUrl: null == proofOfAddressUrl ? _self.proofOfAddressUrl : proofOfAddressUrl // ignore: cast_nullable_to_non_nullable
as String,basicInfoStatus: null == basicInfoStatus ? _self.basicInfoStatus : basicInfoStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,twoFactorSetupStatus: null == twoFactorSetupStatus ? _self.twoFactorSetupStatus : twoFactorSetupStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,twoFactorVerifyStatus: null == twoFactorVerifyStatus ? _self.twoFactorVerifyStatus : twoFactorVerifyStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,documentStatus: null == documentStatus ? _self.documentStatus : documentStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,selfieStatus: null == selfieStatus ? _self.selfieStatus : selfieStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,locationStatus: null == locationStatus ? _self.locationStatus : locationStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,proofOfAddressStatus: null == proofOfAddressStatus ? _self.proofOfAddressStatus : proofOfAddressStatus // ignore: cast_nullable_to_non_nullable
as KycStepStatus,tier2SubmitStatus: null == tier2SubmitStatus ? _self.tier2SubmitStatus : tier2SubmitStatus // ignore: cast_nullable_to_non_nullable
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
}/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Tier2ModelCopyWith<$Res>? get tier2Data {
    if (_self.tier2Data == null) {
    return null;
  }

  return $Tier2ModelCopyWith<$Res>(_self.tier2Data!, (value) {
    return _then(_self.copyWith(tier2Data: value));
  });
}
}

// dart format on
