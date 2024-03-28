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
    return GestureDetector(
      onTap: () {
        onSelected(month);
      },
      child: Container(
        width: 62,height: 99,
        margin: EdgeInsets.symmetric(horizontal: 6),
        // padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.grey,
          borderRadius: BorderRadius.circular(39),
          border: isSelected
              ? Border.all(
                  color: AppColors.studentThemeColor,
                  width: 3,
                )
              : null,
        ),
        child: Align(alignment: Alignment.center,
          child: Text(
            month,
            style: TextStyle(fontSize: 20,
              color: isSelected ? AppColors.studentThemeColor :Color.fromRGBO(224,224,224,1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
