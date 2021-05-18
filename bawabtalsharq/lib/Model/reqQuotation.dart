// class ReqQuotationModel {
//   int code;
//   String status;
//   String msg;
//   List<Null> data;

//   ReqQuotationModel({this.code, this.status, this.msg, this.data});

//   ReqQuotationModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     msg = json['msg'];
//     if (json['data'] != null) {
//       data = new List<Null>();
//       json['data'].forEach((v) {
//         data.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['status'] = this.status;
//     data['msg'] = this.msg;
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
