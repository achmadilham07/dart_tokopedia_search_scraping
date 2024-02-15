// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TokopediaResult {
  // div.prd_link-product-name
  String? productName;

  // div.prd_link-product-price
  String? productPrice;

  // span.prd_rating-average-text
  double? ratingAverage;

  // span.prd_link-shop-name
  String? shopName;

  // span.prd_link-shop-loc
  String? shopLoc;

  // div.pcv3_img_container.css-1mygogd > img
  String? imgLink;

  // div.css-19oqosi > a
  String? productLink;

  TokopediaResult({
    this.productName,
    this.productPrice,
    this.ratingAverage,
    this.shopName,
    this.shopLoc,
    this.imgLink,
    this.productLink,
  });

  TokopediaResult copyWith({
    String? productName,
    String? productPrice,
    double? ratingAverage,
    String? shopName,
    String? shopLoc,
    String? imgLink,
    String? productLink,
  }) {
    return TokopediaResult(
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      ratingAverage: ratingAverage ?? this.ratingAverage,
      shopName: shopName ?? this.shopName,
      shopLoc: shopLoc ?? this.shopLoc,
      imgLink: imgLink ?? this.imgLink,
      productLink: productLink ?? this.productLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'productPrice': productPrice,
      'ratingAverage': ratingAverage,
      'shopName': shopName,
      'shopLoc': shopLoc,
      'imgLink': imgLink,
      'productLink': productLink,
    };
  }

  factory TokopediaResult.fromMap(Map<String, dynamic> map) {
    return TokopediaResult(
      productName: map['productName'] != null ? map['productName'] as String : null,
      productPrice: map['productPrice'] != null ? map['productPrice'] as String : null,
      ratingAverage: map['ratingAverage'] != null ? map['ratingAverage'] as double : null,
      shopName: map['shopName'] != null ? map['shopName'] as String : null,
      shopLoc: map['shopLoc'] != null ? map['shopLoc'] as String : null,
      imgLink: map['imgLink'] != null ? map['imgLink'] as String : null,
      productLink: map['productLink'] != null ? map['productLink'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokopediaResult.fromJson(String source) =>
      TokopediaResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TokopediaResult(productName: $productName, productPrice: $productPrice, ratingAverage: $ratingAverage, shopName: $shopName, shopLoc: $shopLoc, imgLink: $imgLink, productLink: $productLink)';
  }

  @override
  bool operator ==(covariant TokopediaResult other) {
    if (identical(this, other)) return true;
  
    return 
      other.productName == productName &&
      other.productPrice == productPrice &&
      other.ratingAverage == ratingAverage &&
      other.shopName == shopName &&
      other.shopLoc == shopLoc &&
      other.imgLink == imgLink &&
      other.productLink == productLink;
  }

  @override
  int get hashCode {
    return productName.hashCode ^
      productPrice.hashCode ^
      ratingAverage.hashCode ^
      shopName.hashCode ^
      shopLoc.hashCode ^
      imgLink.hashCode ^
      productLink.hashCode;
  }
}
