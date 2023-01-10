import 'dart:ui';

class PlanetCard {
  String? cardNumber;
  Color? color;
  String? cvv;

  PlanetCard({this.cardNumber, this.color, this.cvv});

  PlanetCard.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    color = json['color'];
    cvv = json['cvv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardNumber'] = this.cardNumber;
    data['color'] = this.color;
    data['cvv'] = this.cvv;
    return data;
  }
}
