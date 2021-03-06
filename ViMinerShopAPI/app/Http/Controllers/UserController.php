<?php

namespace App\Http\Controllers;

use JWTAuth;
use App\Models\User;
use App\Models\OrderDetail;
use App\Models\ProductSoldOutNotify;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use App\Http\Helpers\MiscHelper;
use App\Models\UserRecord;
use App\Models\UserCredentialsVerify;
use App\Http\Controllers\MaxMinesCollabMailController;

class UserController extends Controller
{
    public function get_user_info (Request $request) {
        $user = User::with(["useraddresss", "shoppingsessions"])
        ->where("id", $request->userData->id)->first();

        return $user;
    }

    public function register(Request $request)
    {
        $data = $request->only('firstname', 'lastname', 'username', 'email', 'refcode', 'password');
        $validator = Validator::make($data, [
            'firstname' => 'required|string',
            'lastname' => 'required|string',
            'username' => 'required|string',
            'email' => 'required|email|unique:users',
            'refcode' => 'string',
            'password' => 'required|string|min:2|max:50'
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 200);
        }

        $user = [
        	'FirstName' => $request->firstname,
        	'LastName' => $request->lastname,
        	'username' => $request->username,
        	'email' => $request->email,
            'RoleVar_Id' => 1,
        	'ReferralBy' => $request->refcode,
        	'password' => bcrypt($request->password)
        ];

        $userId = User::insertGetId($user);

        if ($userId) {
            $verifyCode = new MiscHelper();
            $verifyCode = $verifyCode->randomStr(10);
            $verifyInfo = [
                "User_id" => $userId,
                "EmailVerifyCode" => $verifyCode,
                "ResendMailAt" => \Carbon\Carbon::now()
            ];
            UserCredentialsVerify::create($verifyInfo);
            $mailController = new MaxMinesCollabMailController();

            $mailController->sendMail($user["email"], "[V?? Miner Shop - Collab] M?? x??c minh t??i kho???n", "Xin ch??o, b???n nh???n ???????c mail t??? V?? Miner Shop. ????y l?? li??n k???t x??c minh email c???a b???n: http://localhost:4200/verify?token=" . $verifyCode . ". \n\nL??u ??: M?? n??y ch??? c?? hi???u l???c trong v??ng 15 ph??t!");

            return response()->json([
                'success' => true,
                'message' => 'T??i kho???n ???? ???????c t???o th??nh c??ng'
            ], Response::HTTP_OK);
        }
    }
 
    public function authenticate(Request $request)
    {
        $credentials = $request->only('email', 'password');

        $validator = Validator::make($credentials, [
            'email' => 'required|string',
            'password' => 'required|string|min:2|max:50'
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 200);
        }

        try {
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json([
                	'success' => false,
                	'message' => 'Th??ng tin ????ng nh???p kh??ng h???p l???'
                ], 400);
            }
        } catch (JWTException $e) {
            return response()->json([
                	'success' => false,
                	'message' => 'Kh??ng th??? t???o token',
                ], 500);
        }

        $user = User::where("email", $request->email)->first();

        if ($user) {
            $verifyOrNot = true;
            $test = UserCredentialsVerify::where("User_id", $user->id)
                            ->where("EmailVerifyCode", "!=", null)
                            ->first();
            if ($test)
                $verifyOrNot = false;

            return response()->json([
                'id' => $user["id"],
                'email' => $user->email,
                'username' => $user->username,
                'firstname' => $user->FirstName,
                'lastname' => $user->LastName,
                'rolevar_id' => $user->RoleVar_Id,
                'isactive' => $verifyOrNot, // T???m th???i
                'token' => $token,
            ]);
        }
    }
 
    public function logout(Request $request)
    {
        $validator = Validator::make($request->only('token'), [
            'token' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 200);
        }

        try {
            JWTAuth::invalidate($request->token);
 
            return response()->json([
                'success' => true,
                'message' => 'User has been logged out'
            ]);
        } catch (JWTException $exception) {
            return response()->json([
                'success' => false,
                'message' => 'Sorry, user cannot be logged out'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function get_user_by_id (Request $request, $id, $isArrayReader = false) {
        if ($isArrayReader) {
            $request = json_decode(json_encode($request));
        }
        $user = User::where("id", $request->userData->id)->first();
 
        return response()->json($user);
    }

    public function update_user (Request $request, $isArrayReader = false) {
        $originalRequest = $request;
        if ($isArrayReader) {
            $request = json_decode(json_encode($request));
        }
        $user = User::where("id", $request->userData->id)->first();

        if ($user == null)
            return "Ng?????i d??ng kh??ng t???n t???i";

        if (isset($request->Email) && $request->Email != $user->email)
        {
            if (User::where("email", $request->Email)->first() != null)
                return "Email " . $request->Email . " ???? t???n t???i";

            $user->Email = $request->Email;
        }

        if (isset($request->Username) && $request->Username != $user->username)
        {
            if (User::where("username", $request->Username)->first() != null)
                return "T??n ng?????i d??ng " . $request->Username . " ???? t???n t???i";

            $user->username = $request->Username;
        }

        if (isset($request->firstname))
            $user->FirstName = $request->firstname;

        if (isset($request->lastname))
            $user->LastName = $request->lastname;

        if (isset($request->Telephone))
            $user->Telephone = $request->Telephone;

        if (isset($request->UserImage))
            $user->UserImage = $request->UserImage;

        if (isset($request->isSubscribedToMailing))
            $user->isSubscribedToMailing = $request->isSubscribedToMailing;

        if (isset($request->password))
            $user->password = bcrypt($request->password);

        $user->save();

        return $this->get_user_by_id($originalRequest, $user->id, $isArrayReader);
    }
 
    public function get_user(Request $request)
    {
        $this->validate($request, [
            'token' => 'required'
        ]);
 
        $user = JWTAuth::authenticate($request->token);
 
        return response()->json(['user' => $user]);
    }

    public function update_subscription (Request $request) {
        $user = $request->userData;

        $user->isSubscribedToMailing = !$user->isSubscribedToMailing;

        return $this->update($user);
    }

    public function get_user_records (Request $request) {
        $user = $request->userData;
        $results = UserRecord::where("Id", $user->id)->get();
        return response()->json($results);
    }

    public function get_user_records_count (Request $request) {
        $user = $request->userData;
        $results = UserRecord::where("Id", $user->id)->count();
        return response()->json($results);
    }

    // verifyEmail
    public function validate_user (Request $request) {
        $token = $request->token;
        $user = $request->userData;
        $expTime = \Carbon\Carbon::now();
        $expTime->subMinutes(15);
        $uvc = UserCredentialsVerify::where("User_id", $user->id)
            ->whereDate('ResendMailAt', '>=', $expTime)->first();

        if ($uvc == null) return "M?? x??c minh kh??ng kh??? d???ng! Vui l??ng x??c minh l???i";

        if ($uvc->EmailVerifyCode == $token) $uvc->EmailVerifyCode = null;

        UserCredentialsVerify::where("User_id", $user->id)->update(["EmailVerifyCode" => null]);

        return $this->get_user_by_id($request, $user->id);
    }

    public function create_referral_code (Request $request) {
        $user = $request->userData;

        if ($user->ReferralCode != null) 
            return "Ng?????i d??ng n??y ???? t???o m?? gi???i thi???u!";
        $mischelper = new MiscHelper();
        $refCode = $mischelper->randomStr();
        $checkRef = User::where("id", $user->id);

        User::where("id", $user->id)->update(["ReferralCode" => $refCode]);

        return response()->json($refCode);
    }

    public function list_all_referral (Request $request) {
        $user = $request->userData;
        if ($user->ReferralCode == null)
            return "Ng?????i d??ng n??y ch??a t???o m?? gi???i thi???u!";
        $reflist = User::where("ReferralBy", $user->ReferralCode)->get();
        return response()->json($reflist);
    }

    public function resend_register_code (Request $request) {
        // under development
    }

    public function get_user_stats_points (Request $request) {
        $user = $request->userData;
        $numberPoint = OrderDetail::
        join("paymentdetails", "paymentdetails.id", "=", "orderdetails.payment_id")
        ->where("paymentdetails.status", "!=", 0)
        ->where("User_id", $user->id)
        ->count() * 1024;

        return array(
            "balance" => .0,
            "point" => $numberPoint
        );
    }

    public function set_new_product_notify (Request $request) {
        $user = $request->userData;
        $expDate = \Carbon\Carbon::now()->subDays(15);
        $psoData = ProductSoldOutNotify::where("User_id", $user->id)
                    ->where("Product_id", $request->productId)
                    ->whereDate('created_at', ">", $expDate)
                    ->first();
        
        if (!$psoData) {
            $psoData = [
                "User_id" => $user->id,
                "Product_id" => $request->productId,
                "quantity" => $request->quantity,
                "created_at" => \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ];
            ProductSoldOutNotify::insert($psoData);
        } else {
            $psoData->quantity = $request->quantity;
            $psoData->save();
        }

        return "";
    }
}
