class CardModel {
  final String? cardholderName;
  final String? last4;
  final String? expiry;
  final String? brand;

  CardModel({this.cardholderName, this.last4, this.expiry, this.brand});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardholderName: json['cardholderName'],
      last4: json['last4'],
      expiry: json['expiry'],
      brand: json['brand'],
    );
  }
}

class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? image;
  final String? token;
  final CardModel? card;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.image,
    this.token,
    this.card,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, {String? token}) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      address: json['address'],
      image: json['image'],
      token: token, 
      card: json['card'] != null ? CardModel.fromJson(json['card']) : null,
    );
  }
}