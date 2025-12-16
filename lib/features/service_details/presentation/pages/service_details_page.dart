import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';

import 'package:hosta_user/config/theme/app_theme.dart';

import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/core/resource/color_manager.dart';
import 'package:hosta_user/core/resource/common_entity/service_entity.dart';
import 'package:hosta_user/core/resource/common_state_widget/error_state_widget.dart';
import 'package:hosta_user/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:hosta_user/core/resource/common_state_widget/no_internet_state_widget.dart';
import 'package:hosta_user/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:hosta_user/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:hosta_user/core/resource/image_widget.dart';
import 'package:hosta_user/core/resource/main_page/main_page.dart';
import 'package:hosta_user/core/util/helper/helper.dart';
import 'package:hosta_user/features/service_details/data/models/store_booking_model.dart';
import 'package:hosta_user/features/service_details/data/models/time_slots_model.dart';
import 'package:hosta_user/features/service_details/domain/entities/slots_entity.dart';
import 'package:hosta_user/features/service_details/domain/entities/time_slots_entity.dart';
import 'package:hosta_user/features/service_details/presentation/bloc/service_details_bloc.dart';
import 'package:hosta_user/features/service_details/presentation/bloc/time_slots_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../data/models/service_details_model.dart';
import '../bloc/store_booking_bloc.dart';
import '../widgets/seven_days_calender.dart';

class ServiceDetailsPage extends StatefulWidget {
  final ServiceEntity? serviceEntity;
  const ServiceDetailsPage({super.key, this.serviceEntity});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  ServiceDetailsModel serviceDetailsModel = ServiceDetailsModel();
  StoreBookingModel storeBookingModel = StoreBookingModel();
  bool showBookingDetails = false;
  bool showBookingSchedule = false;
  double showBookingDetailsPosition = -610.h;
  double showBookingSchedulePosition = -610.0.h;
  TimeSlotsModel timeSlotsModel = TimeSlotsModel();
  String? selectedDate;
  SlotsEntity? selectedSlot;
  List<File?>? files = [];
  String? scheduledAt;
  Future<void> pickImages() async {
    ImageSource? source = ImageSource.gallery;
    await showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 110.h,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadiusDirectional.vertical(
                    top: Radius.circular(20.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 10.r,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        source = ImageSource.gallery;
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(end: 12.w),
                            child: Icon(
                              Icons.photo_library,
                              color: ColorManager.darkTextColor,
                              size: 24.sp,
                            ),
                          ),
                          Text(
                            LocaleKeys.serviceDetailsPage_chooseFromGallery
                                .tr(),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  color: ColorManager.darkTextColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        source = ImageSource.camera;
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(end: 12.w),
                            child: Icon(
                              Icons.camera_alt,
                              color: ColorManager.darkTextColor,
                              size: 24.sp,
                            ),
                          ),
                          Text(
                            LocaleKeys.serviceDetailsPage_takePhoto.tr(),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  color: ColorManager.darkTextColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ).then((onValue) {
      final ImagePicker picker = ImagePicker();
      if (source == ImageSource.camera) {
        picker.pickImage(source: source ?? ImageSource.gallery).then((
          pickedFile,
        ) {
          if (pickedFile != null) {
            setState(() {
              files?.add(File(pickedFile.path));
              storeBookingModel = storeBookingModel.copyWith(
                attachments: files,
              );
            });
          }
        });
      } else {
        picker.pickMultiImage(limit: 5).then((pickedFiles) {
          if (pickedFiles.isNotEmpty) {
            setState(() {
              files?.addAll(pickedFiles.map((e) => File(e.path)).toList());
              storeBookingModel = storeBookingModel.copyWith(
                attachments: files,
              );
            });
          }
        });
      }
    });
  }

  @override
  @override
  void didChangeDependencies() {
    serviceDetailsModel = ServiceDetailsModel(
      Accept_Language: Helper.getCountryCode(context),

      service_id: widget.serviceEntity?.id,
    );
    storeBookingModel = StoreBookingModel(
      acceptLanguage: Helper.getCountryCode(context),

      serviceId: widget.serviceEntity?.provider_service?["id"],
      notes: LocaleKeys.serviceDetailsPage_pleaseDescribeYourIssueInDetail.tr(),
    );
    timeSlotsModel = timeSlotsModel.copyWith(
      acceptLanguage: Helper.getCountryCode(context),

      providerServiceId: widget.serviceEntity?.provider_service?["id"],
    );
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ServiceDetailsPage oldWidget) {
    serviceDetailsModel = ServiceDetailsModel(
      Accept_Language: Helper.getCountryCode(context),

      service_id: widget.serviceEntity?.provider_service?["id"],
    );
    storeBookingModel = StoreBookingModel(
      acceptLanguage: Helper.getCountryCode(context),

      serviceId: widget.serviceEntity?.provider_service?["id"],
      notes: LocaleKeys.serviceDetailsPage_pleaseDescribeYourIssueInDetail.tr(),
    );
    timeSlotsModel = timeSlotsModel.copyWith(
      acceptLanguage: Helper.getCountryCode(context),

      providerServiceId: widget.serviceEntity?.provider_service?["id"],
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      title: widget.serviceEntity?.name ?? "",
      body: BlocProvider<StoreBookingBloc>(
        create: (context) =>
            getItInstance<StoreBookingBloc>()..add(StoreBookingEvent.started()),
        child: Stack(
          children: [
            PositionedDirectional(
              start: 0,
              top: 0,
              end: 0,
              bottom: 0,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    child:
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.h,
                            horizontal: 20.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.serviceEntity?.name ?? "",
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ).asGlass(
                          tintColor: Theme.of(context).scaffoldBackgroundColor,
                          clipBorderRadius: BorderRadius.circular(12.r),
                          blurX: 30,
                          blurY: 30,
                          border: Theme.of(context).defaultBorderSide,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    child: Text(
                      LocaleKeys.serviceDetailsPage_availableProviders.tr(),
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                  ),
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<ServiceDetailsBloc>(
                        create: (context) =>
                            getItInstance<ServiceDetailsBloc>()..add(
                              ServiceDetailsEvent.getServiceDetails(
                                serviceDetailsModel: serviceDetailsModel,
                              ),
                            ),
                      ),
                    ],
                    child: BlocListener<StoreBookingBloc, StoreBookingState>(
                      listener: (context, state) {
                        print("StoreBookingBloc State: $state");
                        if (state is StoreBookingStateInitial) {
                        } else if (state is StoreBookingStateLoading) {
                        } else if (state is StoreBookingStateSuccess) {
                          showMessage(
                            context: context,
                            message: LocaleKeys.common_success.tr(),
                          );
                        } else {
                          showMessage(
                            context: context,
                            message: LocaleKeys.common_error.tr(),
                          );
                        }
                      },
                      child: BlocBuilder<ServiceDetailsBloc, ServiceDetailsState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => SizedBox.shrink(),
                            loading: () => Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            loaded: (serviceDetailsEntity) {
                              return ListView.builder(
                                itemCount: serviceDetailsEntity?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                    child:
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 12.h,
                                            horizontal: 12.w,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Theme.of(context)
                                                            .defaultBorderSide
                                                            .color,
                                                        width: Theme.of(context)
                                                            .defaultBorderSide
                                                            .width,
                                                      ),
                                                    ),
                                                    child: ImageWidget(
                                                      width: 80.w,
                                                      height: 80.h,
                                                      imageUrl:
                                                          "${serviceDetailsEntity?[index]?.provider?["avatar"]}",
                                                      boxFit: BoxFit.fill,
                                                      errorIconSize: 60.sp,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional.only(
                                                          start: 20.w,
                                                        ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,

                                                      children: [
                                                        Text(
                                                          serviceDetailsEntity?[index]
                                                                  ?.provider?["name"] ??
                                                              "",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .labelLarge
                                                              ?.copyWith(
                                                                fontFamily:
                                                                    FontConstants.fontFamily(
                                                                      context
                                                                          .locale,
                                                                    ),
                                                              ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                vertical: 4.h,
                                                              ),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_pin,
                                                                size: 22.sp,
                                                                color:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .textTheme
                                                                        .labelLarge
                                                                        ?.color,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional.only(
                                                                      start:
                                                                          4.w,
                                                                    ),
                                                                child: Text(
                                                                  serviceDetailsEntity?[index]
                                                                          ?.provider?["address"]["address"] ??
                                                                      "",
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .labelSmall
                                                                      ?.copyWith(
                                                                        fontFamily: FontConstants.fontFamily(
                                                                          context
                                                                              .locale,
                                                                        ),
                                                                      ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .monetization_on,
                                                              size: 22.sp,
                                                              color:
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .textTheme
                                                                      .labelLarge
                                                                      ?.color,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional.only(
                                                                    start: 4.w,
                                                                  ),
                                                              child: Text(
                                                                "${Helper.formatPrice(serviceDetailsEntity?[index]?.provider_service?["price"])} ${LocaleKeys.myServicesPage_iqd.tr()}/${LocaleKeys.serviceDetailsPage_service.tr()}",

                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .labelSmall
                                                                    ?.copyWith(
                                                                      fontFamily:
                                                                          FontConstants.fontFamily(
                                                                            context.locale,
                                                                          ),
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                top: 8.h,
                                                              ),
                                                          child: SizedBox(
                                                            height: 25.h,
                                                            width: 200.w,
                                                            child: ListView.builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  serviceDetailsEntity?[index]
                                                                      ?.languages
                                                                      ?.length ??
                                                                  0,
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              itemBuilder:
                                                                  (
                                                                    context,
                                                                    langIndex,
                                                                  ) => Padding(
                                                                    padding:
                                                                        EdgeInsetsDirectional.only(
                                                                          end: 8
                                                                              .w,
                                                                        ),
                                                                    child:
                                                                        Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                8.w,
                                                                            vertical:
                                                                                4.h,
                                                                          ),
                                                                          width:
                                                                              50.w,
                                                                          height:
                                                                              25.h,
                                                                          child: Center(
                                                                            child: FittedBox(
                                                                              fit: BoxFit.scaleDown,
                                                                              child: Text(
                                                                                serviceDetailsEntity?[index]?.languages?[langIndex]["name"] ??
                                                                                    "",
                                                                                style:
                                                                                    Theme.of(
                                                                                      context,
                                                                                    ).textTheme.labelSmall?.copyWith(
                                                                                      fontFamily: FontConstants.fontFamily(
                                                                                        context.locale,
                                                                                      ),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ).asGlass(
                                                                          tintColor: Theme.of(
                                                                            context,
                                                                          ).scaffoldBackgroundColor,
                                                                          clipBorderRadius: BorderRadius.circular(
                                                                            8.r,
                                                                          ),
                                                                          blurX:
                                                                              20,
                                                                          blurY:
                                                                              20,
                                                                          border: Theme.of(
                                                                            context,
                                                                          ).defaultBorderSide,
                                                                        ),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 12.h,
                                                ),
                                                child: SizedBox(
                                                  width: 200.w,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        showBookingDetails =
                                                            true;
                                                        showBookingSchedule =
                                                            false;
                                                        showBookingSchedulePosition =
                                                            -620.h;
                                                        showBookingDetailsPosition =
                                                            0;

                                                        timeSlotsModel =
                                                            timeSlotsModel.copyWith(
                                                              providerServiceId:
                                                                  serviceDetailsEntity?[index]
                                                                      ?.provider_service?["id"],
                                                            );
                                                        storeBookingModel = storeBookingModel.copyWith(
                                                          providerId:
                                                              serviceDetailsEntity?[index]
                                                                  ?.provider?["id"],
                                                          serviceId:
                                                              serviceDetailsEntity?[index]
                                                                  ?.provider_service?["id"],
                                                        );
                                                      });
                                                    },

                                                    child: Text(
                                                      LocaleKeys
                                                          .serviceDetailsPage_bookNow
                                                          .tr(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge
                                                          ?.copyWith(
                                                            fontFamily:
                                                                FontConstants.fontFamily(
                                                                  context
                                                                      .locale,
                                                                ),
                                                            color: ColorManager
                                                                .darkTextColor,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).asGlass(
                                          tintColor: Theme.of(
                                            context,
                                          ).scaffoldBackgroundColor,
                                          clipBorderRadius:
                                              BorderRadius.circular(12.r),
                                          blurX: 30,
                                          blurY: 30,
                                          border: Theme.of(
                                            context,
                                          ).defaultBorderSide,
                                        ),
                                  );
                                },
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                              );
                            },
                            noData: () => Center(child: NodataStateWidget()),
                            error: (error) => Center(child: ErrorStateWidget()),
                            unauthenticated: (error) =>
                                Center(child: ErrorStateWidget()),
                            noInternet: () =>
                                Center(child: NoInternetStateWidget()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showBookingDetails)
              AnimatedPositionedDirectional(
                duration: Duration(milliseconds: 300),
                bottom: showBookingDetailsPosition,
                start: 0,
                end: 0,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    print(
                      "showBookingDetailsPosition: $showBookingDetailsPosition",
                    );
                    if (showBookingDetailsPosition + -details.delta.dy >
                            -200.h &&
                        showBookingDetailsPosition + -details.delta.dy <= 0) {
                      setState(() {
                        showBookingDetailsPosition += -details.delta.dy;
                      });
                    } else if (showBookingDetailsPosition + -details.delta.dy <
                        -200) {
                      setState(() {
                        showBookingDetailsPosition = -610.h;
                      });
                    }
                  },
                  onVerticalDragEnd: (details) {
                    if (showBookingDetailsPosition < -210.h) {
                      setState(() {
                        showBookingDetailsPosition = -610.h;
                      });
                    } else {
                      setState(() {
                        showBookingDetailsPosition = 0.0;
                      });
                    }
                  },
                  child: Container(
                    height: 600.h,
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withValues(
                            alpha:
                                1 *
                                (showBookingDetailsPosition + 600.h) /
                                600.h,
                          ),
                          blurRadius: 1.r,

                          offset: Offset(0, -2.h),
                        ),
                      ],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 60.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color:
                                (Theme.of(
                                      context,
                                    ).textTheme.labelLarge?.color !=
                                    null)
                                ? Theme.of(
                                    context,
                                  ).textTheme.labelLarge?.color?.withValues(
                                    alpha:
                                        1 *
                                        (showBookingDetailsPosition + 220.h) /
                                        220.h,
                                  )
                                : Theme.of(context).textTheme.labelLarge?.color,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(vertical: 12.h),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              LocaleKeys.serviceDetailsPage_describeYourIssue
                                  .tr(),
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    fontFamily: FontConstants.fontFamily(
                                      context.locale,
                                    ),
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        CustomInputField(
                          width: double.maxFinite,

                          maxLines: 4,
                          initialValue: storeBookingModel.notes,
                          onChanged: (value) => storeBookingModel =
                              storeBookingModel.copyWith(notes: value),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Text(
                            LocaleKeys.serviceDetailsPage_addAttachments.tr(),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                ),
                          ),
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (storeBookingModel.attachments?.isEmpty ??
                                true) {
                              return SizedBox(
                                height: 100.h,
                                width: 100.w,
                                child: ElevatedButton(
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style
                                      ?.copyWith(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Theme.of(
                                            context,
                                          ).colorScheme.primaryContainer,
                                        ),
                                      ),
                                  onPressed: () async {
                                    await pickImages();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Theme.of(context).primaryColor,
                                    size: 40.sp,
                                  ),
                                ),
                              );
                            }
                            return Container(
                              height: 260.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(
                                  Theme.of(context).defaultBorderSide,
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 180.h,
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          storeBookingModel
                                              .attachments
                                              ?.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        return Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                width: 150.w,
                                                height: 180.h,
                                                margin:
                                                    EdgeInsetsDirectional.only(
                                                      end: 16.w,

                                                      bottom: 8.h,
                                                    ),

                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        12.r,
                                                      ),
                                                  border: Border.fromBorderSide(
                                                    Theme.of(
                                                      context,
                                                    ).defaultBorderSide,
                                                  ),
                                                ),
                                                child:
                                                    storeBookingModel
                                                            .attachments?[index] !=
                                                        null
                                                    ? Image.file(
                                                        storeBookingModel
                                                                .attachments?[index] ??
                                                            File(""),
                                                        width: 150.w,
                                                        height: 100.h,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Icon(
                                                        Icons.broken_image,
                                                        size: 100.sp,
                                                      ),
                                              ),
                                            ),
                                            Positioned(
                                              top: -8.h,
                                              right: -8,
                                              child: ElevatedButton(
                                                style: Theme.of(context)
                                                    .elevatedButtonTheme
                                                    .style
                                                    ?.copyWith(
                                                      shape:
                                                          WidgetStatePropertyAll(
                                                            CircleBorder(),
                                                          ),
                                                      padding:
                                                          WidgetStatePropertyAll(
                                                            EdgeInsets.all(4.r),
                                                          ),
                                                      minimumSize:
                                                          WidgetStatePropertyAll(
                                                            Size(24.w, 24.h),
                                                          ),
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .errorContainer,
                                                          ),
                                                    ),
                                                onPressed: () {
                                                  files?.removeAt(index);
                                                  setState(() {
                                                    storeBookingModel =
                                                        storeBookingModel
                                                            .copyWith(
                                                              attachments:
                                                                  files,
                                                            );
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  size: 16.sp,
                                                  color: ColorManager
                                                      .darkTextColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.copyWith(
                                                shape: WidgetStatePropertyAll(
                                                  CircleBorder(),
                                                ),
                                              ),
                                          onPressed: () async {
                                            await pickImages();
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 24.sp,
                                            color: ColorManager.darkTextColor,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.copyWith(
                                                shape: WidgetStatePropertyAll(
                                                  CircleBorder(),
                                                ),
                                              ),
                                          onPressed: () {
                                            setState(() {
                                              files = [];
                                              storeBookingModel =
                                                  storeBookingModel.copyWith(
                                                    attachments: files,
                                                  );
                                            });
                                          },
                                          child: Icon(
                                            Icons.delete_forever,
                                            size: 24.sp,
                                            color: ColorManager.darkTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Spacer(),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showBookingDetailsPosition = -620.h;
                                showBookingDetails = false;
                                showBookingSchedule = true;
                                showBookingSchedulePosition = 0;
                              });
                            },
                            child: Text(
                              LocaleKeys.serviceDetailsPage_next.tr(),
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    fontFamily: FontConstants.fontFamily(
                                      context.locale,
                                    ),
                                    color: ColorManager.darkTextColor,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (showBookingSchedule)
              AnimatedPositionedDirectional(
                duration: Duration(milliseconds: 300),
                bottom: showBookingSchedulePosition,
                start: 0,
                end: 0,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    print(
                      "showBookingSchedulePosition: $showBookingSchedulePosition",
                    );
                    if (showBookingSchedulePosition + -details.delta.dy >
                            -200.h &&
                        showBookingSchedulePosition + -details.delta.dy <= 0) {
                      setState(() {
                        showBookingSchedulePosition += -details.delta.dy;
                      });
                    } else if (showBookingSchedulePosition + -details.delta.dy <
                        -200) {
                      setState(() {
                        showBookingSchedulePosition = -610.h;
                      });
                    }
                  },
                  onVerticalDragEnd: (details) {
                    if (showBookingSchedulePosition < -210.h) {
                      setState(() {
                        showBookingSchedulePosition = -610.h;
                      });
                    } else {
                      setState(() {
                        showBookingSchedulePosition = 0.0;
                      });
                    }
                  },
                  child: Container(
                    height: 600.h,
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withValues(
                            alpha:
                                1 *
                                (showBookingDetailsPosition + 600.h) /
                                600.h,
                          ),
                          blurRadius: 1.r,

                          offset: Offset(0, -2.h),
                        ),
                      ],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                    ),
                    child: BlocProvider<TimeSlotsBloc>(
                      key: ValueKey(storeBookingModel),
                      create: (context) => getItInstance<TimeSlotsBloc>()
                        ..add(
                          TimeSlotsEvent.getTimeSlots(
                            timeSlotsModel: timeSlotsModel,
                          ),
                        ),
                      child: Column(
                        children: [
                          Container(
                            width: 60.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              color:
                                  (Theme.of(
                                        context,
                                      ).textTheme.labelLarge?.color !=
                                      null)
                                  ? Theme.of(
                                      context,
                                    ).textTheme.labelLarge?.color?.withValues(
                                      alpha:
                                          1 *
                                          (showBookingSchedulePosition +
                                              220.h) /
                                          220.h,
                                    )
                                  : Theme.of(
                                      context,
                                    ).textTheme.labelLarge?.color,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              LocaleKeys.serviceDetailsPage_chooseDay.tr(),
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    fontFamily: FontConstants.fontFamily(
                                      context.locale,
                                    ),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 80.h,
                            width: double.maxFinite,
                            child:
                                SevenDaysCalender(
                                  startDate: DateTime.now(),
                                  onDateSelected: (date) {
                                    setState(() {
                                      selectedDate = date;
                                    });
                                  },
                                ).animate().scaleXY(
                                  duration: 300.ms,
                                  curve: Curves.easeInOut,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              LocaleKeys.serviceDetailsPage_availableTimes.tr(),
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    fontFamily: FontConstants.fontFamily(
                                      context.locale,
                                    ),
                                  ),
                            ),
                          ),
                          BlocBuilder<TimeSlotsBloc, TimeSlotsState>(
                            builder: (context, state) {
                              print("TimeSlotsState: $state");
                              return state.when(
                                initial: () => Center(
                                  child: Text(
                                    LocaleKeys.serviceDetailsPage_chooseDay
                                        .tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          fontFamily: FontConstants.fontFamily(
                                            context.locale,
                                          ),
                                        ),
                                  ),
                                ),
                                loading: () =>
                                    Center(child: CircularProgressIndicator()),
                                loaded: (data) {
                                  TimeSlotsEntity? selectedTimeSlots = data
                                      ?.firstWhere(
                                        (element) =>
                                            element?.date == selectedDate,
                                        orElse: () => null,
                                      );

                                  return AnimatedSwitcher(
                                    duration: 300.ms,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0.h),
                                      child:
                                          (selectedTimeSlots?.slots?.isEmpty ??
                                              true)
                                          ? Text(
                                              LocaleKeys.common_noThingToShow
                                                  .tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontFamily:
                                                        FontConstants.fontFamily(
                                                          context.locale,
                                                        ),
                                                  ),
                                            )
                                          : SizedBox(
                                              height: 320.h,
                                              child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 12.h,
                                                      crossAxisSpacing: 12.w,
                                                      childAspectRatio: 2.5,
                                                    ),
                                                itemCount:
                                                    selectedTimeSlots
                                                        ?.slots
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  final slot = selectedTimeSlots
                                                      ?.slots?[index];
                                                  final isSelected =
                                                      selectedSlot == slot;
                                                  return ElevatedButton(
                                                    style: Theme.of(context)
                                                        .elevatedButtonTheme
                                                        .style
                                                        ?.copyWith(
                                                          backgroundColor: WidgetStatePropertyAll(
                                                            isSelected
                                                                ? Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .primary
                                                                : Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .primaryContainer,
                                                          ),
                                                        ),
                                                    onPressed: () {
                                                      setState(() {
                                                        selectedSlot = slot;
                                                        scheduledAt =
                                                            "${selectedDate} ${slot?.start_time}";
                                                        storeBookingModel =
                                                            storeBookingModel
                                                                .copyWith(
                                                                  scheduledAt:
                                                                      scheduledAt,
                                                                );
                                                        print(
                                                          "sch ${scheduledAt}",
                                                        );
                                                      });
                                                    },
                                                    child: Text(
                                                      slot?.start_time ?? "",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge
                                                          ?.copyWith(
                                                            fontFamily:
                                                                FontConstants.fontFamily(
                                                                  context
                                                                      .locale,
                                                                ),
                                                            color: isSelected
                                                                ? ColorManager
                                                                      .darkTextColor
                                                                : Theme.of(
                                                                        context,
                                                                      )
                                                                      .textTheme
                                                                      .labelLarge
                                                                      ?.color,
                                                          ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                    ),
                                  );
                                },
                                noData: () =>
                                    Center(child: NodataStateWidget()),
                                error: (error) =>
                                    Center(child: ErrorStateWidget()),
                                sessionExpired: () =>
                                    Center(child: ErrorStateWidget()),
                                noInternet: () =>
                                    Center(child: NoInternetStateWidget()),
                              );
                            },
                          ),
                          Spacer(),
                          SizedBox(
                            width: double.maxFinite,
                            child: Builder(
                              builder: (context) {
                                return ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showBookingDetailsPosition = -620.h;
                                      showBookingDetails = false;
                                      showBookingSchedule = false;
                                      showBookingSchedulePosition = -620.h;
                                    });
                                    context.read<StoreBookingBloc>().add(
                                      StoreBookingEvent.storeBooking(
                                        storeBookingModel: storeBookingModel,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    LocaleKeys.serviceDetailsPage_ConfirmBooking
                                        .tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          fontFamily: FontConstants.fontFamily(
                                            context.locale,
                                          ),
                                          color: ColorManager.darkTextColor,
                                        ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
