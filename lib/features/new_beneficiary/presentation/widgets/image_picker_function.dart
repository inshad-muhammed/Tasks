import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/avatar_image_provider.dart';

class EditableAvatar extends ConsumerWidget {
  const EditableAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarFile = ref.watch(avatarImageProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: screenWidth * 0.08,
          backgroundColor: Colors.blue.shade100,
          backgroundImage: avatarFile != null ? FileImage(avatarFile) : null,
          child: avatarFile == null
              ? const Text("AL", style: TextStyle(fontWeight: FontWeight.bold))
              : null,
        ),
        Positioned(
          right: -6,
          bottom: -6,
          child: GestureDetector(
            onTap: () => _showImageSourceActionSheet(context, ref),
            child: CircleAvatar(
              radius: screenWidth * 0.032,
              backgroundColor: DefaultColors.blueT1,
              child: Icon(
                Icons.edit_outlined,
                color: DefaultColors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showImageSourceActionSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  "Edit Profile Picture",
                  style: TextStyle(color: DefaultColors.gray71, fontSize: 16),
                ),
              ),
              ListTile(
                title: const Text(
                  'Take New Photo',
                  style: TextStyle(
                    color: DefaultColors.blueLightBase,
                    fontSize: 20,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedFile != null) {
                    ref.read(avatarImageProvider.notifier).state = File(
                      pickedFile.path,
                    );
                  }
                },
              ),
              ListTile(
                title: const Text(
                  'Choose Existing Photo',
                  style: TextStyle(
                    color: DefaultColors.blueLightBase,
                    fontSize: 20,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    ref.read(avatarImageProvider.notifier).state = File(
                      pickedFile.path,
                    );
                  }
                },
              ),
              ListTile(
                title: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: DefaultColors.blueLightBase,
                    fontSize: 20,
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
