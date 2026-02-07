import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import '../../../../config/theme/app_theme.dart';

import '../../../../core/constants/font_constants.dart';
import '../../../../core/resource/common_entity/customer_entity.dart';
import '../../../../core/resource/common_entity/provider_entity.dart';
import '../../../../core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import '../../../../core/resource/image_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/locale_keys.g.dart';

class ClientInfoWidget extends StatelessWidget {
  final ProviderEntity? providerEntity;
  const ClientInfoWidget({super.key, this.providerEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.bookingPage_providerDetails.tr(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontFamily: FontConstants.fontFamily(context.locale),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  child: ImageWidget(
                    boxFit: BoxFit.cover,
                    errorWidget: Icon(
                      Icons.design_services,
                      size: 30.sp,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    imageUrl: providerEntity?.avatar ?? "",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          providerEntity?.name ?? "",
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          providerEntity?.phone ?? "",
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 50.w,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () async {
                    final Uri phoneUri = Uri(
                      scheme: 'tel',
                      path: providerEntity?.phone ?? "",
                    );

                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    } else {
                      if (!context.mounted) return;
                      showMessage(
                        message: LocaleKeys.common_error.tr(),
                        context: context,
                      );
                    }
                  },
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    shadowColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  child:
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),

                        child: Icon(
                          Icons.phone,
                          color: Colors.green,
                          size: 22.sp,
                        ),
                      ).asGlass(
                        frosted: true,
                        blurX: 28,
                        blurY: 28,
                        tintColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer.withValues(alpha: 0.9),
                        clipBorderRadius: BorderRadius.circular(12.r),
                        border: Theme.of(context).defaultBorderSide,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    ).asGlass(
      frosted: true,
      blurX: 8,
      blurY: 8,
      tintColor: Theme.of(
        context,
      ).colorScheme.primaryContainer.withValues(alpha: 0.9),
      clipBorderRadius: BorderRadius.circular(12.r),
      border: Theme.of(context).defaultBorderSide,
    );
  }
}
