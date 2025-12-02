class RegisterRequest {
  final String name;
  final String identityNumber;
  final String memberNumber;
  final String birthDate;
  final String phoneNumber;
  final String address;
  final String occupation;
  final String password;
  final int workAreaId;

  RegisterRequest({
    required this.name,
    required this.memberNumber,
    required this.identityNumber,
    required this.birthDate,
    required this.phoneNumber,
    required this.address,
    required this.occupation,
    required this.password,
    required this.workAreaId,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "member_number": memberNumber,
    "identity_number": identityNumber,
    "birth_date": birthDate,
    "phone_number": phoneNumber,
    "address": address,
    "occupation": occupation,
    "password": password,
    "work_area_id": workAreaId,
  };
}
