<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Mail;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class MaxMinesCollabMailController extends Controller {
    public function basic_email() {
        $data = array('name'=>"Virat Gandhi");
    
        Mail::send(['text'=>'mail'], $data, function($message) {
            $message->to($toEmail, 'ViMinerShop Client')->subject
            ($title);
            $message->from(env("MAIL_USERNAME"), env("MAIL_FROM_NAME"));
        });

        return true;
    }

    public function sendMail ($toEmail, $title, $content) {
        $data = array('content' => $content);
        
        Mail::send('mail', $data, function($message) use($toEmail, $title) {
            $message->to($toEmail, 'ViMinerShop Client')->subject
                ($title);
            $message->from(env("MAIL_USERNAME"), env("MAIL_FROM_NAME"));
        });

        return true;
    }
}