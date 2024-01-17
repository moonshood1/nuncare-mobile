class RegistrationForm {
  const RegistrationForm({
    required this.personalInfo,
    required this.professionalInfo,
    required this.securityInfo,
  });

  final PersonalInfosForm personalInfo;
  final ProfessionalInfosForm professionalInfo;
  final SecurityInfosForm securityInfo;
}

class PersonalInfosForm {
  const PersonalInfosForm({
    // required this.gender,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    // required this.birthDate,
  });

  // final String gender;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  // final String birthDate;
}

class ProfessionalInfosForm {
  const ProfessionalInfosForm({
    required this.orderNumber,
    required this.medicalCenter,
    required this.city,
    required this.region,
  });

  final String orderNumber;
  final String medicalCenter;
  final String city;
  final String region;
}

class SecurityInfosForm {
  const SecurityInfosForm({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
