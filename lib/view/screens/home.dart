import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:payment_dapp/view/modals/qr_code.dart';
import 'package:payment_dapp/view/widgets/coins.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayHeight = MediaQuery.of(context).size.height;
    final displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: displayWidth * 0.08),
        child: Column(
          children: [
            SizedBox(
              height: displayHeight * 0.04,
            ),
            SizedBox(
              height: displayHeight * 0.04,
              child: Row(
                children: [
                  Center(
                    child: Text(
                      'Home',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: displayHeight * 0.23,
                    width: displayWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          HexColor("3FA1C0"),
                          HexColor("000405"),
                          HexColor("19667E")
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: displayWidth * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: displayHeight * 0.027,
                                ),
                                const Text(
                                  "Balance",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                                const Text(
                                  '\$2343.34',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 30,
                              width: 22,
                              child: SvgPicture.asset(
                                'assets/three-dots.svg',
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SizedBox(
                              width: displayWidth * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "0x392vg098f90",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (_) => QRCode(
                                          qrImage: QrImage(
                                        data: "0x392vg098f90",
                                        size: 200,
                                      )),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 22,
                                        width: 22,
                                        child: SvgPicture.asset(
                                          'assets/pop.svg',
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const Text(
                                        ' display QR code',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: Image.asset(
                                'assets/unchain_logo.png',
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            )
                          ],
                        ),
                        SizedBox(
                          height: displayHeight * 0.02,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(vertical: displayWidth * 0.03),
                      children: [
                        Coins(
                            displayWidth,
                            displayHeight,
                            'assets/aurora-aoa-logo.png',
                            'AOA',
                            'Aurora',
                            '2.1',
                            '25.1'),
                        Coins(
                            displayWidth,
                            displayHeight,
                            'assets/shib-logo.png',
                            'SHIB',
                            'Shiba Inu',
                            '1.3',
                            '24.3'),
                        Coins(
                            displayWidth,
                            displayHeight,
                            'assets/ethereum-eth-logo.png',
                            'ETH',
                            'Ethereum',
                            '0.4',
                            '13.0'),
                        Coins(
                            displayWidth,
                            displayHeight,
                            'assets/solana-sol-logo.png',
                            'SOL',
                            'Solana',
                            '4.2',
                            '43.2'),
                        Coins(
                            displayWidth,
                            displayHeight,
                            'assets/tether-usdt-logo.png',
                            'USDT',
                            'Tether',
                            '2.6',
                            '54.2'),
                        Coins(
                            displayWidth,
                            displayHeight,
                            'assets/uniswap-uni-logo.png',
                            'UNI',
                            'Uniswap',
                            '0',
                            '0'),
                        Coins(
                            displayWidth,
                            displayHeight,
                            'assets/polygon-matic-logo.png',
                            'Matic',
                            'Polygon',
                            '0',
                            '0'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
