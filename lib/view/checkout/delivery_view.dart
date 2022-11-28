import 'package:ecommerce_app_getx/constants.dart';
import 'package:ecommerce_app_getx/view/checkout/address_view.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_button.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryView extends StatefulWidget {
  const DeliveryView({Key? key}) : super(key: key);

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView> {
  @override
  Widget build(BuildContext context) {
    Delivery delivery = Delivery.StandardDelivery;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Delivery method',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 100.0, right: 10, left: 10),
          child: Column(
            children: [
              RadioListTile<Delivery>(
                value: Delivery.StandardDelivery,
                groupValue: delivery,
                onChanged: (value) {
                  setState(() {
                    delivery = value as Delivery;
                  });
                },
                activeColor: kPrimaryColor,
                title: const CustomText(
                  text: 'Standard Delivery',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: const CustomText(
                  text: '\nOrder will be delivered between 3 - 5 business days',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RadioListTile<Delivery>(
                value: Delivery.NextDayDelivery,
                groupValue: delivery,
                onChanged: (value) {
                  setState(() {
                    delivery = value as Delivery;
                  });
                },
                activeColor: kPrimaryColor,
                title: const CustomText(
                  text: 'Next Day Delivery',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: const CustomText(
                  text:
                      '\nPlace your order before 6pm and your items will be delivered the next day',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RadioListTile<Delivery>(
                value: Delivery.NominatedDelivery,
                groupValue: delivery,
                onChanged: (value) {
                  setState(() {
                    delivery = value as Delivery;
                  });
                },
                activeColor: kPrimaryColor,
                title: const CustomText(
                  text: 'Nominated Delivery',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: const CustomText(
                  text:
                      '\nPick a particular date from the calendar and order will be delivered on selected date',
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 60,
                  width: 150,
                  child: CustomButton(
                    title: 'NEXT',
                    onPressed: () {
                      Get.to(() => const AddressView());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
