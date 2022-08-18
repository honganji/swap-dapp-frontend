import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:payment_dapp/view/screens/qr_code_scan.dart';
import 'package:payment_dapp/view_model/send_model.dart';

class Send extends StatefulWidget {
  const Send({Key? key}) : super(key: key);

  @override
  State<Send> createState() => _SendState();
}

class _SendState extends State<Send> {
  SendModel dropdownValueOfSecond = SendModel(
      symbol: "ETH",
      name: "Ethereum",
      imagePath: "assets/ethereum-eth-logo.png");
  SendModel dropdownValueOfThird = SendModel(
      symbol: "ETH",
      name: "Ethereum",
      imagePath: "assets/ethereum-eth-logo.png");
  TextEditingController addressController = TextEditingController();
  final amountController = TextEditingController();

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
                  Text(
                    'Send',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: displayHeight * 0.01,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: displayHeight * 0.82),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "①Input receiver's wallet address",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: displayHeight * 0.015,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: displayWidth * 0.05),
                            color: Colors.white,
                            child: TextFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(
                                    color: HexColor('#19667E'),
                                    width: 2.0,
                                  ),
                                ),
                                labelText: 'ex) 0x96324xv029...',
                              ),
                              controller: addressController,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => QRCodeScan(),
                                ),
                              );

                              if (!mounted) return;

                              if (result == null) {
                                Fluttertoast.showToast(
                                  msg: "Couldn\'t get recipient address",
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              } else {
                                addressController.text = result;
                              }
                              setState(() {});
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 18),
                                SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: SvgPicture.asset(
                                    'assets/pop.svg',
                                    color: Colors.grey,
                                  ),
                                ),
                                const Text(
                                  ' scan QR code',
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "②Input transfer amount",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                "※ select your preferred currency\n and amount to send to the recipient!",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  color: HexColor('#D9D9D9'),
                                ),
                                width: displayWidth * 0.4,
                                height: displayHeight * 0.12,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    buttonWidth: 20,
                                    buttonHeight: 20,
                                    customButton: Container(
                                        child: Row(
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
                                                    dropdownValueOfSecond
                                                        .imagePath),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
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
                                                dropdownValueOfSecond.symbol,
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
                                                dropdownValueOfSecond.name,
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
                                          width: 10,
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
                                        dropdownValueOfSecond = newValue!;
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
                                              child:
                                                  Image.asset(value.imagePath),
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
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: displayHeight * 0.12,
                                width: displayWidth * 0.32,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  color: HexColor('#D9D9D9'),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: displayHeight * 0.026),
                                      width: displayWidth * 0.12,
                                      color: Colors.white,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide(
                                              color: HexColor('#19667E'),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(3),
                                        ],
                                        controller: amountController,
                                      ),
                                    ),
                                    Container(
                                      height: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            dropdownValueOfSecond.symbol,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: displayHeight * 0.026,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "③Select kind of coin you want to send",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
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
                                                dropdownValueOfThird.imagePath),
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
                                            dropdownValueOfThird.symbol,
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
                                            dropdownValueOfThird.name,
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
                                    dropdownValueOfThird = newValue!;
                                  });
                                },
                                items: <SendModel>[
                                  SendModel(
                                      symbol: "AOA",
                                      name: "Aurora",
                                      imagePath: "assets/aurora-aoa-logo.png"),
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
                                      imagePath: "assets/solana-sol-logo.png"),
                                  SendModel(
                                      symbol: "USDT",
                                      name: "Tether",
                                      imagePath: "assets/tether-usdt-logo.png"),
                                  SendModel(
                                      symbol: "UNI",
                                      name: "Uniswap",
                                      imagePath: "assets/uniswap-uni-logo.png"),
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
                        margin: EdgeInsets.only(bottom: displayHeight * 0.02),
                        child: SizedBox(
                          height: displayHeight * 0.1,
                          width: displayWidth * 0.7,
                          child: ElevatedButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg:
                                    "Transfered ${amountController.text} ${dropdownValueOfThird.symbol} to ${addressController.text}",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                dropdownValueOfSecond = SendModel(
                                    symbol: "ETH",
                                    name: "Ethereum",
                                    imagePath: "assets/ethereum-eth-logo.png");
                              });
                              dropdownValueOfThird = SendModel(
                                  symbol: "ETH",
                                  name: "Ethereum",
                                  imagePath: "assets/ethereum-eth-logo.png");
                              addressController.clear();
                              amountController.clear();
                            },
                            child: Text(
                              'Transfer',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
