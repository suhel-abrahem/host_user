import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/app/app_preferences.dart';
import '../../../../config/route/routes_manager.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../core/dependencies_injection.dart';
import '../../../../core/resource/common_entity/service_error_entity.dart';
import '../../../../core/resource/common_state_widget/no_data_state_widget.dart';
import '../../../../core/resource/common_state_widget/no_internet_state_widget.dart';

import '../../../../core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import '../../../../core/resource/image_widget.dart';
import '../../../../core/resource/main_page/main_page.dart';
import '../../../../core/util/helper/helper.dart';
import '../../../categories_page/domain/entities/category_entity.dart';
import '../../../login_page/domain/entities/login_state_entity.dart';
import '../../data/models/get_service_model.dart';

import '../../data/models/set_service_model.dart';
import '../bloc/set_service_bloc.dart';

import '../../../../generated/locale_keys.g.dart';

import '../../../../core/constants/font_constants.dart';
import '../../../../core/resource/common_entity/service_entity.dart';
import '../../../../core/resource/common_state_widget/error_state_widget.dart';
import '../bloc/category_services_bloc.dart';

class CategoryServicesPagePage extends StatefulWidget {
  final CategoryEntity? categoryEntity;
  const CategoryServicesPagePage({super.key, this.categoryEntity});

  @override
  State<CategoryServicesPagePage> createState() =>
      _CategoryServicesPagePageState();
}

class _CategoryServicesPagePageState extends State<CategoryServicesPagePage> {
  GetServiceModel? getServiceModel = GetServiceModel();
  SetServiceModel? setServiceModel = SetServiceModel();
  ServiceErrorEntity? serviceErrorEntity = ServiceErrorEntity();
  GlobalKey<FormFieldState> setServiceFormKey = GlobalKey();
  bool isAddButtonLoading = false;
  bool isAddServiceHaveError = false;
  @override
  void didChangeDependencies() {
    getServiceModel = getServiceModel?.copyWith(
      category_id: widget.categoryEntity?.id,
      acceptLanguage: Helper.getCountryCode(context),
    );

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CategoryServicesPagePage oldWidget) {
    getServiceModel = getServiceModel?.copyWith(
      category_id: widget.categoryEntity?.id,
      acceptLanguage: Helper.getCountryCode(context),
    );
    print(
      "didUpdateWidget CategoryServicesPagePage:${Helper.getCountryCode(context)}",
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryServicesBloc>(
          create: (blocContext) =>
              getItInstance<CategoryServicesBloc>()
                ..add(CategoryServicesEvent.get(getServiceModel)),
        ),
        BlocProvider(
          create: (context) =>
              getItInstance<SetServiceBloc>()..add(SetServiceEvent.started()),
        ),
      ],
      child: BlocListener<SetServiceBloc, SetServiceState>(
        listener: (context, state) {
          if (state is SetServiceStateAdded) {
            showMessage(
              message: LocaleKeys.common_success.tr(),
              context: context,
            );
            setServiceModel = SetServiceModel();
            if (context.canPop()) {
              context.pop();
            }
          } else if (state is SetServiceStateSetServiceStateAlreadyExist) {
            showMessage(
              message: LocaleKeys.categoryServices_serviceIsAlreadyAdded.tr(),
              context: context,
            );
          } else if (state is SetServiceStateSetError) {
            showMessage(
              message: LocaleKeys.common_error.tr(),
              context: context,
            );
          } else if (state is SetServiceStateUnAuthorized) {
            getItInstance<AppPreferences>().setUserInfo(
              loginStateEntity: LoginStateEntity(),
            );
          }
        },
        child: MainPage(
          title: LocaleKeys.categoryServices_title.tr(),
          body: Column(
            children: [
              Container(
                height: 110.h,
                decoration: BoxDecoration(),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CachedNetworkImage(
                        cacheKey:
                            widget.categoryEntity?.category_id.toString() ?? "",
                        width: 50.w,
                        height: 50.h,
                        progressIndicatorBuilder: (context, url, progress) =>
                            CircularProgressIndicator(),
                        imageUrl: widget.categoryEntity?.icon ?? "",
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          size: 32.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.categoryEntity?.name ?? "",
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${widget.categoryEntity?.services_count} ${LocaleKeys.categoriesPage_services.tr()}",
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  fontSize: 14.sp,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).asGlass(
                frosted: true,
                blurX: 38,
                blurY: 38,
                tintColor: Theme.of(context).colorScheme.primary,

                border: Theme.of(context).defaultBorderSide,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  child: BlocBuilder<CategoryServicesBloc, CategoryServicesState>(
                    builder: (context, state) {
                      return state.when(
                        added: (data) => SizedBox(),
                        initial: () => SizedBox(),
                        noInternet: () => NoInternetStateWidget(
                          lottieHeight: 200.h,
                          lottieWidth: 200.w,
                        ),
                        loading: () =>
                            Center(child: CircularProgressIndicator()),

                        got: (data) => (data == null || data.isEmpty)
                            ? NodataStateWidget(
                                lottieHeight: 200.h,
                                lottieWidth: 200.w,
                              )
                            : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200.w,
                                      mainAxisSpacing: 12.h,
                                      crossAxisSpacing: 12.w,
                                      mainAxisExtent: 250.h,
                                    ),
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (context, index) => ElevatedButton(
                                  onPressed: () {
                                    context.pushNamed(
                                      RoutesName.serviceDetailsPage,
                                      pathParameters: {
                                        "serviceEntity": jsonEncode(
                                          data[index]?.toJson(),
                                        ),
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  child: Center(
                                    child:
                                        Container(
                                          padding: EdgeInsets.zero,
                                          height: 250.h,
                                          width: 200.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12.r,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 200.w,
                                                height: 150.h,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadiusGeometry.vertical(
                                                        top: Radius.circular(
                                                          12.r,
                                                        ),
                                                      ),
                                                  child: ImageWidget(
                                                    boxFit: BoxFit.cover,
                                                    imageUrl:
                                                        data?[index]?.image ??
                                                        "",
                                                    width: 200.w,
                                                    height: 150.h,
                                                    errorWidget: SizedBox(
                                                      width: 200.w,
                                                      height: 150.h,
                                                      child: FittedBox(
                                                        fit: BoxFit.cover,
                                                        child: Icon(
                                                          Icons.broken_image,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelLarge
                                                                  ?.color,
                                                        ),
                                                      ),
                                                    ),
                                                    errorIconSize: 180.w,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 8.h,
                                                  horizontal: 8.w,
                                                ),
                                                child: SizedBox(
                                                  width: 160.w,
                                                  height: 82.h,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        data[index]?.name ?? "",
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
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).asGlass(
                                          frosted: true,
                                          blurX: 30,
                                          blurY: 30,
                                          tintColor: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer
                                              .withValues(alpha: 0.9),
                                          clipBorderRadius:
                                              BorderRadius.circular(12.r),
                                          border: Theme.of(
                                            context,
                                          ).defaultBorderSide,
                                        ),
                                  ),
                                ),
                              ),
                        unAuthorized: () => ErrorStateWidget(
                          lottieHeight: 200.h,
                          lottieWidth: 200.w,
                        ),
                        getError: (ServiceEntity? serviceEntity) =>
                            ErrorStateWidget(
                              lottieHeight: 200.h,
                              lottieWidth: 200.w,
                            ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
