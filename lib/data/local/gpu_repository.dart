import 'package:cryptotool/models/models.dart';

// ignore: avoid_classes_with_only_static_members
class GpuRepository {

  static List<Videocard> availableList = const [
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3090',
      onlinerGpuName: 'rtx3090',
      nicehashId: 'ff9715b2-78b2-4903-9962-2c03a7d4118b',
      hashRate: 120,
      gpuDescription: 'NVIDIA RTX 3090 была выпущена 24 сентября 2020 г.',
      expectedPrice: 2737,
      powerUsage: 300
    ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3080 Ti LHR',
      onlinerGpuName: 'rtx3080ti',
      nicehashId: '9b902b12-2de0-4eca-a7a4-373ae4cdeb90',
      hashRate: 80,
      gpuDescription: 'NVIDIA RTX 3080 Ti LHR была выпущена 3 июня 2021 г..',
      expectedPrice: 1829,
      powerUsage: 320,
      lhr: true
    ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3080',
      onlinerGpuName: 'rtx3080',
      nicehashId: '1821b5f3-581f-4d0a-9ae1-8db2e2f758e6',
      hashRate: 96,
      gpuDescription: 'NVIDIA RTX 3080 была выпущена 17 сентября 2020 г.',
      expectedPrice: 1666,
      powerUsage: 240
    ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3080 LHR',
      onlinerGpuName: 'rtx3080',
      nicehashId: '80492f0b-d8d5-4909-b69b-1d1f2364af0b',
      hashRate: 48,
      gpuDescription: 'NVIDIA RTX 3080 LHR была выпущена 17 сентября 2020 г.',
      expectedPrice: 1485,
      powerUsage: 250,
      lhr: true
    ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3070 Ti LHR',
      onlinerGpuName: 'rtx3070ti',
      nicehashId: '16f0110e-2dd7-4f80-adf2-d1dbf6d33df0',
      hashRate: 53,
      gpuDescription: 'NVIDIA RTX 3070 Ti LHR была выпущена 10 июня 2021 г.',
      expectedPrice: 1124,
      powerUsage: 150,
      lhr: true
    ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3070',
      onlinerGpuName: 'rtx3070',
      nicehashId: '4e33d395-5c8a-4fb9-98c2-8af1f12bce2a',
      hashRate: 60.56,
      gpuDescription: 'NVIDIA RTX 3070 была выпущена 29 октября 2020 г.',
      expectedPrice: 1144,
      powerUsage: 125
    ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3070 LHR',
      onlinerGpuName: 'rtx3070',
      nicehashId: '49640e23-3b63-46f2-8fa3-ad2d567007f9',
      hashRate: 41,
      gpuDescription: 'NVIDIA RTX 3070 LHR была выпущена 29 октября 2020 г.',
      expectedPrice: 1023,
      powerUsage: 125,
      lhr: true
    ),
    // 21.01.2021
    // Videocard(
    //   gpuName: "AMD VII",
    //   onlinerGpuName: "",
    //   nicehashId: "",
    //   hashRate: 80.0,
    //   gpuDescription: "AMD VII была выпущена 7 февраля 2019 г.",
    //   expectedPrice: 870.0,
    //   powerUsage: 210.0
    // ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3060 Ti',
      onlinerGpuName: 'rtx3060ti',
      nicehashId: 'a16e5f4e-1665-486a-bd5a-450b15a9a563',
      hashRate: 60.5,
      gpuDescription: 'NVIDIA RTX 3060 Ti была выпущена 2 декабря 2020 г.',
      expectedPrice: 907,
      powerUsage: 125
    ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3060 Ti LHR',
      onlinerGpuName: 'rtx3060ti',
      nicehashId: '443cc946-0283-48f1-936e-fc26ffa13b77',
      hashRate: 41,
      gpuDescription: 'NVIDIA RTX 3060 Ti LHR была выпущена 2 декабря 2020 г.',
      expectedPrice: 844,
      powerUsage: 125,
      lhr: true
    ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3060',
      onlinerGpuName: 'rtx3060',
      nicehashId: '3cd8829c-c420-4e6a-b1d3-030cea712433',
      hashRate: 49,
      gpuDescription: 'NVIDIA RTX 3060 Ti была выпущена 25 февраля 2021 г.',
      expectedPrice: 800,
      powerUsage: 135
    ),
    // 05.01.2022
    Videocard(
      gpuName: 'NVIDIA RTX 3060 LHR',
      onlinerGpuName: 'rtx3060',
      nicehashId: '1cb7542d-93d8-479c-9683-bfddfdf25370',
      hashRate: 33,
      gpuDescription: 'NVIDIA RTX 3060 Ti LHR была выпущена 25 февраля 2021 г.',
      expectedPrice: 708,
      powerUsage: 135
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'AMD RX 5700 XT',
      onlinerGpuName: 'rx5700xt',
      nicehashId: 'c5fafd85-6376-4aa6-b69d-40938f9c03de',
      hashRate: 55,
      gpuDescription: 'AMD RX 5700 XT была выпущена 1 июля 2019 г.',
      expectedPrice: 520.90,
      powerUsage: 140
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'AMD RX 5700',
      onlinerGpuName: 'rx5700',
      nicehashId: '7112d53c-dc37-43ec-a400-d50f1dcd2b7d',
      hashRate: 55,
      gpuDescription: 'AMD RX 5700 была выпущена 1 июля 2019 г.',
      expectedPrice: 510.90,
      powerUsage: 140
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'NVIDIA RTX 2080 Ti',
      onlinerGpuName: 'rtx2080ti',
      nicehashId: 'eeb685a7-f5be-451b-849c-debb3c4cebd1',
      hashRate: 55.2,
      gpuDescription: 'NVIDIA RTX 2080 Ti была выпущена 20 сентября 2018 г.',
      expectedPrice: 1020.73,
      powerUsage: 180
    ),
    // 21.01.2021
    // Videocard(
    //   gpuName: 'NVIDIA GTX 1080 Ti',
    //   onlinerGpuName: 'gtx1080ti',
    //   nicehashId: '6e88ab8b-7081-4170-84b5-a36686ec98fe',
    //   hashRate: 49,
    //   gpuDescription: 'NVIDIA GTX 1080 Ti была выпущена 10 марта 2017 г.',
    //   expectedPrice: 350.27,
    //   powerUsage: 180
    // ),
    Videocard(
      gpuName: 'NVIDIA RTX 2070 SUPER',
      onlinerGpuName: 'rtx2070super',
      nicehashId: '7ca5c855-b3a1-44e1-836b-eaf80916e766',
      hashRate: 44.3,
      gpuDescription: 'NVIDIA RTX 2070 SUPER была выпущена 9 июля 2019 г.',
      expectedPrice: 540,
      powerUsage: 165
    ),
    Videocard(
      gpuName: 'NVIDIA RTX 2060 SUPER',
      onlinerGpuName: 'rtx2060super',
      nicehashId: '091775e3-2665-4a61-8e96-93102ee8228d',
      hashRate: 44.3,
      gpuDescription: 'NVIDIA RTX 2060 SUPER была выпущена 9 июля 2019 г.',
      expectedPrice: 439,
      powerUsage: 135
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'NVIDIA RTX 2070',
      onlinerGpuName: 'rtx2070',
      nicehashId: '2a3857bc-a0ac-4e16-9ad4-33469ac1d54b',
      hashRate: 40,
      gpuDescription: 'NVIDIA RTX 2070 была выпущена 17 октября 2018 г.',
      expectedPrice: 465.94,
      powerUsage: 140
    ),
    Videocard(
      gpuName: 'NVIDIA RTX 2080 SUPER',
      onlinerGpuName: 'rtx2080super',
      nicehashId: 'f213e671-7b69-468f-8e05-5a2fa4553c45',
      hashRate: 44.3,
      gpuDescription: 'NVIDIA RTX 2080 SUPER была выпущена 23 июля 2019 г.',
      expectedPrice: 749,
      powerUsage: 190
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'NVIDIA RTX 2080',
      onlinerGpuName: 'rtx2080',
      nicehashId: 'ff4c7c32-433d-4e00-8db9-809ee6bd6386',
      hashRate: 40.1,
      gpuDescription: 'NVIDIA RTX 2080 была выпущена 20 сентября 2018 г.',
      expectedPrice: 719.54,
      powerUsage: 160
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'AMD RX 5600 XT',
      onlinerGpuName: 'rx5600xt',
      nicehashId: 'dfc236e2-a519-490b-8f61-4e44ea25df26',
      hashRate: 40.5,
      gpuDescription: 'AMD RX 5600 XT была выпущена 21 января 2020 г.',
      expectedPrice: 379.99,
      powerUsage: 110
    ),
    // 21.01.2021
    // Videocard(
    //   gpuName: "AMD RX Vega 64",
    //   onlinerGpuName: "",
    //   nicehashId: "314747b5-018f-4f71-a4c4-4be214d9e0ff",
    //   hashRate: 46.0,
    //   gpuDescription: "AMD RX Vega 64 была выпущена 28 сентября 2017 г.",
    //   expectedPrice: 340.49,
    //   powerUsage: 200.0
    // ),
    // Videocard(
    //   gpuName: "NVIDIA P104-100",
    //   onlinerGpuName: "",
    //   nicehashId: "5a8d1455-d9dc-425d-8df1-d0565681da39",
    //   hashRate: 37.0,
    //   gpuDescription: "NVIDIA P104-100 была выпущена 11 декабря 2017 г.",
    //   expectedPrice: 199.00,
    //   powerUsage: 135.0
    // ),
    // 21.01.2021
    Videocard(
      gpuName: 'AMD RX Vega 56',
      onlinerGpuName: 'rxvega56',
      nicehashId: '6cdc832d-fe78-4c58-a2c3-905d7b81612d',
      hashRate: 45,
      gpuDescription: 'AMD RX Vega 56 была выпущена 28 сентября 2017 г.',
      expectedPrice: 300.90,
      powerUsage: 180
    ),
    // 21.01.2021
    // Videocard(
    //   gpuName: 'NVIDIA GTX 1080',
    //   onlinerGpuName: 'gtx1080',
    //   nicehashId: 'f0893a52-2ec5-4c03-bf3c-2d00695c6873',
    //   hashRate: 34,
    //   gpuDescription: 'NVIDIA GTX 1080 была выпущена 27 мая 2016 г.',
    //   expectedPrice: 239.69,
    //   powerUsage: 170
    // ),
    // 21.01.2021
    Videocard(
      gpuName: 'AMD RX 580 8GB',
      onlinerGpuName: 'radeonrx580',
      nicehashId: '1946e0fa-f67c-41f1-8812-2bb30469b7e5',
      hashRate: 30.2,
      gpuDescription: 'AMD RX 580 8GB была выпущена 18 апреля 2017 г.',
      expectedPrice: 155.50,
      powerUsage: 130
    ),
    // Videocard(
    //   gpuName: 'AMD RX 480 8GB',
    //   onlinerGpuName: 'radeonrx480',
    //   nicehashId: '58fa802b-460d-48be-be6e-2bb3824136f2',
    //   hashRate: 31.5,
    //   gpuDescription: 'AMD RX 480 8GB была выпущена 1 июля 2016 г.',
    //   expectedPrice: 145,
    //   powerUsage: 120
    // ),
    Videocard(
      gpuName: 'AMD RX 570 8GB',
      onlinerGpuName: 'radeonrx570',
      nicehashId: '009ee085-bbad-456d-a9f9-a75bb75f1f8a',
      hashRate: 30.9,
      gpuDescription: 'AMD RX 570 8GB была выпущена 18 апреля 2017 г.',
      expectedPrice: 149.50,
      powerUsage: 120
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'NVIDIA GTX 1660 SUPER',
      onlinerGpuName: 'gtx1660super',
      nicehashId: '94404838-ef17-4a6b-a97b-d8deb83f26e0',
      hashRate: 30.2,
      gpuDescription: 'NVIDIA GTX 1660 SUPER была выпущена 29 октября 2019 г.',
      expectedPrice: 295,
      powerUsage: 80
    ),
    // 21.01.2021
    // Videocard(
    //   gpuName: 'NVIDIA GTX 1070 Ti',
    //   onlinerGpuName: 'gtx1070ti',
    //   nicehashId: '9282809e-94ae-4cb3-a8db-8941d98f3d09',
    //   hashRate: 30.5,
    //   gpuDescription: 'NVIDIA GTX 1070 Ti была выпущена 2 ноября 2017 г.',
    //   expectedPrice: 215.18,
    //   powerUsage: 130
    // ),
    // Videocard(
    //   gpuName: "AMD RX 470 8GB",
    //   onlinerGpuName: "x470",
    //   nicehashId: "e1276e68-567d-4fa6-b73f-cc4b5045dce2",
    //   hashRate: 29.7,
    //   gpuDescription: "AMD RX 470 8GB была выпущена 1 сентября 2016 г.",
    //   expectedPrice: 125.00,
    //   powerUsage: 120.0
    // ),
    // 21.01.2021
    Videocard(
      gpuName: 'NVIDIA GTX 1660 Ti',
      onlinerGpuName: 'gtx1660ti',
      nicehashId: '182c129a-9432-471e-9ed6-bfedac26ae47',
      hashRate: 28,
      gpuDescription: 'NVIDIA GTX 1660 Ti была выпущена 22 февраля 2019 г.',
      expectedPrice: 330.50,
      powerUsage: 80
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'NVIDIA RTX 2060',
      onlinerGpuName: 'rtx2060',
      nicehashId: '7b1e338c-d881-4afb-83d3-c91819ecae80',
      hashRate: 30,
      gpuDescription: 'NVIDIA RTX 2060 была выпущена 15 января 2019 г.',
      expectedPrice: 385.49,
      powerUsage: 120
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'NVIDIA GTX 1070',
      onlinerGpuName: 'gtx1070',
      nicehashId: '5c76b698-a2d9-445c-aad4-38964dd35421',
      hashRate: 30,
      gpuDescription: 'NVIDIA GTX 1070 была выпущена 10 июня 2016 г.',
      expectedPrice: 193.47,
      powerUsage: 140
    ),
    Videocard(
      gpuName: 'AMD RX 5500 XT 8GB',
      onlinerGpuName: 'rx5500xt',
      nicehashId: '2ce7e7f5-462f-44a1-8473-2ba6abd87179',
      hashRate: 26.5,
      gpuDescription: 'AMD RX 5500 XT 8GB была выпущена 12 декабря 2019 г.',
      expectedPrice: 249,
      powerUsage: 80
    ),
    // 21.01.2021
    Videocard(
      gpuName: 'NVIDIA GTX 1660',
      onlinerGpuName: 'gtx1660',
      nicehashId: '1741f9cd-1ce1-4fa0-9157-dfaedb90d191',
      hashRate: 23,
      gpuDescription: 'NVIDIA GTX 1660 была выпущена 14 марта 2019 г.',
      expectedPrice: 253.90,
      powerUsage: 80
    ),
    // 21.01.2021
    // Videocard(
    //   gpuName: 'NVIDIA GTX 1060 6GB',
    //   onlinerGpuName: 'gfgtx1060',
    //   nicehashId: '869da26b-6e22-4819-8996-a19acfb9ec0d',
    //   hashRate: 22.5,
    //   gpuDescription: 'NVIDIA GTX 1060 6GB была выпущена 8 июля 2016 г.',
    //   expectedPrice: 140.51,
    //   powerUsage: 90
    // ),
    // Videocard(
    //   gpuName: "NVIDIA P106-100",
    //   onlinerGpuName: "",
    //   nicehashId: "8fe1adf9-2963-4a5f-b224-486303220672",
    //   hashRate: 22.5,
    //   gpuDescription: "NVIDIA P106-100 была выпущена 1 июня 2017 г.",
    //   expectedPrice: 115.00,
    //   powerUsage: 80.0
    // ),
    // Videocard(
    //   gpuName: "NVIDIA P106-90",
    //   onlinerGpuName: "",
    //   nicehashId: "",
    //   hashRate: 13.4,
    //   gpuDescription: "NVIDIA P106-90 была выпущена 31 июля 2017 г.",
    //   expectedPrice: 59.00,
    //   powerUsage: 60.0
    // )
  ];

}