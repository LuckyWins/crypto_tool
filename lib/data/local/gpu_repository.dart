import 'package:cryptotool/models/models.dart';

class GpuRepository {

  static List<Videocard> availableList = [
      Videocard(
        gpuName: "NVIDIA RTX 3090",
        onlinerGpuName: "rtx3090",
        hashRate: 125.0,
        gpuDescription: "NVIDIA RTX 3090 была выпущена 24 сентября 2020 г.",
        expectedPrice: 1999.00,
        powerUsage: 300.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA RTX 3080",
        onlinerGpuName: "rtx3080",
        hashRate: 91.5,
        gpuDescription: "NVIDIA RTX 3080 была выпущена 17 сентября 2020 г.",
        expectedPrice: 1000.99,
        powerUsage: 230.0
      ),
      // 21.01.2021
      // Videocard(
      //   gpuName: "AMD VII",
      //   onlinerGpuName: "",
      //   hashRate: 80.0,
      //   gpuDescription: "AMD VII была выпущена 7 февраля 2019 г.",
      //   expectedPrice: 870.0,
      //   powerUsage: 210.0
      // ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA RTX 3060 Ti",
        onlinerGpuName: "rtx3060ti",
        hashRate: 58.1,
        gpuDescription: "NVIDIA RTX 3060 Ti была выпущена 2 декабря 2020 г.",
        expectedPrice: 670.00,
        powerUsage: 130.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA RTX 3070",
        onlinerGpuName: "rtx3070",
        hashRate: 58.1,
        gpuDescription: "NVIDIA RTX 3070 была выпущена 29 октября 2020 г.",
        expectedPrice: 749.00,
        powerUsage: 130.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "AMD RX 5700 XT",
        onlinerGpuName: "rx5700xt",
        hashRate: 55.0,
        gpuDescription: "AMD RX 5700 XT была выпущена 1 июля 2019 г.",
        expectedPrice: 520.90,
        powerUsage: 140.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "AMD RX 5700",
        onlinerGpuName: "rx5700",
        hashRate: 55.0,
        gpuDescription: "AMD RX 5700 была выпущена 1 июля 2019 г.",
        expectedPrice: 510.90,
        powerUsage: 140.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA RTX 2080 Ti",
        onlinerGpuName: "rtx2080ti",
        hashRate: 55.2,
        gpuDescription: "NVIDIA RTX 2080 Ti была выпущена 20 сентября 2018 г.",
        expectedPrice: 1020.73,
        powerUsage: 180.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA GTX 1080 Ti",
        onlinerGpuName: "gtx1080ti",
        hashRate: 49.0,
        gpuDescription: "NVIDIA GTX 1080 Ti была выпущена 10 марта 2017 г.",
        expectedPrice: 350.27,
        powerUsage: 180.0
      ),
      Videocard(
        gpuName: "NVIDIA RTX 2070 SUPER",
        onlinerGpuName: "rtx2070super",
        hashRate: 44.3,
        gpuDescription: "NVIDIA RTX 2070 SUPER была выпущена 9 июля 2019 г.",
        expectedPrice: 540.00,
        powerUsage: 165.0
      ),
      Videocard(
        gpuName: "NVIDIA RTX 2060 SUPER",
        onlinerGpuName: "rtx2060super",
        hashRate: 44.3,
        gpuDescription: "NVIDIA RTX 2060 SUPER была выпущена 9 июля 2019 г.",
        expectedPrice: 439.00,
        powerUsage: 135.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA RTX 2070",
        onlinerGpuName: "rtx2070",
        hashRate: 40.0,
        gpuDescription: "NVIDIA RTX 2070 была выпущена 17 октября 2018 г.",
        expectedPrice: 465.94,
        powerUsage: 140.0
      ),
      Videocard(
        gpuName: "NVIDIA RTX 2080 SUPER",
        onlinerGpuName: "rtx2080super",
        hashRate: 44.3,
        gpuDescription: "NVIDIA RTX 2080 SUPER была выпущена 23 июля 2019 г.",
        expectedPrice: 749.00,
        powerUsage: 190.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA RTX 2080",
        onlinerGpuName: "rtx2080",
        hashRate: 40.1,
        gpuDescription: "NVIDIA RTX 2080 была выпущена 20 сентября 2018 г.",
        expectedPrice: 719.54,
        powerUsage: 160.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "AMD RX 5600 XT",
        onlinerGpuName: "rx5600xt",
        hashRate: 40.5,
        gpuDescription: "AMD RX 5600 XT была выпущена 21 января 2020 г.",
        expectedPrice: 379.99,
        powerUsage: 110.0
      ),
      // 21.01.2021
      // Videocard(
      //   gpuName: "AMD RX Vega 64",
      //   onlinerGpuName: "",
      //   hashRate: 46.0,
      //   gpuDescription: "AMD RX Vega 64 была выпущена 28 сентября 2017 г.",
      //   expectedPrice: 340.49,
      //   powerUsage: 200.0
      // ),
      // Videocard(
      //   gpuName: "NVIDIA P104-100",
      //   onlinerGpuName: "",
      //   hashRate: 37.0,
      //   gpuDescription: "NVIDIA P104-100 была выпущена 11 декабря 2017 г.",
      //   expectedPrice: 199.00,
      //   powerUsage: 135.0
      // ),
      // 21.01.2021
      Videocard(
        gpuName: "AMD RX Vega 56",
        onlinerGpuName: "rxvega56",
        hashRate: 45.0,
        gpuDescription: "AMD RX Vega 56 была выпущена 28 сентября 2017 г.",
        expectedPrice: 300.90,
        powerUsage: 180.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA GTX 1080",
        onlinerGpuName: "gtx1080",
        hashRate: 34.0,
        gpuDescription: "NVIDIA GTX 1080 была выпущена 27 мая 2016 г.",
        expectedPrice: 239.69,
        powerUsage: 170.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "AMD RX 580 8GB",
        onlinerGpuName: "radeonrx580",
        hashRate: 30.2,
        gpuDescription: "AMD RX 580 8GB была выпущена 18 апреля 2017 г.",
        expectedPrice: 155.50,
        powerUsage: 130.0
      ),
      Videocard(
        gpuName: "AMD RX 480 8GB",
        onlinerGpuName: "radeonrx480",
        hashRate: 31.5,
        gpuDescription: "AMD RX 480 8GB была выпущена 1 июля 2016 г.",
        expectedPrice: 145.00,
        powerUsage: 120.0
      ),
      Videocard(
        gpuName: "AMD RX 570 8GB",
        onlinerGpuName: "radeonrx570",
        hashRate: 30.9,
        gpuDescription: "AMD RX 570 8GB была выпущена 18 апреля 2017 г.",
        expectedPrice: 149.50,
        powerUsage: 120.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA GTX 1660 SUPER",
        onlinerGpuName: "gtx1660super",
        hashRate: 30.2,
        gpuDescription: "NVIDIA GTX 1660 SUPER была выпущена 29 октября 2019 г.",
        expectedPrice: 295.00,
        powerUsage: 80.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA GTX 1070 Ti",
        onlinerGpuName: "gtx1070ti",
        hashRate: 30.5,
        gpuDescription: "NVIDIA GTX 1070 Ti была выпущена 2 ноября 2017 г.",
        expectedPrice: 215.18,
        powerUsage: 130.0
      ),
      // Videocard(
      //   gpuName: "AMD RX 470 8GB",
      //   onlinerGpuName: "x470",
      //   hashRate: 29.7,
      //   gpuDescription: "AMD RX 470 8GB была выпущена 1 сентября 2016 г.",
      //   expectedPrice: 125.00,
      //   powerUsage: 120.0
      // ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA GTX 1660 Ti",
        onlinerGpuName: "gtx1660ti",
        hashRate: 28.0,
        gpuDescription: "NVIDIA GTX 1660 Ti была выпущена 22 февраля 2019 г.",
        expectedPrice: 330.50,
        powerUsage: 80.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA RTX 2060",
        onlinerGpuName: "rtx2060",
        hashRate: 30.0,
        gpuDescription: "NVIDIA RTX 2060 была выпущена 15 января 2019 г.",
        expectedPrice: 385.49,
        powerUsage: 120.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA GTX 1070",
        onlinerGpuName: "gtx1070",
        hashRate: 30.0,
        gpuDescription: "NVIDIA GTX 1070 была выпущена 10 июня 2016 г.",
        expectedPrice: 193.47,
        powerUsage: 140.0
      ),
      Videocard(
        gpuName: "AMD RX 5500 XT 8GB",
        onlinerGpuName: "rx5500xt",
        hashRate: 26.5,
        gpuDescription: "AMD RX 5500 XT 8GB была выпущена 12 декабря 2019 г.",
        expectedPrice: 249.00,
        powerUsage: 80.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA GTX 1660",
        onlinerGpuName: "gtx1660",
        hashRate: 23.0,
        gpuDescription: "NVIDIA GTX 1660 была выпущена 14 марта 2019 г.",
        expectedPrice: 253.90,
        powerUsage: 80.0
      ),
      // 21.01.2021
      Videocard(
        gpuName: "NVIDIA GTX 1060 6GB",
        onlinerGpuName: "gfgtx1060",
        hashRate: 22.5,
        gpuDescription: "NVIDIA GTX 1060 6GB была выпущена 8 июля 2016 г.",
        expectedPrice: 140.51,
        powerUsage: 90.0
      ),
      // Videocard(
      //   gpuName: "NVIDIA P106-100",
      //   onlinerGpuName: "",
      //   hashRate: 22.5,
      //   gpuDescription: "NVIDIA P106-100 была выпущена 1 июня 2017 г.",
      //   expectedPrice: 115.00,
      //   powerUsage: 80.0
      // ),
      // Videocard(
      //   gpuName: "NVIDIA P106-90",
      //   onlinerGpuName: "",
      //   hashRate: 13.4,
      //   gpuDescription: "NVIDIA P106-90 была выпущена 31 июля 2017 г.",
      //   expectedPrice: 59.00,
      //   powerUsage: 60.0
      // )
    ];

}