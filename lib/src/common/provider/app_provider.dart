import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ClientStateNotifier extends StateNotifier<ProviderModel> {
// ClientStateNotifier() :  super(FakeData().clientData.first);
//   FakeData fakeData = FakeData();
//   RestaurantModel? orderRestorant;
//
//   List<Category> categories = Category.values;
//   ValueNotifier<List<RestaurantModel>> restaurants = ValueNotifier([]);
//   ValueNotifier<int> pageNumber = ValueNotifier(0);
//   ValueNotifier<List<RestaurantModel>> searchResults = ValueNotifier([]);
//   ValueNotifier<int> basketLendht = ValueNotifier(0);
//   final PageController pageController = PageController();
//
//   ClientStateNotifier() : super(FakeData().clientData.first);
//   ValueNotifier<int> counterOfFilters = ValueNotifier(0);
//   ValueNotifier filterList = ValueNotifier([]);
//   double? latitude;
//   double? longitude;
//
//   ValueNotifier<String> searchText = ValueNotifier("");
//
//   void registerPerson(PersonModel personModel) {
//     state = state.copyWith(personModel: personModel);
//   }
//
//   void searchRestaurants(String text) {
//     searchText.value = text;
//     searchResults.value = [];
//     List<RestaurantModel> result = [];
//     if (text.isNotEmpty && text[0] != ' ') {
//       for (var element in fakeData.restaurantData) {
//         for (final category in element.products.keys) {
//           if (category.title.toLowerCase().contains(text)) {
//             result.add(element);
//             break;
//           }
//         }
//       }
//     }
//     searchResults.value = result;
//   }
//
//   void clear() {
//     state = state.copyWith(
//       personModel: null,
//       ordersHistory: [],
//       basket: [],
//       promotionalCodes: [],);
//   }
//
//   Map<Category, ValueNotifier<bool>> selectionCategoryes = {
//     Category.chicken: ValueNotifier(true),
//     Category.kebab: ValueNotifier(true),
//     Category.burger: ValueNotifier(true),
//     Category.dessert: ValueNotifier(true),
//     Category.coffee: ValueNotifier(true),
//     Category.nationalFood: ValueNotifier(true),
//     Category.pizza: ValueNotifier(true),
//     Category.pilaf: ValueNotifier(true),
//     Category.pita: ValueNotifier(true),
//     Category.asia: ValueNotifier(true),
//   };
//
//   void changeSelection(Category category) {
//     refreshFilterList(category);
//     filterByCategories();
//     selectionCategoryes[category]!.value =
//     !selectionCategoryes[category]!.value;
//   }
//
//   void refreshFilterList(Category category) {
//     if (filterList.value.contains(category)) {
//       filterList.value.remove(category);
//
//       counterOfFilters.value = counterOfFilters.value - 1;
//     } else {
//       filterList.value.add(category);
//       counterOfFilters.value = counterOfFilters.value + 1;
//     }
//   }
//
//   void clearBasket() {
//     basketLendht.value = 0;
//     state = state.copyWith(basket: []);
//   }
//
//   void incrementBasketProduct(BasketModel model) {
//     state = state.copyWith(
//       basket: state.basket.map<BasketModel>((item) {
//         if (item.id == model.id) {
//           return item.copyWith(amount: item.amount + 1);
//         } else {
//           return item;
//         }
//       }).toList(),
//     );
//   }
//
//   void decrementBasketProduct(BasketModel model) {
//     state = state.copyWith(
//       basket: state.basket.map<BasketModel>((item) {
//         if (item.id == model.id) {
//           return item.copyWith(amount: item.amount - 1);
//         } else {
//           return item;
//         }
//       }).toList(),
//     );
//     clearZeroAmountBasket();
//   }
//
//   void clearZeroAmountBasket() {
//     state = state.copyWith(
//         basket: state.basket.where((element) => element.amount != 0).toList());
//   }
//
//   void removeBasketElement(BasketModel model) {
//     basketLendht.value = basketLendht.value - 1;
//     state = state.copyWith(
//         basket:
//         state.basket.where((element) => element.id != model.id).toList());
//   }
//
//   void updateBasketElement(BasketModel model, int amount) {
//     if (amount == 0 || model.amount == amount) {
//       removeBasketElement(model);
//     } else {
//       state = state.copyWith(
//         basket: state.basket.map<BasketModel>((item) {
//           if (item.id == model.id) {
//             return item.copyWith(amount: amount);
//           } else {
//             return item;
//           }
//         }).toList(),
//       );
//     }
//   }
//
//   void filterByCategories() {
//     if (filterList.value.isEmpty) {
//       restaurants.value = fakeData.restaurantData;
//       return;
//     }
//
//     restaurants.value = fakeData.restaurantData.where((element) {
//       return filterList.value.every(
//               (category) => element.products.keys.toList().contains(category));
//     }).toList();
//   }
//
//   void setLocation(PlaceLocation location) async {
//     state = state.copyWith(
//       locationList: [...state.locationList, location],
//     );
//     setAsMainAddress(location);
//   }
//
//   void addOrder(OrderModel order) {
//     state = state.copyWith(
//       ordersHistory: [order, ...state.ordersHistory],
//     );
//   }
//
//   void setAsMainAddress(PlaceLocation location) {
//     state = state.copyWith(
//       locationList: state.locationList.map<PlaceLocation>((item) {
//         if (item.id == location.id) {
//           return item.copyWith(isSelected: true);
//         } else {
//           return item.copyWith(isSelected: false);
//         }
//       }).toList(),
//     );
//   }
//
//   Future<void> getCurrentLocation(
//       Completer<GoogleMapController> controller) async {
//     var location = Location();
//     try {
//       LocationData userLocation = await location.getLocation();
//       final GoogleMapController mapController = await controller.future;
//       mapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//             target: LatLng(userLocation.latitude!, userLocation.longitude!),
//             zoom: 20,
//           ),
//         ),
//       );
//       latitude = userLocation.latitude!;
//       longitude = userLocation.longitude!;
//       await addressName(latitude!, longitude!);
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<PlaceLocation?> addressName(double latitude, double longitude) async {
//     final url = Uri.parse(
//         "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyAMUS_eH_E0_qPzIuweJL_NWuRKoI8lj0w");
//     final response = await get(url);
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       final resData = jsonDecode(response.body);
//       final currentLocationName =
//       resData["results"][0]['formatted_address'] as String;
//       return PlaceLocation(
//         longitude: longitude,
//         latitude: latitude,
//         address: currentLocationName,
//       );
//     }
//     return null;
//   }
// }

class ProviderModel extends ChangeNotifier {

}

final appProvider = ChangeNotifierProvider<ProviderModel>(
  (ref) => ProviderModel(),
);
