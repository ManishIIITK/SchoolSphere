import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/fee_screen/data/fee_data.dart';
import 'package:school_management_app/screens/students/fee_screen/widgets/fee_widget.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({super.key});

  static String routeName = 'FeeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fee'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  topRight: Radius.circular(kDefaultPadding),
                ),
                color: kOtherColor,
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(kDefaultPadding),
                itemCount: fee.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: kDefaultPadding),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(kDefaultPadding),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: kTextLightColor, blurRadius: 2.0),
                            ],
                          ),
                          child: Column(
                            children: [
                              FeeDetailsRow(
                                title: "Receipt No",
                                statusValue: fee[index].receiptNo,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              ),
                              FeeDetailsRow(
                                title: "Month",
                                statusValue: fee[index].month,
                              ),
                              sizedBox,
                              FeeDetailsRow(
                                title: "Payment Date",
                                statusValue: fee[index].date,
                              ),
                              sizedBox,
                              FeeDetailsRow(
                                title: "Status",
                                statusValue: fee[index].paymentStatus,
                              ),
                              sizedBox,
                              const SizedBox(
                                height: kDefaultPadding,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              ),
                              FeeDetailsRow(
                                title: "Total Amount",
                                statusValue: fee[index].totalAmount,
                              ),
                            ],
                          ),
                        ),
                        FeeButton(
                            onPress: () {},
                            iconData: fee[index].paymentStatus == 'Paid'
                                ? Icons.arrow_downward
                                : Icons.arrow_forward_outlined,
                            title: fee[index].btnStatus),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
