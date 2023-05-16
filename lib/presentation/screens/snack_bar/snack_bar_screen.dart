import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  static const name = 'snackbar_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'In amet sit et incididunt esse enim dolore culpa officia aliqua sunt fugiat reprehenderit. Minim proident amet tempor aliqua reprehenderit commodo enim incididunt. Nostrud aliqua et aliquip quis magna id Lorem. Aliqua ea Lorem ut Lorem commodo laborum culpa irure occaecat do sint.',
                    )
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackBar(context),
      ),
    );
  }

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(label: 'OK', onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estás seguro'),
        content: const Text(
            'Ad irure voluptate ut proident sit est aute labore mollit. Irure ad occaecat duis veniam. Tempor aute veniam deserunt excepteur est. Magna cillum deserunt aliqua culpa ullamco dolor. Do minim amet dolore elit officia quis duis aliqua in esse ullamco irure est.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }
}
