import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuncare/models/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(
          const User(
            id: '',
            firstName: '',
            lastName: '',
            phoneNumber: '',
            orderNumber: '',
            city: '',
            speciality: '',
            medicalCenter: '',
            email: '',
            token: '',
          ),
        );

  void setUser(
      {id,
      firstName,
      lastName,
      phoneNumber,
      orderNumber,
      city,
      speciality,
      medicalCenter,
      email,
      token}) {
    state = User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      orderNumber: orderNumber,
      city: city,
      speciality: speciality,
      medicalCenter: medicalCenter,
      email: email,
      token: token,
    );
  }

  void resetUser() {
    state = const User(
        id: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        orderNumber: '',
        city: '',
        speciality: '',
        medicalCenter: '',
        email: '',
        token: '');
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});
