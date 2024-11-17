ডাটাবেইজে ডাটা ইনসার্ট করার পরে আমরা এবার লগিং লগ আউট করতে পারবো । আমাদের ইনসার্ট করা ডাটা দিয়ে আমরা ইউজার হিসেবে এডমিন হিসেবে এমন কি ভেনডর হিসেবে লগিং করতে পারবো।  আমাদের এখন মেইন যে পরিবর্তন করতে হবে তা হচ্ছে ইউজার এর রোল। এর জন্য আমাদের এডমিও ও ভেন্ডর এর জন্য আলাগা আলাগা ডেসবোর্ড তৈরি করতে হবে আর ইউজার এর জন্য একটি কমন ডেসবোর্ড থাকবে। এর জন্য আমাদের কয়েকটি নতুন পেইজ তৈরি করতে হবে। এবং এদের মিডুল ওয়্যর দিয়ে প্রটেকটেড করতে হবে। এর জন্য প্রথমে আমি রিসোর্স এর ভিউ ফোল্ডারে admin এবং vendor নামে দুটি নতুন ফোল্ডার তৈরি করে নিলাম যাতে স্ব স্ব রিলেটেড ডাটা থাকবে। এবার কন্ট্রোলার তৈরির জন্য কমান্ড দিবো।
```php
php artisan make:controller AdminController
php artisan make:controller VendorController
```

### কন্ট্রোালার তৈরি
এবার আমরা এই কন্ট্রোলার গুলো ব্যবহার করে প্রয়োজনিয় রাউট তৈরি করে নি।  আমরা এবার একটি একটি করে শুরু করি। প্রথমেই admin এর জন্য `Route::get('/admin/dashboard', [AdminController::class, 'AdminDashboard'])->name('admin.dashboard');` টি তৈরি করে নিলাম এবং কন্ট্রোলার এর সাথে লিঙ্ক দেওয়ার জন্য উপরে কন্ট্রোলার  `use App\Http\Controllers\AdminController;` ব্যবহার করে নিবো। এখানে আমরা `AdminDashboard` নামে একটি মেথড ব্যবহার করেছি যা এবার আমরা কন্ট্রোলারে তৈরি করে নি। 
```php
<?php

namespace App\Http\Controllers;

class AdminController extends Controller {
    public function AdminDashboard() {
        return view('admin.admin_dashboard');
    } // End Method
}
```
মেথড ডিতে আপাতত আমরা শুধুমাত্র একটি ভিউ এর ফাইল রিটার্ন করেছি। `return view('admin.admin_dashboard');` এখানে দেখাচ্ছে আমরা admin ফেল্ডারের ভেতর admin_dashboard নামে একটি ফাইল ব্যবহার করেছি। আমরা এবার ব্রাউজারে এটি চেক করলে সুন্দর মতো কাজ করে। চেক করার জন্য admin_dashboard ফাইল মানে resources/views/admin/ ফোল্ডারে admin_dashboard.blade.php নামে ফাইল টি আছে। 
#### একই ভাবে ভেন্ডর এর জন্য তৈরি করে নি।
```php
<?php

namespace App\Http\Controllers;

class VendorController extends Controller {
    public function VendorDashboard() {
        return view('vendor.vendor_dashboard');
    } // End Method
}
```
