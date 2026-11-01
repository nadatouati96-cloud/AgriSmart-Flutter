class Zone {
  final String nom;
  final String culture;
  double humidite;
  final double seuil;
  bool vanneOuverte;

  Zone(this.nom, this.culture, this.humidite, this.seuil,
      {this.vanneOuverte = false});

  bool get besoinIrrigation => humidite < seuil;
}

double humiditeMoyenne(List<Zone> zones) {
  if (zones.isEmpty) return 0;
  final somme = zones.fold<double>(0, (total, z) => total + z.humidite);
  return somme / zones.length;
}

String diagnostic(Zone zone) {
  return zone.besoinIrrigation ? "Besoin d'irrigation" : 'Sol correct';
}