import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/pages/settingsPage.dart';
import 'package:voom/utility/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../widgets/m_list_tile.dart';

class ProfilePage extends StatefulWidget {
  static String id = '/profilePage';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //TODO: Put this image selected in shared preference
  File? _imageFile;
  final _picker = ImagePicker();
  String invi = 'voom/ref?user?23432';
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: kInactiveCardColor,
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 140.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: InkWell(
                    splashColor: kActiveCardColor,
                    onTap: () async => _pickImageFromGallery(),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: kBottomBarItemscolor,
                      child: CircleAvatar(
                        radius: 30,
                        child: ClipOval(
                          child: (_imageFile == null)
                              ? Image.asset('images/boy.png')
                              : Image.file(
                                  _imageFile!,
                                  fit: BoxFit.fill,
                                  width: 60,
                                  height: 60,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Barbara Scott',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: kmonochromcolorwhite, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 40, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Invite your friends',
                              style: GoogleFonts.poppins(
                                  color: kmonochromcolorwhite, fontSize: 14),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: const Size(0, 0),
                              ),
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: invi))
                                    .then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      duration: Duration(seconds: 1),
                                      backgroundColor: kSendFABcolor,
                                      content: Text(
                                        'Copied',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            color: kmonochromcolorwhite,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Copy link',
                                style: GoogleFonts.poppins(
                                    color: kBottomBarItemscolor, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Divider(
                          color: kmonochromcolorwhite,
                        ),
                      ),
                      ListTile(
                        // isThreeLine: true,
                        leading: const Icon(
                          FontAwesomeIcons.gift,
                          color: kBottomBarItemscolor,
                          size: 50.0,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Invite and earn 20 USD',
                            style: GoogleFonts.poppins(
                                color: kmonochromcolorwhite, fontSize: 18.0),
                          ),
                        ),
                        subtitle: Text(
                          'For every 2 friends who transfer over 200 USD.',
                          style: GoogleFonts.poppins(
                              color: kmonochromcolor2, fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                        child: Text(
                          'Account services',
                          style: GoogleFonts.poppins(
                              color: kmonochromcolorwhite, fontSize: 16.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Divider(
                          color: kmonochromcolorwhite,
                        ),
                      ),
                      MListTile(
                        iconData: Icons.settings,
                        text: 'General settings',
                        onPress: () {
                          Navigator.pushNamed(context, SettingsPage.id);
                        },
                      ),
                      MListTile(
                        iconData: Icons.account_balance,
                        text: 'Account details',
                        onPress: () {
                          //do something
                        },
                      ),
                      MListTile(
                        iconData: Icons.calendar_month,
                        text: 'Scheduled transfers',
                        onPress: () {
                          //do something
                        },
                      ),
                      MListTile(
                        iconData: Icons.fax,
                        text: 'Receive by email or phone',
                        onPress: () {
                          //do something
                        },
                      ),
                      MListTile(
                        iconData: Icons.menu_book,
                        text: 'Statement of account',
                        onPress: () {
                          //do something
                        },
                      ),
                      MListTile(
                        iconData: Icons.route,
                        text: 'Automatic currency conversion',
                        onPress: () {
                          //do something
                        },
                      ),
                      MListTile(
                        iconData: Icons.line_weight,
                        text: 'Account limits',
                        onPress: () {
                          //do something
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],

          //
        ),
      ),
    );
  }
}
