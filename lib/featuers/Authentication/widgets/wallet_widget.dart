import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Authentication/widgets/wallet_model.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key});

  Future<Wallet> fetchWalletData() async {
    var headers = {
      'authorization':
          'maroTKeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZDlhYmM4NzkwYzI1YjgyN2I3YWE4NSIsImlhdCI6MTcyNTU0MTYxM30.kk2CSS8pe01iFndfKWwh2Li_hpqjDkPVG1U4fN5dL-s',
      'Content-Type': 'application/json',
    };

    var dio = Dio();
    var response = await dio.get(
      'https://maro-cares-z86j.onrender.com/user/wallet',
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      return Wallet.fromJson(response.data);
    } else {
      throw Exception('Failed to load wallet data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Wallet>(
      future: fetchWalletData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final wallet = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Wallet".tr(),
                style: getBoldBlack14Style(),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding: EdgeInsets.all(25.r),
                width: 320.w,
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: MyTheme.mainPrimaryColor4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "There is no any money in your wallet".tr(),
                      style: getBoldBlack14Style(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "${wallet.balance ?? 0} SAR",
                      style:
                          getBoldBlack16Style().copyWith(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Text("No data available".tr());
        }
      },
    );
  }
}
