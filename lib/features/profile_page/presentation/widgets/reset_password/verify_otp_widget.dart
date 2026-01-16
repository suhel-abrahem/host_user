import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:hosta_user/features/profile_page/data/models/reset_password/verify_otp_model.dart';
import 'package:hosta_user/features/profile_page/presentation/bloc/reset_password_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/constants/font_constants.dart';
import '../../../../../core/dependencies_injection.dart';
import '../../../../../core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../login_page/presentation/bloc/login_bloc_bloc.dart';
import '../../../../otp_page/presentation/bloc/otp_page_bloc.dart';

class OtpPagePage extends StatefulWidget {
  final String? identifier;
  final ValueChanged<bool?>? onVerified;
  final ValueChanged<void>? onResent;
  final VerifyOtpModel? otpModel;
  const OtpPagePage({
    super.key,
    this.identifier,
    this.onVerified,
    this.otpModel,
    this.onResent,
  });

  @override
  State<OtpPagePage> createState() => _OtpPagePageState();
}

class _OtpPagePageState extends State<OtpPagePage> {
  TextEditingController otpController = TextEditingController();
  VerifyOtpModel? otpModel = VerifyOtpModel();
  Duration duration = const Duration(seconds: 60);
  bool isTimerCompleted = false;
  @override
  void initState() {
    otpModel = widget.otpModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getItInstance<ResetPasswordBloc>()..add(ResetPasswordEvent.started()),
      child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          state.maybeWhen(
            initial: () {},
            error: (e) {
              showMessage(
                message: LocaleKeys.common_error.tr(),
                context: context,
              );
            },
            loading: () {},
            verifyOtpSuccess: (data) {
              if (widget.onVerified != null) {
                widget.onVerified!(true);
              }
            },

            orElse: () {},
          );
        },
        child: Scaffold(
          body: ListView(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(
                    LocaleKeys.otpPage_title.tr(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                  child: Text(
                    LocaleKeys.otpPage_verification.tr(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                      fontSize: 32.sp,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    LocaleKeys.otpPage_enterTheCodeSentToTheNumber.tr(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    widget.identifier ?? "",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Center(
                  child: Pinput(
                    length: 6,
                    onChanged: (value) {
                      otpModel = otpModel?.copyWith(otp: value);
                    },
                    controller: otpController,
                    defaultPinTheme: PinTheme(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.h),
                child: Center(
                  child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                    builder: (context, state) {
                      if (state is LoginStateLoading) {
                        return SizedBox(
                          width: 300.w,
                          height: 50.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        width: 300.w,
                        height: 50.h,
                        child: ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style
                              ?.copyWith(
                                backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.primary,
                                ),
                              ),

                          onPressed: () {
                            context.read<ResetPasswordBloc>().add(
                              ResetPasswordEvent.verifyOtp(
                                verifyOtpModel: otpModel,
                              ),
                            );
                          },
                          child: Text(
                            LocaleKeys.otpPage_verify.tr(),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.otpPage_didntReceiveCode.tr(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                  ),
                  if (isTimerCompleted)
                    Builder(
                      builder: (context) {
                        return TextButton(
                          onPressed: () {
                            if (widget.onResent != null) {
                              widget.onResent!(null);
                            }
                            setState(() {
                              isTimerCompleted = false;
                            });
                          },
                          child: Text(
                            LocaleKeys.otpPage_resend.tr(),
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        );
                      },
                    ),
                  !isTimerCompleted
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                LocaleKeys.otpPage_resendIn.tr(),
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                            ),
                            TimerCountdown(
                              enableDescriptions: false,
                              format: CountDownTimerFormat.secondsOnly,
                              endTime: DateTime.now().add(duration),
                              onEnd: () {
                                setState(() {
                                  isTimerCompleted = true;
                                });
                              },
                              timeTextStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    fontFamily: FontConstants.fontFamily(
                                      context.locale,
                                    ),
                                  ),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
