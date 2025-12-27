import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/resource/image_widget.dart';
import 'package:hosta_user/features/chat/domain/entities/message/message_entity.dart';

import '../../../../core/enums/uploading_state_enum.dart';

class MessageContainer extends StatelessWidget {
  final MessageEntity? messageEntity;
  const MessageContainer({super.key, this.messageEntity});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: messageEntity?.me == true
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Center(
              child:
                  messageEntity?.uploadingState == UploadingStateEnum.uploading
                  ? CircularProgressIndicator()
                  : messageEntity?.uploadingState == UploadingStateEnum.failed
                  ? Icon(
                      Icons.error,
                      size: 16.sp,
                      color: Theme.of(context).colorScheme.error,
                    )
                  : SizedBox.shrink(),
            ),
          ),
          Container(
            padding: messageEntity?.message_type == "image"
                ? EdgeInsets.zero
                : EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
            constraints: BoxConstraints(maxWidth: 260.w),
            decoration: BoxDecoration(
              color: messageEntity?.me == true
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: messageEntity?.message_type == "image"
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ImageWidget(
                      boxFit: BoxFit.cover,
                      height: 260.h,
                      imageUrl: messageEntity?.content ?? '',
                    ),
                  )
                : Text(
                    messageEntity?.content ?? '',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
