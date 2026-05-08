// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhoneAuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PhoneAuthEvent()';
}


}

/// @nodoc
class $PhoneAuthEventCopyWith<$Res>  {
$PhoneAuthEventCopyWith(PhoneAuthEvent _, $Res Function(PhoneAuthEvent) __);
}


/// Adds pattern-matching-related methods to [PhoneAuthEvent].
extension PhoneAuthEventPatterns on PhoneAuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PhoneNumberChanged value)?  phoneNumberChanged,TResult Function( _SendOtp value)?  sendOtp,TResult Function( _OtpChanged value)?  otpChanged,TResult Function( _VerifyOtp value)?  verifyOtp,TResult Function( _ResendOtp value)?  resendOtp,TResult Function( _StartOtpTimer value)?  startOtpTimer,TResult Function( _TickTimer value)?  tickTimer,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneNumberChanged() when phoneNumberChanged != null:
return phoneNumberChanged(_that);case _SendOtp() when sendOtp != null:
return sendOtp(_that);case _OtpChanged() when otpChanged != null:
return otpChanged(_that);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _ResendOtp() when resendOtp != null:
return resendOtp(_that);case _StartOtpTimer() when startOtpTimer != null:
return startOtpTimer(_that);case _TickTimer() when tickTimer != null:
return tickTimer(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PhoneNumberChanged value)  phoneNumberChanged,required TResult Function( _SendOtp value)  sendOtp,required TResult Function( _OtpChanged value)  otpChanged,required TResult Function( _VerifyOtp value)  verifyOtp,required TResult Function( _ResendOtp value)  resendOtp,required TResult Function( _StartOtpTimer value)  startOtpTimer,required TResult Function( _TickTimer value)  tickTimer,}){
final _that = this;
switch (_that) {
case _PhoneNumberChanged():
return phoneNumberChanged(_that);case _SendOtp():
return sendOtp(_that);case _OtpChanged():
return otpChanged(_that);case _VerifyOtp():
return verifyOtp(_that);case _ResendOtp():
return resendOtp(_that);case _StartOtpTimer():
return startOtpTimer(_that);case _TickTimer():
return tickTimer(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PhoneNumberChanged value)?  phoneNumberChanged,TResult? Function( _SendOtp value)?  sendOtp,TResult? Function( _OtpChanged value)?  otpChanged,TResult? Function( _VerifyOtp value)?  verifyOtp,TResult? Function( _ResendOtp value)?  resendOtp,TResult? Function( _StartOtpTimer value)?  startOtpTimer,TResult? Function( _TickTimer value)?  tickTimer,}){
final _that = this;
switch (_that) {
case _PhoneNumberChanged() when phoneNumberChanged != null:
return phoneNumberChanged(_that);case _SendOtp() when sendOtp != null:
return sendOtp(_that);case _OtpChanged() when otpChanged != null:
return otpChanged(_that);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _ResendOtp() when resendOtp != null:
return resendOtp(_that);case _StartOtpTimer() when startOtpTimer != null:
return startOtpTimer(_that);case _TickTimer() when tickTimer != null:
return tickTimer(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String phoneNumber)?  phoneNumberChanged,TResult Function( String phoneNumber)?  sendOtp,TResult Function( String otp)?  otpChanged,TResult Function()?  verifyOtp,TResult Function( String phoneNumber)?  resendOtp,TResult Function()?  startOtpTimer,TResult Function()?  tickTimer,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneNumberChanged() when phoneNumberChanged != null:
return phoneNumberChanged(_that.phoneNumber);case _SendOtp() when sendOtp != null:
return sendOtp(_that.phoneNumber);case _OtpChanged() when otpChanged != null:
return otpChanged(_that.otp);case _VerifyOtp() when verifyOtp != null:
return verifyOtp();case _ResendOtp() when resendOtp != null:
return resendOtp(_that.phoneNumber);case _StartOtpTimer() when startOtpTimer != null:
return startOtpTimer();case _TickTimer() when tickTimer != null:
return tickTimer();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String phoneNumber)  phoneNumberChanged,required TResult Function( String phoneNumber)  sendOtp,required TResult Function( String otp)  otpChanged,required TResult Function()  verifyOtp,required TResult Function( String phoneNumber)  resendOtp,required TResult Function()  startOtpTimer,required TResult Function()  tickTimer,}) {final _that = this;
switch (_that) {
case _PhoneNumberChanged():
return phoneNumberChanged(_that.phoneNumber);case _SendOtp():
return sendOtp(_that.phoneNumber);case _OtpChanged():
return otpChanged(_that.otp);case _VerifyOtp():
return verifyOtp();case _ResendOtp():
return resendOtp(_that.phoneNumber);case _StartOtpTimer():
return startOtpTimer();case _TickTimer():
return tickTimer();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String phoneNumber)?  phoneNumberChanged,TResult? Function( String phoneNumber)?  sendOtp,TResult? Function( String otp)?  otpChanged,TResult? Function()?  verifyOtp,TResult? Function( String phoneNumber)?  resendOtp,TResult? Function()?  startOtpTimer,TResult? Function()?  tickTimer,}) {final _that = this;
switch (_that) {
case _PhoneNumberChanged() when phoneNumberChanged != null:
return phoneNumberChanged(_that.phoneNumber);case _SendOtp() when sendOtp != null:
return sendOtp(_that.phoneNumber);case _OtpChanged() when otpChanged != null:
return otpChanged(_that.otp);case _VerifyOtp() when verifyOtp != null:
return verifyOtp();case _ResendOtp() when resendOtp != null:
return resendOtp(_that.phoneNumber);case _StartOtpTimer() when startOtpTimer != null:
return startOtpTimer();case _TickTimer() when tickTimer != null:
return tickTimer();case _:
  return null;

}
}

}

/// @nodoc


class _PhoneNumberChanged implements PhoneAuthEvent {
  const _PhoneNumberChanged(this.phoneNumber);
  

 final  String phoneNumber;

/// Create a copy of PhoneAuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneNumberChangedCopyWith<_PhoneNumberChanged> get copyWith => __$PhoneNumberChangedCopyWithImpl<_PhoneNumberChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneNumberChanged&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber);

@override
String toString() {
  return 'PhoneAuthEvent.phoneNumberChanged(phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$PhoneNumberChangedCopyWith<$Res> implements $PhoneAuthEventCopyWith<$Res> {
  factory _$PhoneNumberChangedCopyWith(_PhoneNumberChanged value, $Res Function(_PhoneNumberChanged) _then) = __$PhoneNumberChangedCopyWithImpl;
@useResult
$Res call({
 String phoneNumber
});




}
/// @nodoc
class __$PhoneNumberChangedCopyWithImpl<$Res>
    implements _$PhoneNumberChangedCopyWith<$Res> {
  __$PhoneNumberChangedCopyWithImpl(this._self, this._then);

  final _PhoneNumberChanged _self;
  final $Res Function(_PhoneNumberChanged) _then;

/// Create a copy of PhoneAuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,}) {
  return _then(_PhoneNumberChanged(
null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SendOtp implements PhoneAuthEvent {
  const _SendOtp(this.phoneNumber);
  

 final  String phoneNumber;

/// Create a copy of PhoneAuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOtpCopyWith<_SendOtp> get copyWith => __$SendOtpCopyWithImpl<_SendOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOtp&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber);

@override
String toString() {
  return 'PhoneAuthEvent.sendOtp(phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$SendOtpCopyWith<$Res> implements $PhoneAuthEventCopyWith<$Res> {
  factory _$SendOtpCopyWith(_SendOtp value, $Res Function(_SendOtp) _then) = __$SendOtpCopyWithImpl;
@useResult
$Res call({
 String phoneNumber
});




}
/// @nodoc
class __$SendOtpCopyWithImpl<$Res>
    implements _$SendOtpCopyWith<$Res> {
  __$SendOtpCopyWithImpl(this._self, this._then);

  final _SendOtp _self;
  final $Res Function(_SendOtp) _then;

/// Create a copy of PhoneAuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,}) {
  return _then(_SendOtp(
null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OtpChanged implements PhoneAuthEvent {
  const _OtpChanged(this.otp);
  

 final  String otp;

/// Create a copy of PhoneAuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpChangedCopyWith<_OtpChanged> get copyWith => __$OtpChangedCopyWithImpl<_OtpChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpChanged&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,otp);

@override
String toString() {
  return 'PhoneAuthEvent.otpChanged(otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$OtpChangedCopyWith<$Res> implements $PhoneAuthEventCopyWith<$Res> {
  factory _$OtpChangedCopyWith(_OtpChanged value, $Res Function(_OtpChanged) _then) = __$OtpChangedCopyWithImpl;
@useResult
$Res call({
 String otp
});




}
/// @nodoc
class __$OtpChangedCopyWithImpl<$Res>
    implements _$OtpChangedCopyWith<$Res> {
  __$OtpChangedCopyWithImpl(this._self, this._then);

  final _OtpChanged _self;
  final $Res Function(_OtpChanged) _then;

/// Create a copy of PhoneAuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otp = null,}) {
  return _then(_OtpChanged(
null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _VerifyOtp implements PhoneAuthEvent {
  const _VerifyOtp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PhoneAuthEvent.verifyOtp()';
}


}




/// @nodoc


class _ResendOtp implements PhoneAuthEvent {
  const _ResendOtp(this.phoneNumber);
  

 final  String phoneNumber;

/// Create a copy of PhoneAuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResendOtpCopyWith<_ResendOtp> get copyWith => __$ResendOtpCopyWithImpl<_ResendOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendOtp&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber);

@override
String toString() {
  return 'PhoneAuthEvent.resendOtp(phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$ResendOtpCopyWith<$Res> implements $PhoneAuthEventCopyWith<$Res> {
  factory _$ResendOtpCopyWith(_ResendOtp value, $Res Function(_ResendOtp) _then) = __$ResendOtpCopyWithImpl;
@useResult
$Res call({
 String phoneNumber
});




}
/// @nodoc
class __$ResendOtpCopyWithImpl<$Res>
    implements _$ResendOtpCopyWith<$Res> {
  __$ResendOtpCopyWithImpl(this._self, this._then);

  final _ResendOtp _self;
  final $Res Function(_ResendOtp) _then;

/// Create a copy of PhoneAuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,}) {
  return _then(_ResendOtp(
null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StartOtpTimer implements PhoneAuthEvent {
  const _StartOtpTimer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartOtpTimer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PhoneAuthEvent.startOtpTimer()';
}


}




/// @nodoc


class _TickTimer implements PhoneAuthEvent {
  const _TickTimer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TickTimer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PhoneAuthEvent.tickTimer()';
}


}




/// @nodoc
mixin _$PhoneAuthState {

 PhoneFormz get phoneNumber; OtpFormz get otp; String get verificationId; FormzSubmissionStatus get sendOtpStatus; FormzSubmissionStatus get verifyOtpStatus; String get errorMessage; String get successMessage; int get otpTimerSeconds; bool get canResendOtp;
/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneAuthStateCopyWith<PhoneAuthState> get copyWith => _$PhoneAuthStateCopyWithImpl<PhoneAuthState>(this as PhoneAuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneAuthState&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.sendOtpStatus, sendOtpStatus) || other.sendOtpStatus == sendOtpStatus)&&(identical(other.verifyOtpStatus, verifyOtpStatus) || other.verifyOtpStatus == verifyOtpStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.otpTimerSeconds, otpTimerSeconds) || other.otpTimerSeconds == otpTimerSeconds)&&(identical(other.canResendOtp, canResendOtp) || other.canResendOtp == canResendOtp));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otp,verificationId,sendOtpStatus,verifyOtpStatus,errorMessage,successMessage,otpTimerSeconds,canResendOtp);

@override
String toString() {
  return 'PhoneAuthState(phoneNumber: $phoneNumber, otp: $otp, verificationId: $verificationId, sendOtpStatus: $sendOtpStatus, verifyOtpStatus: $verifyOtpStatus, errorMessage: $errorMessage, successMessage: $successMessage, otpTimerSeconds: $otpTimerSeconds, canResendOtp: $canResendOtp)';
}


}

/// @nodoc
abstract mixin class $PhoneAuthStateCopyWith<$Res>  {
  factory $PhoneAuthStateCopyWith(PhoneAuthState value, $Res Function(PhoneAuthState) _then) = _$PhoneAuthStateCopyWithImpl;
@useResult
$Res call({
 PhoneFormz phoneNumber, OtpFormz otp, String verificationId, FormzSubmissionStatus sendOtpStatus, FormzSubmissionStatus verifyOtpStatus, String errorMessage, String successMessage, int otpTimerSeconds, bool canResendOtp
});




}
/// @nodoc
class _$PhoneAuthStateCopyWithImpl<$Res>
    implements $PhoneAuthStateCopyWith<$Res> {
  _$PhoneAuthStateCopyWithImpl(this._self, this._then);

  final PhoneAuthState _self;
  final $Res Function(PhoneAuthState) _then;

/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? otp = null,Object? verificationId = null,Object? sendOtpStatus = null,Object? verifyOtpStatus = null,Object? errorMessage = null,Object? successMessage = null,Object? otpTimerSeconds = null,Object? canResendOtp = null,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as PhoneFormz,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as OtpFormz,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,sendOtpStatus: null == sendOtpStatus ? _self.sendOtpStatus : sendOtpStatus // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,verifyOtpStatus: null == verifyOtpStatus ? _self.verifyOtpStatus : verifyOtpStatus // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,successMessage: null == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String,otpTimerSeconds: null == otpTimerSeconds ? _self.otpTimerSeconds : otpTimerSeconds // ignore: cast_nullable_to_non_nullable
as int,canResendOtp: null == canResendOtp ? _self.canResendOtp : canResendOtp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneAuthState].
extension PhoneAuthStatePatterns on PhoneAuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneAuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneAuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneAuthState value)  $default,){
final _that = this;
switch (_that) {
case _PhoneAuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneAuthState value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneAuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PhoneFormz phoneNumber,  OtpFormz otp,  String verificationId,  FormzSubmissionStatus sendOtpStatus,  FormzSubmissionStatus verifyOtpStatus,  String errorMessage,  String successMessage,  int otpTimerSeconds,  bool canResendOtp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneAuthState() when $default != null:
return $default(_that.phoneNumber,_that.otp,_that.verificationId,_that.sendOtpStatus,_that.verifyOtpStatus,_that.errorMessage,_that.successMessage,_that.otpTimerSeconds,_that.canResendOtp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PhoneFormz phoneNumber,  OtpFormz otp,  String verificationId,  FormzSubmissionStatus sendOtpStatus,  FormzSubmissionStatus verifyOtpStatus,  String errorMessage,  String successMessage,  int otpTimerSeconds,  bool canResendOtp)  $default,) {final _that = this;
switch (_that) {
case _PhoneAuthState():
return $default(_that.phoneNumber,_that.otp,_that.verificationId,_that.sendOtpStatus,_that.verifyOtpStatus,_that.errorMessage,_that.successMessage,_that.otpTimerSeconds,_that.canResendOtp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PhoneFormz phoneNumber,  OtpFormz otp,  String verificationId,  FormzSubmissionStatus sendOtpStatus,  FormzSubmissionStatus verifyOtpStatus,  String errorMessage,  String successMessage,  int otpTimerSeconds,  bool canResendOtp)?  $default,) {final _that = this;
switch (_that) {
case _PhoneAuthState() when $default != null:
return $default(_that.phoneNumber,_that.otp,_that.verificationId,_that.sendOtpStatus,_that.verifyOtpStatus,_that.errorMessage,_that.successMessage,_that.otpTimerSeconds,_that.canResendOtp);case _:
  return null;

}
}

}

/// @nodoc


class _PhoneAuthState extends PhoneAuthState {
  const _PhoneAuthState({this.phoneNumber = const PhoneFormz.pure(), this.otp = const OtpFormz.pure(), this.verificationId = '', this.sendOtpStatus = FormzSubmissionStatus.initial, this.verifyOtpStatus = FormzSubmissionStatus.initial, this.errorMessage = '', this.successMessage = '', this.otpTimerSeconds = 300, this.canResendOtp = false}): super._();
  

@override@JsonKey() final  PhoneFormz phoneNumber;
@override@JsonKey() final  OtpFormz otp;
@override@JsonKey() final  String verificationId;
@override@JsonKey() final  FormzSubmissionStatus sendOtpStatus;
@override@JsonKey() final  FormzSubmissionStatus verifyOtpStatus;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String successMessage;
@override@JsonKey() final  int otpTimerSeconds;
@override@JsonKey() final  bool canResendOtp;

/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneAuthStateCopyWith<_PhoneAuthState> get copyWith => __$PhoneAuthStateCopyWithImpl<_PhoneAuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneAuthState&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.sendOtpStatus, sendOtpStatus) || other.sendOtpStatus == sendOtpStatus)&&(identical(other.verifyOtpStatus, verifyOtpStatus) || other.verifyOtpStatus == verifyOtpStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.otpTimerSeconds, otpTimerSeconds) || other.otpTimerSeconds == otpTimerSeconds)&&(identical(other.canResendOtp, canResendOtp) || other.canResendOtp == canResendOtp));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otp,verificationId,sendOtpStatus,verifyOtpStatus,errorMessage,successMessage,otpTimerSeconds,canResendOtp);

@override
String toString() {
  return 'PhoneAuthState(phoneNumber: $phoneNumber, otp: $otp, verificationId: $verificationId, sendOtpStatus: $sendOtpStatus, verifyOtpStatus: $verifyOtpStatus, errorMessage: $errorMessage, successMessage: $successMessage, otpTimerSeconds: $otpTimerSeconds, canResendOtp: $canResendOtp)';
}


}

/// @nodoc
abstract mixin class _$PhoneAuthStateCopyWith<$Res> implements $PhoneAuthStateCopyWith<$Res> {
  factory _$PhoneAuthStateCopyWith(_PhoneAuthState value, $Res Function(_PhoneAuthState) _then) = __$PhoneAuthStateCopyWithImpl;
@override @useResult
$Res call({
 PhoneFormz phoneNumber, OtpFormz otp, String verificationId, FormzSubmissionStatus sendOtpStatus, FormzSubmissionStatus verifyOtpStatus, String errorMessage, String successMessage, int otpTimerSeconds, bool canResendOtp
});




}
/// @nodoc
class __$PhoneAuthStateCopyWithImpl<$Res>
    implements _$PhoneAuthStateCopyWith<$Res> {
  __$PhoneAuthStateCopyWithImpl(this._self, this._then);

  final _PhoneAuthState _self;
  final $Res Function(_PhoneAuthState) _then;

/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? otp = null,Object? verificationId = null,Object? sendOtpStatus = null,Object? verifyOtpStatus = null,Object? errorMessage = null,Object? successMessage = null,Object? otpTimerSeconds = null,Object? canResendOtp = null,}) {
  return _then(_PhoneAuthState(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as PhoneFormz,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as OtpFormz,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,sendOtpStatus: null == sendOtpStatus ? _self.sendOtpStatus : sendOtpStatus // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,verifyOtpStatus: null == verifyOtpStatus ? _self.verifyOtpStatus : verifyOtpStatus // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,successMessage: null == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String,otpTimerSeconds: null == otpTimerSeconds ? _self.otpTimerSeconds : otpTimerSeconds // ignore: cast_nullable_to_non_nullable
as int,canResendOtp: null == canResendOtp ? _self.canResendOtp : canResendOtp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
