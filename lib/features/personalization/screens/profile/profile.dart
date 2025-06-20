import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_circular_image.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GMAppBar(showBackArrow: true, title: Text("Profile")),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const GMCircularImage(
                      image: GMImages.user,
                      width: 88,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: GSizes.spaceBtwItems / 2),
              Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),

              /// Heading Profile Info
              const GMSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(height: GSizes.spaceBtwItems),

              GMProfileMenu(title: "Name", value: "John Doe", onPressed: () {}),
              GMProfileMenu(
                title: "Username",
                value: "John Doe",
                onPressed: () {},
              ),

              const SizedBox(height: GSizes.spaceBtwItems),
              Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),

              /// Heading Personal Info
              const GMSectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              const SizedBox(height: GSizes.spaceBtwItems),

              GMProfileMenu(
                title: "User ID",
                value: "45826",
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              GMProfileMenu(
                title: "E-mail",
                value: "johndoe@gmail.com",
                onPressed: () {},
              ),
              GMProfileMenu(
                title: "Phone Number",
                value: "+241-77-777777",
                onPressed: () {},
              ),
              GMProfileMenu(title: "Gender", value: "Male", onPressed: () {}),
              GMProfileMenu(
                title: "Date of Birth",
                value: "10 Oct, 1994",
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
