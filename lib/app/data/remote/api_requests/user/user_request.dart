class UserRequest {
  final int? id;
  final String name;
  final String identityNumber;
  final String? memberNumber;
  final String birthDate;
  final String phoneNumber;
  final String address;
  final String occupation;
  final String password;
  final int? workAreaId;

  UserRequest({
    this.id,
    required this.name,
    this.memberNumber,
    required this.identityNumber,
    required this.birthDate,
    required this.phoneNumber,
    required this.address,
    required this.occupation,
    required this.password,
    this.workAreaId,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
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
