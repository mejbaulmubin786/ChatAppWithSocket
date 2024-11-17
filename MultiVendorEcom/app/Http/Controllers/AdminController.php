<?php

namespace App\Http\Controllers;

class AdminController extends Controller {
    public function AdminDashboard() {
        return view('admin.admin_dashboard');
    } // End Method
}
