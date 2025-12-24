import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:hosta_user/core/constants/api_constant.dart';
import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/resource/image_widget.dart';
import 'package:hosta_user/features/chat/domain/entities/chats/chats_entity.dart';
import 'package:hosta_user/features/chat/domain/entities/message/message_entity.dart';
import 'package:hosta_user/features/chat/domain/entities/other_participant/other_participant_entity.dart';

class ConversionWidget extends StatelessWidget {
  final MessageEntity? messageEntity;
  final String? bookingNumber;
  final OtherParticipantEntity? otherParticipantEntity;
  final int? unreadCount;

  const ConversionWidget({
    super.key,
    this.messageEntity,
    this.bookingNumber,
    this.otherParticipantEntity,
    this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: (unreadCount ?? 0) > 0 == true
              ? Theme.of(context).primaryColor.withValues(alpha: 0.3)
              : Theme.of(context).scaffoldBackgroundColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 12.w),
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.w,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: ImageWidget(
                    imageUrl:
                        "${ApiConstant.baseUrl}${otherParticipantEntity?.profile_image ?? ""}",
                    boxFit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookingNumber ?? "",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontFamily: FontConstants.fontFamily(context.locale),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${otherParticipantEntity?.name ?? ""}: ",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (messageEntity?.message_type == "image")
                      ImageWidget(
                        imageUrl: "${messageEntity?.content}",
                        width: 100.w,
                        height: 100.h,
                        boxFit: BoxFit.cover,
                      )
                    else
                      Text(
                        messageEntity?.content ?? "",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontFamily: FontConstants.fontFamily(context.locale),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
