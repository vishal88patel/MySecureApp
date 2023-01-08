import 'dart:ui';

class PlanetCard {
  String? cardNumber;
  Color? color;
  double? marginTop;

  PlanetCard({this.cardNumber, this.color, this.marginTop});

  PlanetCard.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    color = json['color'];
    marginTop = json['marginTop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardNumber'] = this.cardNumber;
    data['color'] = this.color;
    data['marginTop'] = this.marginTop;
    return data;
  }
}
