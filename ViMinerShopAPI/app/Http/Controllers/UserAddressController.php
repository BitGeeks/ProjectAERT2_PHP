<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use App\Models\UserAddress;

class UserAddressController extends Controller {
    // GET: /useraddresses
    function get_user_address (Request $request) {
        // under development
    }

    // GET: /useraddresses/:id
    function get_user_address_by_id (Request $request, $id) {
        // under development
    }

    // PUT: /useraddresses/update
    function update_user_address (Request $request) {
        $this->checkEmptyValueAddressObj($request);

        $user = $request->userData;
        $check = UserAddress::where("Id", $request->id)
                            ->where("User_id", $user->id)
                            ->first();
        
        if ($check == null)
            return "NotFound";

        $check->Address = $request->address;
        $check->Street_name = $request->street_name;
        $check->City = $request->city;
        $check->Postal_code = $request->postal_code;
        $check->Country = $request->country;
        $check->Telephone = $request->telephone;
        $check->Mobile = $request->mobile;

        UserAddress::where("Id", $request->id)
        ->where("User_id", $user->id)
        ->update($check);

        return "";
    }

    function checkEmptyValueAddressObj (UserAddress $user) {
        if (isset($user->address))
            return "Địa chỉ không hợp lệ";
        elseif (isset($user->street_name))
            return "Tên đường không hợp lệ";
        elseif (isset($user->city))
            return "Tên thành phố không hợp lệ";
        elseif (isset($user->postal_code))
            return "Mã bưu chính không hợp lệ";
        elseif (isset($user->country))
            return "Quốc gia không hợp lệ";
        elseif (isset($user->telephone))
            return "Số điện thoại không hợp lệ";
        else return "Số điện thoại cá nhân không hợp lệ";
    }
}