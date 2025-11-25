import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:hosta_user/config/theme/app_theme.dart';
import 'package:hosta_user/core/constants/api_constant.dart';
import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/core/resource/common_entity/service_entity.dart';
import 'package:hosta_user/core/resource/common_state_widget/error_state_widget.dart';
import 'package:hosta_user/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:hosta_user/core/resource/common_state_widget/no_internet_state_widget.dart';
import 'package:hosta_user/core/resource/image_widget.dart';
import 'package:hosta_user/core/resource/main_page/main_page.dart';
import 'package:hosta_user/core/util/helper/helper.dart';
import 'package:hosta_user/features/service_details/presentation/bloc/service_details_bloc.dart';

import '../../../../config/route/routes_manager.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/models/service_details_model.dart';

class ServiceDetailsPage extends StatefulWidget {
  final ServiceEntity? serviceEntity;
  const ServiceDetailsPage({super.key, this.serviceEntity});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  ServiceDetailsModel serviceDetailsModel = ServiceDetailsModel();
  @override
  void didChangeDependencies() {
    serviceDetailsModel = ServiceDetailsModel(
      Accept_Language: Helper.getCountryCode(context),

      service_id: widget.serviceEntity?.id,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      title: widget.serviceEntity?.name ?? "",
      body: ListView(
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
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: FontConstants.fontFamily(context.locale),
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
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Text(
              LocaleKeys.serviceDetailsPage_availableProviders.tr(),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontFamily: FontConstants.fontFamily(context.locale),
              ),
            ),
          ),
          BlocProvider<ServiceDetailsBloc>(
            create: (context) => getItInstance<ServiceDetailsBloc>()
              ..add(
                ServiceDetailsEvent.getServiceDetails(
                  serviceDetailsModel: serviceDetailsModel,
                ),
              ),
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
                          child: ElevatedButton(
                            onPressed: () =>
                                context.pushNamed(RoutesName.providerPage),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child:
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12.h,
                                    horizontal: 12.w,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 40.r,
                                        child: ImageWidget(
                                          width: 60.w,
                                          height: 60.h,
                                          imageUrl:
                                              "${ApiConstant.imageBaseUrl}${serviceDetailsEntity?[index]?.provider?["avatar"]}",
                                          boxFit: BoxFit.cover,
                                          errorIconSize: 60.sp,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: 20.w,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                          context.locale,
                                                        ),
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 4.h,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_pin,
                                                    size: 22.sp,
                                                    color: Theme.of(context)
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
                                                      serviceDetailsEntity?[index]
                                                              ?.provider?["address"]["address"] ??
                                                          "",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall
                                                          ?.copyWith(
                                                            fontFamily:
                                                                FontConstants.fontFamily(
                                                                  context
                                                                      .locale,
                                                                ),
                                                          ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.monetization_on,
                                                  size: 22.sp,
                                                  color: Theme.of(
                                                    context,
                                                  ).textTheme.labelLarge?.color,
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
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ).asGlass(
                                  tintColor: Theme.of(
                                    context,
                                  ).scaffoldBackgroundColor,
                                  clipBorderRadius: BorderRadius.circular(12.r),
                                  blurX: 30,
                                  blurY: 30,
                                  border: Theme.of(context).defaultBorderSide,
                                ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    );
                  },
                  noData: () => Center(child: NodataStateWidget()),
                  error: (error) => Center(child: ErrorStateWidget()),
                  unauthenticated: (error) => Center(child: ErrorStateWidget()),
                  noInternet: () => Center(child: NoInternetStateWidget()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
