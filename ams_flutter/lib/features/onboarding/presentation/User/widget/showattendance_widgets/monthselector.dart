import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MonthSelector extends StatefulWidget {
  final List<String> months;

  const MonthSelector({Key? key, required this.months}) : super(key: key);

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  String? _selectedMonth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.months
            .map(
              (month) => MonthBox(
                month: month,
                isSelected: month == _selectedMonth,
                onSelected: (selectedMonth) {
                  setState(() {
                    _selectedMonth = selectedMonth;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class MonthBox extends StatelessWidget {
  final String month;
  final bool isSelected;
  final Function(String) onSelected;

  const MonthBox({
    Key? key,
    required this.month,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final double screenWidth = MediaQuery.of(context).size.width;
    final double itemWidth = screenWidth * 0.15;
    final double itemHeight = screenWidth * 0.20;
      final double fontSize = itemHeight * 0.3;
    return GestureDetector(
      onTap: () {
        onSelected(month);
      },
      child: Container(
        width: itemWidth,height: itemHeight,
        margin: EdgeInsets.symmetric(horizontal: 6),
        // padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.grey,
          borderRadius: BorderRadius.circular(39),
          border: isSelected
              ? Border.all(
                  color: AppColors.primary,
                  width: 1,
                )
              : null,
        ),
        child: Align(alignment: Alignment.center,
          child: Text(
            month,
            style: TextStyle(fontSize: fontSize,
              color: isSelected ? AppColors.primary :Color.fromRGBO(224,224,224,1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
