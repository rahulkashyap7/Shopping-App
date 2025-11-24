import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import '../../../../common/widgets/payment/payment_tile.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: RImages.payPal, name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModelBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(RSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RSectionHeading(
                        title: 'Select Payment Method',
                        showActionButton: false),
                    SizedBox(height: RSizes.spaceBtwSections),
                    RPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: RImages.payPal, name: 'Paypal')),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    RPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: RImages.googlePay, name: 'Google Pay')),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    RPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: RImages.applePay, name: 'Apple Pay')),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    RPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: RImages.visa, name: 'VISA')),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    RPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: RImages.masterCard, name: 'Master Card')),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    RPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: RImages.payTm, name: 'Paytm')),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    RPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: RImages.payStack, name: 'Paystack')),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    RPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: RImages.creditCard, name: 'Credit Card')),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    const SizedBox(height: RSizes.spaceBtwSections),
                  ],
                ),
              ),
            ));
  }
}
