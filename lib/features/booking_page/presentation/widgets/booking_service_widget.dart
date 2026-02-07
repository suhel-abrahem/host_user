import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import '/core/resource/color_manager.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/font_constants.dart';

import '../../../../core/util/helper/helper.dart';

import '../../domain/entities/booking_entity.dart';
import '../../../../generated/locale_keys.g.dart';

import '../../../../config/route/routes_manager.dart';

class BookingServiceWidget extends StatefulWidget {
  final BookingEntity? bookingEntity;
  const BookingServiceWidget({super.key, this.bookingEntity});

  @override
  State<BookingServiceWidget> createState() => _BookingServiceWidgetState();
}

class _BookingServiceWidgetState extends State<BookingServiceWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.pushNamed(
          RoutesName.serviceInfoPage,
          pathParameters: {
            "serviceId": widget.bookingEntity?.id.toString() ?? "",
            "isComplete": "false",
          },
        );
      },
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        shadowColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      child:
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            height: 220.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.bookingEntity?.booking_number.toString() ?? "",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Helper.getColorByStatus(
                          widget.bookingEntity?.status,
                          context,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        Helper.getStatusName(
                              widget.bookingEntity?.status ?? "",
                            ) ??
                            "",
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              fontFamily: FontConstants.fontFamily(
                                context.locale,
                              ),
                              color: ColorManager.backgroundColor,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(end: 12.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                widget.bookingEntity?.provider?["name"] ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
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
                                widget.bookingEntity?.service?["name"] ?? "",
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
                      width: 80.w,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${widget.bookingEntity?.total_price ?? 0} ${LocaleKeys.myServicesPage_iqd.tr()}",
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 8.w),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: Theme.of(context).textTheme.labelSmall?.color,
                      ),
                    ),
                    Text(
                      "${LocaleKeys.bookingPage_startTime.tr()}: ",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd - hh:mm').format(
                        DateTime.parse(widget.bookingEntity?.start_time ?? ""),
                      ),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 8.w),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: Theme.of(context).textTheme.labelSmall?.color,
                      ),
                    ),
                    Text(
                      "${LocaleKeys.bookingPage_endTime.tr()}: ",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd - hh:mm').format(
                        DateTime.parse(widget.bookingEntity?.end_time ?? ""),
                      ),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).asGlass(
            frosted: true,
            blurX: 38,
            blurY: 38,
            tintColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.9),
            clipBorderRadius: BorderRadius.circular(12.r),
            border: Theme.of(context).defaultBorderSide,
          ),
    );
  }
}
