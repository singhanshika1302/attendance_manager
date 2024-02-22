// // To parse this JSON data, do
// //
// //     final documentModel = documentModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// DocumentModel documentModelFromJson(String str) => DocumentModel.fromJson(json.decode(str));

// String documentModelToJson(DocumentModel data) => json.encode(data.toJson());

// class DocumentModel {
//     Documents documents;

//     DocumentModel({
//         required this.documents,
//     });

//     factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
//         documents: Documents.fromJson(json["documents"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "documents": documents.toJson(),
//     };
// }

// class Documents {
//     String tenthMarksheet;
//     String studentPhoto;

//     Documents({
//         required this.tenthMarksheet,
//         required this.studentPhoto,
//     });

//     factory Documents.fromJson(Map<String, dynamic> json) => Documents(
//         tenthMarksheet: json["tenthMarksheet"],
//         studentPhoto: json["studentPhoto"],
//     );

//     Map<String, dynamic> toJson() => {
//         "tenthMarksheet": tenthMarksheet,
//         "studentPhoto": studentPhoto,
//     };
// }
// To parse this JSON data, do
//
//     final documentModel = documentModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final documentModel = documentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DocumentModel documentModelFromJson(String str) => DocumentModel.fromJson(json.decode(str));

String documentModelToJson(DocumentModel data) => json.encode(data.toJson());

class DocumentModel {
    List<Product> products;
    // int total;
    // int skip;
    // int limit;

    DocumentModel({
        required this.products,
        // required this.total,
        // required this.skip,
        // required this.limit,
    });

    factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        // total: json["total"],
        // skip: json["skip"],
        // limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        // "total": total,
        // "skip": skip,
        // "limit": limit,
    };
}

class Product {
    int id;
    String title;
    String description;
    int price;
    double discountPercentage;
    double rating;
    int stock;
    String brand;
    String category;
    String thumbnail;
    List<String> images;

    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
