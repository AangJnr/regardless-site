import 'package:dart_mappable/dart_mappable.dart';

part 'user_query.mapper.dart';

@MappableClass()
class UserQuery with UserQueryMappable {
  final String email;
  final String message;
  final String? phoneNumber;
  final String? name;

  UserQuery({this.email = '', this.message = '', this.phoneNumber, this.name});
}
