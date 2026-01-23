import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tredo/core/style/repo.dart';

import '../../../core/localization/strings.dart';

class HomeContentList extends StatelessWidget {
  final String title;
  final void Function()? seeAll;
  final Widget content;

  const HomeContentList({
    super.key,
    required this.title,
    this.seeAll,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (seeAll != null)
                TextButton(
                  onPressed: seeAll,
                  child: Text(tr(LocaleKeys.show_all),style: TextStyle(color: StyleRepo.orange),),
                ),
            ],
          ),
        ),
        SizedBox(height: 12),
        content,
      ],
    );
  }
}
