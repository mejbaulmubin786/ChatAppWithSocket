<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller {
    public function AdminDashboard() {
        return view('admin.index');
    } // End Method

    public function AdminLogin() {
        return view('admin.admin_login');
    } // End Method

    public function AdminDestroy(Request $request): RedirectResponse {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/admin/login');
    } // End AdminDestroy Method

    public function AdminProfile() {
        $id = Auth::id();
        $adminData = User::find($id);
        return view('admin.admin_profile_view', compact('adminData'));
    }
}
