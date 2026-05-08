// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'magic_link_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MagicLinkEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MagicLinkEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MagicLinkEvent()';
}


}

/// @nodoc
class $MagicLinkEventCopyWith<$Res>  {
$MagicLinkEventCopyWith(MagicLinkEvent _, $Res Function(MagicLinkEvent) __);
}


/// Adds pattern-matching-related methods to [MagicLinkEvent].
extension MagicLinkEventPatterns on MagicLinkEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EmailChanged value)?  emailChanged,TResult Function( _SendLink value)?  sendLink,TResult Function( _VerifyLink value)?  verifyLink,TResult Function( _CheckAuth value)?  checkAuth,TResult Function( _SignOut value)?  signOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that);case _SendLink() when sendLink != null:
return sendLink(_that);case _VerifyLink() when verifyLink != null:
return verifyLink(_that);case _CheckAuth() when checkAuth != null:
return checkAuth(_that);case _SignOut() when signOut != null:
return signOut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EmailChanged value)  emailChanged,required TResult Function( _SendLink value)  sendLink,required TResult Function( _VerifyLink value)  verifyLink,required TResult Function( _CheckAuth value)  checkAuth,required TResult Function( _SignOut value)  signOut,}){
final _that = this;
switch (_that) {
case _EmailChanged():
return emailChanged(_that);case _SendLink():
return sendLink(_that);case _VerifyLink():
return verifyLink(_that);case _CheckAuth():
return checkAuth(_that);case _SignOut():
return signOut(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EmailChanged value)?  emailChanged,TResult? Function( _SendLink value)?  sendLink,TResult? Function( _VerifyLink value)?  verifyLink,TResult? Function( _CheckAuth value)?  checkAuth,TResult? Function( _SignOut value)?  signOut,}){
final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that);case _SendLink() when sendLink != null:
return sendLink(_that);case _VerifyLink() when verifyLink != null:
return verifyLink(_that);case _CheckAuth() when checkAuth != null:
return checkAuth(_that);case _SignOut() when signOut != null:
return signOut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  emailChanged,TResult Function()?  sendLink,TResult Function( String link)?  verifyLink,TResult Function()?  checkAuth,TResult Function()?  signOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _SendLink() when sendLink != null:
return sendLink();case _VerifyLink() when verifyLink != null:
return verifyLink(_that.link);case _CheckAuth() when checkAuth != null:
return checkAuth();case _SignOut() when signOut != null:
return signOut();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  emailChanged,required TResult Function()  sendLink,required TResult Function( String link)  verifyLink,required TResult Function()  checkAuth,required TResult Function()  signOut,}) {final _that = this;
switch (_that) {
case _EmailChanged():
return emailChanged(_that.email);case _SendLink():
return sendLink();case _VerifyLink():
return verifyLink(_that.link);case _CheckAuth():
return checkAuth();case _SignOut():
return signOut();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  emailChanged,TResult? Function()?  sendLink,TResult? Function( String link)?  verifyLink,TResult? Function()?  checkAuth,TResult? Function()?  signOut,}) {final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _SendLink() when sendLink != null:
return sendLink();case _VerifyLink() when verifyLink != null:
return verifyLink(_that.link);case _CheckAuth() when checkAuth != null:
return checkAuth();case _SignOut() when signOut != null:
return signOut();case _:
  return null;

}
}

}

/// @nodoc


class _EmailChanged implements MagicLinkEvent {
  const _EmailChanged(this.email);
  

 final  String email;

/// Create a copy of MagicLinkEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailChangedCopyWith<_EmailChanged> get copyWith => __$EmailChangedCopyWithImpl<_EmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'MagicLinkEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailChangedCopyWith<$Res> implements $MagicLinkEventCopyWith<$Res> {
  factory _$EmailChangedCopyWith(_EmailChanged value, $Res Function(_EmailChanged) _then) = __$EmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$EmailChangedCopyWithImpl<$Res>
    implements _$EmailChangedCopyWith<$Res> {
  __$EmailChangedCopyWithImpl(this._self, this._then);

  final _EmailChanged _self;
  final $Res Function(_EmailChanged) _then;

/// Create a copy of MagicLinkEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SendLink implements MagicLinkEvent {
  const _SendLink();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendLink);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MagicLinkEvent.sendLink()';
}


}




/// @nodoc


class _VerifyLink implements MagicLinkEvent {
  const _VerifyLink(this.link);
  

 final  String link;

/// Create a copy of MagicLinkEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyLinkCopyWith<_VerifyLink> get copyWith => __$VerifyLinkCopyWithImpl<_VerifyLink>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyLink&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,link);

@override
String toString() {
  return 'MagicLinkEvent.verifyLink(link: $link)';
}


}

/// @nodoc
abstract mixin class _$VerifyLinkCopyWith<$Res> implements $MagicLinkEventCopyWith<$Res> {
  factory _$VerifyLinkCopyWith(_VerifyLink value, $Res Function(_VerifyLink) _then) = __$VerifyLinkCopyWithImpl;
@useResult
$Res call({
 String link
});




}
/// @nodoc
class __$VerifyLinkCopyWithImpl<$Res>
    implements _$VerifyLinkCopyWith<$Res> {
  __$VerifyLinkCopyWithImpl(this._self, this._then);

  final _VerifyLink _self;
  final $Res Function(_VerifyLink) _then;

/// Create a copy of MagicLinkEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? link = null,}) {
  return _then(_VerifyLink(
null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CheckAuth implements MagicLinkEvent {
  const _CheckAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MagicLinkEvent.checkAuth()';
}


}




/// @nodoc


class _SignOut implements MagicLinkEvent {
  const _SignOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MagicLinkEvent.signOut()';
}


}




/// @nodoc
mixin _$MagicLinkState {

 EmailFormz get email; MagicLinkStatus get sendStatus; MagicLinkStatus get verifyStatus; String get errorMessage; bool get linkSent; bool get isAuthenticated; String? get userId;
/// Create a copy of MagicLinkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MagicLinkStateCopyWith<MagicLinkState> get copyWith => _$MagicLinkStateCopyWithImpl<MagicLinkState>(this as MagicLinkState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MagicLinkState&&(identical(other.email, email) || other.email == email)&&(identical(other.sendStatus, sendStatus) || other.sendStatus == sendStatus)&&(identical(other.verifyStatus, verifyStatus) || other.verifyStatus == verifyStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.linkSent, linkSent) || other.linkSent == linkSent)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,email,sendStatus,verifyStatus,errorMessage,linkSent,isAuthenticated,userId);

@override
String toString() {
  return 'MagicLinkState(email: $email, sendStatus: $sendStatus, verifyStatus: $verifyStatus, errorMessage: $errorMessage, linkSent: $linkSent, isAuthenticated: $isAuthenticated, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $MagicLinkStateCopyWith<$Res>  {
  factory $MagicLinkStateCopyWith(MagicLinkState value, $Res Function(MagicLinkState) _then) = _$MagicLinkStateCopyWithImpl;
@useResult
$Res call({
 EmailFormz email, MagicLinkStatus sendStatus, MagicLinkStatus verifyStatus, String errorMessage, bool linkSent, bool isAuthenticated, String? userId
});




}
/// @nodoc
class _$MagicLinkStateCopyWithImpl<$Res>
    implements $MagicLinkStateCopyWith<$Res> {
  _$MagicLinkStateCopyWithImpl(this._self, this._then);

  final MagicLinkState _self;
  final $Res Function(MagicLinkState) _then;

/// Create a copy of MagicLinkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? sendStatus = null,Object? verifyStatus = null,Object? errorMessage = null,Object? linkSent = null,Object? isAuthenticated = null,Object? userId = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailFormz,sendStatus: null == sendStatus ? _self.sendStatus : sendStatus // ignore: cast_nullable_to_non_nullable
as MagicLinkStatus,verifyStatus: null == verifyStatus ? _self.verifyStatus : verifyStatus // ignore: cast_nullable_to_non_nullable
as MagicLinkStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,linkSent: null == linkSent ? _self.linkSent : linkSent // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MagicLinkState].
extension MagicLinkStatePatterns on MagicLinkState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MagicLinkState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MagicLinkState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MagicLinkState value)  $default,){
final _that = this;
switch (_that) {
case _MagicLinkState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MagicLinkState value)?  $default,){
final _that = this;
switch (_that) {
case _MagicLinkState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EmailFormz email,  MagicLinkStatus sendStatus,  MagicLinkStatus verifyStatus,  String errorMessage,  bool linkSent,  bool isAuthenticated,  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MagicLinkState() when $default != null:
return $default(_that.email,_that.sendStatus,_that.verifyStatus,_that.errorMessage,_that.linkSent,_that.isAuthenticated,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EmailFormz email,  MagicLinkStatus sendStatus,  MagicLinkStatus verifyStatus,  String errorMessage,  bool linkSent,  bool isAuthenticated,  String? userId)  $default,) {final _that = this;
switch (_that) {
case _MagicLinkState():
return $default(_that.email,_that.sendStatus,_that.verifyStatus,_that.errorMessage,_that.linkSent,_that.isAuthenticated,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EmailFormz email,  MagicLinkStatus sendStatus,  MagicLinkStatus verifyStatus,  String errorMessage,  bool linkSent,  bool isAuthenticated,  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _MagicLinkState() when $default != null:
return $default(_that.email,_that.sendStatus,_that.verifyStatus,_that.errorMessage,_that.linkSent,_that.isAuthenticated,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _MagicLinkState extends MagicLinkState {
  const _MagicLinkState({this.email = const EmailFormz.pure(), this.sendStatus = MagicLinkStatus.initial, this.verifyStatus = MagicLinkStatus.initial, this.errorMessage = '', this.linkSent = false, this.isAuthenticated = false, this.userId}): super._();
  

@override@JsonKey() final  EmailFormz email;
@override@JsonKey() final  MagicLinkStatus sendStatus;
@override@JsonKey() final  MagicLinkStatus verifyStatus;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  bool linkSent;
@override@JsonKey() final  bool isAuthenticated;
@override final  String? userId;

/// Create a copy of MagicLinkState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MagicLinkStateCopyWith<_MagicLinkState> get copyWith => __$MagicLinkStateCopyWithImpl<_MagicLinkState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MagicLinkState&&(identical(other.email, email) || other.email == email)&&(identical(other.sendStatus, sendStatus) || other.sendStatus == sendStatus)&&(identical(other.verifyStatus, verifyStatus) || other.verifyStatus == verifyStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.linkSent, linkSent) || other.linkSent == linkSent)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,email,sendStatus,verifyStatus,errorMessage,linkSent,isAuthenticated,userId);

@override
String toString() {
  return 'MagicLinkState(email: $email, sendStatus: $sendStatus, verifyStatus: $verifyStatus, errorMessage: $errorMessage, linkSent: $linkSent, isAuthenticated: $isAuthenticated, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$MagicLinkStateCopyWith<$Res> implements $MagicLinkStateCopyWith<$Res> {
  factory _$MagicLinkStateCopyWith(_MagicLinkState value, $Res Function(_MagicLinkState) _then) = __$MagicLinkStateCopyWithImpl;
@override @useResult
$Res call({
 EmailFormz email, MagicLinkStatus sendStatus, MagicLinkStatus verifyStatus, String errorMessage, bool linkSent, bool isAuthenticated, String? userId
});




}
/// @nodoc
class __$MagicLinkStateCopyWithImpl<$Res>
    implements _$MagicLinkStateCopyWith<$Res> {
  __$MagicLinkStateCopyWithImpl(this._self, this._then);

  final _MagicLinkState _self;
  final $Res Function(_MagicLinkState) _then;

/// Create a copy of MagicLinkState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? sendStatus = null,Object? verifyStatus = null,Object? errorMessage = null,Object? linkSent = null,Object? isAuthenticated = null,Object? userId = freezed,}) {
  return _then(_MagicLinkState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailFormz,sendStatus: null == sendStatus ? _self.sendStatus : sendStatus // ignore: cast_nullable_to_non_nullable
as MagicLinkStatus,verifyStatus: null == verifyStatus ? _self.verifyStatus : verifyStatus // ignore: cast_nullable_to_non_nullable
as MagicLinkStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,linkSent: null == linkSent ? _self.linkSent : linkSent // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
