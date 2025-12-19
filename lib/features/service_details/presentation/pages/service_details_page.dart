import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:hosta_user/config/app/app_preferences.dart';

import 'package:hosta_user/config/theme/app_theme.dart';

import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/core/enums/login_state_enum.dart';
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
import 'package:hosta_user/features/login_page/domain/entities/login_state_entity.dart';
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

  TimeSlotsModel timeSlotsModel = TimeSlotsModel();
  String? selectedDate;

  SlotsEntity? selectedSlot;
  List<File?>? images = [];
  String? scheduledAt;
  String? nots;
  List<TimeSlotsEntity?>? timeSlots = [];
  TimeSlotsEntity? selectedTimeSlots;
  bool gettingTimeSlotsHasError = false;
  bool gettingTimeSlots = false;
  DraggableScrollableController bookingDetailsScrollableController =
      DraggableScrollableController();
  DraggableScrollableController bookingScheduleScrollableController =
      DraggableScrollableController();
  Future<void> pickImages() async {
    ImageSource? source = ImageSource.gallery;
    int imagesNumber = images?.length ?? 0;
    int imageLimt = 6 - (imagesNumber);
    if (imagesNumber >= 5) {
      showMessage(
        context: context,
        message: LocaleKeys.serviceDetailsPage_maximumOf5ImagesAllowed.tr(),
      );
      return;
    }
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
              images?.add(File(pickedFile.path));
            });
          }
        });
      } else {
        picker.pickMultiImage(limit: imageLimt, imageQuality: 60).then((
          pickedFiles,
        ) {
          if (pickedFiles.isNotEmpty) {
            setState(() {
              images?.addAll(pickedFiles.map((e) => File(e.path)).toList());
            });
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookingDetailsScrollableController.addListener(() {
        if (bookingDetailsScrollableController.isAttached) {
          print(
            "booking details scroll size: ${bookingDetailsScrollableController.size}",
          );
          if (!showBookingDetails) {
            bookingDetailsScrollableController.jumpTo(0);
          }
          if (bookingDetailsScrollableController.size <= 0.25) {
            setState(() {
              showBookingDetails = false;
            });
          }
        }
      });
      bookingScheduleScrollableController.addListener(() {
        if (bookingScheduleScrollableController.isAttached) {
          if (!showBookingSchedule) {
            bookingScheduleScrollableController.jumpTo(0);
          }
          if (bookingScheduleScrollableController.size <= 0.35) {
            setState(() {
              showBookingSchedule = false;
            });
          }
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    serviceDetailsModel = ServiceDetailsModel(
      Accept_Language: Helper.getCountryCode(context),

      service_id: widget.serviceEntity?.id,
    );
    storeBookingModel = StoreBookingModel(
      acceptLanguage: Helper.getCountryCode(context),

      serviceId: widget.serviceEntity?.provider_service?["id"],
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
  dispose() {
    bookingDetailsScrollableController.dispose();
    bookingScheduleScrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      title: widget.serviceEntity?.name ?? "",
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<StoreBookingBloc>(
              create: (storeBookingContext) =>
                  getItInstance<StoreBookingBloc>()
                    ..add(StoreBookingEvent.started()),
            ),
            BlocProvider<TimeSlotsBloc>(
              create: (context) =>
                  getItInstance<TimeSlotsBloc>()..add(TimeSlotsEvent.started()),
            ),
          ],
          child: BlocListener<StoreBookingBloc, StoreBookingState>(
            listener: (context, state) {
              state.when(
                initial: () {
                  gettingTimeSlotsHasError = false;
                  gettingTimeSlots = false;
                },
                loading: () {
                  showMessage(
                    message: LocaleKeys.serviceDetailsPage_uploading.tr(),
                    context: context,
                  );
                  gettingTimeSlots = true;
                  gettingTimeSlotsHasError = false;
                },
                success: () {
                  showMessage(
                    message: LocaleKeys.common_success.tr(),
                    context: context,
                  );

                  setState(() {
                    selectedDate = null;
                    selectedSlot = null;
                    images = [];
                    nots = null;
                    selectedSlot = null;
                    scheduledAt = null;
                    showBookingDetails = false;
                    showBookingSchedule = false;
                  });
                  gettingTimeSlotsHasError = false;
                  gettingTimeSlots = false;
                  context.read<TimeSlotsBloc>().add(TimeSlotsEvent.started());
                },
                error: (e) {
                  showMessage(
                    message: LocaleKeys.common_error.tr(),
                    context: context,
                  );
                  gettingTimeSlotsHasError = true;
                  gettingTimeSlots = false;
                },
                sessionExpired: () async {
                  LoginStateEntity? loginStateEntity =
                      getItInstance<AppPreferences>().getUserInfo();
                  await getItInstance<AppPreferences>().setUserInfo(
                    loginStateEntity: loginStateEntity?.copyWith(
                      loginStateEnum: LoginStateEnum.unlogined,
                    ),
                  );
                  gettingTimeSlotsHasError = true;
                  gettingTimeSlots = false;
                },
                noInternet: () {
                  showMessage(
                    message: LocaleKeys.common_noInternetPullDown.tr(),
                    context: context,
                  );
                  gettingTimeSlotsHasError = true;
                  gettingTimeSlots = false;
                },
              );
            },
            child: Stack(
              children: [
                ListView(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.serviceEntity?.name ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            fontFamily:
                                                FontConstants.fontFamily(
                                                  context.locale,
                                                ),
                                          ),
                                    ),
                                  ],
                                ),
                              )
                              .asGlass(
                                tintColor: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                                clipBorderRadius: BorderRadius.circular(12.r),
                                blurX: 30,
                                blurY: 30,
                                border: Theme.of(context).defaultBorderSide,
                              )
                              .animate()
                              .scaleXY(
                                duration: 600.ms,
                                curve: Curves.easeInOut,
                                delay: 300.ms,
                              ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child:
                          Text(
                            LocaleKeys.serviceDetailsPage_availableProviders
                                .tr(),
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                ),
                          ).animate().scaleXY(
                            duration: 600.ms,
                            delay: 300.ms,
                            curve: Curves.easeInOut,
                          ),
                    ),

                    BlocProvider<ServiceDetailsBloc>(
                      create: (context) =>
                          getItInstance<ServiceDetailsBloc>()..add(
                            ServiceDetailsEvent.getServiceDetails(
                              serviceDetailsModel: serviceDetailsModel,
                            ),
                          ),

                      child: BlocListener<TimeSlotsBloc, TimeSlotsState>(
                        listener: (context, state) {
                          print("time slots state: //");
                          state.when(
                            initial: () {
                              timeSlots = [];
                            },
                            loading: () {
                              timeSlots = [];
                            },
                            loaded: (data) {
                              setState(() {
                                timeSlots = data;
                                if (selectedDate != null &&
                                    (selectedDate?.trim().isNotEmpty ??
                                        false)) {
                                  selectedTimeSlots = timeSlots?.firstWhere(
                                    (element) => element?.date == selectedDate,
                                    orElse: () => null,
                                  );
                                }
                              });
                              print("selected date: , selected time slots: ");
                            },
                            error: (e) {
                              showMessage(
                                message: LocaleKeys.common_error.tr(),
                                context: context,
                              );

                              timeSlots = [];
                            },
                            sessionExpired: () async {
                              LoginStateEntity? loginStateEntity =
                                  getItInstance<AppPreferences>().getUserInfo();
                              await getItInstance<AppPreferences>().setUserInfo(
                                loginStateEntity: loginStateEntity?.copyWith(
                                  loginStateEnum: LoginStateEnum.unlogined,
                                ),
                              );

                              timeSlots = [];
                            },
                            noInternet: () {
                              showMessage(
                                message: LocaleKeys.common_noInternetPullDown
                                    .tr(),
                                context: context,
                              );

                              timeSlots = [];
                            },
                            noData: () {
                              timeSlots = [];
                            },
                          );
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
                                                            overflow:
                                                                TextOverflow
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
                                                                  color: Theme.of(context)
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
                                                                      start:
                                                                          4.w,
                                                                    ),
                                                                child: Text(
                                                                  "${Helper.formatPrice(serviceDetailsEntity?[index]?.provider_service?["price"])} ${LocaleKeys.myServicesPage_iqd.tr()}/${LocaleKeys.serviceDetailsPage_service.tr()}",

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
                                                                            end:
                                                                                8.w,
                                                                          ),
                                                                      child:
                                                                          Container(
                                                                            padding: EdgeInsets.symmetric(
                                                                              horizontal: 8.w,
                                                                              vertical: 4.h,
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
                                                        print(
                                                          "book now pressed for service id: ${serviceDetailsEntity?[index]?.provider_service?["id"]}",
                                                        );
                                                        setState(() {
                                                          showBookingDetails =
                                                              true;
                                                          showBookingSchedule =
                                                              false;

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
                                                          context
                                                              .read<
                                                                TimeSlotsBloc
                                                              >()
                                                              .add(
                                                                TimeSlotsEvent.getTimeSlots(
                                                                  timeSlotsModel:
                                                                      timeSlotsModel,
                                                                ),
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
                                ).animate().scaleXY(
                                  duration: 600.ms,
                                  curve: Curves.easeInOut,
                                );
                              },
                              noData: () => Center(child: NodataStateWidget()),
                              error: (error) =>
                                  Center(child: ErrorStateWidget()),
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

                Visibility(
                  visible: showBookingDetails,
                  child: DraggableScrollableSheet(
                    controller: bookingDetailsScrollableController,

                    builder: (context, scrollController) {
                      return Container(
                        height: 600.h,
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 16.w,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 1.r,

                              offset: Offset(0, -2.h),
                            ),
                          ],
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.r),
                          ),
                        ),
                        child: ListView(
                          controller: scrollController,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Center(
                              child:
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
                                            ).textTheme.labelLarge?.color
                                          : Theme.of(
                                              context,
                                            ).textTheme.labelLarge?.color,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ).animate().scaleXY(
                                    duration: 900.ms,

                                    curve: Curves.easeInOut,
                                  ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child:
                                  CustomInputField(
                                    width: double.maxFinite,
                                    label: LocaleKeys
                                        .serviceDetailsPage_describeYourIssue
                                        .tr(),
                                    maxLines: 5,
                                    isRequired: false,
                                    initialValue: nots,
                                    hintText: LocaleKeys
                                        .serviceDetailsPage_pleaseDescribeYourIssueInDetail
                                        .tr(),
                                    onChanged: (value) =>
                                        storeBookingModel = nots = value,
                                  ).animate().scaleXY(
                                    duration: 900.ms,

                                    curve: Curves.easeInOut,
                                  ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: Text(
                                LocaleKeys.serviceDetailsPage_addAttachments
                                    .tr(),
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                            ).animate().scaleXY(
                              duration: 900.ms,

                              curve: Curves.easeInOut,
                            ),
                            Center(
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  if (images?.isEmpty ?? true) {
                                    return SizedBox(
                                      height: 100.h,
                                      width: 100.w,
                                      child: ElevatedButton(
                                        style: Theme.of(context)
                                            .elevatedButtonTheme
                                            .style
                                            ?.copyWith(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
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
                                    ).animate().scaleXY(
                                      duration: 900.ms,
                                      curve: Curves.easeInOut,
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
                                            itemCount: images?.length ?? 0,
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

                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12.r,
                                                            ),
                                                        border:
                                                            Border.fromBorderSide(
                                                              Theme.of(
                                                                context,
                                                              ).defaultBorderSide,
                                                            ),
                                                      ),
                                                      child:
                                                          images?[index] != null
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12.r,
                                                                  ),
                                                              child: Image.file(
                                                                images?[index] ??
                                                                    File(""),
                                                                width: 150.w,
                                                                height: 100.h,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            )
                                                          : Icon(
                                                              Icons
                                                                  .broken_image,
                                                              size: 100.sp,
                                                            ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: -10.h,
                                                    right: -10,
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
                                                                  EdgeInsets.all(
                                                                    4.r,
                                                                  ),
                                                                ),
                                                            minimumSize:
                                                                WidgetStatePropertyAll(
                                                                  Size(
                                                                    24.w,
                                                                    24.h,
                                                                  ),
                                                                ),
                                                            backgroundColor:
                                                                WidgetStatePropertyAll(
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .errorContainer,
                                                                ),
                                                          ),
                                                      onPressed: () {
                                                        print(
                                                          "im index ${index}",
                                                        );
                                                        setState(() {
                                                          images?.removeAt(
                                                            index,
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
                                                      shape:
                                                          WidgetStatePropertyAll(
                                                            CircleBorder(),
                                                          ),
                                                    ),
                                                onPressed: () async {
                                                  await pickImages();
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  size: 24.sp,
                                                  color: ColorManager
                                                      .darkTextColor,
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: Theme.of(context)
                                                    .elevatedButtonTheme
                                                    .style
                                                    ?.copyWith(
                                                      shape:
                                                          WidgetStatePropertyAll(
                                                            CircleBorder(),
                                                          ),
                                                    ),
                                                onPressed: () {
                                                  setState(() {
                                                    images = [];
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.delete_forever,
                                                  size: 24.sp,
                                                  color: ColorManager
                                                      .darkTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animate().scaleXY(
                                    duration: 900.ms,
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: SizedBox(
                                width: double.maxFinite,
                                child:
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          showBookingDetails = false;
                                          showBookingSchedule = true;
                                        });
                                      },
                                      child: Text(
                                        LocaleKeys.serviceDetailsPage_next.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontFamily:
                                                  FontConstants.fontFamily(
                                                    context.locale,
                                                  ),
                                              color: ColorManager.darkTextColor,
                                            ),
                                      ),
                                    ).animate().scaleXY(
                                      duration: 900.ms,
                                      curve: Curves.easeInOut,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ).animate().slideY(
                        begin: 1.0,
                        end: 0.0,
                        duration: 600.ms,
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),

                Visibility(
                  visible: showBookingSchedule,
                  child: DraggableScrollableSheet(
                    controller: bookingScheduleScrollableController,
                    builder: (context, scrollController) {
                      return Container(
                        height: 600.h,
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 16.w,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 1.r,

                              offset: Offset(0, -2.h),
                            ),
                          ],
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.r),
                          ),
                        ),
                        child: ListView(
                          controller: scrollController,
                          shrinkWrap: true,
                          children: [
                            Center(
                              child:
                                  Container(
                                    width: 60.w,
                                    height: 6.h,
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).textTheme.labelLarge?.color,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ).animate().scaleXY(
                                    duration: 900.ms,
                                    curve: Curves.easeInOut,
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
                            ).animate().scaleXY(
                              duration: 900.ms,
                              curve: Curves.easeInOut,
                            ),
                            SizedBox(
                              height: 80.h,
                              width: double.maxFinite,
                              child: Builder(
                                builder: (context) {
                                  return SevenDaysCalender(
                                    selectedDate: selectedDate,
                                    startDate: DateFormat(
                                      "yyyy-MM-dd",
                                    ).parse(DateTime.now().toString()),
                                    onDateSelected: (date) {
                                      setState(() {
                                        selectedDate = date;
                                        selectedTimeSlots = timeSlots
                                            ?.firstWhere(
                                              (element) =>
                                                  element?.date == selectedDate,
                                              orElse: () => null,
                                            );
                                        if (gettingTimeSlotsHasError) {
                                          if (gettingTimeSlots == false) {
                                            context.read<TimeSlotsBloc>().add(
                                              TimeSlotsEvent.getTimeSlots(
                                                timeSlotsModel: timeSlotsModel,
                                              ),
                                            );
                                          }
                                        }
                                      });
                                    },
                                  );
                                },
                              ),
                            ).animate().scaleXY(
                              duration: 900.ms,
                              curve: Curves.easeInOut,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Text(
                                LocaleKeys.serviceDetailsPage_availableTimes
                                    .tr(),
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                            ).animate().scaleXY(
                              duration: 900.ms,
                              curve: Curves.easeInOut,
                            ),
                            AnimatedSwitcher(
                              duration: 300.ms,
                              child: Padding(
                                key: ValueKey(selectedDate),
                                padding: EdgeInsets.only(top: 0.h),
                                child:
                                    (selectedTimeSlots?.slots?.isEmpty ?? true)
                                    ? Text(
                                        LocaleKeys.common_noThingToShow.tr(),
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
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
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
                                              onPressed:
                                                  slot?.is_available == true
                                                  ? () {
                                                      setState(() {
                                                        selectedSlot = slot;
                                                        scheduledAt =
                                                            " ${slot?.start_time}";
                                                      });
                                                    }
                                                  : null,
                                              child: Text(
                                                slot?.start_time ?? "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontFamily:
                                                          FontConstants.fontFamily(
                                                            context.locale,
                                                          ),
                                                      color: isSelected
                                                          ? ColorManager
                                                                .darkTextColor
                                                          : Theme.of(context)
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
                            ).animate().scaleXY(
                              duration: 900.ms,
                              curve: Curves.easeInOut,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child:
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Builder(
                                      builder: (context) {
                                        return ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              showBookingDetails = false;
                                              showBookingSchedule = false;
                                            });
                                            print(
                                              "Selected Date: $selectedDate",
                                            );
                                            scheduledAt =
                                                "${selectedDate ?? ""} $scheduledAt";
                                            storeBookingModel =
                                                storeBookingModel.copyWith(
                                                  notes: nots,
                                                  attachments: images,
                                                  scheduledAt: scheduledAt,
                                                );
                                            context.read<StoreBookingBloc>().add(
                                              StoreBookingEvent.storeBooking(
                                                storeBookingModel:
                                                    storeBookingModel,
                                              ),
                                            );
                                          },
                                          child: Text(
                                            LocaleKeys
                                                .serviceDetailsPage_ConfirmBooking
                                                .tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                  fontFamily:
                                                      FontConstants.fontFamily(
                                                        context.locale,
                                                      ),
                                                  color: ColorManager
                                                      .darkTextColor,
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  ).animate().scaleXY(
                                    duration: 900.ms,
                                    curve: Curves.easeInOut,
                                  ),
                            ),
                          ],
                        ),
                      ).animate().slideY(
                        begin: 1.0,
                        end: 0.0,
                        duration: 600.ms,
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
