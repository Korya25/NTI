import 'package:crevel/features/contact/presentation/widgets/contact_card_background.dart';
import 'package:crevel/features/contact/presentation/widgets/contact_info_content.dart';
import 'package:flutter/material.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContactCardBackground(
      child: ContactInfoContent(),
    );
  }
}

