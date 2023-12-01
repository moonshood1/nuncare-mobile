class OldUser {
  const OldUser(this.email, this.password);

  final String email;
  final String password;
}

class NewUser {
  const NewUser(this.firstName, this.lastName, this.birthDate, this.email,
      this.gender, this.phone);

  final String firstName;
  final String lastName;
  final String email;
  final String birthDate;
  final String gender;
  final String phone;
}

class MedicalDomain {
  const MedicalDomain(this.orderNumber, this.healthCenter, this.city,
      this.region, this.service, this.speciality);

  final String orderNumber;
  final String region;
  final String city;
  final String healthCenter;
  final String service;
  final String speciality;
}
