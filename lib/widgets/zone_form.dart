import 'package:flutter/material.dart';
import 'package:agrismart/models/zone.dart';

class ZoneForm extends StatefulWidget {
  final List<String> nomsExistants;
  final Zone? zone;
  final Function(Zone nouvelleZone) onEnregistrer;

  const ZoneForm({
    super.key,
    this.nomsExistants = const [],
    this.zone,
    required this.onEnregistrer,
  });

  @override
  State<ZoneForm> createState() => _ZoneFormState();
}

class _ZoneFormState extends State<ZoneForm> {
  final _formKey = GlobalKey<FormState>();
  late String _nom;
  late String _culture;
  late double _humidite;
  late double _seuil;
  late bool _vanneOuverte;

  @override
  void initState() {
    super.initState();
    _nom = widget.zone?.nom ?? '';
    _culture = widget.zone?.culture ?? '';
    _humidite = widget.zone?.humidite ?? 50.0;
    _seuil = widget.zone?.seuil ?? 30.0;
    _vanneOuverte = widget.zone?.vanneOuverte ?? false;
  }

  void _soumettre() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final zoneFormulee = Zone(
        _nom,
        _culture,
        _humidite,
        _seuil,
        vanneOuverte: _vanneOuverte,
      );
      widget.onEnregistrer(zoneFormulee);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: _nom,
              decoration: const InputDecoration(labelText: 'Nom de la zone'),
              validator: (val) {
                if (val == null || val.trim().isEmpty) return 'Veuillez entrer un nom';
                if (widget.nomsExistants.contains(val.trim())) return 'Ce nom existe déjà';
                return null;
              },
              onSaved: (val) => _nom = val!.trim(),
            ),
            TextFormField(
              initialValue: _culture,
              decoration: const InputDecoration(labelText: 'Culture'),
              validator: (val) => (val == null || val.trim().isEmpty) ? 'Entrez une culture' : null,
              onSaved: (val) => _culture = val!.trim(),
            ),
            const SizedBox(height: 16),
            Text('Humidité actuelle : ${_humidite.round()}%'),
            Slider(
              value: _humidite,
              min: 0,
              max: 100,
              onChanged: (v) => setState(() => _humidite = v),
            ),
            Text('Seuil d\'irrigation : ${_seuil.round()}%'),
            Slider(
              value: _seuil,
              min: 0,
              max: 100,
              onChanged: (v) => setState(() => _seuil = v),
            ),
            SwitchListTile(
              title: const Text('Vanne ouverte'),
              value: _vanneOuverte,
              onChanged: (v) => setState(() => _vanneOuverte = v),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _soumettre,
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}