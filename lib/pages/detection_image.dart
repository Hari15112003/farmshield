// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../theme/provider/dark_theme_provider.dart';

// ignore: must_be_immutable
class DetectionDeteils extends StatefulWidget {
  DetectionDeteils({super.key, required this.image, required this.results});

  File image;
  List results;

  @override
  State<DetectionDeteils> createState() => _DetectionDeteilsState();
}

class _DetectionDeteilsState extends State<DetectionDeteils> {
  @override
  Widget build(BuildContext context) {
    final languageChange = Provider.of<LanguageProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: widget.results.isEmpty
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Warning',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : Text(
                      'identifydisease'.tr,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.file(
                      widget.image,
                      fit: BoxFit.fill,
                    ))),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                widget.results.isEmpty
                    ? 'cautionerror'.tr
                    : widget.results[0]['label']
                        .toString()
                        .replaceAll(RegExp(r'\d+'), '')
                        .trim()
                        .toString()
                        .tr,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 8, 18, 8),
              child: Center(
                child: widget.results.isEmpty
                    ? const Text(
                        'Description : This is not a leaf object',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "Possible Causes".tr +
                            " :" +
                            '${Diseases(widget.results[0]['label'].toString(), languageChange)[0]}',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 8, 18, 8),
              child: Text(
                widget.results.isEmpty
                    ? ''
                    : "Possible Solution".tr +
                        " :" +
                        '${Diseases(widget.results[0]['label'].toString(), languageChange)[1]}',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  List Diseases(String name, languageChange) {
    String causes = '';
    String solution = '';
    String formattedDisease = name.replaceAll(RegExp(r'\d+'), '');

    if (languageChange.getDarkTheme == "ma") {
      switch (formattedDisease.trim()) {
        case "Apple Black Rot":
          causes = "कवक  कारणीभूत.";
          solution = "संक्रमित क्षेत्रे काढा, फंगीसायड वापरा.";
          break;

        case "Apple Cedar Rust":
          causes = "कवक  कारणीभूत.";
          solution = "जूनिपर पौधांची दूरस्थी करा, फंगीसायड वापरा.";
          break;

        case "Apple Healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "चंद्रोदय उत्पादन साधारित्य, नियमित मॉनिटरिंग.";
          break;

        case "Apple Scab":
          causes = "कवक Venturia inaequalis कारणीभूत.";
          solution = "फंगीसायड लागू करा, संक्रमित शाखांची कंटें काढा.";
          break;

        case "Blueberry Healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "चंद्रोदय उत्पादन साधारित्य, किडकांसाठी मॉनिटरिंग.";
          break;

        case "Cherry Healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "चंद्रोदय उत्पादन साधारित्य, नियमित मॉनिटरिंग.";
          break;

        case "Cherry Powdery mildew":
          causes = "कवक  कारणीभूत.";
          solution = "फंगीसायड लागू करा, संक्रमित भाग काढा.";
          break;

        case "Corn Cercospora leaf spot or Gray leaf spot":
          causes = "कवक Cercospora zeae-maydis कारणीभूत.";
          solution = "प्रतिरोधी प्रजांचा वापर करा, फंगीसायड लागू करा.";
          break;

        case "Corn Common rust":
          causes = "कवक  कारणीभूत.";
          solution = "प्रतिरोधी प्रजांचा वापर करा, फंगीसायड लागू करा.";
          break;

        case "Corn healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "फसळांची परिस्थिती बदला, चंद्रोदय उत्पादन साधारित्य.";
          break;

        case "Corn Northern Leaf Blight":
          causes = "कवक  कारणीभूत.";
          solution = "प्रतिरोधी प्रजांचा वापर करा, फंगीसायड लागू करा.";
          break;

        case "Grape Black rot":
          causes = "कवक  कारणीभूत.";
          solution = "संक्रमित क्षेत्रे काढा, फंगीसायड लागू करा.";
          break;

        case "Grape Esca (Black Measles)":
          causes = "विविध कवक, सहितकं  कारणीभूत.";
          solution = "संक्रमित डाळे काढा, फंगीसायड लागू करा.";
          break;

        case "Grape healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "चंद्रोदय उत्पादन साधारित्य, नियमित मॉनिटरिंग.";
          break;

        case "Grape Leaf blight (Isariopsis Leaf Spot)":
          causes = "कवक  कारणीभूत.";
          solution = "फंगीसायड लागू करा, संक्रमित भाग काढा.";
          break;

        case "Mango Anthracnose":
          causes = "कवक कारणीभूत.";
          solution = "संक्रमित क्षेत्रे काढा, फंगीसायड लागू करा.";
          break;

        case "Mango Bacterial Canker":
          causes = "बॅक्टीरियम  कारणीभूत.";
          solution = "संक्रमित क्षेत्रे काढा, तांबटाचे स्प्रे लागू करा.";
          break;

        case "Mango Cutting Weevil":
          causes = "कीडा  कारणीभूत.";
          solution = "उपयुक्त कीटकनाशक लागू करा, संक्रमित भाग काढा.";
          break;

        case "Mango Die Back":
          causes = "विविध कारके, कवक आणि पर्यावरणीय तंतूंसह कारणीभूत.";
          solution = "संक्रमित क्षेत्रे काढा, सांस्कृतिक प्रथा सुधारा.";
          break;

        case "Mango Gall Midge":
          causes = "कीडा  कारणीभूत.";
          solution = "संक्रमित पौध भाग काढा, कीटकनाशक लागू करा.";
          break;

        case "Mango Healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "चंद्रोदय उत्पादन साधारित्य, नियमित मॉनिटरिंग.";
          break;

        case "Mango Powdery Mildew":
          causes = "कवक Oidium mangiferae कारणीभूत.";
          solution = "फंगीसायड लागू करा, हवेची सरकुलेशन सुधारा.";
          break;

        case "Mango Sooty Mould":
          causes =
              "कीटकांच्या शहाण्यांनी निकाललेल्या मधूसूटीवर वाढलेल्या कवकाने कारणीभूत.";
          solution =
              "कीटकांचे नियंत्रण करा, संक्रमित क्षेत्रे सफाई आणि उपचार करा.";
          break;

        case "Orange Haunglongbing (Citrus greening)":
          causes = "बॅक्टीरियम कारणीभूत.";
          solution =
              "संक्रमित झाडे काढा, सिट्रस सायलिडचा नियंत्रण करा, एंटीबायोटिक लागू करा.";
          break;

        case "Peach Bacterial spot":
          causes = "बॅक्टीरियम  कारणीभूत.";
          solution = "संक्रमित शाखांची कंटें काढा, तांबटाचे स्प्रे लागू करा.";
          break;

        case "Peach healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "चंद्रोदय उत्पादन साधारित्य, नियमित मॉनिटरिंग.";
          break;

        case "Potato Early blight":
          causes = "कवक कारणीभूत.";
          solution =
              "फसलांचा परिस्थिती बदला, फंगीसायड लागू करा, चंद्रोदय उत्पादन साधारित्य.";
          break;

        case "Potato Bacteria":
          causes =
              "बटाट्याच्या बॅक्टेरिया रोगाची काही कारणे जमीनच्या कुळीत बॅक्टेरिया, पाणीची कमतरता, बटाट्याची दुर्बलता, आणि अशुद्ध कृत्रिम संयोजनांमध्ये आहेत.";
          solution =
              " बटाट्याच्या बॅक्टेरिया रोगाच्या नियंत्रणासाठी आयरोक्साइफ्लोरिड, कॉपर सल्फेट, आणि बॅक्टेरियल सायलेन या फवारण्यांचा उपयोग केला जातो.";
          break;
        case "Potato Fungi":
          causes =
              " बटाट्याच्या कवकरोगाची काही कारणे प्रादुर्भावित वातावरण, अतिरिक्त पाणी, अशुद्ध कृत्रिम संयोजन, आणि बटाट्याची दुर्बलता आहेत.";
          solution =
              "बटाट्याच्या कवकरोगाच्या नियंत्रणासाठी मॅन्कोझेब, सायलेन, आणि टॉपमैन या फवारण्यांचा उपयोग केला जातो.";
          break;
        case "Potato Nematode":
          causes =
              "बटाट्याच्या नेमाटोडची काही कारणे जमिनीतील नेमाटोडस, बटाट्याची दुर्बलता, प्रादुर्भावित वातावरण, आणि अतिरिक्त पाणी आहेत.";
          solution =
              " बटाट्याच्या नेमाटोडच्या नियंत्रणासाठी कार्बोसुल्फॅन, व्हॅजिलेन, आणि आईड्रेट-१५ या फवारण्यांचा उपयोग केला जातो.";
          break;
        case "Potato Pest":
          causes =
              "बटाट्याचे कीटकची काही कारणे पाणीची कमतरता, बटाट्याची दुर्बलता, आणि अतिरिक्त आपुण आहेत.";
          solution =
              "बटाट्याचे कीटक नियंत्रण करण्यासाठी इमिडाक्लोप्रिड, असेटमेथ्रीन, आणि डेल्टामेथ्रीन या कीटकनाशकांचा उपयोग केला जातो.";
          break;
        case "Potato Phytophthora":
          causes =
              "बटाट्याचा फायटोफ्थोराचा काही कारणे जमिनीतील नम्रता, पाणीची कमतरता, अतिरिक्त पाणी, आणि बटाट्याची दुर्बलता आहेत.";
          solution =
              "बटाट्याचा फायटोफ्थोराच्या नियंत्रणासाठी फोसेटील, मेटालाक्सिल, आणि फोसेटील-मॅटालाक्सिल या फवारण्यांचा उपयोग केला जातो.";
          break;

        case "Potato Virus":
          causes =
              "बटाट्याचे व्हायरस रोग किंवा रोगाची काही कारणे बटाट्याची दुर्बलता, वातावरणातील अनियमितता, आणि कीटक-रोगांच्या संक्रमणांमध्ये सामायिक आहेत";
          solution =
              "बटाट्याचे व्हायरस रोग नियंत्रण करण्यासाठी बॅक्टेरियल सायलेन, आणि असेटमेथ्रीन या कीटकनाशकांचा उपयोग केला जातो.";
          break;
        case "Potato Diseased":
          causes =
              "बटाट्याचे रोग विकृतींची काही कारणे अजूनही स्पष्टपणे नसलेली आहेत, परंतु ते बटाट्याच्या विविध कीटक-रोगांच्या संक्रमणाच्या सामायिक रहितीत, कीटकांच्या प्रभावात, किंवा पोषणातील कमतरत्वात प्राधान्य असू शकते.";
          solution =
              "बटाट्याच्या रोगांना नियंत्रण करण्यासाठी उपलब्ध केलेल्या रोगनिरोधक किंवा निरोधक उपाय करा.";
          break;

        case "Potato Healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "फसलांचा परिस्थिती बदला, चंद्रोदय उत्पादन साधारित्य.";
          break;

        case "Potato Late blight":
          causes = "ओमायसिट्स  कारणीभूत.";
          solution = "प्रतिरोधी प्रजांचा वापर करा, फंगीसायड लागू करा.";
          break;

        case "Raspberry healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "चंद्रोदय उत्पादन साधारित्य, किडकांसाठी मॉनिटरिंग.";
          break;

        case "Soybean healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "फसलांचा परिस्थिती बदला, चंद्रोदय उत्पादन साधारित्य.";
          break;

        case "Squash Powdery mildew":
          causes = "कवक कारणीभूत.";
          solution = "फंगीसायड लागू करा, प्रतिरोधी प्रजांचा वापर करा.";
          break;

        case "Strawberry healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "चंद्रोदय उत्पादन साधारित्य, किडकांसाठी मॉनिटरिंग.";
          break;

        case "Strawberry Leaf scorch":
          causes = "बॅक्टीरियम  कारणीभूत.";
          solution = "संक्रमित पाने काढा, कॉपर-आधारित स्प्रे लागू करा.";
          break;

        case "Tomato Bacterial spot":
          causes = "बॅक्टीरियम  कारणीभूत.";
          solution = "संक्रमित क्षेत्रे काढा, कॉपर-आधारित स्प्रे लागू करा.";
          break;

        case "Tomato Early blight":
          causes = "कवक  कारणीभूत.";
          solution =
              "पुनरावृत्ती करा, फंगीसायड लागू करा, चंद्रोदय उत्पादन साधारित्य.";
          break;

        case "Tomato healthy":
          causes = "कोणतेही विशिष्ट रोग ओळखले नाहीत.";
          solution = "पुनरावृत्ती करा, चंद्रोदय उत्पादन साधारित्य.";
          break;

        case "Tomato Late blight":
          causes = "ऊमायसेट  कारणीभूत.";
          solution = "प्रतिरोधी प्रजांचा वापर करा, फंगीसायड लागू करा.";
          break;

        case "Tomato Leaf Mold":
          causes = "कवक  कारणीभूत.";
          solution = "संक्रमित पाने काढा, फंगीसायड लागू करा.";
          break;

        case "Tomato Septoria leaf spot":
          causes = "कवक  कारणीभूत.";
          solution = "संक्रमित पाने काढा, फंगीसायड लागू करा.";
          break;

        case "Tomato Spider mites Two spotted spider mite":
          causes = "अणुस्थान तेंडु ऊरल्यामुळे कारणीभूत.";
          solution = "एकॅरिसायड्स लागू करा, उच्च आर्द्रता बनावट बनवा.";
          break;

        case "Tomato Target Spot":
          causes = "कवक कारणीभूत.";
          solution = "संक्रमित क्षेत्रे काढा, फंगीसायड लागू करा.";
          break;

        case "Tomato Mosaic Virus":
          causes = "विविध मोझेक व्हायरसांकिंवा कारणीभूत.";
          solution =
              "एफिड्सचा नियंत्रण करा, व्हायरस-प्रतिरोधी प्रजांचा वापर करा.";
          break;

        case "Tomato Yellow Leaf Cur Virus":
          causes = "व्ह्याइटफ्लाय-संचालित बेगोमोवायरस कारणीभूत.";
          solution =
              "व्ह्याइटफ्लायचा नियंत्रण करा, व्हायरस-प्रतिरोधी प्रजांचा वापर करा.";
          break;

        case "No Leaf Found":
          causes = "हे सठीस छायाचित्र नाही";
          solution = "आपल्याकडून हे पान कसंबर केलं नाही.";
          break;

        //cotton
        case "Cotton Aphids":
          causes =
              "कॉटन अफिड्सच्या कारणांमध्ये पाण्याची कमतरता, वातावरणातील अनियमितता, वाळणीचे कीटक, आणि कीटकपाण्याचा अस्तित्व असू शकतो.";
          solution =
              " कॉटन अफिडसारख्या कीटकांच्या नियंत्रणासाठी सायलेन, नीम तेल, कोकडी आणि एफ-टीकोट सारे वापरले जातात. प्राकृतिक दुष्टपरिणामक नव्हे आहेत आणि पारंपारिक प्रणालीवर श्रमाचा वापर कमी करतात.";
          break;
        case "Cotton Armyworm":
          causes =
              "कॉटन आर्मीवॉर्मच्या कारणांमध्ये पाण्याची कमतरता, मुख्यपणे फॅमिली नोटा नावाच्या अजेंडाच्या मुख्य असू शकते";
          solution =
              "कॉटन आर्मीवॉर्मनिया नियंत्रणासाठी थिओफेनमेट-मेथाइल, क्लोरोफेनापाईरस्ट, स्पिनोसॅड, फिप्रोनिल, आणि एस्ट्राडायंट्रेन वापरले जातात.";
          break;
        case "Cotton Bacterial Blight":
          causes =
              "कॉटन बॅक्टीरियल ब्लाईटच्या कारणांमध्ये वातावरणातील अनियमितता, जलदर्शन, बिजाची अनियमितता, आणि जैविक संक्रमणे शामिल आहेत.";
          solution =
              "कॉटन बॅक्टीरियल ब्लाईटच्या नियंत्रणासाठी कॅप्टन, जायड वित्रोल, कॉपर ऑक्सीक्लोराईड, आणि बोर्डोमिक्स आवश्यक आहेत.";
          break;
        case "Cotton Healthy":
          causes =
              "कॉटन आरोग्यकर्ता असल्याची काही कारणे पाण्याची पुरवठा, शुष्क वातावरण, संतुलित पोषण, आणि कीटक-रोग नियंत्रणासाठी सुसंगत कार्यवाही आहेत.";
          solution =
              " समजूत, पाण्याची चांगली आपुण, संतुलित पोषण, आणि कीटक-रोग नियंत्रण या सर्व परिप्रेक्ष्यात तांत्रिक काम करावे लागेल.";
          break;
        case "Cotton Powdery Mildew":
          causes =
              "कॉटन पावडरी माईल्ड्युच्या कारणांमध्ये मोठ्या प्रमाणातील पाणी, वातावरणातील अनियमितता, आणि रोगाच्या कीटकांच्या अस्तित्वामुळे आहे.";
          solution =
              "कॉटन पावडरी माईल्ड्यु नियंत्रण करण्यासाठी, सायलेन, सल्फर, फ्लुवोफिनामाईड, आणि ट्रायडीकॉनाझोल वापरले जातात.";
          break;
        case "Cotton Target Spot":
          causes =
              "कॉटन टार्गेट स्पॉटच्या कारणांमध्ये पाण्याची पुरवठा, वातावरणातील अनियमितता, आणि कीटक-रोग नियंत्रणाच्या कमतरता असू शकते.";
          solution =
              "कॉटन टार्गेट स्पॉटनियंत्रणासाठी थिओफेनमेट-मेथाइल, कॉपर ऑक्सीक्लोराईड, मैन्कोझेब, आणि ट्रायडीमार्क वापरले जातात.";
          break;

        case "Guava Canker":
          causes =
              "गुवाच्या कॅन्करच्या कारणांमध्ये जलदर्शन, अतिरिक्त आपुण, कीटक-रोगांची संक्रमणे, आणि आपल्याला पुढे प्रसारित करणाऱ्या सफरच्या कीटकांचे अस्तित्व असू शकते.";
          solution =
              " गुवाच्या कॅन्करच्या नियंत्रणासाठी कॉपर सल्फेट, ब्ल्यू कॉपर, कॅप्टन, आणि मॅनेब या फवारण्यांचा उपयोग केला जातो.";
          break;
        case "Guava Dot":
          causes =
              "गुवाच्या डॉटच्या कारणांमध्ये रक्तात लाल पडणारे डॉट्स, प्रादुर्भावित प्रतिक्रिया, अतिरिक्त आपुण, विषाणूंची संक्रमणे, आणि वातावरणातील अनियमितता या सर्व कारकांची शामिल आहेत.";
          solution =
              "गुवाच्या डॉटच्या नियंत्रणासाठी कॉपर सल्फेट, कॅप्टन, आणि सैडेंझॅन का मांझेब या फवारण्यांचा उपयोग केला जातो.";
          break;
        case "Guava Mummification":
          causes =
              "गुवाची मुमीफिकेशनची काही कारणे मृदगळे पाणी, कीटक-रोगांच्या संक्रमणे, अतिरिक्त आपुण, आणि विषाणूंची संक्रमणे शामिल आहेत.";
          solution =
              "गुवाची मुमीफिकेशनच्या नियंत्रणासाठी कॅप्टन, मॅनेब, आणि कॉप्पर हायड्रॉक्साईड या फवारण्यांचा उपयोग केला जातो";
          break;
        case "Guava Rust":
          causes =
              "गुवाची जंजीरीची काही कारणे प्रादुर्भावित प्रतिक्रिया, विषाणूंच्या संक्रमणे, अतिरिक्त आपुण, वातावरणातील अनियमितता, आणि अनियमित पोषण आहेत.";
          solution =
              "गुवाची जंजीरीनियंत्रणासाठी कॅप्टन, कॉप्पर हायड्रॉक्साईड, आणि स्वप्नेतले फवारण्यांचा उपयोग केला जातो.";
          break;
        case "Guava Diseased":
          causes =
              "गुवाचे रोग विकृतींची काही कारणे अजूनही स्पष्टपणे नसलेली आहेत, परंतु ते कॉटन विषाणूच्या संक्रमणाच्या कारणांच्या सामायिक रहितीत, कीटकांच्या प्रभावात, किंवा पोषणातील कमतरत्वात प्राधान्य असू शकते.";
          solution =
              "गुवाच्या रोगांना नियंत्रण करण्यासाठी उपलब्ध केलेल्या रोगनिरोधक किंवा निरोधक उपाय करा.";
          break;

        default:
          causes = "";
          solution = "";
          break;
      }

      return [causes, solution];
    } else {
      switch (formattedDisease.trim()) {
        case "Apple Black Rot":
          causes = "Caused by the fungus Botryosphaeria obtusa.";
          solution = "Prune infected areas, use fungicides.";
          break;

        case "Apple Cedar Rust":
          causes = "Caused by the fungus Gymnosporangium juniperi-virginianae.";
          solution = "Remove nearby juniper plants, apply fungicides.";
          break;

        case "Apple Healthy":
          causes = "No specific disease identified.";
          solution = "Maintain good orchard hygiene, regular monitoring.";
          break;

        case "Apple Scab":
          causes = "Caused by the fungus Venturia inaequalis.";
          solution = "Apply fungicides, prune infected branches.";
          break;

        case "Blueberry Healthy":
          causes = "No specific disease identified.";
          solution = "Maintain good field hygiene, monitor for pests.";
          break;

        case "Cherry Healthy":
          causes = "No specific disease identified.";
          solution = "Maintain good orchard hygiene, regular monitoring.";
          break;

        case "Cherry Powdery mildew":
          causes = "Caused by Podosphaera spp.";
          solution = "Apply fungicides, prune affected parts.";
          break;

        case "Corn Cercospora leaf spot or Gray leaf spot":
          causes = "Caused by the fungus Cercospora zeae-maydis.";
          solution = "Use resistant varieties, apply fungicides.";
          break;

        case "Corn Common rust":
          causes = "Caused by the fungus Puccinia sorghi.";
          solution = "Use resistant varieties, apply fungicides.";
          break;

        case "Corn healthy":
          causes = "No specific disease identified.";
          solution = "Rotate crops, practice good field hygiene.";
          break;

        case "Corn Northern Leaf Blight":
          causes = "Caused by the fungus Exserohilum turcicum.";
          solution = "Use resistant varieties, apply fungicides.";
          break;

        case "Grape Black rot":
          causes = "Caused by the fungus Guignardia bidwellii.";
          solution = "Prune infected areas, apply fungicides.";
          break;

        case "Grape Esca (Black Measles)":
          causes = "Caused by multiple fungi including Phaeoacremonium spp.";
          solution = "Prune infected vines, apply fungicides.";
          break;

        case "Grape healthy":
          causes = "No specific disease identified.";
          solution = "Maintain good vineyard hygiene, regular monitoring.";
          break;

        case "Grape Leaf blight (Isariopsis Leaf Spot)":
          causes = "Caused by the fungus Isariopsis spp.";
          solution = "Apply fungicides, prune affected parts.";
          break;

        case "Mango Anthracnose":
          causes = "Caused by the fungus Colletotrichum gloeosporioides.";
          solution = "Prune infected areas, apply fungicides.";
          break;

        case "Mango Bacterial Canker":
          causes = "Caused by the bacterium Xanthomonas campestris.";
          solution = "Prune infected areas, apply copper-based sprays.";
          break;

        case "Mango Cutting Weevil":
          causes = "Caused by the weevil Hypomeces squamosus.";
          solution = "Apply appropriate insecticides, prune affected parts.";
          break;

        case "Mango Die Back":
          causes =
              "Caused by various factors, including fungi and environmental stress.";
          solution = "Prune infected areas, improve cultural practices.";
          break;

        case "Mango Gall Midge":
          causes = "Caused by the midge Procontarinia mangiferae.";
          solution =
              "Prune and destroy affected plant parts, apply insecticides.";
          break;

        case "Mango Healthy":
          causes = "No specific disease identified.";
          solution = "Maintain good orchard hygiene, regular monitoring.";
          break;

        case "Mango Powdery Mildew":
          causes = "Caused by the fungus Oidium mangiferae.";
          solution = "Apply fungicides, improve air circulation.";
          break;

        case "Mango Sooty Mould":
          causes =
              "Caused by the growth of sooty mold on honeydew excreted by insects.";
          solution = "Control insect pests, clean and treat affected areas.";
          break;

        case "Mango Diseased":
          causes =
              "Caused by the growth of sooty mold on honeydew excreted by insects.";
          solution = "Control insect pests, clean and treat affected areas.";
          break;

        case "Orange Haunglongbing (Citrus greening)":
          causes = "Caused by the bacterium Candidatus Liberibacter asiaticus.";
          solution =
              "Remove infected trees, control citrus psyllid, apply antibiotics.";
          break;

        case "Peach Bacterial spot":
          causes = "Caused by the bacterium Xanthomonas arboricola pv. pruni.";
          solution = "Prune infected branches, apply copper-based sprays.";
          break;

        case "Peach healthy":
          causes = "No specific disease identified.";
          solution = "Maintain good orchard hygiene, regular monitoring.";
          break;

        case "Potato Early blight":
          causes = "Caused by the fungus Alternaria solani.";
          solution =
              "Rotate crops, apply fungicides, practice good field hygiene.";
          break;

        case "Potato Bacteria":
          causes =
              "Potato bacterial disease can be caused by factors such as soil-borne bacteria, water scarcity, potato vulnerability, and improper artificial mixtures.";
          solution =
              "Airoxifloride, Copper sulfate, and Bacterial saaylene sprays are used for controlling potato bacterial disease";
          break;
        case "Potato Fungi":
          causes =
              "Potato fungal disease can be caused by factors such as conducive environment, excessive water, improper artificial mixtures, and potato vulnerability.";
          solution =
              "Maneb, Saaylene, and Topman sprays are used for controlling potato fungal disease.";
          break;
        case "Potato Nematode":
          causes =
              " Potato nematode disease can be caused by factors such as soil nematodes, potato vulnerability, conducive environment, and excessive water.";
          solution =
              "Carbosulfan, Vasilene, and Idrate-15 sprays are used for controlling potato nematode disease.";
          break;
        case "Potato Pest":
          causes =
              "Potato pest infestation can be caused by factors such as water scarcity, potato vulnerability, and excessive pruning.";
          solution =
              "Imidacloprid, Acetamethrin, and Deltamethrin insecticides are used for controlling potato pests.";
        case "Potato Phytophthora":
          causes =
              "Potato Phytophthora disease can be caused by factors such as soil acidity, water scarcity, excessive water, and potato vulnerability.";
          solution =
              "Fosetyl, Metalaxyl, and Fosetyl-Metalaxyl sprays are used for controlling potato Phytophthora disease.";
          break;
        case "Potato Virus":
          causes =
              "Potato virus disease or virus infection can be caused by factors such as potato vulnerability, environmental irregularities, and pest-disease infections.";
          solution =
              "Bacterial saaylene and Acetamethrin insecticides are used for controlling potato virus disease.";
          break;
        case "Potato Diseased":
          causes =
              "The causes of potato diseases are not yet clearly defined, but they may primarily result from various pest-disease infections, pest infestations, or nutrient deficiencies";
          solution =
              "Employ available disease-resistant or preventive measures to control potato diseases";
          break;

        case "Potato Healthy":
          causes = "No specific disease identified.";
          solution = "Rotate crops, practice good field hygiene.";
          break;

        case "Potato Late blight":
          causes = "Caused by the oomycete Phytophthora infestans.";
          solution = "Use resistant varieties, apply fungicides.";
          break;

        case "Raspberry healthy":
          causes = "No specific disease identified.";
          solution = "Maintain good field hygiene, monitor for pests.";
          break;

        case "Soybean healthy":
          causes = "No specific disease identified.";
          solution = "Rotate crops, practice good field hygiene.";
          break;

        case "Squash Powdery mildew":
          causes = "Caused by the fungus Podosphaera spp.";
          solution = "Apply fungicides, plant resistant varieties.";
          break;

        case "Strawberry healthy":
          causes = "No specific disease identified.";
          solution = "Maintain good field hygiene, monitor for pests.";
          break;

        case "Strawberry Leaf scorch":
          causes = "Caused by the bacterium Xanthomonas fragariae.";
          solution = "Prune infected leaves, apply copper-based sprays.";
          break;

        case "Tomato Bacterial spot":
          causes =
              "Caused by the bacterium Xanthomonas campestris pv. vesicatoria.";
          solution = "Prune infected areas, apply copper-based sprays.";
          break;

        case "Tomato Early blight":
          causes = "Caused by the fungus Alternaria solani.";
          solution =
              "Rotate crops, apply fungicides, practice good field hygiene.";
          break;

        case "Tomato healthy":
          causes = "No specific disease identified.";
          solution = "Rotate crops, practice good field hygiene.";
          break;

        case "Tomato Late blight":
          causes = "Caused by the oomycete Phytophthora infestans.";
          solution = "Use resistant varieties, apply fungicides.";
          break;

        case "Tomato Leaf Mold":
          causes = "Caused by the fungus Passalora fulva.";
          solution = "Prune affected leaves, apply fungicides.";
          break;

        case "Tomato Septoria leaf spot":
          causes = "Caused by the fungus Septoria lycopersici.";
          solution = "Prune infected leaves, apply fungicides.";
          break;

        case "Tomato Spider mites Two spotted spider mite":
          causes = "Caused by Tetranychus urticae.";
          solution = "Apply acaricides, maintain proper humidity.";
          break;

        case "Tomato Target Spot":
          causes = "Caused by the fungus Corynespora cassiicola.";
          solution = "Prune infected areas, apply fungicides.";
          break;

        case "Tomato Mosaic Virus":
          causes = "Caused by various mosaic viruses.";
          solution = "Control aphids, use virus-resistant varieties.";
          break;

        case "Tomato Yellow Leaf Cur Virus":
          causes = "Caused by the whitefly-transmitted begomovirus.";
          solution = "Control whiteflies, use virus-resistant varieties.";
          break;

        case "No Leaf Found":
          causes = "This is not an Proper image";
          solution = "We have not trained for this leaf";
          break;
// End of the list
        //cotton
        case "Cotton Aphids":
          causes =
              " Lack of water, environmental irregularities, pest infestations, and the presence of honeydew-producing insects can contribute to cotton aphids.";
          solution =
              "Insecticides like pyrethroids, neem oil, soaps, and F-Temik are commonly used for controlling cotton aphids. They have minimal adverse effects on the environment and reduce the use of conventional systems";
          break;
        case "Cotton Armyworm":
          causes =
              "Cotton armyworms primarily thrive in conditions of water scarcity and prefer plants from the family Noctuidae.";
          solution =
              "Insecticides like Thiofenamate-methyl, Chlorfenapyr, Spinosad, Fipronil, and Estradiol are used for controlling cotton armyworms.";
          break;
        case "Cotton Bacterial Blight":
          causes =
              "Environmental irregularities, excessive moisture, seed irregularities, and biological infections are involved in the causes of cotton bacterial blight.";
          solution =
              "Captan, Jayde Vitrol, Copper oxychloride, and Bordeaux mixture are essential for controlling cotton bacterial blight.";
          break;
        case "Cotton Healthy":
          causes =
              "Adequate water supply, dry environment, balanced nutrition, and appropriate pest-disease control measures contribute to cotton health.";
          solution =
              "Proper management of water, good irrigation, balanced nutrition, and effective pest-disease control are essential for maintaining cotton health.";
          break;
        case "Cotton Powdery Mildew":
          causes =
              "High humidity, environmental irregularities, and the presence of disease-causing pests contribute to cotton powdery mildew.";
          solution =
              "For controlling cotton powdery mildew, pesticides like Sulfur, Fluofenamide, and Triadimefon are commonly used.";
          break;
        case "Cotton Target Spot":
          causes =
              "Insufficient water supply, environmental irregularities, and lack of pest-disease control measures can contribute to cotton target spot.";
          solution =
              "Thiofenamate-methyl, Copper oxychloride, Maneb, and Triadimefon are used for controlling cotton target spot.";

          break;
        case "Guava Canker":
          causes =
              "Factors contributing to guava canker include excessive moisture, over-fertilization, pest-disease infections, and the presence of vector insects spreading the disease";
          solution =
              "Copper sulfate, Blue copper, Captan, and Maneb are used for controlling guava canker.";
          break;
        case "Guava Dot":
          causes =
              "Guava dot is caused by factors such as red dots appearing on leaves, hypersensitivity reactions, over-fertilization, bacterial infections, and environmental irregularities.";
          solution =
              "Copper sulfate, Captan, and Saedenjan Ka Maneb are used for controlling guava dot.";
          break;
        case "Guava Mummification":
          causes =
              "Guava mummification can be caused by factors such as stagnant water, pest-disease infections, over-fertilization, and bacterial infections.";
          solution =
              "Captan, Maneb, and Copper Hydroxide are used for controlling guava mummification.";
          break;
        case "Guava Rust":
          causes =
              "Guava rust can be caused by factors such as hypersensitivity reactions, bacterial infections, over-fertilization, environmental irregularities, and nutrient imbalances";
          solution =
              "Captan, Copper Hydroxide, and Dreamt applied sprays are used for controlling guava rust";
          break;
        case "Guava Diseased":
          causes =
              "The causes of guava diseases are not yet clearly defined, but they may primarily result from cotton bacterial infections, pest infestations, or nutrient deficiencies";
          solution =
              "Employ available disease-resistant or preventive measures to control guava diseases.";
          break;
        default:
          causes = "";
          solution = "";
          break;
      }

      return [causes, solution];
    }
  }
}
