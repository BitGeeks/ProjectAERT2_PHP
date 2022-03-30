<?php

namespace App\Http\Controllers;

use JWTAuth;
use App\Models\User;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

class ApiController extends Controller
{
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

        $user = User::create([
        	'FirstName' => $request->firstname,
        	'LastName' => $request->lastname,
        	'username' => $request->username,
        	'email' => $request->email,
        	'RefCode' => $request->refcode,
        	'password' => bcrypt($request->password)
        ]);

        return response()->json([
            'success' => true,
            'message' => 'User created successfully',
            'data' => $user
        ], Response::HTTP_OK);
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
                	'message' => 'Thông tin đăng nhập không hợp lệ'
                ], 400);
            }
        } catch (JWTException $e) {
            return response()->json([
                	'success' => false,
                	'message' => 'Không thể tạo token',
                ], 500);
        }

        $user = User::where("email", $request->email)->first();
 	
        return response()->json([
            'success' => true,
            'id' => $user["id"],
            'email' => $user->email,
            'username' => $user->username,
            'firstname' => $user->FirstName,
            'lastname' => $user->LastName,
            'rolevar_id' => $user->RoleVar_Id,
            'isactive' => true, // Tạm thời
            'token' => $token,
        ]);
    }
 
    public function logout(Request $request)
    {
        //valid credential
        $validator = Validator::make($request->only('token'), [
            'token' => 'required'
        ]);

        //Send failed response if request is not valid
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 200);
        }

		//Request is validated, do logout        
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

    public function get_user_by_id (Request $request, $id) {
        $user = $request["userData"];
        // $user = User::where("id", $id)->first(); ? wassup Vi :))
 
        return response()->json($user);
    }

    public function update_user (Request $request) {
        $user = User::where("id", $request->userData->id)->first();

        if ($user == null)
            return "Người dùng không tồn tại";

        if (isset($request->Email) && $request->Email != $user->Email)
        {
            if (User::where("email", $request->Email)->first() != null)
                return "Email " . $request->Email . " đã tồn tại";

            $user->Email = $request->Email;
        }

        if (isset($request->Username) && $request->Username != $user->username)
        {
            if (User::where("username", $request->Username)->first() != null)
                return "Tên người dùng " . uParams.Username . " đã tồn tại";

            $user->username = $request->Username;
        }

        if (isset($request->FirstName))
            $user->FirstName = $request->FirstName;

        if (isset($request->LastName))
            $user->LastName = $request->LastName;

        if (isset($request->Telephone))
            $user->Telephone = $request->Telephone;

        if (isset($request->UserImage))
            $user->UserImage = $request->UserImage;

        $user->isSubscribedToMailing = $request->isSubscribedToMailing;

        if (isset($request->password))
            $user->password = bcrypt($request->password);

        User::where("id", $request->id)->update($user);

        return $this->get_user_by_id($request->id);
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

    // public function get_user_records (Request $request) {
    //     $results = User::OrderBy("id", "DESC")->where("User_id", $request->id)->skip($skip)->take($limit);
    //     return _context.UserRecord
    //                 .OrderByDescending(r => r.Id)
    //                 .Where(u => u.User_id == user.Id)
    //                 .Skip((int)paginate.size * (int)paginate.page)
    //                 .Take((int)paginate.size)
    //                 .ToList();
    // }
}
