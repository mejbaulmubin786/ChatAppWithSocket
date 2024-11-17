ডাটাবেইজে ডাটা ইনসার্ট করার পরে আমরা এবার লগিং লগ আউট করতে পারবো । আমাদের ইনসার্ট করা ডাটা দিয়ে আমরা ইউজার হিসেবে এডমিন হিসেবে এমন কি ভেনডর হিসেবে লগিং করতে পারবো। আমাদের এখন মেইন যে পরিবর্তন করতে হবে তা হচ্ছে ইউজার এর রোল। এর জন্য আমাদের এডমিও ও ভেন্ডর এর জন্য আলাগা আলাগা ডেসবোর্ড তৈরি করতে হবে আর ইউজার এর জন্য একটি কমন ডেসবোর্ড থাকবে। এর জন্য আমাদের কয়েকটি নতুন পেইজ তৈরি করতে হবে। এবং এদের মিডুল ওয়্যর দিয়ে প্রটেকটেড করতে হবে। এর জন্য প্রথমে আমি রিসোর্স এর ভিউ ফোল্ডারে admin এবং vendor নামে দুটি নতুন ফোল্ডার তৈরি করে নিলাম যাতে স্ব স্ব রিলেটেড ডাটা থাকবে। এবার কন্ট্রোলার তৈরির জন্য কমান্ড দিবো।

```php
php artisan make:controller AdminController
php artisan make:controller VendorController
```

### কন্ট্রোালার তৈরি

এবার আমরা এই কন্ট্রোলার গুলো ব্যবহার করে প্রয়োজনিয় রাউট তৈরি করে নি। আমরা এবার একটি একটি করে শুরু করি। প্রথমেই admin এর জন্য `Route::get('/admin/dashboard', [AdminController::class, 'AdminDashboard'])->name('admin.dashboard');` টি তৈরি করে নিলাম এবং কন্ট্রোলার এর সাথে লিঙ্ক দেওয়ার জন্য উপরে কন্ট্রোলার `use App\Http\Controllers\AdminController;` ব্যবহার করে নিবো। এখানে আমরা `AdminDashboard` নামে একটি মেথড ব্যবহার করেছি যা এবার আমরা কন্ট্রোলারে তৈরি করে নি।

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

### এখানে এসে এবার আমরা যদি আমরা এডমিন বা ভেন্ডর হিসেবে লগিং করি তবে আমাদের দুটি আলাদা ডেসবোর্ড এ নেওয়ার কথা কিন্তু আমরা লগিং করলে সারাধারন ইউজার দের ডেসবোর্ড ই দেখতে পাই। এবার এডমিন ও ভেন্ডর এর জন্য আমাদের তৈরি করা ডেসবোর্ড রিডাইরেক্ট করে দিবো। আমরা এই ইউজার এডমিন বা ভেন্ডর এর জন্য আলাদা আলাদা ডেসবোর্ড মেনটেইন বা তাদের প্রোটেক্ট ই বা করবো কি করে মানে ভেন্ডর কোনভাবেই এডমিন এর ডেসবোর্ড এ ডুকতে পারবেনা বা ইউজার কোনভাবেই এডমিন বা ভেন্ডর এর ডেসবোর্ড এর একসেস করতে পারবে না। এর জন্য আমরা ব্যবহার করবো মিডলওয়্যার ।

### এর জন্য আমরা `php artisan make:middleware Role` কমান্ড দিয়ে Role নামে একটি middleware তৈরি করে নিলাম।

```php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Role
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        return $next($request);
    }
}
```

এটি তৈরি করার পরে আমাদের প্রথম কাজ এটিকে রেজিস্ট্রেশন করা। এর জন্য আমাদের যেতে হবে Kernel.php ফাইলের `protected $middlewareAliases = [` অংশে\*\* ঐখানে আমরা আমাদের মিডলওয়্যার এর জন্য `'role' => \App\Http\Middleware\Role::class,`

##### Middleware কে রেজিস্ট্রেশন কেন ব্যবহার করলাম তার ব্যাখ্যা

লারাভেলে একটি নতুন Middleware তৈরি করার পর সেটিকে Kernel.php ফাইলে `$middlewareAliases` এ যুক্ত করার উদ্দেশ্য হলো সেই Middleware-কে একটি শর্টকাট বা সহজ নাম (alias) দিয়ে সেটিকে ব্যবহার করা সহজ করা।

### সহজ ভাষায় বিষয়টি বুঝুন:

Middleware মূলত এমন একটি "ফিল্টার" বা "প্রসেস" যা কোনো রিকোয়েস্ট (যেমন: ইউজার যখন ব্রাউজারে কোনো পেজ দেখতে চায়) সার্ভারে পৌঁছানোর আগে বা সার্ভার থেকে রেসপন্স (উত্তর) ইউজারের কাছে পাঠানোর আগে কাজ করে। উদাহরণস্বরূপ, কিছু Middleware শুধুমাত্র লগিন করা ইউজারদের নির্দিষ্ট পেজে অ্যাক্সেস দেয়।

#### Middleware তৈরি করার পর কী হয়?

Middleware তৈরি করলে সেটিকে `App\Http\Middleware` ফোল্ডারে রাখা হয়। কিন্তু শুধু Middleware তৈরি করলেই হবে না, Laravel-কে জানতে হবে কখন ও কোথায় সেটি ব্যবহার করতে হবে।

### `$middlewareAliases` কী?

Kernel.php ফাইলে `$middlewareAliases` নামে একটি প্রপার্টি থাকে, যেটি বিভিন্ন Middleware-এর "সার্টকাট নাম" বা "ছোট নাম" ধরে রাখে। `$middlewareAliases`-এ আমরা Middleware-এর পুরো ক্লাসের নামের বদলে একটি ছোট নাম বা alias দিয়ে রাখতে পারি।

### উদাহরণ দিয়ে বলি:

এখানে আমরা একটি `role` নামে Middleware ব্যবহার করছি, যার ক্লাস হলো `\App\Http\Middleware\Role::class`।

```php
protected $middlewareAliases = [
    'role' => \App\Http\Middleware\Role::class,
];
```

এখানে:

-   `'role'` হলো সেই Middleware-এর একটি ছোট নাম বা alias।
-   `\App\Http\Middleware\Role::class` হলো পুরো ক্লাসের নাম, যেখানে Middleware কোডটি লেখা আছে।

এখন এই alias ব্যবহার করে সহজেই Middleware-কে ব্যবহার করা যাবে। যেমন: কোনো রাউটে `role` Middleware অ্যাপ্লাই করতে চাইলে শুধু `role` নামটি ব্যবহার করলেই হবে।

### উপকারিতা

এভাবে `$middlewareAliases` এ alias ব্যবহার করলে বড় বড় ক্লাসের নাম লেখার ঝামেলা থেকে বাঁচা যায় এবং কোড আরও পরিষ্কার থাকে।

মিডলওয়্যার এর ব্যাখ্যা এখানে শেষ।

---

এবার আমরা আমাদের তৈরি করা মিডলওয়্যার Role এ গিয়ে কিছু কন্ডিশন যুক্ত করবো। প্রথমে আমরা এবার মিডল ওয়্যারে পেরিমিটার হিসেবে `public function handle(Request $request, Closure $next, $role)` $role কে পাস করে দিলাম। এর পর কন্ডিশন যুক্ত করবো এখন এখানে এটি ডিফল্ট ডেসবোর্ড

```php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Role {
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, $role): Response {
        if ($request->user()->role !== $role) {
            return redirect('dashboard');
        }
        return $next($request);
    }
}

```

#### কোর্ড ব্যাখ্যা

---

আপনার Middleware `Role` ক্লাসটি যেভাবে কাজ করে, সেটি বুঝিয়ে দিচ্ছি:

### কোডটি কী করছে:

1. **Namespace এবং Imports**:

    ```php
    namespace App\Http\Middleware;
    use Closure;
    use Illuminate\Http\Request;
    use Symfony\Component\HttpFoundation\Response;
    ```

    এখানে `Role` ক্লাসটি `App\Http\Middleware` নেমস্পেসে আছে এবং এতে `Closure`, `Request`, ও `Response`-এর জন্য প্রয়োজনীয় ক্লাসগুলো ইমপোর্ট করা হয়েছে।

2. **Role ক্লাসের handle মেথড**:

    ```php
    public function handle(Request $request, Closure $next, $role): Response {
        if ($request->user()->role !== $role) {
            return redirect('dashboard');
        }
        return $next($request);
    }
    ```

    `handle` মেথডে আপনার Middleware এর মূল কাজ করা হয়।

    এখানে `handle` মেথডে তিনটি প্যারামিটার রয়েছে:

    - `$request`: ইউজারের অনুরোধের তথ্য ধারণ করে।
    - `$next`: পরবর্তী Middleware অথবা রিকোয়েস্ট প্রসেসিং কন্ট্রোলার।
    - `$role`: এটি এক্সট্রা প্যারামিটার হিসাবে নেওয়া হয়েছে, যা এই Middleware-এ বিভিন্ন ভূমিকার (role) জন্য ব্যবহৃত হয়।

3. **Middleware-এর কাজ**:
    ```php
    if ($request->user()->role !== $role) {
        return redirect('dashboard');
    }
    ```
    - এখানে `if` চেক করে যে ইউজারের রোল (`$request->user()->role`) `$role` প্যারামিটার এর সাথে মিলে কিনা।
    - যদি না মেলে, তাহলে ইউজারকে `dashboard` পেজে রিডিরেক্ট করে দেয়া হয়।
4. **`$next($request)`**:
    ```php
    return $next($request);
    ```
    - যদি রোল মিলেযায়, তাহলে Middleware কন্ট্রোলকে পরবর্তী Middleware বা কন্ট্রোলারের কাছে পাঠিয়ে দেয়।

### এই Middleware কেন দরকার?

এই Middleware ব্যবহার করে আপনি নির্দিষ্ট রোলের ইউজারদেরকে নির্দিষ্ট রিসোর্স অ্যাক্সেস করতে দিতে পারেন। যেমন, শুধুমাত্র `admin` রোলের ইউজাররা একটি পেজ দেখতে পারবে এবং অন্য রোলের ইউজারদেরকে ড্যাশবোর্ডে রিডিরেক্ট করা হবে।

### ব্যবহারের উদাহরণ

এই Middleware-কে `$middlewareAliases` এ `role` নামে অ্যাড করে যদি কোনো রাউটে ব্যবহার করেন, যেমন:

```php
Route::get('/admin', function () {
    // admin page content
})->middleware('role:admin');
```

তাহলে কেবলমাত্র `admin` রোলের ইউজাররাই `/admin` পেজ দেখতে পারবেন, অন্যরা `dashboard` পেজে রিডিরেক্ট হবেন। এই `dashboard` হচ্ছে ডিফল্ট এটি পাওয়া যাবে Providers ফোল্ডারের ভেতর `RouteServiceProvider.php` তে যা ঐখানে `public const HOME = '/dashboard';` লাইনের দারা হয়েছে।

**এভাবে Middleware-কে ইউজারের রোল অনুযায়ী ফিল্টার করার জন্য ব্যবহার করা যায়।**

এবার আমরা আমাদের রাউট গুলোকে মিডলওয়ার ব্যবহার করে প্রটেকডেট করবো।

```php
Route::middleware(['auth', 'role:admin'])->group(function () {
    Route::get('/admin/dashboard', [AdminController::class, 'AdminDashboard'])->name('admin.dashboard');
});

Route::middleware(['auth', 'role:vendor'])->group(function () {
    Route::get('/vendor/dashboard', [VendorController::class, 'VendorDashboard'])->name('vendor.dashboard');
});
```

**কোর্ড এর ব্যাখ্যা**
এখানে দু’টি আলাদা রাউট গ্রুপ তৈরি করা হয়েছে, যেখানে **`admin`** এবং **`vendor`** রোল অনুযায়ী ড্যাশবোর্ড পেজ আলাদা করা হয়েছে। এবার এগুলোর প্রতিটি অংশ বিশ্লেষণ করি।

---

### ১. `Route::middleware([...])->group(...)`

-   `Route::middleware` অংশটি বলে দিচ্ছে যে এই রাউট গ্রুপে কিছু Middleware প্রয়োগ করা হবে।
-   `group(function () {...})` অংশটি রাউটগুলিকে একটি গ্রুপে একত্রিত করে এবং এই গ্রুপে থাকা প্রতিটি রাউটে একই Middleware প্রয়োগ করে।

এখানে দুটি আলাদা গ্রুপ তৈরি করা হয়েছে, প্রতিটির জন্য আলাদা রোলের Middleware প্রয়োগ করা হয়েছে।

---

### ২. `['auth', 'role:admin']` এবং `['auth', 'role:vendor']`

প্রথম রাউট গ্রুপে `['auth', 'role:admin']` এবং দ্বিতীয় রাউট গ্রুপে `['auth', 'role:vendor']` Middleware প্রয়োগ করা হয়েছে। এগুলো কীভাবে কাজ করে, তা দেখি:

1. **'auth' Middleware**:

    - `auth` Middleware নিশ্চিত করে যে ইউজার লগইন করা আছে কিনা।
    - যদি ইউজার লগইন না করে থাকে, তাহলে তাকে লগইন পেজে পাঠানো হবে।

2. **'role:admin' এবং 'role:vendor' Middleware**:
    - `role:admin` Middleware নিশ্চিত করে যে ইউজারের রোল `admin` হতে হবে, যাতে তিনি `/admin/dashboard` পেজ দেখতে পারেন।
    - `role:vendor` Middleware নিশ্চিত করে যে ইউজারের রোল `vendor` হতে হবে, যাতে তিনি `/vendor/dashboard` পেজ দেখতে পারেন।
    - Middleware এর মধ্যে এই রোল চেক করার জন্য আগে যে `Role` Middleware তৈরি করেছিলেন, সেটিই কাজ করছে। যদি ইউজারের রোল ম্যাচ না করে, তাহলে তাকে `dashboard` রুটে রিডিরেক্ট করা হবে।

---

### ৩. প্রতিটি Route-এর ভেতরে কী রয়েছে

#### Admin Dashboard Route

```php
Route::get('/admin/dashboard', [AdminController::class, 'AdminDashboard'])->name('admin.dashboard');
```

-   **Route::get('/admin/dashboard', ...)**: এই অংশটি `/admin/dashboard` URL-এর জন্য একটি GET রিকোয়েস্ট সেট করছে।
-   **[AdminController::class, 'AdminDashboard']**: এই অংশটি নির্দেশ করছে যে `AdminController`-এর `AdminDashboard` মেথডটি এক্সিকিউট করা হবে।
-   **->name('admin.dashboard')**: এটিকে একটি নাম দেওয়া হয়েছে (`admin.dashboard`), যাতে রাউটটি সহজে রেফার করা যায়।

#### Vendor Dashboard Route

```php
Route::get('/vendor/dashboard', [VendorController::class, 'VendorDashboard'])->name('vendor.dashboard');
```

-   এই Route টি `/vendor/dashboard` URL-এ যাওয়ার জন্য এবং `VendorController` এর `VendorDashboard` মেথডটি কল করার জন্য।
-   এর নাম দেওয়া হয়েছে `vendor.dashboard`, যাতে এটি সহজেই রেফার করা যায়।

---

### সংক্ষেপে:

1. `/admin/dashboard` রাউটে যেতে হলে ইউজারকে **auth** এবং **admin** রোল থাকা বাধ্যতামূলক। শুধুমাত্র অ্যাডমিনরাই এই রাউটে যেতে পারবে।
2. `/vendor/dashboard` রাউটে যেতে হলে ইউজারকে **auth** এবং **vendor** রোল থাকা বাধ্যতামূলক। শুধুমাত্র ভেন্ডররাই এই রাউটে যেতে পারবে।
3. Middleware এর মাধ্যমে এই রোল চেকিং করা হচ্ছে, এবং যদি রোল মিল না করে, তাহলে ইউজারকে `dashboard` রুটে রিডিরেক্ট করা হবে।

---

#### এখানে আমাদের রাউট গুলো প্রটেকটেড হলো মানে রাউট গুলো চেক করবে এটি এডমিন বা ভেন্ডর কিনা। এখনো এটি নির্দিস্ট ডেসবোর্ড এ রিডাইরেক্ট করে নি তা করার জন্য । আমরা AuthenticatedSessionController.php ফাইলে গিয়ে দেখলে দেখতে পাই যে, সেখানে

```php
public function store(LoginRequest $request): RedirectResponse
    {
        $request->authenticate();

        $request->session()->regenerate();

        return redirect()->intended(RouteServiceProvider::HOME);
    }
```

**কোর্ড এর ব্যাখ্যা**
এই `store` মেথডটি Laravel-এর `AuthenticatedSessionController.php` ফাইলে লগইন করার প্রক্রিয়াটি সম্পন্ন করার জন্য ব্যবহৃত হয়। এটি সাধারণত ইউজার লগইনের পর কী কী কাজ করবে, তা নির্দেশ করে। মেথডটি ধাপে ধাপে বিশ্লেষণ করে দেখা যায়।

```php
public function store(LoginRequest $request): RedirectResponse
{
    $request->authenticate();

    $request->session()->regenerate();

    return redirect()->intended(RouteServiceProvider::HOME);
}
```

#### মেথডের প্রতিটি লাইন এবং তার কাজ:

1. **`public function store(LoginRequest $request): RedirectResponse`**:

    - এই অংশটি `store` নামে একটি পাবলিক মেথড তৈরি করেছে, যা `LoginRequest` ক্লাস থেকে `$request` অবজেক্ট গ্রহণ করে।
    - এই মেথডটি `RedirectResponse` টাইপের রেসপন্স ফেরত দেবে। অর্থাৎ, এটি ইউজারকে কোনো পেজে রিডিরেক্ট করবে।

2. **`$request->authenticate();`**:

    - `$request` অবজেক্টের `authenticate()` মেথডটি কল করা হচ্ছে।
    - এই মেথডটি ইউজারের দেওয়া ইমেইল ও পাসওয়ার্ড যাচাই করে, এগুলো সঠিক হলে ইউজারকে লগইন করায়।
    - যদি ইমেইল ও পাসওয়ার্ড ভুল হয়, তবে সাধারণত ব্যাকএন্ড থেকে একটি ত্রুটি মেসেজ ফেরত পাঠানো হয়।

3. **`$request->session()->regenerate();`**:

    - এই লাইনটি ইউজার সেশনের আইডি রি-জেনারেট বা পুনরায় তৈরি করে।
    - এটি একটি গুরুত্বপূর্ণ সিকিউরিটি স্টেপ, কারণ এটি "সেশনের ফিক্সেশন অ্যাটাক" (session fixation attack) থেকে রক্ষা করে। লগইনের পর সেশন আইডি পরিবর্তন করে দেয়, ফলে পুরনো সেশন আইডি আর কার্যকর থাকে না।
    - অর্থাৎ, ইউজারের নতুন একটি সেশনের মাধ্যমে নিরাপদে লগইন করায়।

4. **`return redirect()->intended(RouteServiceProvider::HOME);`**:
    - `redirect()->intended(...)` মেথডটি ইউজারকে সঠিক পেজে রিডিরেক্ট করে।
    - `RouteServiceProvider::HOME` এখানে একটি কনস্ট্যান্ট, যা সাধারণত হোমপেজ বা ড্যাশবোর্ড পেজের URL সংরক্ষণ করে।
    - যদি ইউজার লগইনের আগে কোনো নির্দিষ্ট পেজ অ্যাক্সেস করার চেষ্টা করছিলেন, তাহলে `intended` মেথড তাকে ওই পেজে রিডিরেক্ট করবে। যদি নির্দিষ্ট কোনো পেজ না থাকে, তাহলে `RouteServiceProvider::HOME` URL-এ রিডিরেক্ট হবে।

### সংক্ষেপে:

-   `$request->authenticate();`: ইউজারের লগইন তথ্য যাচাই করে।
-   `$request->session()->regenerate();`: সেশন আইডি রি-জেনারেট করে সিকিউরিটি নিশ্চিত করে।
-   `return redirect()->intended(...);`: ইউজারকে লগইনের পর পূর্ববর্তী পেজে বা ডিফল্ট হোম পেজে রিডিরেক্ট করে।

### এখান থেকে দেখতে পারি যে `return redirect()->intended(RouteServiceProvider::HOME);` যা RouteServiceProvider এর হোম দেখাচ্ছে আর `RouteServiceProvider.php` তে গেলে আমরা পূর্বেই দেখেছি সেখানে HOME হচ্ছে public const HOME = '/dashboard';। তাই return redirect()->intended(RouteServiceProvider::HOME); থেকে সরাসরি ডিফল্ট HOME ই রিডাইরেক্ট করে তাই এখানে কিচু চেঞ্জ করতে হবে। যাতে আমরা বিভিন্ন ধরনের রোল সেট করবো।

এর জন্য প্রথমে আমরা AuthenticatedSessionController এর store মেথড এরিয়াতে আমরা সকল Role গুলো সেট করবো।

```php
public function store(LoginRequest $request): RedirectResponse {
        $request->authenticate();

        $request->session()->regenerate();

        $url = '';
        if ($request->user()->role === 'admin') {
            $url = 'admin/dashboard';
        } elseif ($request->user()->role === 'vendor') {
            $url = 'vendor/dashboard';
        } else {
            $url = '/dashboard';
        }

        return redirect()->intended($url);

    }
```
