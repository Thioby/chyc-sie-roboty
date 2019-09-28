import 'package:chyc_sie_roboty/domain/auth/user.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'serializers.jser.dart';

@GenSerializer()
class UserSerializer extends Serializer<User> with _$UserSerializer {}
