import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/core/resource/main_page/main_page.dart';
import 'package:hosta_user/features/otp_page/presentation/pages/otp_page_page.dart';
import 'package:hosta_user/features/profile_page/presentation/bloc/reset_password_bloc.dart';
import 'package:hosta_user/features/profile_page/presentation/widgets/reset_password/request_password_reset_widget.dart';
import 'package:hosta_user/generated/locale_keys.g.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String? pageTitle;

  int currentIndex = 0;
  @override
  void initState() {
    pageTitle = LocaleKeys.profilePage_requestPasswordReset.tr();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      RequestPasswordResetWidget(
        onChanged: (value) {
          setState(() {
            currentIndex = 1;
          });
        },
      ),
      OtpPagePage(),
    ];
    return MainPage(
      title: pageTitle,
      body: BlocProvider<ResetPasswordBloc>(
        create: (context) =>
            getItInstance<ResetPasswordBloc>()
              ..add(ResetPasswordEventStarted()),
        child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {},
              requestResetPasswordSuccess: (requestResetPasswordEntity) {},
              verifyOtpSuccess: (verifyOtpEntity) {},
              resetPasswordSuccess: () {},
              error: (error) {},
              noInternet: () {},
              unauthenticated: (error) {},
            );
          },
          child: AnimatedSwitcher(
            duration: 600.ms,
            transitionBuilder: (child, animation) {
              final slide = Tween<Offset>(
                begin: const Offset(0.2, 0),
                end: Offset.zero,
              ).animate(animation);
              return SlideTransition(
                position: slide,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: pages[currentIndex],
          ),
        ),
      ),
    );
  }
}
