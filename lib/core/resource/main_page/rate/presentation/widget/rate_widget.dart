import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:hosta_user/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:hosta_user/generated/locale_keys.g.dart';

import '../../data/model/rate_model.dart';
import '../bloc/rate_bloc.dart';

class RateWidget extends StatelessWidget {
  final int? bookingId;
  const RateWidget({super.key, this.bookingId});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    int? rating = 0;
    String? comment;
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        width: 1.sw,
        height: 300.h,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                LocaleKeys.notificationPage_pleaseRateTheProvider.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontFamily: FontConstants.fontFamily(context.locale),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 12.h),
              child: Center(
                child: BlocProvider<RateBloc>(
                  create: (context) =>
                      getItInstance<RateBloc>()..add(RateEvent.getRate()),
                  child: BlocBuilder<RateBloc, RateState>(
                    builder: (context, state) {
                      if (state is RateStateGetRateSuccess) {
                        rating = state.rate;
                      }
                      return Center(
                        child: SizedBox(
                          width: 1.sw,
                          height: 50.h,
                          child: Center(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return IconButton(
                                  onPressed: () {
                                    context.read<RateBloc>().add(
                                      RateEvent.setRate(rate: index + 1),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.star,
                                    color:
                                        (state is RateStateGetRateSuccess &&
                                            state.rate != null &&
                                            state.rate! > index)
                                        ? Colors.amber
                                        : Colors.grey,
                                    size: (30 + (index * 2)).sp,
                                  ),
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
            ),
            Center(
              child: CustomInputField(
                width: 300.w,
                height: 100.h,
                maxLines: 4,
                hintText: LocaleKeys.notificationPage_comment.tr(),
                label: LocaleKeys.notificationPage_comment.tr(),
                onChanged: (value) {
                  comment = value.toString();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: BlocProvider(
                create: (context) =>
                    getItInstance<RateBloc>()..add(RateEvent.started()),
                child: BlocListener<RateBloc, RateState>(
                  listener: (context, state) {
                    print("Rate State: $state,bookingId: $bookingId");
                    if (state is RateStateNoInternet) {
                      showMessage(
                        message: LocaleKeys.common_error.tr(),
                        context: context,
                      );
                    } else if (state is RateStateUnauthenticated) {
                      showMessage(message: state.error, context: context);
                    }
                  },
                  child: BlocBuilder<RateBloc, RateState>(
                    builder: (context, state) {
                      if (state is RateStateSuccess ||
                          state is RateStateFailure) {
                        return ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.check),
                          label: Text(
                            LocaleKeys.notificationPage_rateProvider.tr(),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  color: Colors.white,
                                ),
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: 300.w,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<RateBloc>().add(
                                  RateEvent.sentRate(
                                    rateModel: RateModel(
                                      rating: rating,
                                      bookingId: bookingId,
                                      comment: comment,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                LocaleKeys.notificationPage_rateProvider.tr(),
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
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
