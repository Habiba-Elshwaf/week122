class Contact {
  String name;
  String email;
  String address;
  DateTime dob;
  String phoneNumber;

  Contact({
    required this.name,
    required this.email,
    required this.address,
    required this.dob,
    required this.phoneNumber,
  });

  @override
  String toString() {
    return '''
      Name: $name
      Email: $email
      Address: $address
      Date of Birth: ${dob.toLocal()}
      Phone Number: $phoneNumber
    ''';
  }
}