import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    super.key,
    required this.colorIndex,
    required this.colorList,
    required this.onColorSelected,
  });

  final int colorIndex;
  final List<Color> colorList;
  final void Function(int index) onColorSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16.0,
      children: colorList.asMap().entries.map((e) {
        int index = e.key;
        Color color = e.value;
        bool isSelected = index == colorIndex;
        return GestureDetector(
          onTap: () => onColorSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(isSelected ? 1 : 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99.0),
                border: isSelected
                    ? Border.all(
                        color: context.color.primary,
                        width: 3,
                      )
                    : null),
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: context.deco.shadow,
              ),
              child: CircleAvatar(
                backgroundColor: color,
                radius: 20.0,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
