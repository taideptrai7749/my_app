// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_app/models/product.dart';

class User {
  final String id;
  final String email;
  final String name;
  final String password;
  final String address;
  final String type;
  final String token;
  final List<Product>? favoriteProducts;
  final List<dynamic> cart;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
    this.favoriteProducts,
    required this.cart,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'favoriteProducts': favoriteProducts,
      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
      favoriteProducts: map['favoriteProducts'] != null
          ? List<Product>.from(
              (map['favoriteProducts'] as List).map(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      cart: List<Map<String, dynamic>>.from(
        (map['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        )),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? password,
    String? address,
    String? type,
    String? token,
    List<Product>? favoriteProducts,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      cart: cart ?? this.cart,
    );
  }
}
