<?php

namespace App\Http\Controllers;

use App\Models\SlideImage;
use Illuminate\Http\Request;

class SlideImagesController extends Controller
{
    public function get_slide_images (Request $request) {
        $results = SlideImage::get();

        return response()->json($results);
    }
}