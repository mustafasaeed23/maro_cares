class loginModel {
  String? message;
  String? userToken;

  loginModel({this.message, this.userToken});

  loginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userToken = json['userToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['userToken'] = this.userToken;
    return data;
  }
}
