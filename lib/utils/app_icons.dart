import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formulas_cms/models/models.dart';
import 'package:formulas_cms/utils/colors.dart';

var _basePath = 'assets/icons/';

class _BizwizIcons extends Object {
  static Map<AppIcons, String> _icons = {
    AppIcons.drawer: 'drawer.svg',
    AppIcons.notification: 'notification.svg',
    AppIcons.search: 'search.svg',
    AppIcons.physics: 'physics.png',
    AppIcons.chemistry: 'chemistry.png',
    AppIcons.mathematics: 'mathematics.png',
    AppIcons.menu: 'menu.svg',
    AppIcons.back: 'back.svg',
  };

  static Widget getIcon(AppIcons icon, {double width, Color color}) {
    if (_icons[icon].contains('svg')) {
      return SvgPicture.asset(
        _basePath + _icons[icon],
        width: width,
        fit: BoxFit.cover,
        color: color,
      );
    }
    return Image.asset(
      _basePath + _icons[icon],
      width: width,
      fit: BoxFit.cover,
      color: color,
    );
  }
}

class BizWizIcon extends StatelessWidget {
  final AppIcons icon;
  final IconData iconData;
  final double width;
  final Color color;

  const BizWizIcon({Key key, this.icon, this.iconData, this.width, this.color})
      : super(key: key);

  static AppIcons fromName(String name) {
    AppIcons res;
    // TODO: Create default icon
    _BizwizIcons._icons.forEach((key, icon) {
      if (icon.contains(name)) {
        res = key;
      }
    });

    return res;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQD = MediaQuery.of(context);

    var _color = this.color;

    if (iconData != null)
      return Icon(
        iconData,
        color: _color ?? AppColors.primaryWhite,
        size: width ?? 24,
      );

    return _BizwizIcons.getIcon(icon, width: width ?? 24, color: _color);
  }
}
