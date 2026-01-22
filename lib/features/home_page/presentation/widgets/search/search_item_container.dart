import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:hosta_user/config/theme/app_theme.dart';
import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/resource/image_widget.dart';
import 'package:hosta_user/features/home_page/domain/entities/search/search_entity.dart';

class SearchItemContainer extends StatelessWidget {
  final SearchEntity? item;
  final VoidCallback? onTap;
  const SearchItemContainer({super.key, this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipOval(
              child: ImageWidget(
                imageUrl: item?.image ?? '',

                boxFit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 12.w),
              child: Text(
                item?.name ?? '',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontFamily: FontConstants.fontFamily(context.locale),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    ).asGlass(
      tintColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
      frosted: true,
      blurX: 4,
      blurY: 4,
      border: Theme.of(context).defaultBorderSide,
    );
  }
}
