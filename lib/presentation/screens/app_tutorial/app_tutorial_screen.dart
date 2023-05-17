import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Ea eiusmod dolor id commodo culpa quis incididunt exercitation eiusmod.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Occaecat consequat ut ex et est eiusmod est non cupidatat pariatur nisi nisi nostrud reprehenderit.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Elit laborum mollit ut reprehenderit id cillum id sit.',
    'assets/images/3.png',
  ),
];

class SlideInfo {
  final String title, caption, imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController;

  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slide) => _Slide(slide.title, slide.caption, slide.imageUrl),
                )
                .toList(),
          ),
          Positioned(
            right: 20.0,
            top: 50.0,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
          (endReached)
              ? Positioned(
                  right: 30.0,
                  bottom: 30.0,
                  child: FadeInRight(
                    from: 15.0,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Empezar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(this.title, this.caption, this.imageUrl);

  final String title, caption, imageUrl;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.titleSmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
