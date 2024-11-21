#### ১. অ্যাডমিন প্রোফাইল পেজের প্রস্তুতি:

আমরা প্রথমে **authenticated user**-এর ডেটা কীভাবে ডাটাবেস থেকে পাই। এই ডেটা `compact()` মেথড ব্যবহার করে অ্যাডমিন প্রোফাইল ভিউতে পাঠানো হয়। ভিউতে আমরা নিম্নলিখিত তথ্য যোগ করব:

-   **Name**
-   **Username**
-   **Email**
-   **Phone**
-   **Address**

#### ২. ভিউতে ফিল্ডস যুক্ত করা:

আমাদের admin_profile_view পেইজে টেমপ্লেট ব্যবহার করে নিম্নলিখিতভাবে ফিল্ড গুলো যুক্ত করা হয়:

```html
<h6 class="mb-0">
    Full Name
    <!--replace with `User Name`-->
</h6>
<div class="col-sm-3">
    <h6 class="mb-0">
        Email
        <!--replace with `Name`-->
    </h6>
</div>

<div class="col-sm-3">
    <h6 class="mb-0">Phone</h6>
    <!--replace with `Email`-->
</div>

<div class="col-sm-3">
    <h6 class="mb-0">Mobile</h6>
    <!--replace with `Phone`-->
</div>
```

#### ৩. ডায়নামিক ডেটা প্রদর্শন:

ভিডিওতে দেখানো হয়েছে কিভাবে আমরা প্রোফাইলের প্রতিটি ফিল্ডে ডায়নামিক ডেটা যোগ করতে পারি। এখানে `$adminData` ভেরিয়েবল থেকে ডেটা অ্যাক্সেস করে Blade টেমপ্লেটে দেখানো হয়।

```html
<!--এর পরে স্টেটিক ডাটা গুলো আছে সেখানে আমরা ডাইনামিক ডাটা গুলো বসাতে থাকে -->

<input type="text" class="form-control" value="John Doe" />
<!--যেমন এখানে John Doe আছে আমরা দিতে পারি {{ $adminData->username }} এভাবে পরবর্তিতে শুধু প্রয়োজনিয় স্থান গুলো রিপ্লেস করতে থাকবো।-->

<!--john@example.com এর স্থলে {{ $adminData->name }}-->
<!--
{{ $adminData->email }}
{{ $adminData->phone }}
{{ $adminData->address }}
```

#### ৪. ডিফল্ট ইমেজের শর্ত যোগ করা:

প্রোফাইল ইমেজ যোগ করতে নিম্নলিখিত শর্ত যুক্ত করা হয়:

```php
// আমাদের আছে নিচের মতো
<img src="{{asset('adminbackend/assets/images/avatars/avatar-2.png')}}" alt="Admin" class="rounded-circle p-1 bg-primary" width="110" />
// আমরা এখানে শর্ত এমনভাবে যুক্ত করবো যাতে আমরা কোন ছবি যুক্ত না করলে ডিফল্ট এটি প্রদর্শন করে আর যদি দি তবে আমাদের দেওয়া টা প্রদর্শন করে
{{ !empty($adminData->photo ) ? url('uplode/admin_images/'.$adminData->photo):url('uplode/admin_images/'.avatar-2.png) }}
```

## কোর্ড ব্যাখ্যা

`{{ !empty($adminData->photo ) ? url('uplode/admin_images/'.$adminData->photo):url('uplode/admin_images/avatar-2.png') }}` কোডটি Laravel ব্লেড টেমপ্লেটের একটি কন্ডিশনাল স্টেটমেন্ট, যেখানে চেক করা হচ্ছে, `$adminData->photo` ফিল্ডটি খালি কিনা। এর মাধ্যমে ডাইনামিকভাবে একটি ফাইলের URL তৈরি করা হচ্ছে। সহজভাবে এটি নিম্নরূপে কাজ করে:

---

### কোডটি:

```php
{{ !empty($adminData->photo ) ? url('uplode/admin_images/'.$adminData->photo):url('uplode/admin_images/avatar-2.png') }}
```

---

### কী হচ্ছে এখানে?

1. **`!empty($adminData->photo)`**:

    - এটি চেক করে যে `$adminData->photo` ফিল্ডটি খালি (`null`, ফাঁকা, বা শূন্য) কিনা।
    - `!` দ্বারা বোঝায় "না" (not)। অর্থাৎ, ফিল্ডটি খালি **না** হলে এটি সত্য (true) হবে।

2. **`?` (টার্নারি অপারেটর)**:

    - এটি কন্ডিশনাল (if-else) চেক করার একটি শর্টকাট।
    - যদি `$adminData->photo` খালি না হয়, তাহলে `?`-এর পরের অংশটি রিটার্ন করবে। অন্যথায় কিছুই রিটার্ন করবে না (কোডে `else` অংশ নেই)।

3. **`url('uplode/admin_images/'.$adminData->photo)`**:
    - এখানে `url()` ফাংশনটি ব্যবহার করা হয়েছে একটি সম্পূর্ণ URL জেনারেট করার জন্য।
    - `'uplode/admin_images/'` হলো একটি ফোল্ডারের পাথ। এর সাথে `$adminData->photo`-র ভ্যালু যোগ করা হয়েছে।
    - ধরে নিই `$adminData->photo`-তে `"example.jpg"` আছে। সেক্ষেত্রে রিটার্ন হবে:
        ```
        http://yourdomain.com/uplode/admin_images/example.jpg
        ```

---

### সহজভাবে বলা হলে:

1. চেক করা হচ্ছে, `$adminData->photo`-তে কোনো ছবি আছে কি না।
2. যদি ছবি থাকে, তাহলে সেই ছবির সম্পূর্ণ URL তৈরি করা হচ্ছে।
3. ছবিটি `uplode/admin_images/` ফোল্ডারে ধরে রাখা হয়েছে বলে ধরা হয়েছে।

---

### উদাহরণ দিয়ে বুঝাই:

#### যখন `$adminData->photo`-তে ছবি আছে:

```php
$adminData->photo = "profile.jpg";
```

তাহলে কোডটি রিটার্ন করবে:

```
http://yourdomain.com/uplode/admin_images/profile.jpg
```

#### যখন `$adminData->photo` খালি:

```php
$adminData->photo = null; // বা ফাঁকা
```

তাহলে রিটার্ন হবে কিছুই না (শূন্য ভ্যালু)।

---

### Laravel Blade-এ ব্যবহারের সুবিধা:

এটি ডাইনামিক ফাইল পাথ তৈরিতে কাজ করে। যেমন, এভাবে অ্যাডমিনের প্রোফাইল ছবির পাথ সহজেই জেনারেট করা যায়।

আপনার প্রশ্নটি খুব গুরুত্বপূর্ণ! **`.$adminData->photo`-এর আগে `.` কেন দেওয়া হচ্ছে**, সেটি আসলে স্ট্রিং কনক্যাটেনেশন বা দুইটি স্ট্রিং একত্রে যুক্ত করার জন্য।

---

### সহজ ভাষায় ব্যাখ্যা:

PHP-তে `.` (ডট) অপারেটর ব্যবহার করা হয় **দুইটি স্ট্রিং যুক্ত করতে**। এখানে `'uplode/admin_images/'` একটি স্ট্রিং, এবং `$adminData->photo`-এর ভ্যালু (যেটি সম্ভবত ফাইলের নাম) অন্য একটি স্ট্রিং।

ডট ব্যবহার না করলে, PHP বুঝবে না যে `'uplode/admin_images/'` এবং `$adminData->photo`-কে একত্রে জুড়ে দিতে হবে।

---

### উদাহরণ:

1. **ডট ছাড়া:**

    ```php
    'uplode/admin_images/$adminData->photo'
    ```

    এভাবে লিখলে, PHP এটিকে একত্রিত করবে না। এটি শুধু টেক্সট হিসেবে `'uplode/admin_images/$adminData->photo'` রিটার্ন করবে। `$adminData->photo`-এর ভ্যালু এখানে কাজ করবে না।

2. **ডট দিয়ে:**
    ```php
    'uplode/admin_images/'.$adminData->photo
    ```
    এভাবে লিখলে, `$adminData->photo`-এর ভ্যালু `'uplode/admin_images/'` স্ট্রিং-এর সাথে যুক্ত হবে।

---

### বাস্তব উদাহরণ:

#### ধরে নিই `$adminData->photo = 'profile.jpg';`।

1. **ডট ছাড়া:**

    ```php
    echo 'uplode/admin_images/$adminData->photo';
    ```

    আউটপুট হবে:

    ```
    uplode/admin_images/$adminData->photo
    ```

2. **ডট দিয়ে:**
    ```php
    echo 'uplode/admin_images/'.$adminData->photo;
    ```
    আউটপুট হবে:
    ```
    uplode/admin_images/profile.jpg
    ```

---

### Laravel Blade-এ ব্যবহার:

Laravel Blade টেমপ্লেটে ডট অপারেটর ব্যবহার করে ডাইনামিক URL বা পাথ তৈরি করা হয়। যেমন:

```php
url('uplode/admin_images/'.$adminData->photo)
```

এটি `http://yourdomain.com/uplode/admin_images/profile.jpg`-এর মতো একটি পূর্ণ URL তৈরি করবে।

---

### সংক্ষেপে:

`.$adminData->photo`-এর **`.` (ডট)** ব্যবহার করা হচ্ছে `'uplode/admin_images/'` এবং `$adminData->photo`-এর মান (যেমন: `profile.jpg`) একত্রে যুক্ত করার জন্য।

#### ৫. ফিল্ড আপডেটের সুবিধা:

```php
<div class="mt-3">
    <h4>John Doe</h4>
    <p class="text-secondary mb-1">Full Stack Developer</p>
    <p class="text-muted font-size-sm">Bay Area, San Francisco, CA</p>

</div>
```

তাছাড়া এড্রেস এর পরে আমরা ছবি আপলোড করার জন্য আর একটি ফিল্ড যুক্ত করতে পারি।

```php
<div class="row mb-3">
    <div class="col-sm-3">
        <h6 class="mb-0">Photo</h6>
        </div>
        <div class="col-sm-9 text-secondary">
        <input type="file" class="form-control" /> // এখানে টাইপ ছবির জন্য কিন্তু file হবে।
    </div>
</div>
```

````php
<input type="text" class="form-control" value="{{ $adminData->username }}" disabled/> // আমরা ইউজার নেইম এর অংশকে disabled ব্যবহার করে ডিসেবল রাখতে পারি যাতে পরিবর্তন করা না যায়।
 ```

#### ৬. সামগ্রিক ফলাফল:

সবকিছু যুক্ত করার পরে, আমরা অ্যাডমিন প্রোফাইল পেজে ডাইনামিক ডেটা সফলভাবে প্রদর্শন করতে সক্ষম হই। এটি প্রোফাইলের প্রতিটি ফিল্ড যেমন নাম, ইউজারনেম, ইমেল, ফোন এবং ঠিকানার ডেটা ডায়নামিকভাবে দেখাতে পারে।

---

### মূল বিষয়বস্তু:

-   Blade টেমপ্লেট ব্যবহার করে ডায়নামিক ডেটা প্রদর্শন।
-   `compact()` মেথড দিয়ে ডেটা ভিউতে পাঠানো।
-   প্রোফাইল ইমেজের জন্য ডিফল্ট ইমেজ ব্যবহারের শর্ত।
-   ফিল্ডসমূহ ডাইনামিকভাবে আপডেট করা।


````
