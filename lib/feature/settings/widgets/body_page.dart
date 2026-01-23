import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/settings/controller.dart';
import 'package:tredo/gen/assets.gen.dart';

class BodySettingsPage extends StatelessWidget {
  const BodySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsPageController>(tag: "settings");
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        Text(
          tr(LocaleKeys.about_the_app),
          style: TextStyle(
            color: StyleRepo.darkGrey,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        // Privacy pocicy
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder:
                  (context) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr(LocaleKeys.title)),
                        Text(tr(LocaleKeys.introduction)),
                        Text(tr(LocaleKeys.data_collection)),
                        Text(tr(LocaleKeys.third_party_services)),
                        Text(tr(LocaleKeys.children)),
                        Text(tr(LocaleKeys.updates)),
                        Text(tr(LocaleKeys.contact)),
                      ],
                    ),
                  ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgIcon(icon: Assets.icons.privacy2, color: StyleRepo.orange),
                  SizedBox(width: 10),
                  Text(
                    tr(LocaleKeys.privacy_policy),
                    style: TextStyle(
                      color: StyleRepo.darkGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: StyleRepo.darkGrey,
                size: 20,
              ),
            ],
          ),
        ),

        TextButton(
          onPressed: () => Get.toNamed(Pages.contact_us.value),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgIcon(icon: Assets.icons.contact2, color: StyleRepo.orange),
                  SizedBox(width: 10),
                  Text(
                    tr(LocaleKeys.Contact_Us),
                    style: TextStyle(
                      color: StyleRepo.darkGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: StyleRepo.darkGrey,
                size: 20,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        //About Us
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tr(LocaleKeys.About_us),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: StyleRepo.black,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: StyleRepo.darkGrey),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      Text(
                        tr(LocaleKeys.about_us_contain),
                        style: TextStyle(
                          fontSize: 14,
                          color: StyleRepo.darkGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),

                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: StyleRepo.orange),
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.facebook, color: StyleRepo.orange),
                            label: Text(
                              "Facebook",
                              style: TextStyle(color: StyleRepo.orange),
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: StyleRepo.orange),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: StyleRepo.orange,
                            ),
                            label: Text(
                              "Instagram",
                              style: TextStyle(color: StyleRepo.orange),
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: StyleRepo.orange),
                            ),
                            onPressed: () {

                            },
                            icon: Icon(
                              Icons.whatshot_sharp,
                              color: StyleRepo.orange,
                            ),
                            label: Text(
                              "WhatsApp",
                              style: TextStyle(color: StyleRepo.orange),
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: StyleRepo.orange),
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.phone, color: StyleRepo.orange),
                            label: Text(
                              "Phone",
                              style: TextStyle(color: StyleRepo.orange),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgIcon(icon: Assets.icons.aboutUs, color: StyleRepo.orange),
                  SizedBox(width: 10),
                  Text(
                    tr(LocaleKeys.About_us),
                    style: TextStyle(
                      color: StyleRepo.darkGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: StyleRepo.darkGrey,
                size: 20,
              ),
            ],
          ),
        ),

        SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(color: StyleRepo.lightGrey),
        ),

        SizedBox(height: 20),
        Text(
          tr(LocaleKeys.Settings),
          style: TextStyle(
            color: StyleRepo.darkGrey,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tr(LocaleKeys.Language),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: StyleRepo.darkGrey,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: StyleRepo.darkGrey),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        title: Text("English"),
                        onTap: () {
                          controller.changeLanguage("en", context);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text("Arabic"),
                        onTap: () {
                          controller.changeLanguage("ar", context);
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgIcon(icon: Assets.icons.language, color: StyleRepo.orange),
                  SizedBox(width: 10),
                  Text(
                    tr(LocaleKeys.Language),
                    style: TextStyle(
                      color: StyleRepo.darkGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    Get.locale?.languageCode == "ar" ? "العربية" : "English",
                    style: TextStyle(
                      color: StyleRepo.darkGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: StyleRepo.darkGrey,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 5),
        TextButton(
          onPressed: () => Get.toNamed(Pages.change_password.value),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgIcon(icon: Assets.icons.lock, color: StyleRepo.orange),
                  SizedBox(width: 10),
                  Text(
                    tr(LocaleKeys.Change_Password),
                    style: TextStyle(
                      color: StyleRepo.darkGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: StyleRepo.darkGrey,
                size: 20,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(color: StyleRepo.lightGrey),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () =>
                  controller.isLoading.value
                      ? Center(
                        child: CircularProgressIndicator(
                          color: StyleRepo.deepGreen,
                        ),
                      )
                      : Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: controller.LogOut,
                          child: Text(tr(LocaleKeys.log_out)),
                        ),
                      ),
            ),
          ],
        ),

        SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
      ],
    );
  }
}
