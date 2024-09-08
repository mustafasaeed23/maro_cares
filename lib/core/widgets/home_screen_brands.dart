import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:maro/core/widgets/custom_appbar.dart';
import 'package:maro/core/widgets/product_card_home.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'dart:convert';

class HomeBrandsScreen extends StatefulWidget {
  final String brand;

  const HomeBrandsScreen({Key? key, required this.brand}) : super(key: key);

  @override
  _HomeBrandsScreenState createState() => _HomeBrandsScreenState();
}

class _HomeBrandsScreenState extends State<HomeBrandsScreen> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = getProductsByBrand(widget.brand);
  }

  Future<List<Product>> getProductsByBrand(String brand) async {
    var headers = {
      'language': 'ar',
    };
    var dio = Dio();
    try {
      var response = await dio.get(
        'https://maro-cares-z86j.onrender.com/product/getProductByBrand/$brand/1',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response
            .data['products']; // Adjust based on your response structure
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        print(response.statusMessage);
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.brand),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found.'));
          } else {
            List<Product> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                return ProductCardHome(product: product);
               
              },
            );
          }
        },
      ),
    );
  }
}
