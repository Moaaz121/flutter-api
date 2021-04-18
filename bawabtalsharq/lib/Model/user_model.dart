class UserModel {
  int code;
  String status;
  String msg;
  Data data;

  UserModel({this.code, this.status, this.msg, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String userId;
  String status;
  String userType;
  String firstname;
  String lastname;
  String company;
  String email;
  String phone;
  String apiKey;

  Data(
      {this.userId,
      this.status,
      this.userType,
      this.firstname,
      this.lastname,
      this.company,
      this.email,
      this.phone,
      this.apiKey});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    status = json['status'];
    userType = json['user_type'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    company = json['company'];
    email = json['email'];
    phone = json['phone'];
    apiKey = json['ApiKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['user_type'] = this.userType;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['company'] = this.company;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['ApiKey'] = this.apiKey;
    return data;
  }
}
