import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hosta_user/core/resource/main_page/bottom_end_background_clip_path.dart';
import 'package:hosta_user/core/resource/main_page/top_background_clip_path.dart';
import '../../enums/login_state_enum.dart';
import '../../../config/app/app_preferences.dart';
import '../../../config/route/routes_manager.dart';
import '../../dependencies_injection.dart';

import '../custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'drawer.dart';

class MainPage extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final String? title;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool? haveBottomBar;
  final Widget? navigationTaps;
  final Widget? drawer;
  final String? pagePath;
  final ValueChanged<bool>? onAnimationComplete;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  const MainPage({
    super.key,
    required this.body,
    this.title,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.navigationTaps,
    this.actions,
    this.pagePath,
    this.drawer,
    this.haveBottomBar,
    this.appBar,
    this.bottom,
    this.onAnimationComplete,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double yOffset = 0;
  bool animationDone = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.h,
          left: 0,
          right: 0,

          child: SizedBox(
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: AnimatedRotation(
                    duration: Duration(milliseconds: 300),
                    turns: yOffset / 100,
                    child: Icon(
                      Icons.refresh,
                      size: 40.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: 300.ms,
          curve: Curves.easeInOut,
          top: yOffset,
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                yOffset += details.delta.dy;
                if (yOffset < 0) {
                  yOffset = 0;
                } else if (yOffset > 100) {
                  yOffset = 100;
                }
              });
            },
            onVerticalDragCancel: () {
              setState(() {
                yOffset = 0;
              });
            },
            onVerticalDragEnd: (details) {
              if (yOffset > 90) {
                setState(() {
                  yOffset = 0;
                  animationDone = false;
                });
                print(
                  "user info: ${getItInstance<AppPreferences>().getUserInfo()}",
                );
                if (getItInstance<AppPreferences>()
                        .getUserInfo()
                        ?.loginStateEnum ==
                    LoginStateEnum.logined) {
                  String _currentPath = currentPath ?? RoutesPath.homePage;
                  if (context.canPop()) {
                    context.pop();
                  }
                  context.push(_currentPath);
                } else {
                  context.go(RoutesPath.loginPage);
                }
                setState(() {
                  yOffset = 0;
                });
              } else {
                setState(() {
                  yOffset = 0;
                });
              }
            },
            child: ThemeSwitchingArea(
              child: Stack(
                children: [
                  PositionedDirectional(
                    top: 0.w,
                    start: 0.w,
                    child:
                        ClipPath(
                              clipper: TopBackgroundClipPath(),
                              child: Container(
                                width: 350.w,
                                height: 350.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      if (getItInstance<AppPreferences>()
                                              .getAppTheme() ??
                                          false) ...[
                                        const Color.fromARGB(
                                          255,
                                          5,
                                          50,
                                          100,
                                        ).withValues(alpha: 0.9),
                                        const Color.fromARGB(
                                          255,
                                          86,
                                          44,
                                          165,
                                        ).withValues(alpha: 0.8),
                                        const Color.fromARGB(255, 95, 11, 63),
                                      ] else ...[
                                        const Color.fromARGB(
                                          255,
                                          195,
                                          199,
                                          198,
                                        ).withValues(alpha: 0.9),
                                        const Color.fromARGB(
                                          255,
                                          14,
                                          125,
                                          204,
                                        ).withValues(alpha: 0.8),
                                        const Color.fromARGB(255, 2, 145, 152),
                                      ],
                                    ],
                                    stops: const [0.0, 0.5, 1.0],
                                  ),
                                ),
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, curve: Curves.easeInOut)
                            .slideX(
                              duration: 600.ms,
                              curve: Curves.bounceInOut,
                              begin: -0.5,
                            ),
                  ),
                  PositionedDirectional(
                    bottom: 0.w,
                    end: 0.w,
                    child:
                        ClipPath(
                              clipper: BottomEndBackgroundClipPath(),
                              child: Container(
                                width: 250.w,
                                height: 250.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      if (getItInstance<AppPreferences>()
                                              .getAppTheme() ??
                                          false) ...[
                                        const Color.fromARGB(
                                          255,
                                          5,
                                          50,
                                          100,
                                        ).withValues(alpha: 0.9),
                                        const Color.fromARGB(
                                          255,
                                          48,
                                          22,
                                          65,
                                        ).withValues(alpha: 0.8),
                                        const Color.fromARGB(255, 41, 11, 68),
                                      ] else ...[
                                        const Color.fromARGB(
                                          255,
                                          195,
                                          199,
                                          198,
                                        ).withValues(alpha: 0.9),
                                        const Color.fromARGB(
                                          255,
                                          14,
                                          125,
                                          204,
                                        ).withValues(alpha: 0.8),
                                        const Color.fromARGB(255, 2, 145, 152),
                                      ],
                                    ],
                                    stops: const [0.0, 0.5, 1.0],
                                  ),
                                ),
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, curve: Curves.easeInOut)
                            .slideY(
                              duration: 600.ms,
                              curve: Curves.bounceInOut,
                              begin: 1,
                            ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar:
                        widget.appBar ??
                        PreferredSize(
                          preferredSize: Size.fromHeight(
                            widget.haveBottomBar == true ? 110.h : 50.h,
                          ),
                          child: AppBar(
                            backgroundColor: Colors.transparent,
                            centerTitle: true,
                            title: Text(
                              widget.title ?? "",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            leading: SizedBox(
                              width: 36.w,
                              height: 36.h,
                              child: Center(
                                child: Builder(
                                  builder: (builderContext) {
                                    return ElevatedButton(
                                      style: Theme.of(context)
                                          .elevatedButtonTheme
                                          .style
                                          ?.copyWith(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                  Theme.of(context)
                                                      .scaffoldBackgroundColor
                                                      .withValues(alpha: 0.6),
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
                                        Scaffold.of(
                                          builderContext,
                                        ).openDrawer();
                                      },
                                      child: Icon(
                                        Icons.menu,
                                        size: 28.sp,
                                        color: Theme.of(
                                          context,
                                        ).textTheme.labelLarge?.color,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            actions:
                                widget.actions ??
                                [
                                  IconButton(
                                    onPressed: context.canPop()
                                        ? () => context.canPop()
                                              ? context.pop()
                                              : showMessage(
                                                  message: "Can not pop",
                                                  context: context,
                                                )
                                        : null,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 32.sp,
                                      color: context.canPop()
                                          ? Theme.of(
                                              context,
                                            ).textTheme.labelLarge?.color
                                          : Theme.of(context).disabledColor,
                                    ),
                                  ),
                                ],
                            bottom: widget.bottom,
                          ).animate().slideX(duration: 500.ms),
                        ),
                    body: RepaintBoundary(
                      child: widget.body
                          .animate()
                          .scaleXY(duration: 600.ms, curve: Curves.easeInOut)
                          .callback(
                            delay: Duration(milliseconds: 100),
                            callback: (_) {
                              if (!animationDone) {
                                animationDone = true;
                                if (widget.onAnimationComplete != null) {
                                  widget.onAnimationComplete!(animationDone);
                                }
                              }
                            },
                          ),
                    ),

                    drawer: widget.drawer ?? CustomDrawer(),
                    floatingActionButton: widget.floatingActionButton,

                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.endFloat,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
