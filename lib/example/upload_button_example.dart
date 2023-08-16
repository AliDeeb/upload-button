import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upload_button/upload_button.dart';

class UploadButtonExample extends StatefulWidget {
  const UploadButtonExample({super.key});

  @override
  State<UploadButtonExample> createState() => _UploadButtonExampleState();
}

class _UploadButtonExampleState extends State<UploadButtonExample>
    with TickerProviderStateMixin {
  final style = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  final Offset uploadOffset = Offset.zero;
  final Offset uploadingOffset = const Offset(0, 50);
  final Offset uploadedOffset = const Offset(0, 100);
  final slideCurve = Curves.elasticOut;

  late AnimationController controller;
  late AnimationController slideController;
  late Animation<double> progressAnimation;
  late Animation<Offset> slideAnimation;

  // states

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    progressAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    slideAnimation = Tween<Offset>(begin: Offset.zero, end: Offset.zero)
        .animate(slideController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([progressAnimation, slideAnimation]),
      builder: (context, child) {
        return UploadButton(
          width: 180,
          height: 65,
          onTap: onUploadTap,
          progressValue: progressAnimation.value,
          child: Transform.translate(
            offset: slideAnimation.value,
            child: child!,
          ),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          _buildUploadWidget(),
          _buildUploadingWidget(),
          _buildUploadedWidget(),
        ],
      ),
    );
  }

  Widget _buildUploadWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 25),
      child: Transform.translate(
        offset: uploadOffset,
        child: Row(
          children: [
            const Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text("Upload", style: style),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadingWidget() {
    return Center(
      child: Transform.translate(
        offset: uploadingOffset,
        child: Text("Uploading", style: style),
      ),
    );
  }

  Widget _buildUploadedWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 25),
      child: Transform.translate(
        offset: uploadedOffset,
        child: Row(
          children: [
            const Icon(
              Icons.done,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(width: 10),
            Text("Uploaded", style: style),
          ],
        ),
      ),
    );
  }

  TickerFuture goToUpload() {
    slideAnimation =
        Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
      CurvedAnimation(parent: slideController, curve: slideCurve),
    );
    slideController.reset();
    return slideController.forward();
  }

  TickerFuture goToUploading() {
    slideAnimation =
        Tween<Offset>(begin: Offset.zero, end: -uploadingOffset).animate(
      CurvedAnimation(parent: slideController, curve: slideCurve),
    );
    slideController.reset();
    return slideController.forward();
  }

  TickerFuture goToUploaded() {
    slideAnimation =
        Tween<Offset>(begin: -uploadingOffset, end: -uploadedOffset).animate(
      CurvedAnimation(parent: slideController, curve: slideCurve),
    );
    slideController.reset();
    return slideController.forward();
  }

  TickerFuture startProgress() {
    return controller.forward();
  }

  void onUploadTap() {
    if (controller.isAnimating || slideController.isAnimating) return;

    goToUploading().then((_) {
      startProgress().then((_) {
        controller.reset();
        goToUploaded().then((_) {
          Future.delayed(const Duration(milliseconds: 500), () {
            goToUpload();
          });
        });
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    slideController.dispose();
    super.dispose();
  }
}
