class ContactData {
  String? email;
  String? phone;

  ContactData({
    this.email,
    this.phone,
  });

  bool get isValid => [
        email,
        phone,
      ].every((element) => element != null);
}
