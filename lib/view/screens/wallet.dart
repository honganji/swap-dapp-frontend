import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:payment_dapp/view/modals/qr_code.dart';
import 'package:payment_dapp/view/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../view_model/send_model.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  SendModel dropdownValue = SendModel(
      symbol: "ETH",
      name: "Ethereum",
      imagePath: "assets/ethereum-eth-logo.png");
  @override
  Widget build(BuildContext context) {
    final displayHeight = MediaQuery.of(context).size.height;
    final displayWidth = MediaQuery.of(context).size.width;
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: displayWidth * 0.08),
        child: Column(
          children: [
            SizedBox(
              height: displayHeight * 0.04,
            ),
            SizedBox(
              height: displayHeight * 0.05,
              child: Row(
                children: [
                  Text(
                    'Wallet',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: displayHeight * 0.02,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: HexColor('#D9D9D9'),
                    ),
                    width: double.infinity,
                    height: displayHeight * 0.12,
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "wallet address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 1),
                          child: Text(
                            "0x392vg098f90",
                            style: TextStyle(
                              fontSize: 35,
                              color: HexColor("#56CCC5"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: displayHeight * 0.01,
                        )
                      ],
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
                  SizedBox(
                    height: displayHeight * 0.1,
                  ),
                  SizedBox(
                    height: displayHeight * 0.19,
                    child: SvgPicture.asset("assets/wallet_screen_img.svg"),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "If you want, change kind of currency\nyou receive.",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                color: HexColor('#D9D9D9'),
                              ),
                              width: displayWidth * 0.7,
                              height: displayHeight * 0.12,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  buttonWidth: 20,
                                  buttonHeight: 20,
                                  customButton: Container(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: displayWidth * 0.13,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Image.asset(
                                                  dropdownValue.imagePath),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      SizedBox(
                                        height: displayHeight * 0.12,
                                        width: displayWidth * 0.14,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              dropdownValue.symbol,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              dropdownValue.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70,
                                      ),
                                      SizedBox(
                                        height: displayHeight * 0.12,
                                        width: 20,
                                        child: SvgPicture.asset(
                                          "assets/triangle.svg",
                                          color: HexColor("#628A8A"),
                                        ),
                                      ),
                                    ],
                                  )),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 30,
                                    color: HexColor("#628A8A"),
                                  ),
                                  onChanged: (SendModel? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <SendModel>[
                                    SendModel(
                                        symbol: "AOA",
                                        name: "Aurora",
                                        imagePath:
                                            "assets/aurora-aoa-logo.png"),
                                    SendModel(
                                        symbol: "SHIB",
                                        name: "Shiba Inu",
                                        imagePath: "assets/shib-logo.png"),
                                    SendModel(
                                        symbol: "ETH",
                                        name: "Ethereum",
                                        imagePath:
                                            "assets/ethereum-eth-logo.png"),
                                    SendModel(
                                        symbol: "SOL",
                                        name: "Solana",
                                        imagePath:
                                            "assets/solana-sol-logo.png"),
                                    SendModel(
                                        symbol: "USDT",
                                        name: "Tether",
                                        imagePath:
                                            "assets/tether-usdt-logo.png"),
                                    SendModel(
                                        symbol: "UNI",
                                        name: "Uniswap",
                                        imagePath:
                                            "assets/uniswap-uni-logo.png"),
                                    SendModel(
                                        symbol: "Matic",
                                        name: "Polygon",
                                        imagePath:
                                            "assets/polygon-matic-logo.png"),
                                  ].map<DropdownMenuItem<SendModel>>(
                                      (SendModel value) {
                                    return DropdownMenuItem<SendModel>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(value.imagePath),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(value.symbol)
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: SizedBox(
                            height: displayHeight * 0.1,
                            width: displayWidth * 0.7,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/signIn');
                              },
                              child: Text(
                                'Disconnect',
                                style: GoogleFonts.patuaOne(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 27,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
