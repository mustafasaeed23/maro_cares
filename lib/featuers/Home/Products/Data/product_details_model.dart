
class ProductsDetailsModel {
  String? message;
  Product? product;
  List<RelatedProducts>? relatedProducts;

  ProductsDetailsModel({this.message, this.product, this.relatedProducts});

  ProductsDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    if (json['relatedProducts'] != null) {
      relatedProducts = <RelatedProducts>[];
      json['relatedProducts'].forEach((v) {
        relatedProducts!.add(RelatedProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (relatedProducts != null) {
      data['relatedProducts'] = relatedProducts!.map((v) => v.toJson()).toList();
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
  bool? outOfStock;
  int? totalRating;
  List<String>? images;
  List<String>? colors; 
  int? iV;
  int? discountPercentage;
  List<String>? filter; 
  String? productName;
  String? description;
  String? category;
  String? brand;

  Product({
    this.sId,
    this.price,
    this.costPrice,
    this.stock,
    this.sectionType,
    this.productCode,
    this.outOfStock,
    this.totalRating,
    this.images,
    this.colors,
    this.iV,
    this.discountPercentage,
    this.filter,
    this.productName,
    this.description,
    this.category,
    this.brand,
  });

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    costPrice = json['costPrice'];
    stock = json['stock'];
    sectionType = json['sectionType'];
    productCode = json['productCode'];
    outOfStock = json['outOfStock'];
    totalRating = json['totalRating'];
    images = json['images']?.cast<String>();
    colors = json['colors']?.cast<String>(); // Deserialize as List<String>
    iV = json['__v'];
    discountPercentage = json['discountPercentage'];
    filter = json['filter']?.cast<String>(); // Deserialize as List<String>
    productName = json['productName'];
    description = json['description'];
    category = json['category'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['price'] = price;
    data['costPrice'] = costPrice;
    data['stock'] = stock;
    data['sectionType'] = sectionType;
    data['productCode'] = productCode;
    data['outOfStock'] = outOfStock;
    data['totalRating'] = totalRating;
    data['images'] = images;
    data['colors'] = colors;
    data['__v'] = iV;
    data['discountPercentage'] = discountPercentage;
    data['filter'] = filter;
    data['productName'] = productName;
    data['description'] = description;
    data['category'] = category;
    data['brand'] = brand;
    return data;
  }
}

class RelatedProducts {
  String? sId;
  int? price;
  int? costPrice;
  int? stock;
  String? productCode;
  int? discountPercentage;
  bool? outOfStock;
  int? totalRating;
  List<String>? images;
  List<String>? colors; 
  int? iV;
  List<String>? filter; 
  String? productName;
  String? description;
  String? category;
  String? brand;

  RelatedProducts({
    this.sId,
    this.price,
    this.costPrice,
    this.stock,
    this.productCode,
    this.discountPercentage,
    this.outOfStock,
    this.totalRating,
    this.images,
    this.colors,
    this.iV,
    this.filter,
    this.productName,
    this.description,
    this.category,
    this.brand,
  });

  RelatedProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    costPrice = json['costPrice'];
    stock = json['stock'];
    productCode = json['productCode'];
    discountPercentage = json['discountPercentage'];
    outOfStock = json['outOfStock'];
    totalRating = json['totalRating'];
    images = json['images']?.cast<String>();
    colors = json['colors']?.cast<String>(); 
    iV = json['__v'];
    filter = json['filter']?.cast<String>(); 
    productName = json['productName'];
    description = json['description'];
    category = json['category'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['price'] = price;
    data['costPrice'] = costPrice;
    data['stock'] = stock;
    data['productCode'] = productCode;
    data['discountPercentage'] = discountPercentage;
    data['outOfStock'] = outOfStock;
    data['totalRating'] = totalRating;
    data['images'] = images;
    data['colors'] = colors;
    data['__v'] = iV;
    data['filter'] = filter;
    data['productName'] = productName;
    data['description'] = description;
    data['category'] = category;
    data['brand'] = brand;
    return data;
  }
}
