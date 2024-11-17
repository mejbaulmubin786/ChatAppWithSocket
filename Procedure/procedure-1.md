লারাভেল ব্রিজ ও npm ইন্সটল ও রান করার পরে। এবার আমরা লারাভেল এর সাথে যে ডিফল্ট মাইগ্রেশন ফাইল গুলো পেয়ে থাকি সেটার users ফাইল টিকে আমাদের প্রয়োজন মাফিক কাস্টমাইজ করে নি। 
ফাইলটিতে সাধারণত মেইন কোর্ড
```php
Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });
```
এতটুকু থাকে এই কোড অংশটুকুকে আমরা আমাদের নিজের মতো কাস্টমাইজ করে নি। 
```php
Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('username')->nullable();
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('photo')->nullable();
            $table->string('phone')->nullable();
            $table->text('address')->nullable();
            $table->enum('role', ['admin', 'vendor', 'user'])->default('user');
            $table->enum('status', ['active', 'inactive'])->default('active');
            $table->rememberToken();
            $table->timestamps();
        });
```
## লারাভেল মাইগ্রেশন ফাইল: সহজ করে বোঝা

আপনি যে কোডটি দেখছেন, সেটি লারাভেল ফ্রেমওয়ার্কের একটি মাইগ্রেশন ফাইলের অংশ। মাইগ্রেশন ফাইলগুলো ব্যবহার করে আমরা আমাদের অ্যাপ্লিকেশনের ডাটাবেজের কাঠামো (structure) পরিবর্তন করতে পারি। অর্থাৎ, নতুন টেবিল তৈরি করা, পুরানো টেবিল মুছে ফেলা, কলাম যোগ করা, কলাম মুছে ফেলা ইত্যাদি কাজ করা যায়।

**এই কোডটি কী করছে?**

এই বিশেষ কোডটি একটি নতুন টেবিল তৈরি করছে যার নাম "users"। এই টেবিলটি আমাদের অ্যাপ্লিকেশনের ব্যবহারকারীদের তথ্য রাখতে ব্যবহৃত হবে। আসুন কোডটি ধাপে ধাপে বুঝে নেওয়া যাক:

* **Schema::create('users', function (Blueprint $table) {** : এই লাইনটি একটি নতুন টেবিল তৈরির জন্য একটি ফাংশন কল করে। টেবিলের নাম "users" এবং ফাংশনের ভিতরে আমরা টেবিলের কলামগুলো সংজ্ঞায়িত করব।
* **$table->id();** : এই লাইনটি টেবিলের একটি কলাম তৈরি করে যার নাম "id" এবং এটি একটি স্বয়ংক্রিয়ভাবে বৃদ্ধিপ্রাপ্ত পূর্ণসংখ্যা। এই কলামটি প্রতিটি রেকর্ডকে অনন্যভাবে চিহ্নিত করবে।
* **$table->string('name');** : এই লাইনটি একটি স্ট্রিং ধরনের কলাম তৈরি করে যার নাম "name"। এই কলামে ব্যবহারকারীর নাম সংরক্ষিত হবে।
* **$table->string('username')->nullable();** : এই লাইনটি একটি স্ট্রিং ধরনের কলাম তৈরি করে যার নাম "username" এবং এটি nullable। অর্থাৎ, এই কলামটি খালি থাকতে পারে।
* **$table->string('email')->unique();** : এই লাইনটি একটি স্ট্রিং ধরনের কলাম তৈরি করে যার নাম "email" এবং এটি unique। অর্থাৎ, এই কলামে প্রতিটি ইমেইল অ্যাড্রেস একবারের বেশি ব্যবহার করা যাবে না।
* **$table->timestamp('email_verified_at')->nullable();** : এই লাইনটি একটি timestamp ধরনের কলাম তৈরি করে যার নাম "email_verified_at" এবং এটি nullable। এই কলামে ব্যবহারকারীর ইমেইল যাচাই করার সময় সংরক্ষিত হবে।
* **$table->string('password');** : এই লাইনটি একটি স্ট্রিং ধরনের কলাম তৈরি করে যার নাম "password"। এই কলামে ব্যবহারকারীর পাসওয়ার্ড হ্যাশ করে সংরক্ষিত হবে।
* **$table->string('photo')->nullable();** : এই লাইনটি একটি স্ট্রিং ধরনের কলাম তৈরি করে যার নাম "photo" এবং এটি nullable। এই কলামে ব্যবহারকারীর প্রোফাইল ছবির পথ সংরক্ষিত হবে।
* **$table->string('phone')->nullable();** : এই লাইনটি একটি স্ট্রিং ধরনের কলাম তৈরি করে যার নাম "phone" এবং এটি nullable। এই কলামে ব্যবহারকারীর ফোন নাম্বার সংরক্ষিত হবে।
* **$table->text('address')->nullable();** : এই লাইনটি একটি text ধরনের কলাম তৈরি করে যার নাম "address" এবং এটি nullable। এই কলামে ব্যবহারকারীর ঠিকানা সংরক্ষিত হবে।
* **$table->enum('role', ['admin', 'vendor', 'user'])->default('user');** : এই লাইনটি একটি enum ধরনের কলাম তৈরি করে যার নাম "role" এবং এটি 'admin', 'vendor' বা 'user' এই তিনটি মানের একটি ধারণ করতে পারে। ডিফল্ট মান হিসেবে 'user' সেট করা আছে।
* **$table->enum('status', ['active', 'inactive'])->default('active');** : এই লাইনটি একটি enum ধরনের কলাম তৈরি করে যার নাম "status" এবং এটি 'active' বা 'inactive' এই দুটি মানের একটি ধারণ করতে পারে। ডিফল্ট মান হিসেবে 'active' সেট করা আছে।
* **$table->rememberToken();** : এই লাইনটি একটি remember_token নামের কলাম তৈরি করে যা ব্যবহারকারীকে স্বয়ংক্রিয়ভাবে লগ ইন করতে সাহায্য করে।
* **$table->timestamps();** : এই লাইনটি created_at এবং updated_at নামে দুটি কলাম তৈরি করে যা যথাক্রমে একটি রেকর্ড তৈরি হওয়ার এবং আপডেট হওয়ার সময় সংরক্ষিত করে।

**সারসংক্ষেপ:**

এই কোডটি একটি "users" নামের টেবিল তৈরি করে যা ব্যবহারকারীদের সম্পর্কিত বিভিন্ন তথ্য যেমন নাম, ইমেইল, পাসওয়ার্ড, ঠিকানা ইত্যাদি সংরক্ষণ করতে ব্যবহৃত হবে।


php artisan migrate কমান্ড চালানোর পরে মাইগ্রেশন এর সকল টেবিল তৈরি হয়ে যাবে। 
------------------
এবার মাইগ্রেশন ফাইল টি তৈরি হওয়ার পরে আমি এবার এটিতে সিডিং করতে চাচ্ছি । এর জন্য আমি `php artisan make:seeder UsersTableSeeder` কমান্ড দিয়ে আমার প্রয়োজনিয় সিডার ফাইলটি তৈরি করে নিলাম। ফাইল টি তৈরি হলে আমি তাতে নিচের মতো কোর্ড করি।

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            // Admin
            [
                'name' => 'admin',
                'username' => 'admin',
                'email' => 'admin@admin.com',
                'password' => Hash::make('111'),
                'role' => 'admin',
                'status' => 'active',
            ],
            // Vendor
            [
                'name' => 'vendor',
                'username' => 'vendor',
                'email' => 'vendor@vendor.com',
                'password' => Hash::make('111'),
                'role' => 'vendor',
                'status' => 'active',
            ],
            // user or customer
            [
                'name' => 'user',
                'username' => 'user',
                'email' => 'user@user.com',
                'password' => Hash::make('111'),
                'role' => 'user',
                'status' => 'active',
            ],
        ]);
    }
}
```
আপনাকে এই `UsersTableSeeder` ক্লাসের কাজটি সহজভাবে ব্যাখ্যা করছি:

1. **Seeder কী**: Laravel এ **Seeder** এমন একটি ক্লাস যা ডাটাবেজে ডামি (অস্থায়ী) ডেটা ইনসার্ট করতে ব্যবহৃত হয়। ডেভেলপাররা বিভিন্ন টেবিলের জন্য আলাদা আলাদা Seeder তৈরি করতে পারেন। এই `UsersTableSeeder` ক্লাসটি **users** টেবিলে কিছু ডিফল্ট ডেটা ইনসার্ট করতে তৈরি করা হয়েছে।

2. **namespace এবং use স্টেটমেন্ট**: প্রথমে `namespace Database\Seeders;` লিখে আমরা এই ক্লাসটি কোন জায়গায় রয়েছে তা Laravel কে জানাচ্ছি। তারপর `Illuminate\Database\Seeder`, `Illuminate\Support\Facades\Hash`, এবং `Illuminate\Support\Facades\DB` ইমপোর্ট করা হয়েছে, যেগুলো যথাক্রমে Seeder এর জন্য, পাসওয়ার্ড হ্যাশ করার জন্য, এবং ডাটাবেজ অপারেশনের জন্য প্রয়োজনীয়।

3. **class এবং run() মেথড**: এই ক্লাসের মধ্যে **run()** নামের একটি মেথড আছে, যেটি মূলত Seeder চালানোর সময় এক্সিকিউট হয়। `run()` মেথডের মধ্যে আপনার কাঙ্ক্ষিত ডেটা নির্দিষ্ট করে ইনসার্ট করা হয়েছে।

4. **ডেটা ইনসার্ট**:
   ```php
   DB::table('users')->insert([
   ```
   এখানে `DB::table('users')` লিখে আমরা **users** টেবিলে অ্যাক্সেস নিচ্ছি। তারপর `insert()` মেথড ব্যবহার করে একসাথে তিনটি ডেটা (Admin, Vendor, এবং User) ইনসার্ট করা হচ্ছে।

5. **Hash::make()**: এখানে `Hash::make('111')` পাসওয়ার্ডটি হ্যাশ করে সুরক্ষিত করে রাখছে। এর মানে, পাসওয়ার্ড সরাসরি ডাটাবেজে রাখা হচ্ছে না, বরং এনক্রিপ্ট (গোপনকৃত) করে রাখা হচ্ছে, যাতে এটি নিরাপদ থাকে।

6. **User ডেটার ফরম্যাট**: এই `insert` মেথডের মধ্যে প্রতিটি ব্যবহারকারীর ডেটা একটি অ্যারে আকারে লেখা হয়েছে:
    - `name`: ব্যবহারকারীর নাম (যেমন 'admin', 'vendor', 'user')।
    - `username`: লগইনের জন্য ইউনিক নাম।
    - `email`: ইমেইল ঠিকানা।
    - `password`: হ্যাশ করা পাসওয়ার্ড।
    - `role`: ব্যবহারকারীর ভূমিকা (যেমন 'admin', 'vendor', 'user')।
    - `status`: ব্যবহারকারীর অবস্থা (যেমন 'active')।

এখন, এই Seeder রান করলে Laravel এই ডেটা users টেবিলে ইনসার্ট করবে।

### এখন আমরা models ফোল্ডারের লারাভেল এর সাথে যে ডিফল্ট User মডেলটি থাকে সেটিকে আমাদের প্রয়োজন মতো কাস্টমাইজ করে ব্যবহার করবো। 
```php
<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable {
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
```
##কোর্ড বিশ্লেষণ
এই কোডটি Laravel ফ্রেমওয়ার্কের একটি মডেল (`User` ক্লাস) যা সাধারণত ব্যবহারকারীর তথ্য নিয়ে কাজ করার জন্য ব্যবহৃত হয়। আমি একে ধাপে ধাপে সহজভাবে ব্যাখ্যা করছি:

---

### ১. **নেমস্পেস ও প্রয়োজনীয় ক্লাসগুলো ইমপোর্ট করা**
```php
namespace App\Models;
```
- `namespace` হলো কোডের একটি লজিক্যাল গ্রুপিং।
- এখানে `App\Models` বলে বোঝানো হচ্ছে যে `User` ক্লাসটি অ্যাপ্লিকেশনের মডেলের অংশ।

```php
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
```
- এখানে কিছু Laravel এর বিল্ট-ইন ফিচার ইমপোর্ট করা হয়েছে:
    - `HasFactory`: ফ্যাক্টরি তৈরি করতে ব্যবহৃত হয় (ডেমো ডেটা তৈরি করা সহজ করে)।
    - `Authenticatable`: এটি ব্যবহারকারীদের লগইন সিস্টেমে ব্যবহৃত মৌলিক ফিচার সরবরাহ করে।
    - `Notifiable`: নোটিফিকেশন (ইমেইল বা অন্যান্য) পাঠানোর ফিচার।
    - `HasApiTokens`: API টোকেন ব্যবহারের জন্য।

---

### ২. **`User` ক্লাস তৈরি**
```php
class User extends Authenticatable
```
- `User` হলো একটি ক্লাস যা Laravel এর `Authenticatable` ক্লাস থেকে ইনহেরিট করেছে।
- এটি ব্যবহারকারীদের সাথে সম্পর্কিত ফিচার এবং ডাটাবেস টেবিলের জন্য কাজ করে।

---

### ৩. **ট্রেইট (Traits) ব্যবহার করা**
```php
use HasApiTokens, HasFactory, Notifiable;
```
- এখানে `User` ক্লাসে তিনটি ট্রেইট যুক্ত করা হয়েছে:
    1. **`HasApiTokens`**: API সিকিউরিটির জন্য টোকেন ব্যবহার করতে দেয়।
    2. **`HasFactory`**: ডেমো ডেটা তৈরি করার জন্য।
    3. **`Notifiable`**: নোটিফিকেশন (যেমন ইমেইল) পাঠানোর জন্য।

---

### ৪. **Mass Assignment Protection**
```php
protected $guarded = [];
```
- এটি বলে দেয় যে এই মডেলের সব ফিল্ড (কলাম) *mass assignment*-এর জন্য অনুমোদিত।
- অর্থাৎ, আপনি `$user->create([...])` এর মাধ্যমে সব ফিল্ডে ডেটা যোগ করতে পারবেন।

---

### ৫. **হিডেন অ্যাট্রিবিউট (Hidden Attributes)**
```php
protected $hidden = [
    'password',
    'remember_token',
];
```
- এগুলো এমন ফিল্ড, যেগুলো ডাটাবেস থেকে আনা হলেও JSON বা API রেসপন্সে দেখানো হবে না।
    - উদাহরণ: পাসওয়ার্ড এবং টোকেন।

---

### ৬. **কাস্ট (Casts)**
```php
protected $casts = [
    'email_verified_at' => 'datetime',
];
```
- এটি বলে দেয় যে ডাটাবেসের `email_verified_at` কলামটি যখন কোডে ব্যবহার করা হবে, তখন সেটি একটি **তারিখ/সময়** হিসেবে ব্যবহার করা হবে।

---

### সহজ উদাহরণ
ধরি, আপনার ডাটাবেসে একটি `users` টেবিল আছে যার মধ্যে `name`, `email`, `password` আছে। এই `User` মডেল দিয়ে আপনি সহজে ডাটাবেসের উপর কাজ করতে পারবেন। যেমন:

#### নতুন ব্যবহারকারী তৈরি:
```php
User::create([
    'name' => 'John Doe',
    'email' => 'john@example.com',
    'password' => bcrypt('password123'),
]);
```

#### ব্যবহারকারী খুঁজে পাওয়া:
```php
$user = User::find(1); // আইডি ১-এর ব্যবহারকারী খুঁজে পাওয়া
```

#### ব্যবহারকারীর তথ্য আপডেট:
```php
$user->update(['name' => 'Jane Doe']);
```

---

### সংক্ষেপে
1. এই `User` মডেল Laravel-এর ডাটাবেস টেবিল `users`-এর সাথে কাজ করার জন্য তৈরি।
2. `protected $guarded = [];` বলে দেয় যে সব ফিল্ড আপডেট করা যাবে।
3. `protected $hidden` দিয়ে কিছু ফিল্ড লুকানো হয়েছে (যেমন পাসওয়ার্ড)।
4. `protected $casts` কিছু ডেটার ধরন কাস্ট (পরিবর্তন) করে।

**এখন প্রশ্ন থাকলে জিজ্ঞাসা করতে পারেন। 😊**
### এবার আমরা যাবো UserFactory তে সেখানে প্রয়োজনিক কোর্ড সযুক্ত করে এটিও বাই ডিফলট তৈরি থাকে।
```php
<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->name(),
            'email' => fake()->unique()->safeEmail(),
            'username' => fake()->userName,
            'email_verified_at' => now(),
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'phone' => fake()->phoneNumber(),
            'address' => fake()->address,
            'photo' => fake()->imageUrl('60', '60'),
            'role' => fake()->randomElement(['admin','vendor','user']),
            'status' => fake()->randomElement(['active', 'inactive']),
            'remember_token' => Str::random(10),
        ];
    }

    /**
     * Indicate that the model's email address should be unverified.
     *
     * @return $this
     */
    public function unverified(): static
    {
        return $this->state(fn (array $attributes) => [
            'email_verified_at' => null,
        ]);
    }
}
```
এই কোডটি Laravel-এর **ফ্যাক্টরি (Factory)** নিয়ে কাজ করে। এটি মূলত ডেমো বা টেস্টিং ডেটা তৈরি করতে ব্যবহৃত হয়। এখন একে ধাপে ধাপে সহজ ভাষায় ব্যাখ্যা করা যাক:

---

### **১. নেমস্পেস ও বেস ক্লাস ইমপোর্ট করা**
```php
namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
```
- **`namespace Database\Factories;`**: এই ফ্যাক্টরি কোডটি ডাটাবেস ফ্যাক্টরির অন্তর্ভুক্ত।
- **`Factory` ক্লাস**: ফ্যাক্টরির জন্য প্রয়োজনীয় বিল্ট-ইন Laravel ক্লাস।
- **`Str` ক্লাস**: স্ট্রিং হ্যান্ডলিং-এর জন্য (যেমন র‍্যান্ডম টোকেন তৈরি করা)।

---

### **২. ফ্যাক্টরি ক্লাস ডিফাইন করা**
```php
class UserFactory extends Factory
```
- এটি একটি ক্লাস যা `Factory` থেকে ইনহেরিট করেছে।
- এই ফ্যাক্টরি ক্লাসটি **`User` মডেলের জন্য ডেমো ডেটা তৈরি** করতে ব্যবহৃত হয়।

---

### **৩. ডিফল্ট ডেটা স্টেট**
```php
public function definition(): array
```
- এই মেথডে মডেলের জন্য ডিফল্ট ডেটা বা ফিল্ডগুলোর মান সংজ্ঞায়িত করা হয়।

#### উদাহরণ:
```php
return [
    'name' => fake()->name(),
    'email' => fake()->unique()->safeEmail(),
];
```
- **`fake()`**: Laravel-এর `Faker` লাইব্রেরি, যা টেস্ট ডেটা তৈরি করতে ব্যবহৃত হয়।
- প্রতিটি ফিল্ডে `fake()`-এর মাধ্যমে এলোমেলো ডেটা তৈরি হয়।

---

### **৪. প্রতিটি ফিল্ডের ব্যাখ্যা**

#### **`name`**
```php
'name' => fake()->name(),
```
- ব্যবহারকারীর নাম (যেমন: "John Doe") তৈরি করে।

#### **`email`**
```php
'email' => fake()->unique()->safeEmail(),
```
- একটি ইউনিক এবং নিরাপদ ইমেইল জেনারেট করে (যেমন: "john.doe@example.com")।

#### **`username`**
```php
'username' => fake()->userName,
```
- একটি এলোমেলো ব্যবহারকারীর নাম তৈরি করে (যেমন: "johndoe123")।

#### **`email_verified_at`**
```php
'email_verified_at' => now(),
```
- বর্তমান সময়ে ইমেইল ভেরিফিকেশন করা হয়েছে বলে ধরে নেয়।

#### **`password`**
```php
'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
```
- এটি একটি এনক্রিপ্ট করা পাসওয়ার্ড (যেমন "password")।
- আপনি চাইলে `bcrypt()` দিয়ে নতুন পাসওয়ার্ড এনক্রিপ্ট করতে পারেন।

#### **`phone`**
```php
'phone' => fake()->phoneNumber(),
```
- এলোমেলো ফোন নম্বর জেনারেট করে।

#### **`address`**
```php
'address' => fake()->address,
```
- এলোমেলো ঠিকানা তৈরি করে।

#### **`photo`**
```php
'photo' => fake()->imageUrl('60', '60'),
```
- এলোমেলো ইমেজ URL তৈরি করে। এটি 60x60 সাইজের একটি ছবি হবে।

#### **`role`**
```php
'role' => fake()->randomElement(['admin','vendor','user']),
```
- এলোমেলো একটি ভূমিকা নির্বাচন করে। (যেমন: `admin`, `vendor`, `user`)।

#### **`status`**
```php
'status' => fake()->randomElement(['active', 'inactive']),
```
- এলোমেলো একটি স্ট্যাটাস নির্বাচন করে (যেমন: `active`, `inactive`)।

#### **`remember_token`**
```php
'remember_token' => Str::random(10),
```
- একটি ১০ অক্ষরের এলোমেলো টোকেন তৈরি করে।

---

### **৫. ইমেইল ভেরিফিকেশন বাদ দেওয়ার জন্য `unverified()` মেথড**
```php
public function unverified(): static
{
    return $this->state(fn (array $attributes) => [
        'email_verified_at' => null,
    ]);
}
```
- এই মেথডটি ব্যবহার করলে, `email_verified_at` ফিল্ড **`null`** সেট হবে।
- এটি ব্যবহার করা যেতে পারে যদি ভেরিফিকেশন ছাড়া ব্যবহারকারী তৈরি করতে চান।

#### উদাহরণ:
```php
User::factory()->unverified()->create();
```
- এই কোডের মাধ্যমে একটি ইমেইল ভেরিফিকেশন ছাড়া ব্যবহারকারী তৈরি হবে।

---

### **৬. ফ্যাক্টরি ব্যবহার করার উদাহরণ**
#### একাধিক ব্যবহারকারী তৈরি:
```php
User::factory()->count(10)->create();
```
- এটি ১০টি ব্যবহারকারী তৈরি করবে।

#### নির্দিষ্ট ডেটা সহ ব্যবহারকারী তৈরি:
```php
User::factory()->create([
    'name' => 'John Doe',
    'email' => 'john@example.com',
]);
```
- এটি একটি নির্দিষ্ট `name` এবং `email` সহ ব্যবহারকারী তৈরি করবে।

---

### সংক্ষেপে
- **`UserFactory`** এলোমেলো ব্যবহারকারী ডেটা তৈরি করে।
- এটি টেস্টিং বা ডেভেলপমেন্টে দ্রুত ডেটা জেনারেট করার জন্য খুবই কার্যকর।
- Laravel-এর `Faker` এবং `Factory` মিলে ডেটা তৈরি করার প্রক্রিয়াকে সহজ করে।

### সিডার ক্লাস টি সম্পূন্ন করার পরে এবার আমরা ডাটাবেইজ সিডারে কিছু পরিবর্তন করতে হবে। 
```php
<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(UsersTableSeeder::class);
        \App\Models\User::factory(20)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
```
এখানে `DatabaseSeeder` ক্লাসটি পুরো ডাটাবেজে ডিফল্ট বা ডামি ডেটা যোগ করতে ব্যবহৃত হয়। এবার এর কাজগুলো ব্যাখ্যা করছি:

1. **Seeder ক্লাস**: `DatabaseSeeder` হল Laravel এ ডিফল্ট একটি Seeder, যা সাধারণত অন্যান্য Seeder ক্লাসগুলোকে কল করে, যেন একসাথে সব টেবিলের ডেটা তৈরি করা যায়।

2. **run() মেথড**: এই মেথডের মধ্যে `UsersTableSeeder::class` কে কল করা হয়েছে, অর্থাৎ `UsersTableSeeder` ক্লাসটি রান হবে এবং এর ডেটা `users` টেবিলে ইনসার্ট হবে।

3. **User Model Factory**:
   ```php
   \App\Models\User::factory(20)->create();
   ```
   এখানে `User` মডেলের ফ্যাক্টরি ব্যবহার করে ২০টি ডামি ইউজার তৈরি করা হচ্ছে। ফ্যাক্টরি Laravel এ একটি ফিচার, যা দ্রুত এবং সহজে ডামি ডেটা জেনারেট করতে সাহায্য করে। ফ্যাক্টরি ইউজ করে আপনি অনেকগুলো ডামি ইউজার ক্রিয়েট করতে পারবেন, যেগুলো টেস্টিংয়ের জন্য উপকারী।

4. **কাস্টম ইউজার তৈরি (কমেন্ট আউট করা অংশ)**:
   ```php
   // \App\Models\User::factory()->create([
   //     'name' => 'Test User',
   //     'email' => 'test@example.com',
   // ]);
   ```
   এখানে একটি নির্দিষ্ট ইউজার তৈরি করার জন্য কোড লেখা আছে, তবে এটি কমেন্ট আউট করা হয়েছে। এই অংশটি অ্যাকটিভ করলে এটি `name` এবং `email` ফিল্ডে নির্দিষ্ট মানসহ (যেমন, 'Test User' এবং 'test@example.com') একটি ডামি ইউজার তৈরি করবে।

**পুরো কোডের উদ্দেশ্য**: এই `DatabaseSeeder` রান করলে Laravel প্রথমে `UsersTableSeeder` এর ডেটা ইনসার্ট করবে এবং তারপর `User` মডেলের ফ্যাক্টরি ব্যবহার করে আরও ২০টি ইউজার তৈরি করবে।
### এবার আমরা artisan কমান্ড দিয়ে সিডিং সম্পূন্ন করবো। এর জন্য আমি `php artisan migrate:fresh --seed` দিয়ে সিডিং শেষ করি।
