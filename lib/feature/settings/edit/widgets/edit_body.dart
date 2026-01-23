import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/feature/settings/edit/widgets/pick_image.dart';

import '../../../../core/localization/strings.dart';
import '../../../../core/services/state_management/widgets/obs_widget.dart';
import '../../../../core/style/repo.dart';
import '../../../../core/widgets/svg_icon.dart';
import '../../../../gen/assets.gen.dart';
import '../../../Auth/signup/models/cities.dart';
import '../../../Auth/signup/models/state.dart';
import '../controller.dart';

class EditBody extends StatelessWidget {
  const EditBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditPageController>();

    return Form(
      key:controller.formKey ,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(child: PickImageMyProfile()),
            SizedBox(height: 30),

            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: tr(LocaleKeys.first_name),
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgIcon(
                              icon: Assets.icons.user,
                              color: StyleRepo.orange,
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return tr(LocaleKeys.this_field_is_required);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: tr(LocaleKeys.last_name),
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgIcon(
                              icon: Assets.icons.user,
                              color: StyleRepo.orange,
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return tr(LocaleKeys.this_field_is_required);
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: controller.phone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: tr(LocaleKeys.Write_Your_Phone_Number),
                prefixIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.sizeOf(context).width * 0.26,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgIcon(
                        icon: Assets.icons.phone,
                        color: StyleRepo.orange,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "+963",
                        style: TextStyle(
                          color: StyleRepo.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(width: 1, height: 24, color: StyleRepo.grey),
                    ],
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return tr(LocaleKeys.this_field_is_required);
                }
                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return tr(LocaleKeys.only_numbers_allowed);
                }
                return null;
              },
            ),

            SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: ObsListBuilder<StateModel>(
                    obs: controller.states,
                    builder: (context, stateList) {
                      return DropdownButtonFormField<StateModel>(
                        isExpanded: true,
                        value: controller.selectedState.value,
                        hint: Text(tr(LocaleKeys.state)),
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SvgIcon(icon: Assets.icons.state, color: StyleRepo.orange,size: 28,),
                          ),
                        ),
                        items: stateList
                            .map((s) => DropdownMenuItem(
                          value: s,
                          child: Text(s.name,
                              style: const TextStyle(fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis),
                        ))
                            .toList(),
                        onChanged: (StateModel? value) {
                          controller.selectedState.value = value;
                          controller.state.text = value?.name ?? "";
                          controller.selectedCity.value = null;
                          controller.cities.value = [];
                          if (value != null) controller.fetchCities(value.id);
                        },
                        validator: (v) => v == null ? tr(LocaleKeys.this_field_is_required) : null,
                        onTap: () {
                          if (controller.states.value!.isEmpty) controller.fetchStates();
                        },
                      );
                    },

                    loader: (context) => DropdownButtonFormField<StateModel>(
                      isExpanded: true,
                      items: const [],
                      onChanged: null,
                      hint: Row(
                        children: [
                          SvgIcon(icon: Assets.icons.state,color: StyleRepo.orange,size: 28,),
                          SizedBox(width: 10,),
                          Text(tr(LocaleKeys.state)),
                        ],
                      ),
                    ),

                    errorBuilder: (context, error) => DropdownButtonFormField<StateModel>(
                      isExpanded: true,
                      items: const [],
                      onChanged: null,
                      hint: Text(error.toString()),
                    ),
                  ),
                ),

                const SizedBox(width: 5),

                Expanded(
                  child: ObsListBuilder<Cities>(
                    obs: controller.cities,
                    builder: (context, cityList) {
                      return DropdownButtonFormField<Cities>(
                        isExpanded: true,
                        value: controller.selectedCity.value,
                        hint: Text(tr(LocaleKeys.city)),
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SvgIcon(icon: Assets.icons.city, color: StyleRepo.orange,size: 28,),
                          ),
                        ),
                        items: cityList
                            .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c.name,
                              style: const TextStyle(fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis),
                        ))
                            .toList(),
                        onChanged: (Cities? value) {
                          controller.selectedCity.value = value;
                          controller.city.text = value?.name ?? "";
                        },
                        validator: (v) => v == null ? tr(LocaleKeys.this_field_is_required) : null,
                      );
                    },

                    loader: (context) => DropdownButtonFormField<Cities>(
                      isExpanded: true,
                      items: const [],
                      onChanged: null,
                      hint: Row(
                        children: [
                          SvgIcon(icon: Assets.icons.city,color: StyleRepo.orange,size: 28,),
                          SizedBox(width: 10,),
                          Text(tr(LocaleKeys.city)),
                        ],
                      ),
                    ),

                    errorBuilder: (context, error) => DropdownButtonFormField<Cities>(
                      isExpanded: true,
                      items: const [],
                      onChanged: null,
                      hint: Text(error.toString()),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 50),

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
                      onPressed: controller.save,
                      child: Text(tr(LocaleKeys.save)),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
