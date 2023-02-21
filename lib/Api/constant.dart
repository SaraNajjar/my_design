class Constant {

  static const baseUrl= 'https://mydesign.hexacit.com/api';
  static const signUpUrl= '/signUp';
  static const signInUrl= '/login';
  static const categoriesUrl= '/getCategories';
  static const bannerUrl= '/getBanners';
  static const contactUsUrl= '/contactUs';
  static const settingsUrl= '/getSetting';
  static const myprofileUrl= '/MyProfile';
  static String getSubCategories(int id){
    return '/getSubCategories/$id';
  }
  static String getDesign(int id){
    return '/getDesigns/$id';
  }
}