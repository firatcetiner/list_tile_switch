/*
    Author: Fırat Çetiner
    Contact: f1r4tc@gmail.com
*/

library list_tile_switch;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Enum for deciding which type of switch to be displayed.
enum SwitchType {
  /// Material type [Switch].
  material,

  /// Cupertino type [CupertinoSwitch].
  cupertino,

  /// Custom [CustomSwitch].
  custom,
}

/// Enum extension to map the given [SwitchType] to its corresponding switch widget.
/// Default is [CustomSwitch].
extension SwitchTypeExtension on SwitchType {
  Widget widget(
    Color? activeColor,
    Color? inactiveColor,
    ValueChanged<bool> onChanged,
    bool value,
  ) {
    switch (this) {
      case SwitchType.material:
        return Switch(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          activeTrackColor: activeColor?.withOpacity(0.5),
        );
      case SwitchType.cupertino:
        return CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
        );
      default:
        return CustomSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        );
    }
  }
}

/// Animation duration for [CustomSwitch].
@protected
const Duration _kSwitchAnimationDuration = const Duration(milliseconds: 250);

class ListTileSwitch extends StatelessWidget {
  const ListTileSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.switchScale = 0.7,
    this.switchActiveColor = Colors.blue,
    this.switchInactiveColor,
    this.title,
    this.subtitle,
    this.leading,
    this.enabled = true,
    this.isThreeLine = false,
    this.switchType = SwitchType.custom,
    this.contentPadding,
    this.onLongPress,
    this.visualDensity,
    this.dense = false,
    this.focusNode,
    this.autoFocus = false,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.mouseCursor,
    this.toggleSelectedOnValueChange = false,
    this.listTileStyle = ListTileStyle.list,
  })  : assert(switchScale <= 1.0),
        super(key: key);

  // Indicates that how much to scale the switch widget against its original values.
  /// Prefer using [switchScale] = 1.0 for [Material] type [Switch].
  final double switchScale;

  /// Color of switch background color and [ListTileTheme.selectedColor].
  final Color? switchActiveColor;

  /// A value for deciding whether make [ListTile] widget selected or not.
  /// If true, [ListTileTheme.selectedColor] will be the value of [activeSwitchColor].
  final bool? toggleSelectedOnValueChange;

  /// Color value when switch is [value] is false.
  final Color? switchInactiveColor;

  // Indicating type of switch widget to be used.
  final SwitchType switchType;

  /// Referring to both [Switch.value] and [CupertinoSwitch.value], holding the
  /// current state of the switch widget.
  final bool value;

  /// Similar to [Switch.onChanged] and [CupertinoSwitch.onChanged].
  final ValueChanged<bool> onChanged;

  /// Referring to properties of [ListTile]
  /// Values directly mapped into the [ListTileSwitch].
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final bool isThreeLine;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onLongPress;
  final VisualDensity? visualDensity;
  final bool? dense;
  final bool enabled;
  final FocusNode? focusNode;
  final bool autoFocus;
  final bool selected;
  final Color? focusColor;
  final Color? hoverColor;
  final MouseCursor? mouseCursor;

  /// Sets the [ListTileStyle] for the inherited [ListTileTheme].
  final ListTileStyle listTileStyle;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme.merge(
      selectedColor: switchActiveColor,
      style: listTileStyle,
      child: ListTile(
        enabled: enabled,
        onTap: () => onChanged(!value),
        onLongPress: onLongPress,
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: Builder(
          builder: (_) => Transform.scale(
            alignment: Alignment.center,
            scale: switchType == SwitchType.material ? 1.0 : switchScale,
            child: switchType.widget(
              switchActiveColor,
              switchInactiveColor ??
                  Theme.of(context).unselectedWidgetColor.withOpacity(0.1),
              onChanged,
              value,
            ),
          ),
        ),
        contentPadding: contentPadding,
        visualDensity: visualDensity,
        autofocus: autoFocus,
        focusNode: focusNode,
        selected: toggleSelectedOnValueChange == true ? value : selected,
        isThreeLine: isThreeLine,
        dense: dense,
        focusColor: focusColor,
        hoverColor: hoverColor,
        mouseCursor: mouseCursor,
      ),
    );
  }
}

@visibleForTesting
class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    required this.onChanged,
    required this.value,
    this.inactiveColor,
    this.activeColor,
  }) : super(key: key);

  /// Function callback similar to [Switch.onChanged] or [CupertinoSwitch.onChanged].
  final ValueChanged<bool> onChanged;

  /// Referring to [Switch.value] or [CupertinoSwitch.value]
  final bool value;

  /// Referring to [Switch.inactiveColor] in the case of [SwitchType.material],
  /// we use inactiveColor for both [Switch.inactiveTrackColor]
  /// and [Switch.inactiveTrackColor] with [Color.withOpacity].
  final Color? inactiveColor;

  /// Color for background of the switch widget when [value] is true.
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: SizedBox(
        height: 35,
        width: 70,
        child: Stack(
          children: [
            AnimatedContainer(
              height: 35,
              width: 70,
              curve: Curves.ease,
              duration: _kSwitchAnimationDuration,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(25.0),
                ),
                color: value ? activeColor : inactiveColor,
              ),
            ),
            AnimatedAlign(
              curve: Curves.ease,
              duration: _kSwitchAnimationDuration,
              alignment: !value ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
