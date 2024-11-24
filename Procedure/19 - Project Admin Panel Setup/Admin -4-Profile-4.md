### **1. Setting Up the Form from admin_profile_view page**

এইন admin_profile_view page এ গিয়ে <div class="card-body"> এর নিচে <form> টেগ নি এবং <div class="card-body"> এ শেষ টেগের আগে </form> টেগ দি। এবার এতে রাউট যুক্ত করি।

<form method="post" action="{{ route('admin.profile.store') }}" enctype="multipart/form-data">
এর নিচে @csrf যুক্ত করি।

এবার <input type="text"  class="form-control" value="{{ $adminData->name }}" /> এর জন্য name="name" যুক্ত করি।

<input type="text" name="email" class="form-control" value="{{ $adminData->email }}" /> এর জন্য name="email" এর টাইপ টেক্সট এর পরিবর্তে ইমেইল করতে হবে।
এভাবে প্রতিটি ইনপুট ঠিক করে নি ডাটাবেইজ এর সাথে মিল করে।

**Example Form:**

এর পর রাউট তৈরি করলাম।

```php
Route::post('/admin/profile/store', [AdminController::class, 'AdminProfileStore'])->name('admin.profile')->name('admin.profile.store');
```

````php
// AdminController
public function AdminProfileStore(Request $request) {
        $id = Auth::user()->id;
        $data = User::find($id);

        $data->name = $request->name;
        $data->email = $request->email;
        $data->phone = $request->phone;
        $data->address = $request->address;

        if ($request->file('photo')) {
            $file = $request->file('photo');
            $filename = date('YmdHi') . $file->getClientOriginalName();
            $file->move(public_path('upload/admin_images'), $filename);
            $data['photo']= $filename;
        }

        $data->save();
        return redirect()->back();
    }

---

### **3. Handling Data in the Controller**

In your `AdminController`, define the `store` method to process the form data:

**Example Code:**

```php
public function store(Request $request)
{
    // Validate the input
    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|email|unique:users,email,' . auth()->id(),
        'phone' => 'nullable|string|max:15',
        'address' => 'nullable|string',
        'photo' => 'nullable|image|max:2048',
    ]);

    // Get authenticated user
    $user = auth()->user();

    // Update text fields
    $user->name = $validated['name'];
    $user->email = $validated['email'];
    $user->phone = $validated['phone'];
    $user->address = $validated['address'];

    // Handle photo upload
    if ($request->hasFile('photo')) {
        // Delete old photo if it exists
        if ($user->photo) {
            Storage::delete('public/' . $user->photo);
        }

        // Save new photo
        $path = $request->file('photo')->store('admin_images', 'public');
        $user->photo = $path;
    }

    // Save the user
    $user->save();

    // Redirect back with success message
    return redirect()->back()->with('success', 'Profile updated successfully!');
}
````

---

### **4. Folder and File Management**

-   Ensure the `storage` directory is linked using `php artisan storage:link`.
-   Uploaded images will be stored in `storage/app/public/admin_images`.

---

### **5. Validating Data**

-   Use Laravel’s validation rules to ensure all inputs are sanitized and meet requirements.
-   Example rules include checking file type and size limits for the uploaded photo.

---

### **6. Optional Enhancements**

-   **Image Intervention**: Resize or optimize the uploaded images using the [Intervention Image](http://image.intervention.io/) package.
-   **AJAX Support**: Use JavaScript for a smoother user experience by submitting the form data via AJAX.

---

### **End Result**

1. The form updates user profile data, including the profile photo.
2. Image files are securely stored and their paths saved in the database.
3. Users receive feedback about the operation via success or error messages.

Would you like further clarification or additional features like AJAX integration or image resizing?
