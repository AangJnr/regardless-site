// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_query.dart';

class UserQueryMapper extends ClassMapperBase<UserQuery> {
  UserQueryMapper._();

  static UserQueryMapper? _instance;
  static UserQueryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserQueryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserQuery';

  static String _$email(UserQuery v) => v.email;
  static const Field<UserQuery, String> _f$email =
      Field('email', _$email, opt: true, def: '');
  static String _$message(UserQuery v) => v.message;
  static const Field<UserQuery, String> _f$message =
      Field('message', _$message, opt: true, def: '');
  static String? _$phoneNumber(UserQuery v) => v.phoneNumber;
  static const Field<UserQuery, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, opt: true);
  static String? _$name(UserQuery v) => v.name;
  static const Field<UserQuery, String> _f$name =
      Field('name', _$name, opt: true);

  @override
  final MappableFields<UserQuery> fields = const {
    #email: _f$email,
    #message: _f$message,
    #phoneNumber: _f$phoneNumber,
    #name: _f$name,
  };

  static UserQuery _instantiate(DecodingData data) {
    return UserQuery(
        email: data.dec(_f$email),
        message: data.dec(_f$message),
        phoneNumber: data.dec(_f$phoneNumber),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static UserQuery fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserQuery>(map);
  }

  static UserQuery fromJson(String json) {
    return ensureInitialized().decodeJson<UserQuery>(json);
  }
}

mixin UserQueryMappable {
  String toJson() {
    return UserQueryMapper.ensureInitialized()
        .encodeJson<UserQuery>(this as UserQuery);
  }

  Map<String, dynamic> toMap() {
    return UserQueryMapper.ensureInitialized()
        .encodeMap<UserQuery>(this as UserQuery);
  }

  UserQueryCopyWith<UserQuery, UserQuery, UserQuery> get copyWith =>
      _UserQueryCopyWithImpl(this as UserQuery, $identity, $identity);
  @override
  String toString() {
    return UserQueryMapper.ensureInitialized()
        .stringifyValue(this as UserQuery);
  }

  @override
  bool operator ==(Object other) {
    return UserQueryMapper.ensureInitialized()
        .equalsValue(this as UserQuery, other);
  }

  @override
  int get hashCode {
    return UserQueryMapper.ensureInitialized().hashValue(this as UserQuery);
  }
}

extension UserQueryValueCopy<$R, $Out> on ObjectCopyWith<$R, UserQuery, $Out> {
  UserQueryCopyWith<$R, UserQuery, $Out> get $asUserQuery =>
      $base.as((v, t, t2) => _UserQueryCopyWithImpl(v, t, t2));
}

abstract class UserQueryCopyWith<$R, $In extends UserQuery, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? email, String? message, String? phoneNumber, String? name});
  UserQueryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserQueryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserQuery, $Out>
    implements UserQueryCopyWith<$R, UserQuery, $Out> {
  _UserQueryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserQuery> $mapper =
      UserQueryMapper.ensureInitialized();
  @override
  $R call(
          {String? email,
          String? message,
          Object? phoneNumber = $none,
          Object? name = $none}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (message != null) #message: message,
        if (phoneNumber != $none) #phoneNumber: phoneNumber,
        if (name != $none) #name: name
      }));
  @override
  UserQuery $make(CopyWithData data) => UserQuery(
      email: data.get(#email, or: $value.email),
      message: data.get(#message, or: $value.message),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      name: data.get(#name, or: $value.name));

  @override
  UserQueryCopyWith<$R2, UserQuery, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserQueryCopyWithImpl($value, $cast, t);
}
