import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/route/routes_manager.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/font_constants.dart';
import '../../../../core/constants/language_constant.dart';

import '../../../../core/resource/common_state_widget/error_state_widget.dart';
import '../../../../core/resource/common_state_widget/no_data_state_widget.dart';
import '../../../../core/resource/common_state_widget/no_internet_state_widget.dart';
import '../../../../core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';

import '../../../../core/resource/main_page/main_page.dart';
import '../../../../core/util/helper/helper.dart';
import '../../../categories_page/data/models/get_category_model.dart';
import '../../../categories_page/presentation/bloc/categories_page_bloc.dart';
import '../../../categories_page/presentation/widgets/category_container.dart';
import '../../domain/entities/home_page_entity.dart';

import '../../../login_page/domain/entities/login_state_entity.dart';
import '../../../profile_page/data/models/profile_model.dart';
import '../../../profile_page/domain/entities/profile_entity.dart';
import '../../../profile_page/presentation/bloc/get_profile_bloc.dart';
import '../../../../generated/locale_keys.g.dart';

import '../../../../config/app/app_preferences.dart';
import '../../../../core/dependencies_injection.dart';

import '../../../../core/resource/image_widget.dart';
import '../../data/models/home_page_model.dart';

class HomePagePage extends StatefulWidget {
  const HomePagePage({super.key});

  @override
  State<HomePagePage> createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  HomePageModel? model = HomePageModel();
  HomePageEntity? homePageEntity = HomePageEntity();
  List<FlSpot> totalBookingsSpots = [];
  List<FlSpot> totalRevenueSpots = [];
  bool isTotalRevenue = false;
  ProfileModel profileModel = ProfileModel();
  ProfileEntity? profileEntity = ProfileEntity();
  bool isProfileDataLoading = true;
  GetCategoryModel? getCategoryModel = GetCategoryModel();

  @override
  void didChangeDependencies() {
    model = model?.copyWith(acceptLanguage: Helper.getCountryCode(context));
    profileModel = profileModel.copyWith(
      acceptLanguage: Helper.getCountryCode(context),
    );
    getCategoryModel = getCategoryModel?.copyWith(
      acceptLanguage: Helper.getCountryCode(context),
      page: "1",
      per_page: "6",
    );
    print(
      "Home Page didChangeDependencies:acceptLanguage:${getCategoryModel?.acceptLanguage},page:${getCategoryModel?.page},per_page:${getCategoryModel?.per_page} ",
    );
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomePagePage oldWidget) {
    model = model?.copyWith(acceptLanguage: Helper.getCountryCode(context));
    profileModel = profileModel.copyWith(
      acceptLanguage: Helper.getCountryCode(context),
    );
    getCategoryModel = getCategoryModel?.copyWith(
      acceptLanguage: Helper.getCountryCode(context),
      page: "1",
      per_page: "6",
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                size: 24.sp,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 8.w),
              child: SizedBox(
                width: 36.w,
                height: 36.h,
                child: Center(
                  child: Builder(
                    builder: (builderContext) {
                      return ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style
                            ?.copyWith(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.transparent,
                              ),
                              shape: WidgetStatePropertyAll(
                                CircleBorder(eccentricity: 0),
                              ),
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.all(0),
                              ),
                              shadowColor: WidgetStatePropertyAll(
                                Colors.transparent,
                              ),
                            ),
                        onPressed: () {
                          Scaffold.of(builderContext).openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          size: 28.sp,
                          color: Theme.of(context).textTheme.labelLarge?.color,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          leadingWidth: 210.w,

          leading: SizedBox(
            height: 60.h,
            child: BlocProvider<GetProfileBloc>(
              create: (context) => getItInstance<GetProfileBloc>()
                ..add(GetProfileEvent.getProfile(profileModel: profileModel)),
              child: BlocListener<GetProfileBloc, GetProfileState>(
                listener: (context, state) {
                  if (state is GetProfileStateLoading) {
                    setState(() {
                      isProfileDataLoading = true;
                    });
                  } else if (state is GetProfileStateError) {
                    showMessage(
                      context: context,
                      message: LocaleKeys.common_error.tr(),
                    );
                    setState(() {
                      isProfileDataLoading = false;
                    });
                  } else if (state is GetProfileStateNoInternet) {
                    showMessage(
                      context: context,
                      message: LocaleKeys.common_noInternetPullDown.tr(),
                    );
                    setState(() {
                      isProfileDataLoading = false;
                    });
                  } else if (state is GetProfileStateUnauthorized) {
                    getItInstance<AppPreferences>().setUserInfo(
                      loginStateEntity: LoginStateEntity(),
                    );
                    setState(() {
                      isProfileDataLoading = false;
                    });
                    context.pushNamed(RoutesName.loginPage);
                  } else if (state is GetProfileStateLoaded) {
                    setState(() {
                      profileEntity = state.profileEntity;
                      isProfileDataLoading = false;
                    });
                  }
                },
                child: SizedBox(
                  height: 70.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isProfileDataLoading
                          ? Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 8.h),
                              width: 50.w,

                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ImageWidget(
                                boxFit: BoxFit.cover,
                                errorWidget: Icon(
                                  Icons.account_circle,
                                  size: 40.sp,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.labelLarge?.color,
                                ),
                                imageUrl: profileEntity?.avatar ?? "",
                              ),
                            ),
                      SizedBox(
                        width: 130.w,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: SizedBox(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: isProfileDataLoading
                                      ? SizedBox(
                                          width: 70.w,
                                          height: 10.h,
                                          child: LinearProgressIndicator(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withValues(alpha: 0.1),
                                          ),
                                        )
                                      : Text(
                                          profileEntity?.name ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                fontFamily:
                                                    FontConstants.fontFamily(
                                                      context.locale,
                                                    ),
                                              ),
                                          textAlign: TextAlign.start,
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                              width: 130.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width:
                                          context.locale ==
                                              LanguageConstant.arLoacle
                                          ? 30.w
                                          : 70.w,
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            LocaleKeys.homePage_myRating,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
                                                ?.copyWith(
                                                  fontFamily:
                                                      FontConstants.fontFamily(
                                                        context.locale,
                                                      ),
                                                ),
                                            textAlign: TextAlign.center,
                                          ).tr(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                      start: 8.w,
                                    ),
                                    width: 50.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: AlignmentGeometry.center,
                                          child: SizedBox(
                                            width: 20.w,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                "4.5",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontFamily:
                                                          FontConstants.fontFamily(
                                                            context.locale,
                                                          ),
                                                      color: Theme.of(
                                                        context,
                                                      ).colorScheme.onSurface,
                                                    ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12.sp,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ).animate().slideX(duration: 500.ms),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: Theme.of(context).elevatedButtonTheme.style
                        ?.copyWith(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                          padding: WidgetStatePropertyAll(EdgeInsets.zero),
                          shadowColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                        ),
                    child:
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                            horizontal: 8.w,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.pin_drop,
                              size: 24.sp,
                              color: Theme.of(
                                context,
                              ).textTheme.labelLarge?.color,
                            ),
                          ),
                        ).asGlass(
                          tintColor: Theme.of(context).primaryColor,
                          clipBorderRadius: BorderRadius.circular(12.r),
                          blurX: 30,
                          blurY: 30,
                          frosted: true,
                          border: Theme.of(context).defaultBorderSide,
                        ),
                  ),
                ),
                SizedBox(
                  child:
                      SearchBar(
                        constraints: BoxConstraints(
                          maxHeight: 40.h,
                          maxWidth: 280.w,
                          minHeight: 40.h,
                          minWidth: 250.w,
                        ),
                        elevation: WidgetStatePropertyAll(1),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                        shadowColor: WidgetStatePropertyAll(Colors.transparent),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        leading: Padding(
                          padding: EdgeInsetsDirectional.only(end: 8.w),
                          child: Icon(
                            Icons.search,
                            size: 20.sp,
                            color: Theme.of(
                              context,
                            ).textTheme.labelLarge?.color,
                          ),
                        ),
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                        ),
                      ).asGlass(
                        tintColor: Theme.of(context).primaryColor,
                        clipBorderRadius: BorderRadius.circular(12.r),
                        blurX: 30,
                        blurY: 30,
                        frosted: true,
                        border: Theme.of(context).defaultBorderSide,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 0.h,
              horizontal: 12.w,
            ),
            child:
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.homePage_categories.tr(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: FontConstants.fontFamily(context.locale),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(RoutesName.categoriesPage);
                        },
                        child: Text(
                          LocaleKeys.homePage_showAll.tr(),
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ).asGlass(
                  tintColor: Theme.of(context).primaryColor,
                  clipBorderRadius: BorderRadius.circular(12.r),
                  blurX: 30,
                  blurY: 30,
                  frosted: true,
                ),
          ),
          BlocProvider<CategoriesPageBloc>(
            create: (context) =>
                getItInstance<CategoriesPageBloc>()
                  ..add(CategoriesPageEvent.get(getCategoryModel)),
            child: BlocListener<CategoriesPageBloc, CategoriesPageState>(
              listener: (context, state) {
                if (state is CategoriesPageStateUnAuthorized) {
                  getItInstance<AppPreferences>().setUserInfo(
                    loginStateEntity: LoginStateEntity(),
                  );
                }
              },
              child: BlocBuilder<CategoriesPageBloc, CategoriesPageState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => SizedBox(),
                    error: () => Expanded(
                      child: ErrorStateWidget(
                        lottieHeight: 200.h,
                        lottieWidth: 200.w,
                      ),
                    ),
                    noInternet: () => Expanded(
                      child: NoInternetStateWidget(
                        lottieHeight: 200.h,
                        lottieWidth: 200.w,
                      ),
                    ),
                    unAuthorized: () => Expanded(
                      child: ErrorStateWidget(
                        lottieHeight: 200.h,
                        lottieWidth: 200.w,
                      ),
                    ),
                    loading: () => Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    got: (data) => (data == null || data.isEmpty)
                        ? NodataStateWidget(
                            lottieHeight: 200.h,
                            lottieWidth: 200.w,
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 12.h,
                            ),
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 570.h,
                              child: GridView.builder(
                                itemCount: data.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12.w,
                                      mainAxisSpacing: 12.h,
                                      mainAxisExtent: 180.h,
                                    ),
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CategoryContainer(
                                    categoryEntity: data[index],
                                  );
                                },
                              ),
                            ),
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
