import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/resource/color_manager.dart';
import 'package:hosta_user/core/util/helper/helper.dart';

class SevenDaysCalender extends StatefulWidget {
  final DateTime startDate;
  final ValueChanged<String?> onDateSelected;

  const SevenDaysCalender({
    super.key,
    required this.startDate,
    required this.onDateSelected,
  });

  @override
  State<SevenDaysCalender> createState() => _SevenDaysCalenderState();
}

class _SevenDaysCalenderState extends State<SevenDaysCalender> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (context, index) {
        final date = widget.startDate.add(Duration(days: index));
        return GestureDetector(
          onTap: () {
            widget.onDateSelected(DateFormat('yyyy-MM-dd').format(date));
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            padding: EdgeInsets.all(12.0),
            width: 60.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(
                alpha: selectedIndex == index ? 1.0 : 0.3,
              ),
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${date.day}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontFamily: FontConstants.fontFamily(context.locale),
                    color: ColorManager.darkTextColor,
                  ),
                ),
                Text(
                  '${Helper.getDayName(date, locale: context.locale.languageCode)}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontFamily: FontConstants.fontFamily(context.locale),
                    color: ColorManager.darkTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
