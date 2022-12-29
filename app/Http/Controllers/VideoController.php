<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Image;
use App\Http\Controllers\CloudinaryStorage;

class VideoController extends Controller
{
    //
	public function index()
    {
		return view('list_image', ['images' => Image::get()]);
    }
}
