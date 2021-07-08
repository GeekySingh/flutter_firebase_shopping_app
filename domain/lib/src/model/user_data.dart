class UserData {
  String? name;
  String? email;
  String? number;
  List<Address>? addresses;

  UserData(this.name, this.email, this.number);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'number': number,
    };
  }
}

class Address {
  final String flat;
  final String street;
  final String area;
  final String city;
  final String state;
  final int pinCode;

  Address(
      this.flat, this.street, this.area, this.city, this.state, this.pinCode);
}
