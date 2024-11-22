### Step-by-Step Explanation: User Selected Image Display করা (বাংলায়)

এখানে একটি ফর্মে ছবি আপলোড করার সময় সেই ছবি প্রিভিউ হিসেবে দেখানোর জন্য HTML, CSS এবং JavaScript ব্যবহার করে একটি সমাধান দেখানো হয়েছে। নিচে প্রতিটি ধাপ বিস্তারিতভাবে ব্যাখ্যা করা হলো। প্রথমেই ইমেজ ফিল্ড টিকে পুনরায় কপি করে নিচে পেস্ট করে নি

```php
<div class="row mb-3">
    <div class="col-sm-3">
        <h6 class="mb-0">Photo</h6>
    </div>
    <div class="col-sm-9 text-secondary">

    </div>
</div>
// এখান কার <input type="file" class="form-control"/> এটি আমাদের প্রয়োজন নেই তাই এটিকে বাদ দিয়ে ফেলি । উপরে আমরা ইমেজ এর ফাংশনালিটি যুক্ত করেছিলাম তা এখঅনে ব্যবহার করি

<img
    src="{{ !empty($adminData->photo ) ? url('uplode/admin_images/'.$adminData->photo):url('uplode/admin_images/avatar-2.png')  }}"
    alt="Admin"
    class="rounded-circle p-1 bg-primary"
    width="110"
/>
// class="rounded-circle p-1 bg-primary" কে বাদ দেওয়া যেতে পারে।

// <h6 class="mb-0">Photo</h6> এখান থেকে Photo এর জায়গা খালি করে দি।
```

---

#### **১. HTML এ Input Field এবং Image Element যোগ করা**

প্রথমে, ফর্মের মধ্যে একটি `input` ফিল্ড এবং একটি `img` ট্যাগ যুক্ত করা হয়:

```html
<input type="file" id="image" />
<img id="showImage" style="width: 100px; height: 100px;" />
```

-   **`<input type="file">`:** ইউজার যাতে ছবি আপলোড করতে পারে, তার জন্য এটি ব্যবহৃত হয়।
-   **`id="image"`:** JavaScript থেকে ফাইল ইনপুটকে সনাক্ত করতে এই আইডি ব্যবহার করা হবে।
-   **`<img>` ট্যাগ:** প্রিভিউ দেখানোর জন্য একটি ইমেজ ট্যাগ।
-   **`id="showImage"`:** আপলোড করা ইমেজটি এখানে দেখানোর জন্য ব্যবহার করা হবে।
-   **`style`:** ইমেজের প্রিভিউ ১০০ পিক্সেল চওড়া এবং লম্বা করতে স্টাইল প্রোপার্টি ব্যবহার করা হয়েছে।

---

#### **২. JavaScript কোড যোগ করা**

HTML এর শেষে একটি স্ক্রিপ্ট ট্যাগে JavaScript কোড লেখা হয়েছে:

```javascript

// <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> add above
<script type = "text/javascript">
    $(document).ready(function () {
        $('#image').change(function (e) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#showImage').attr('src', e.target.result);
            };
            reader.readAsDataURL(e.target.files[0]);
        });
    });
</script>
```

এখানে ধাপে ধাপে বুঝানো হলো কী হচ্ছে:

---

#### **৩. `$(document).ready()`**

-   **ব্যাখ্যা:** এই ফাংশন নিশ্চিত করে যে পুরো HTML লোড হওয়ার পর JavaScript কোড চালু হবে।

---

#### **৪. `$('#image').change()` ইভেন্ট**

-   **ব্যাখ্যা:** যখন ইউজার একটি ফাইল নির্বাচন করে, তখন `change` ইভেন্টটি ট্রিগার হয়।
-   **`e` প্যারামিটার:** এটি ইভেন্ট অবজেক্ট, যা ইনপুটের ফাইল সম্পর্কিত তথ্য ধারণ করে।

---

#### **৫. `FileReader` অবজেক্ট তৈরি করা**

-   **কোড:**
    ```javascript
    var reader = new FileReader();
    ```
-   **ব্যাখ্যা:** JavaScript এর `FileReader` অবজেক্ট ব্যবহার করে একটি ফাইলকে ব্রাউজারে লোড করা যায়। এটি ইমেজের মতো বাইনারি ডেটা পড়ার জন্য ব্যবহৃত হয়।

---

#### **৬. `reader.onload` ইভেন্ট**

-   **কোড:**
    ```javascript
    reader.onload = function (e) {
        $("#showImage").attr("src", e.target.result);
    };
    ```
-   **ব্যাখ্যা:**
    -   **`reader.onload`:** যখন `FileReader` ইমেজটি সম্পূর্ণ পড়বে, তখন এই ইভেন্টটি চালু হয়।
    -   **`e.target.result`:** এটি ইমেজ ডেটা ধারণ করে, যা `<img>` ট্যাগের `src` অ্যাট্রিবিউটে সেট করা হয়।
    -   **`$('#showImage').attr('src', ...)`:** প্রিভিউ দেখানোর জন্য ইমেজ ডেটা সেট করা হয়।

---

#### **৭. `reader.readAsDataURL()`**

-   **কোড:**
    ```javascript
    reader.readAsDataURL(e.target.files[0]);
    ```
-   **ব্যাখ্যা:**
    -   **`e.target.files[0]`:** এটি ইউজার যে ফাইলটি আপলোড করেছে সেটি নির্দেশ করে।
    -   **`readAsDataURL()`:** এই মেথড ফাইলটি Base64 ফরম্যাটে রূপান্তরিত করে, যা ব্রাউজারে সরাসরি ইমেজ হিসেবে দেখানো যায়।

---

### **ফাইনাল আউটপুট**

1. ইউজার যখন একটি ফাইল নির্বাচন করবে, তখন `change` ইভেন্টটি ট্রিগার হবে।
2. `FileReader` ইমেজটি লোড করবে এবং প্রিভিউ হিসেবে দেখাবে।
3. HTML এ থাকা `<img>` ট্যাগে ইমেজটি দেখাবে, ১০০ পিক্সেল আকারে।

---

### **সম্পূর্ণ কোড**

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Image Preview</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <form>
            <input type="file" id="image" />
            <img id="showImage" style="width: 100px; height: 100px;" />
        </form>

        <script>
            $(document).ready(function () {
                $("#image").change(function (e) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#showImage").attr("src", e.target.result);
                    };
                    reader.readAsDataURL(e.target.files[0]);
                });
            });
        </script>
    </body>
</html>
```

এটি রান করলে ইউজার ছবি আপলোড করার সঙ্গে সঙ্গে একটি প্রিভিউ দেখতে পাবে। 😊
