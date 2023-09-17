import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  Auth({
    required this.fullname,
    required this.token,
    required this.refreshToken,

    // required this.name,
  });

  final String fullname;
  final String token;
  final String refreshToken;

  // final String name;

  @override
  List<Object> get props => [
        fullname,
        token,
        refreshToken,
        //name
      ];
}
