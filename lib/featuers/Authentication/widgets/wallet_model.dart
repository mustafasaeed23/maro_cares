class Wallet {
  String? message;
  int? balance;

  Wallet({this.message, this.balance});

  Wallet.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['balance'] = this.balance;
    return data;
  }
}
