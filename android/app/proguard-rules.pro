-keepclassmembers class * {
    @android.webkit.javascriptinterface <methods>;
}

-keepattributes javascriptinterface
-keepattributes *annotation*

-dontwarn com.razorpay.**
-keep class com.razorpay.** {*;}

-optimizations !method/inlining/*

-keepclasseswithmembers class * {
  public void onpayment*(...);
}