import 'package:cart_app/cubit/cart_cubit.dart';
import 'package:cart_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Shipping Details",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              CustomTextField(
                label: "Full Name",
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Name is required";
                  return null;
                },
              ),

              const SizedBox(height: 15),

              CustomTextField(
                label: "Email",
                icon: Icons.email,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return "Invalid Email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              CustomTextField(
                label: "Shipping Address",
                icon: Icons.location_on,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Address is required";
                  }
                  return null;
                },
              ),

              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final cartState = context.read<CartCubit>().state;
                    double total = 0;
                    for (var item in cartState) {
                      total += (item.price * item.quantity);
                    }
                    context.read<CartCubit>().submitOrder(total);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Order Placed Successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
                child: const Text(
                  "Pay Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
