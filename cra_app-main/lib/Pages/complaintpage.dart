import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final List<String> deptList = <String>[
    'Hostel',
    'Maintenance',
    'Mess',
    'Technical'
  ];
  var dName = 'Hostel';

  Future<void> addToFireStore(complaint, uid) async {
    try {
      FirebaseFirestore.instance
          .collection("complaints")
          .doc(uid)
          .set(complaint);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Great!',
            message: "Let's work on your complaint..",

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.success,
          ),
        ));
    } catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'On Snap!',
            message: "Failed to register your complaint!!",

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.failure,
          ),
        ));
    }
  }

  addComplaint(complaintTitle, describe, suggest, dname) {
    var uid = FirebaseFirestore.instance.collection("complaints").doc().id;
    var complaintData = {
      "department": dname,
      "description": describe,
      "idnum": FirebaseAuth.instance.currentUser?.email,
      "publisher": "Jay Shah",
      "status": "Pending",
      "suggestion": suggest,
      "time": DateTime.now(),
      "title": complaintTitle,
      "upvote": 0,
      "uid": uid,
    };
    addToFireStore(complaintData, uid);
  }

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final suggestionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool submitted = false;

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      addComplaint(titleController.text, descriptionController.text,
          suggestionController.text, dName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Form(
        key: formKey,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const Text(
              'Complaint Form',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: submitted
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              validator: (title) {
                if (title == null || title.isEmpty) {
                  return 'Can\'t be empty';
                }
                return null;
              },
              controller: titleController,
              maxLines: 1,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF645CBB))),
                // fillColor: Colors.grey.shade200,
                // filled: true,
                labelText: 'Subject Of The Complaint',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                children: [
                  const Text(
                    'Select Department: ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  DropdownButton(
                    value: dName,
                    borderRadius: BorderRadius.circular(5),
                    items: deptList.map((String deptList) {
                      return DropdownMenuItem(
                        value: deptList,
                        child: Text(deptList),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dName = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: submitted
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              validator: (describe) {
                if (describe == null || describe.isEmpty) {
                  return 'Can\'t be empty';
                }
                return null;
              },
              controller: descriptionController,
              maxLines: null,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF645CBB))),
                // fillColor: Colors.grey.shade200,
                // filled: true,
                labelText: 'Describe Your Complaint',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: suggestionController,
              maxLines: null,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF645CBB))),
                // fillColor: Colors.grey.shade200,
                // filled: true,
                labelText: 'Suggestion',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //const CameraPick(),

            //const GalleryPick(),
            // Center(
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //     decoration: BoxDecoration(
            //       border: Border.all(width: 1, color: Colors.grey.shade400),
            //       borderRadius: BorderRadius.circular(3),
            //     ),
            //     child: Row(children: const [
            //       Text(
            //         'Select Image : ',
            //         style: TextStyle(fontWeight: FontWeight.w400),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       CameraPick(),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       GalleryPick(),
            //     ]),
            //   ),
            // ),
            // const SizedBox(
            //   height: 50,
            // ),
            GestureDetector(
              onTap: submit,
              child: Container(
                padding: const EdgeInsets.all(20),
                // margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: const Color(0xFF645CBB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            // SlideAction(
            //   borderRadius: 12,
            //   innerColor: const Color(0xFF645CBB),
            //   outerColor: Colors.white,
            //   sliderButtonIcon: const Icon(
            //     Icons.send_rounded,
            //     color: Colors.white,
            //   ),
            //   text: 'Swipe To Submit',
            //   textStyle: const TextStyle(
            //     color: Colors.black54,
            //     fontSize: 24,
            //   ),
            //   sliderRotate: false,
            //   onSubmit: addComplaint(titleController.text,
            //       descriptionController.text, suggestionController.text, dName),
            // ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
