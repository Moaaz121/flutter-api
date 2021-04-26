class ContactModel {
  int code;
  String status;
  Contact contact;

  ContactModel({this.code, this.status, this.contact});

  ContactModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    contact = json['data'] != null ? new Contact.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.contact != null) {
      data['data'] = this.contact.toJson();
    }
    return data;
  }
}

class Contact {
  String companyAddress;
  String companyCity;
  String companyPhone;
  String companyState;

  Contact(
      {this.companyAddress,
      this.companyCity,
      this.companyPhone,
      this.companyState});

  Contact.fromJson(Map<String, dynamic> json) {
    companyAddress = json['company_address'];
    companyCity = json['company_city'];
    companyPhone = json['company_phone'];
    companyState = json['company_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_address'] = this.companyAddress;
    data['company_city'] = this.companyCity;
    data['company_phone'] = this.companyPhone;
    data['company_state'] = this.companyState;
    return data;
  }
}
