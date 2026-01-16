import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:hosta_user/features/profile_page/data/models/reset_password/request_reset_password_model.dart';
import 'package:hosta_user/generated/locale_keys.g.dart';

import '../../../../../core/resource/validator.dart';

class RequestPasswordResetWidget extends StatefulWidget {
  final ValueChanged<RequestResetPasswordModel?>? onChanged;
  const RequestPasswordResetWidget({super.key, this.onChanged});

  @override
  State<RequestPasswordResetWidget> createState() =>
      _RequestPasswordResetWidgetState();
}

class _RequestPasswordResetWidgetState
    extends State<RequestPasswordResetWidget> {
  RequestResetPasswordModel? requestResetPasswordModel =
      RequestResetPasswordModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 50.h),
            child: Center(child: Icon(Icons.lock_reset, size: 260.sp)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              LocaleKeys.profilePage_enterYourEmailOrPhoneToResetYourPassword
                  .tr(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontFamily: FontConstants.fontFamily(context.locale),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: CustomInputField(
              width: 300.w,
              isRequired: true,

              label: LocaleKeys.loginPage_emailOrPhone.tr(),
              validator: (value) {
                String? login = value?.trim();
                if (login == null || login.isEmpty) {
                  return LocaleKeys.loginPage_emailOrPhoneIsRequired.tr();
                }
                if (RegExp(Validator.numberRegex).hasMatch(login)) {
                  if (login.length < 10) {
                    return Validator.phoneExample;
                  }
                }
                if (RegExp(Validator.stringRegex).hasMatch(login)) {
                  if (!RegExp(Validator.emailRegex).hasMatch(login)) {
                    return Validator.emailExample;
                  }
                }
                return null;
              },
              onChanged: (newValue) {
                String? value = newValue?.trim();
                requestResetPasswordModel = requestResetPasswordModel?.copyWith(
                  identifier:
                      RegExp(Validator.numberRegex).hasMatch(value ?? "")
                      ? "+964${value.toString().trim()}"
                      : value.toString().trim(),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: ElevatedButton(
              onPressed: (formKey.currentState?.validate() ?? true)
                  ? () {
                      if (widget.onChanged != null) {
                        widget.onChanged!(requestResetPasswordModel);
                      }
                    }
                  : null,
              child: Text(
                LocaleKeys.profilePage_resetPassword.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontFamily: FontConstants.fontFamily(context.locale),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
