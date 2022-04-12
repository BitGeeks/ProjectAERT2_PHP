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

        return ""; // không
    }

    function checkEmptyValueAddressObj ($user) {
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

    // POST: /useraddresses/add
    public function user_address_add (Request $request) {
        $this->checkEmptyValueAddressObj($request);

        $isDefault = false;

        $user = $request->userData;

        $checkEmpty = UserAddress::where("User_id", $user->id)->first();

        $isDefault = $checkEmpty == NULL;

        $check = UserAddress::where("Address", $request->address)
                            ->where("Street_name", $request->street_name)
                            ->where("User_id", $user->id)
                            ->first();

        if ($check)
            return "Địa chỉ này đã tồn tại trong tài khoản của bạn";
        
        $address = new UserAddress();

        $address->User_id = $user->id;
        $address->Address = $request->address;
        $address->Street_name = $request->street_name;
        $address->City = $request->city;
        $address->Postal_code = $request->postal_code;
        $address->Country = $request->country;
        $address->Telephone = $request->telephone;
        $address->Mobile = $request->mobile;
        $address->isDefault = $isDefault;

        $address->save();

        return ""; // không
    }

    // POST: /useraddresses/setdefault
    public function set_default (Request $request) {
        $user = $request->userData;

        $setNoDefault = UserAddress::where("isDefault", true)
                                ->where("User_id", $user->id)
                                ->first();
        
        if ($setNoDefault != null) {
            $setNoDefault->isDefault = false;
            $setNoDefault->save();
        }

        $check = UserAddress::where("User_id", $user->id)
                        ->where("Id", $request->id)
                        ->first();
        if ($check == null)
            return "Địa chỉ không hợp lệ";

        $check->isDefault = true;

        $check->save();
        
        return "";
    }

    public function remove_user_address (Request $request, $id) {
        $user = $request->userData;

        $userAddress = UserAddress::where("Id", $id)
                                ->where("User_id", $user->id)
                                ->first();
        if ($userAddress == null)
            return "NotFound";
        
        UserAddress::where("Id", $id)
            ->where("User_id", $user->id)
            ->delete();

        return "";
    }
}