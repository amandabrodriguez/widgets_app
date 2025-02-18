import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  const UiControlScreen({super.key});

  static const name = 'ui_control_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UIControlsView(),
    );
  }
}

enum Transportation {
  car,
  plain,
  boat,
  submarine,
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {
  bool switchValue = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: switchValue,
          onChanged: (value) {
            switchValue = value;
            setState(() {});
          },
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(selectedTransportation.name),
          children: [
            _CustomRadioListTile(
              transportationValue: Transportation.car,
              selectedTransportation: selectedTransportation,
              onPressed: () => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            _CustomRadioListTile(
              transportationValue: Transportation.plain,
              selectedTransportation: selectedTransportation,
              onPressed: () => setState(() {
                selectedTransportation = Transportation.plain;
              }),
            ),
            _CustomRadioListTile(
              transportationValue: Transportation.boat,
              selectedTransportation: selectedTransportation,
              onPressed: () => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            _CustomRadioListTile(
              transportationValue: Transportation.submarine,
              selectedTransportation: selectedTransportation,
              onPressed: () => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          value: wantsBreakfast,
          title: const Text('¿Desayuno?'),
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          value: wantsLunch,
          title: const Text('¿Almuerzo?'),
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          value: wantsDinner,
          title: const Text('¿Cena?'),
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}

class _CustomRadioListTile extends StatelessWidget {
  const _CustomRadioListTile(
      {required this.onPressed,
      required this.transportationValue,
      required this.selectedTransportation});

  final Function() onPressed;
  final Transportation transportationValue;
  final Transportation selectedTransportation;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text('By ${transportationValue.name.toString()}'),
      subtitle: Text('Travel by ${transportationValue.name}'),
      value: transportationValue,
      groupValue: selectedTransportation,
      onChanged: (value) => onPressed(),
    );
  }
}
