class User {
  final String name;
  final String email;
  final String number;
  final List<Address> addresses;

  User(this.name, this.email, this.number, this.addresses);
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
