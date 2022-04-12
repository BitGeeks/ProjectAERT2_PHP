<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserRecovery;
use Illuminate\Http\Request;
use App\Http\Helpers\MiscHelper;
use App\Http\Controllers\ApiController;

class RecoverController extends Controller
{
    public function GetUserRecoveryCode (Request $request) {
        // Gửi email
        $user = User::where("Email", $request->email)->first();
        
        if (!$user) return "NotFound";
        $mischelper = new MiscHelper();

        $recovery = [
            "recoveryCode" => $mischelper->randomStr(11),
            "User_id" => $user->id,
            "IsUsed" => false,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];
        UserRecovery::insert($recovery);

        // EmailModel template = new EmailModel()
        // {
        //     EmailFrom = "vi@maxmines.com",
        //     EmailTo = model.email,
        //     CustomerUsername = user.Username,
        //     Subject = "[Vĩ Miner Shop - Collab] Mã đặt lại mật khẩu của bạn",
        //     Body = "Xin chào, bạn nhận được mail từ Vĩ Miner Shop. Đây là mã đặt lại mật khẩu của bạn: " + recovery.recoveryCode + ". \n\nLưu ý: Mã này chỉ có hiệu lực trong vòng 15 phút!"
        // };

        // mail.Send(template);

        return "";
    }

    public function PostUserRecovery (Request $request, $id) {
        $user = User::where("Email", $request->email)->first();
        $vrc = UserRecovery::where("User_id", $user->Id)
            ->where("recoveryCode", $request->verifyCode)
            ->first();

        if (!$vrc) return "NotFound";
        else if ($vrc->IsUsed) return "NotFound";
        
        $date = \Carbon\Carbon::parse($vrc->Created_at);
        if ($date->diffInSeconds(\Carbon\Carbon::now()) > 600) return "NotFound";

        return "";
    }

    public function PostUserRecovery2 (Request $request, $id) {
        $user = User::where("Email", $request->email)->first();
        $vrc = UserRecovery::where("User_id", $user->Id)
            ->where("recoveryCode", $request->verifyCode)
            ->first();

        if (!$vrc) return "NotFound";
        else if ($vrc->IsUsed) return "NotFound";
        
        $date = \Carbon\Carbon::parse($vrc->Created_at);
        if ($date->diffInSeconds(\Carbon\Carbon::now()) > 600) return "NotFound";

        $vrc->IsUsed = true;
        UserRecovery::where("Id", $vrc->Id)->update($vrc);

        $apiController = new ApiController();
        $request->userData = [
            "id" => $user->id
        ];
        $request->password = $request->newPassword;
        $apiController->update_user($request);
        
        return "";
    }
}