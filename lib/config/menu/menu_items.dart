import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Riverpod Counter',
    subtitle: 'Introducción a Riverpod',
    link: '/counter-river',
    icon: Icons.calculate_outlined,
  ),
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicator',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars y dialogos',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animted container',
    subtitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subtitle: 'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Introducción a la aplicación',
    subtitle: 'Tutorial',
    link: '/tutorial',
    icon: Icons.accessibility_new_rounded,
  ),
  MenuItem(
    title: 'InfiniteScroll y Pull',
    subtitle: 'Listas infinitas y pull refresh',
    link: '/infinite-scroll',
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Cambiar tema',
    subtitle: 'Cambiar tema de la aplicación',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
];
