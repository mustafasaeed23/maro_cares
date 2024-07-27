class ProductsResponse {
  String? message;
  List<Product>? productsList;

  ProductsResponse({this.message, this.productsList});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['products'] != null) {
      productsList = <Product>[];
      json['products'].forEach((v) {
        productsList!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.productsList != null) {
      data['products'] = this.productsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? sId;
  int? price;
  int? costPrice;
  int? stock;
  String? sectionType;
  String? productCode;
  int? discountPercentage;
  bool? outOfStock;
  int? totalRating;
  List<String>? images;
  // List<Null>? ratings;
  // List<Null>? colors;
  int? iV;
  List<String>? filter;
  String? productName;
  String? description;
  String? category;
  String? brand;

  Product(
      {this.sId,
      this.price,
      this.costPrice,
      this.stock,
      this.sectionType,
      this.productCode,
      this.discountPercentage,
      this.outOfStock,
      this.totalRating,
      this.images,
      // this.ratings,
      // this.colors,
      this.iV,
      this.filter,
      this.productName,
      this.description,
      this.category,
      this.brand});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    costPrice = json['costPrice'];
    stock = json['stock'];
    sectionType = json['sectionType'];
    productCode = json['productCode'];
    discountPercentage = json['discountPercentage'];
    outOfStock = json['outOfStock'];
    totalRating = json['totalRating'];
    images = json['images'].cast<String>();
    // if (json['ratings'] != null) {
    // 	ratings = <Null>[];
    // 	json['ratings'].forEach((v) { ratings!.add(new Null.fromJson(v)); });
    // }
    // if (json['colors'] != null) {
    // 	colors = <Null>[];
    // 	json['colors'].forEach((v) { colors!.add(new Null.fromJson(v)); });
    // }
    iV = json['__v'];
    filter = json['filter'].cast<String>();
    productName = json['productName'];
    description = json['description'];
    category = json['category'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['costPrice'] = this.costPrice;
    data['stock'] = this.stock;
    data['sectionType'] = this.sectionType;
    data['productCode'] = this.productCode;
    data['discountPercentage'] = this.discountPercentage;
    data['outOfStock'] = this.outOfStock;
    data['totalRating'] = this.totalRating;
    data['images'] = this.images;
    // if (this.ratings != null) {
    //   data['ratings'] = this.ratings!.map((v) => v.toJson()).toList();
    // }
    // if (this.colors != null) {
    //   data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    data['filter'] = this.filter;
    data['productName'] = this.productName;
    data['description'] = this.description;
    data['category'] = this.category;
    data['brand'] = this.brand;
    return data;
  }
}
