class Supplier {
  int? id;
  String? supplierName;
  String? contactPerson;
  String? contactNo;
  String? emailAddress;

  Supplier(
      {this.id,
      this.supplierName,
      this.contactPerson,
      this.contactNo,
      this.emailAddress});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'supplierName': supplierName,
      'contactPerson': contactPerson,
      'contactNo': contactNo,
      'emailAddress': emailAddress,
    };
  }

  static Supplier fromMap(Map<String, dynamic> map) {
    return Supplier(
      id: map['id'],
      supplierName: map['supplierName'],
      contactPerson: map['contactPerson'],
      contactNo: map['contactNo'],
      emailAddress: map['emailAddress'],
    );
  }

  String? getSupplierName() {
    return supplierName;
  }

  String? getContactPerson() {
    return contactPerson;
  }

  int? getId() {
    return id;
  }
}
