import 'dart:io';
import 'package:socket_io_client/socket_io_client.dart' as IO;
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

import '../../../../core/data_state/data_state.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/common_service/common_service.dart';
import '../../../../core/resource/common_state_widget/error_state_widget.dart';
import '../../../../core/resource/common_state_widget/no_data_state_widget.dart';
import '../../../../core/resource/common_state_widget/no_internet_state_widget.dart';
import '../../../../core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';

import '../../../../core/resource/main_page/main_page.dart';
import '../../../../core/resource/rst_stream/rst_stream.dart';
import '../../../../core/util/helper/helper.dart';
import '../../../categories_page/data/models/get_category_model.dart';
import '../../../categories_page/presentation/bloc/categories_page_bloc.dart';
import '../../../categories_page/presentation/widgets/category_container.dart';
import '../../../refresh_token/data/models/refresh_token_model.dart';
import '../../../refresh_token/domain/usecases/refresh_token_usecase.dart';
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
import '../widgets/notification_number_widget.dart';

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
  bool isAnimationCompleted = false;
  int currentImage = 0;
  int notificationCount = 0;
  PageController imageController = PageController(initialPage: 0);
  Future<int> getUnreadCount() async {
    try {
      LoginStateEntity? loginState = await getItInstance<AppPreferences>()
          .getUserInfo();
      int count = 0;
      await getItInstance<RefreshTokenUsecase>()
          .call(
            params: RefreshTokenModel(
              token: loginState?.access_token ?? "",
              refresh_token: loginState?.refresh_token ?? "",
            ),
          )
          .then((refreshTokenOnValue) async {
            if (refreshTokenOnValue is DataSuccess) {
              CommonService commonService = CommonService(
                headers: {
                  "Authorization":
                      "Bearer ${refreshTokenOnValue?.data?.access_token}",
                },
              );
              await commonService.get('/notifications/unread-count').then((
                onValue,
              ) {
                if (onValue is DataSuccess) {
                  count = onValue.data?.data?['unread_count'] ?? 0;

                  return count;
                } else {
                  count = 0;
                  return count;
                }
              });
            } else if (refreshTokenOnValue is UnauthenticatedDataState) {
              getItInstance<AppPreferences>().setUserInfo(
                loginStateEntity: LoginStateEntity(),
              );
            } else {
              count = 0;
              return count;
            }
          });

      return count;
    } catch (e) {
      print("❌ Error fetching unread count: $e");
      return 0;
    }
  }

  IO.Socket? socket;
  void connectAndListen() {
    socket = IO.io(
      'https://hosta-api.lenda-agency.com',
      IO.OptionBuilder()
          .setPath('/socket.io/')
          .setTransports(['websocket'])
          .enableForceNew()
          .enableReconnection()
          .setExtraHeaders({'Connection': 'upgrade', 'Upgrade': 'websocket'})
          .enableAutoConnect()
          .build(),
    );

    socket?.connect();

    // Connection status
    socket?.onConnect((_) {
      print('✅ Connected to Socket.IO');

      socket?.emit('authenticate', {
        'userId': "5",
        'token':
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2hvc3RhLWFwaS5sZW5kYS1hZ2VuY3kuY29tL2FwaS9sb2dpbiIsImlhdCI6MTc2NTI0NTExOSwiZXhwIjoxNzY1MjQ4NzE5LCJuYmYiOjE3NjUyNDUxMTksImp0aSI6Im5sN2lmdEtDbFNNUDZoYnYiLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInJvbGVfaWQiOjMsInJvbGVfbmFtZSI6IlByb3ZpZGVyIn0.sM5hxv7U7wNJynQ0Hx6ERDBcjTLXlrMGKVM6D2zylJA",
      });
    });

    socket?.onConnectError((error) {
      print('⛔ connect_error: $error');
    });

    socket?.onError((error) {
      print('⛔ error: $error');
    });

    socket?.onDisconnect((_) {
      print('❌ disconnected from socket');
    });

    // 🔍 Log EVERY event received from the server
    socket?.onAny((event, data) {
      print('📡 onAny → event: $event | data: $data');
    });

    // Your specific event listener
    socket?.on('notification:new', (data) async {
      print("🔔 New Notification: $data");

      int count = await getUnreadCount();

      streamSocket.addResponse(count.toString());
    });
  }

  Future<int> getUnreadNotification() async {
    return await getUnreadCount();
  }

  @override
  void dispose() {
    socket?.close();
    socket?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUnreadNotification().then((onValue) {
      notificationCount = onValue;
      streamSocket.addResponse(onValue.toString());
    });
  }

  @override
  void didChangeDependencies() {
    model = model?.copyWith(acceptLanguage: Helper.getCountryCode(context));
    profileModel = profileModel.copyWith(
      acceptLanguage: Helper.getCountryCode(context),
    );
    getCategoryModel = getCategoryModel?.copyWith(
      acceptLanguage: Helper.getCountryCode(context),
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
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      onAnimationComplete: (completed) {
        setState(() {
          isAnimationCompleted = completed;
        });
      },
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          shadowColor: Theme.of(context).shadowColor,
          bottom: null,
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(RoutesName.notificationPage);
              },
              icon: SizedBox(
                width: 36.w,
                height: 36.h,
                child: Stack(
                  children: [
                    PositionedDirectional(
                      bottom: 0,
                      top: 0,
                      start: 0,
                      child: Icon(
                        Icons.notifications,
                        size: 28.sp,
                        color: ColorManager.backgroundColor,
                      ),
                    ),
                    AnimatedPositionedDirectional(
                      duration: Duration(milliseconds: 300),
                      top: 0.h,
                      end: 4.w,
                      child: BuildWithSocketStream(
                        onValueChanged: (value) => notificationCount = value,
                      ).animate().flipV(duration: Duration(milliseconds: 300)),
                    ),
                  ],
                ),
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
                          color: ColorManager.darkTextColor,
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

          leading: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: SizedBox(
              height: 60.h,
              child: BlocProvider<GetProfileBloc>(
                create: (context) => getItInstance<GetProfileBloc>()
                  ..add(GetProfileEvent.getProfile(profileModel: profileModel)),
                child: BlocListener<GetProfileBloc, GetProfileState>(
                  listener: (context, state) async {
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
                      await getItInstance<AppPreferences>().setUserInfo(
                        loginStateEntity: LoginStateEntity(),
                      );
                      setState(() {
                        isProfileDataLoading = false;
                      });
                    } else if (state is GetProfileStateLoaded) {
                      setState(() {
                        profileEntity = state.profileEntity;
                        isProfileDataLoading = false;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isProfileDataLoading
                          ? CircularProgressIndicator(
                              backgroundColor: ColorManager.darkTextColor,
                            )
                          : Container(
                              width: 50.w,

                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ImageWidget(
                                boxFit: BoxFit.cover,
                                errorWidget: Icon(
                                  Icons.account_circle,
                                  size: 40.sp,
                                  color: ColorManager.darkTextColor,
                                ),
                                imageUrl: profileEntity?.avatar ?? "",
                              ),
                            ),
                      SizedBox(
                        width: 130.w,
                        height: 60.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: isProfileDataLoading
                                    ? SizedBox(
                                        width: 70.w,
                                        height: 1.h,
                                        child: Center(
                                          child: LinearProgressIndicator(
                                            color: ColorManager.darkTextColor,
                                            backgroundColor: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          ),
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
                                              color: ColorManager.darkTextColor,
                                            ),
                                        textAlign: TextAlign.start,
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                              width: 130.w,
                              child: isProfileDataLoading
                                  ? SizedBox(
                                      width: 70.w,
                                      height: 10.h,
                                      child: Center(
                                        child: LinearProgressIndicator(
                                          color: ColorManager.darkTextColor,

                                          backgroundColor: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            width:
                                                context.locale ==
                                                    LanguageConstant.arLoacle
                                                ? 30.w
                                                : 70.w,
                                            child: Align(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
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
                                                        color: ColorManager
                                                            .darkTextColor,
                                                      ),
                                                  textAlign: TextAlign.center,
                                                ).tr(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4.w,
                                          ),
                                          child:
                                              Container(
                                                padding:
                                                    EdgeInsetsDirectional.symmetric(
                                                      horizontal: 4.w,
                                                    ),
                                                width: 42.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentGeometry
                                                              .center,
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
                                                                        context
                                                                            .locale,
                                                                      ),
                                                                  color: ColorManager
                                                                      .darkTextColor,
                                                                ),
                                                            textAlign: TextAlign
                                                                .center,
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
                                              ).asGlass(
                                                frosted: true,
                                                blurX: 20,
                                                blurY: 20,
                                                tintColor: Theme.of(context)
                                                    .focusColor
                                                    .withValues(alpha: 0.7),
                                                clipBorderRadius:
                                                    BorderRadius.circular(12.r),
                                                border: Theme.of(context)
                                                    .defaultBorderSide
                                                    .copyWith(
                                                      color: Theme.of(
                                                        context,
                                                      ).focusColor,
                                                    ),
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
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            child: Column(
              children: [
                SizedBox(
                  height: 180.h,
                  child: PageView(
                    controller: imageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentImage = value;
                      });
                    },
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: ImageWidget(
                          boxFit: BoxFit.cover,
                          imageUrl:
                              "https://m.media-amazon.com/images/M/MV5BM2JhZWJmMDEtNTU5MS00YmQ3LTk1NjMtOGFlMjM2MjZlNjg5XkEyXkFqcGc@._V1_.jpg",
                        ),
                      ).animate().fadeIn(
                        curve: Curves.easeInOut,
                        duration: 500.ms,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child:
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: ImageWidget(
                                width: 200.w,
                                height: 180.h,
                                boxFit: BoxFit.cover,
                                imageUrl:
                                    "https://fapello.com/content/x/c/xcandylashes/1000/xcandylashes_0044.jpg",
                              ),
                            ).animate().fadeIn(
                              curve: Curves.easeInOut,
                              duration: 500.ms,
                            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: ImageWidget(
                          width: 200.w,
                          height: 180.h,
                          boxFit: BoxFit.cover,
                          imageUrl:
                              "https://fapello.com/content/x/c/xcandylashes/1000/xcandylashes_0095.jpg",
                        ),
                      ).animate().fadeIn(
                        curve: Curves.easeInOut,
                        duration: 500.ms,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 52.w,
                    child: Center(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentImage = index;
                                imageController.animateToPage(
                                  currentImage,
                                  duration: 300.ms,
                                  curve: Curves.easeInOut,
                                );
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              width: currentImage == index ? 12.w : 8.w,
                              height: currentImage == index ? 12.h : 8.h,
                              decoration: BoxDecoration(
                                color: currentImage == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(
                                        context,
                                      ).disabledColor.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        },
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.directional(start: 20.w, top: 12.h),
            child: Text(
              LocaleKeys.homePage_categories.tr(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontFamily: FontConstants.fontFamily(context.locale),
              ),
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
                key: ValueKey(isAnimationCompleted),
                buildWhen: (previous, current) => isAnimationCompleted,
                builder: (context, state) {
                  return state.when(
                    initial: () => Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
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
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            child: AnimatedSwitcher(
                              duration: 300.ms,
                              child: GridView.builder(
                                shrinkWrap: true,
                                key: ValueKey<int>(data.length),
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 0.w,
                                  vertical: 20.h,
                                ),
                                itemCount: data.length,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 150.w,
                                      crossAxisSpacing: 12.w,
                                      mainAxisSpacing: 12.h,
                                      mainAxisExtent: 150.h,
                                    ),

                                itemBuilder: (context, index) {
                                  return CategoryContainer(
                                    isHomePage: true,
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
