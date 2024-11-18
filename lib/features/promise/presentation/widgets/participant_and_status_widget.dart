import 'package:flutter/material.dart';
import 'package:pravo_client/features/promise/domain/entities/participant_status.dart';
import 'package:pravo_client/features/promise/presentation/widgets/image_and_text_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/participation_status_label_widget.dart';

class ParticipantAndStatusWidget extends StatelessWidget {
  final String name;
  final String? profileImageUrl;
  final ParticipantStatus status;

  const ParticipantAndStatusWidget({
    super.key,
    required this.name,
    this.profileImageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImageAndTextWidget(name: name, imageUrl: profileImageUrl),
        ParticipationStatusLabelWidget(
          status: status,
        ),
      ],
    );
  }
}
