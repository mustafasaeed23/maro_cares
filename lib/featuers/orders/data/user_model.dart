class UserOrder {
  final String userName;
  final String userAddress;
  final String userPhone;
  final String userCity;
  final double totalPrice;
  final String message;
  final String coupon;

  UserOrder({
    required this.userName,
    required this.userAddress,
    required this.userPhone,
    required this.userCity,
    required this.totalPrice,
    this.message = '',
    this.coupon = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userAddress': userAddress,
      'userPhone': userPhone,
      'userCity': userCity,
      'totalAfterDiscount': totalPrice,
      'message': message,
      'coupon': coupon,
    };
  }
}
