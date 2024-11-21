এবার আমরা শিখবো কি করে এডমিন প্রোফাইল কাস্টমাইজেশন কমপ্লিট করবো।

#### ধাপ ১: **ইউআরএল হেডারে যুক্ত করা**

প্রথমে আমাদের হেডারে একটি নতুন প্রোফাইল মেনু যুক্ত করতে হবে।  
এটি করতে হলে নিম্নলিখিত কাজগুলো সম্পন্ন করুন:

1. **হেডার ফাইল খুলুন**  
   আপনি যেখানে আপনার হেডার ফাইল সংরক্ষণ করেছেন, সেই ফাইলটি খুলুন। সেখানে <span>Profile</span> এই অংশে যান

    মানে

    ```php
    <a class="dropdown-item" href="javascript:;">
     <i class="bx bx-user"></i>
     <span>Profile</span></a>
    ```

    অংশে

2. **মেনু কোড কপি ও এডিট করুন**  
   লগআউট মেনুর জন্য যে কোডটি আছে `{{ route('admin.logout') }}` তা কপি করে প্রোফাইল মেনুর জন্য ব্যবহার করুন।  
   উদাহরণ:

```html
<li>
    <a href="{{ route('admin.profile') }}">Profile</a>
</li>
```

3. **রুট সংযোগ করুন**  
   নতুন প্রোফাইল ইউআরএল সংযোগ করতে `web.php` ফাইল এডিট করুন।

```php
Route::get('/admin/profile', [AdminController::class, 'AdminProfile'])->name('admin.profile');
```

---

#### ধাপ ২: **অ্যাডমিন প্রোফাইল মেথড তৈরি করা**

1. **কন্ট্রোলারে নতুন মেথড তৈরি করুন**  
   `AdminController.php` ফাইলে গিয়ে একটি নতুন মেথড তৈরি করুন।  
   উদাহরণ:

```php
public function adminProfile()
{
    // লগ ইনকৃত ইউজারের আইডি সংগ্রহ
    $id = Auth::id();

    // ইউজারের ডেটা সংগ্রহ
    $adminData = User::find($id);

    // ডেটা ভিউতে পাঠানো
    return view('admin.admin_profile_view', compact('adminData'));
}
```

2. **মডেল ইমপোর্ট করুন**  
   `User` মডেল ইমপোর্ট করতে কন্ট্রোলারের উপরে যুক্ত করুন:

```php
use App\Models\User;
use Illuminate\Support\Facades\Auth;
```

---

#### ধাপ ৩: **ভিউ পেজ তৈরি করা**

1. **ভিউ ফোল্ডারে ফাইল তৈরি করুন**  
   `resources/views/admin` ফোল্ডারে `admin_profile_view.blade.php` নামে একটি নতুন ফাইল তৈরি করুন।

ফাইলে index পেইজ থেকে এই অংশ কপি করে পেস্ট করুন।

```php
@extends('admin.admin_dashboard')
@section('admin')



@endsection
```

---

#### ধাপ ৪: **রাউট পরীক্ষা করুন**

-   ব্রাউজারে `/admin/profile` খুলুন।
-   অ্যাডমিনের তথ্য সঠিকভাবে দেখানো হচ্ছে কিনা নিশ্চিত করুন।

---

এবার আমাদের টেম্পলেট থেকে user-profile.html এর <div class="page-content"> এর মাঝের সকল কিছু কপি করে

```php
@extends('admin.admin_dashboard')
@section('admin')

<div class="page-content">  এখানে সম্পূন্ন কোর্ড পেস্ট করতে হবে।

@endsection
```
