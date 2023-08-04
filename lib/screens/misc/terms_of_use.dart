import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';

class TermsOfUse extends StatelessWidget {
  final List<InfoData> termsData = const [
    InfoData(
        title: 'Title1',
        description:
            'Description 1 To avail the Service as a validly registered user in accordance with the terms of this Agreement, you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting To avail the Service as a validly registered user in accordance with the terms of this Agreement , you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting'),
    InfoData(
        title: 'Title1',
        description:
            'Description 1 To avail the Service as a validly registered user in accordance with the terms of this Agreement, you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting To avail the Service as a validly registered user in accordance with the terms of this Agreement , you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting'),
    InfoData(
        title: 'Title1',
        description:
            'Description 1 To avail the Service as a validly registered user in accordance with the terms of this Agreement, you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting To avail the Service as a validly registered user in accordance with the terms of this Agreement , you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting'),
    InfoData(
        title: 'Title1',
        description:
            'Description 1 To avail the Service as a validly registered user in accordance with the terms of this Agreement, you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting To avail the Service as a validly registered user in accordance with the terms of this Agreement , you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting'),
    InfoData(
        title: 'Title1',
        description:
            'Description 1 To avail the Service as a validly registered user in accordance with the terms of this Agreement, you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting To avail the Service as a validly registered user in accordance with the terms of this Agreement , you may need to register on our website and/or on the Software through any means, which may involve (without limitation), setting up a profile, connecting')
  ];

  const TermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: BackNavigationBar(
        title: LocalizationString.termsOfUse,backTapHandler: (){
        Get.back();
      },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (InfoData data in termsData)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
          ],
        ).hP16,
      ),
    );
  }
}
