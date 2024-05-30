import 'package:currency_converter/currency.dart';
import 'package:e_commerce/app/CategoryProduct/product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/app_colors.dart';
import '../../common_widgets/urls.dart';
import '../../constant/cons.dart';
import '../../widgets/cache_network_image.dart';
import '../Home/controller/home_controller.dart';
import '../Search/search_screen.dart';

class AllFeatureProductScreen extends StatelessWidget {
  const AllFeatureProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    final screenSize = ScreenUtils.getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    final layoutInfo = (screenSize, orientation);
    var isBigDevice = ScreenUtils.isBigDevice(screenSize);
    if (isBigDevice) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
    }
    var provider = Provider.of<HomeController>(context, listen: false);
    // var currencyProvider = Provider.of<CurrencyProvider>(context,listen: false);


    // if(type == 0) {
    //   provider.getWishlistProduct();
    // }
    return Consumer<HomeController>(
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                controller.setFavIndex(null);
                controller.filterCateProduct(null);
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
          title: Text( "Feature Product",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500)),
          centerTitle: false,
          actions:  [
            GestureDetector(
                onTap: () {
                  Get.to(const SearchScreen());
                },
                child: Icon(Icons.search)),
            SizedBox(
              width: 15,
            )
          ],
          elevation: 0,
          surfaceTintColor: AppColors.white,
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Visibility(
                visible: !controller.shopProductLoading,
                replacement: const Center(child: CupertinoActivityIndicator.partiallyRevealed(),),
                child: Visibility(
                  visible:controller.allProducts.isNotEmpty,
                  replacement: Center(child: Text( "Product Not available",style: Theme.of(context).textTheme.bodyLarge,),),
                  child: Column(
                    children: [


                      NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent) {
                            if (!controller.isFetching) {

                              controller.setValue(true, true);
                              controller.setPage();
                              controller.getShopProductData(1);
                              Future.delayed(const Duration(seconds: 1)).then(
                                      (value) => controller.setValue(false, false));

                              print("isLoading");
                            }
                          }
                          return false;
                        },
                        child: Expanded(
                          // height: height * .54,
                            child: GridView.builder(
                              itemCount:  controller.allShopProduct.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                 childAspectRatio: _calculateAspectRatio(context),

                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0),
                              itemBuilder: (context, index) {
                                var data =  controller.allShopProduct[index];
                                //
                                // var convertedSalePrice = currencyProvider.getConvertedPrice(index);
                                // var convertedRegularPrice = currencyProvider.getConvertedRegularPrice(index);
                                //
                                // if (currencyProvider.getConvertedPrice(index) == null) {
                                //   currencyProvider.convertCurrency(index,"inr",Currency.usd,  double.parse(data.salePrice ?? "0"));
                                // }
                                //
                                // if (currencyProvider.getConvertedRegularPrice(index) == null) {
                                //   currencyProvider.convertRegularCurrency(index,"inr",Currency.usd,  double.parse(data.regularPrice ?? "0"));
                                // }
                                return GestureDetector(
                                  onTap: () {
                                    controller.changePriceWithIndex(data.id);
                                    controller.saveProductDetailslug(data.slug);
                                    controller.getProductDetail(data.slug, 0);
                                    // print(data['id']);
                                    Get.to( ProductDetailScreen(productSlug:  data.slug ??"", id: data.id??0,));
                                  },
                                  child:Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              MyCacheNetworkImages(
                                                imageUrl: "$imageURL${data.image}",
                                                // imageUrl: "https://5.imimg.com/data5/SELLER/Default/2022/4/CR/WD/AE/47199006/pedigree-normal-500x500.jpg",
                                                height: switch (layoutInfo) {
                                                  (ScreenSize.large || ScreenSize.extraLarge, _) =>
                                                  height * .25,
                                                  (_, Orientation.landscape) => width * .86,
                                                  _ => width * .43
                                                },
                                                width: width,
                                                radius: 15,
                                                fit: BoxFit.cover,
                                                // color: AppColors.primaryColor,
                                              ),
                                              data.wishlistAvgUserId == "null"
                                                  ? Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        controller.addWishlistProduct(data.id,3);
                                                      },
                                                      child: const Icon(Icons.favorite_border)))
                                                  : Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        controller.addWishlistProduct(data.id,3);
                                                      },
                                                      child: const Icon(Icons.favorite))),
                                              if(data.reviewsCount !=0)
                                                Positioned(
                                                    bottom: 8,
                                                    left: 10,
                                                    child: Container(
                                                      height: 22,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color: AppColors.transparentColor),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: IntrinsicHeight(
                                                          child: Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    double.parse(data.reviewsAvgRating !="null" ? data.reviewsAvgRating ??"0.0" :"0.0").toStringAsFixed(1) ??"",
                                                                    style: Theme.of(context)
                                                                        .textTheme
                                                                        .labelSmall,
                                                                  ),
                                                                  const Icon(
                                                                    Icons.star,
                                                                    size: 12,
                                                                    color: AppColors.green,
                                                                  ),
                                                                ],
                                                              ),
                                                              const VerticalDivider(
                                                                color: AppColors.grey1,
                                                                thickness: 2,
                                                              ),
                                                              if ("soldItem" != "0")
                                                                Text(
                                                                  controller.formatValue(data.reviewsCount ?? 0),
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .labelSmall
                                                                      ?.copyWith(fontSize: 11),
                                                                ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              if(data.discountValue !="0" && data.discountValue != "null")
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child:  Container(
                                      // height: 20,
                                      // width: 90,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.indigo,
                                            Colors.purple.shade300,
                                          ]),
                                          borderRadius: const BorderRadius.only(
                                              bottomRight:
                                              Radius.elliptical(15, 20),
                                              topLeft: Radius.circular(10)
                                          )),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10,vertical: 4),
                                          child: Text(
                                              "${data.discountValue}% ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall?.copyWith(color: AppColors.white,fontSize: 9)),
                                        ),
                                      ),
                                    )),

                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.brands?.brandName ?? "",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(color: AppColors.green),
                                                ),
                                                Text(
                                                  data.name ?? "",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(color: AppColors.primaryBlack),
                                                ),
                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.start,
                                                //   children: [
                                                //     Text(
                                                //       "₹${data.salePrice ?? ""}",
                                                //       maxLines: 1,
                                                //       style: Theme.of(context)
                                                //           .textTheme
                                                //           .labelSmall
                                                //           ?.copyWith(
                                                //           fontSize: 10,
                                                //           fontWeight: FontWeight.w600),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 2,
                                                //     ),
                                                //     if(data.salePrice != data.regularPrice)
                                                //       Text(
                                                //         "₹${data.regularPrice ?? " "}",
                                                //         maxLines: 1,
                                                //         style: Theme.of(context)
                                                //             .textTheme
                                                //             .labelSmall
                                                //             ?.copyWith(
                                                //             fontSize: 8,
                                                //             decoration:
                                                //             TextDecoration.lineThrough,
                                                //             color: AppColors.redColor),
                                                //       ),
                                                //     const SizedBox(
                                                //       width: 2,
                                                //     ),
                                                //     if(data.salePrice != data.regularPrice)
                                                //       Text(
                                                //         "${data.discountValue}% off",
                                                //         maxLines: 1,
                                                //         style: Theme.of(context).textTheme.labelSmall,
                                                //       ),
                                                //   ],
                                                // ),
                                                Consumer<CurrencyProvider>(
                                                  builder: (context, currencyProvider, child) =>  FutureBuilder<double>(
                                                    future: currencyProvider.selectedCurrency == Currency.usd
                                                        ? currencyProvider.convertToUSD(double.parse(data.salePrice ?? "0.0"))
                                                        : Future.value(double.parse(data.salePrice ?? "0.0")),
                                                    builder: (context, salePriceSnapshot) {
                                                      if (!salePriceSnapshot.hasData) {
                                                        return const Text("Loading..");
                                                      }
                                                      double salePrice = salePriceSnapshot.data ?? 0.0;
                                                      return FutureBuilder<double>(
                                                        future: currencyProvider.selectedCurrency == Currency.usd
                                                            ? currencyProvider.convertToUSD(double.parse(data.regularPrice ?? "0.0"))
                                                            : Future.value(double.parse(data.regularPrice ?? "0.0")),
                                                        builder: (context, regularPriceSnapshot) {
                                                          if (!regularPriceSnapshot.hasData) {
                                                            return const Text("Loading..");
                                                          }
                                                          double regularPrice = regularPriceSnapshot.data ?? 0.0;
                                                          return Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                currencyProvider.selectedCurrency == Currency.inr
                                                                    ? "₹${data.salePrice ?? " "}"
                                                                    : "\$${salePrice.toStringAsFixed(2)}",
                                                                maxLines: 1,
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .labelSmall
                                                                    ?.copyWith(
                                                                    fontSize: 9,
                                                                    fontWeight: FontWeight.w600),
                                                              ),
                                                              const SizedBox(width: 2),
                                                              if (salePrice != regularPrice)
                                                                Text(
                                                                  currencyProvider.selectedCurrency == Currency.inr
                                                                      ? "₹${data.regularPrice ?? " "}"
                                                                      : "\$${regularPrice.toStringAsFixed(2)}",
                                                                  maxLines: 1,
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .labelSmall
                                                                      ?.copyWith(
                                                                      fontSize: 7,
                                                                      decoration: TextDecoration.lineThrough,
                                                                      color: AppColors.redColor),
                                                                ),
                                                              const SizedBox(width: 2),
                                                              if (salePrice != regularPrice)
                                                                Text(
                                                                  "${data.discountValue}% off",
                                                                  maxLines: 1,
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .labelSmall,
                                                                ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),

                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text(data.stockStatus == "instock" ?"In Stock" :"Out Of Stock" , style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall
                                                    ?.copyWith(  fontSize: 10, color: data.stockStatus == "instock"? AppColors.green :AppColors.redColor ),)

                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );


                              },
                            )),
                      ),

                      if(controller.catLoading)
                        const Center(child: CupertinoActivityIndicator(),),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
  double _calculateAspectRatio(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double screenWidth = MediaQuery.of(context).size.width;

    double childAspectRatio1 = screenHeight / screenWidth * .32;

    return childAspectRatio1;
  }
}
