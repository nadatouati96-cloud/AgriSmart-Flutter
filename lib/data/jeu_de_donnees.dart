import 'package:agrismart/models/zone.dart';

List<Zone> jeuDeDonnees() {
  return [
    Zone('Parcelle Nord', 'Tomates', 28.0, 35.0, vanneOuverte: false),
    Zone('Parcelle Sud', 'Piments', 65.0, 40.0, vanneOuverte: false),
    Zone('Parcelle Est', 'Palmiers', 20.0, 30.0, vanneOuverte: true),
    Zone('Serre 1', 'Concombres', 80.0, 50.0, vanneOuverte: false),
  ];
}