wstring TestCamera(string &log_path){
    wstring result;
    Mat frame_prev, frame_next;
    if( camera.Grab(frame_next)){
        frame_prev =frame_next.clone();
        result = L"Камера используется другой программой";
        for(int f = 0; f < 10; f++){
            if( camera.Grab(frame_next)){
                if(!std::equal(frame_prev.begin<byte>(),frame_prev.end<byte>(),frame_next.begin<byte>())){
                    result = L"";
                    break;
                }
            }
            else{
                result = L"Камера недоступна";
                break;
            }
        }
        if(!result.empty()){
            vector<unsigned char> jpeg;
            cv_works::GetJPEG(frame_next, jpeg);
            stringf::WriteBufferToFile(log_path+"\\camtest.jpg", string(jpeg.begin(),jpeg.end()));
            Log("Camera check error");
        }
    }
    else{result = L"Камера недоступна";}
    return result;
}
///////////////////////////////////////////////////////////////////////
CamStreamAvailable = camera.Enable(0);
switch(USER.cam_level[0]){
	case '1': // Отключить видеонаблюдение
		CamStreamAvailable = false;
		break;
	case '2': // Запуск при заблокированной камере
		Initialized = true;
		break;
	case '3': // Постоянная проверка состояния камеры на протяжении работы программы
		ConstantCameraCheck = true;
		break;
	default: break;
}

if( CamStreamAvailable ){
	if(!camera.SetResolution(640,480)) camera.SetResolution(320,240);
	wstring InitText = TestCamera(PATH.info);
	if( InitText.length() > 0 && !Initialized){
		MessageBoxW(NULL, InitText.c_str(), ApplicationTitleW.c_str(), MB_OK | MB_ICONERROR);
		camera.Disable();
		return 1;
	}
}
else if( USER.cam_level[0] == '1'){
	ConstantCameraCheck = false;
	Initialized = true;
	camera.Disable();
}
else{
	camera.Disable();
	if( USER.cam_required[0] == '1'){
		MessageBoxW(NULL, L"Запуск без web-камеры невозможен!\nПодключите или настройте камеру", ApplicationTitleW.c_str(), MB_OK | MB_ICONERROR);
		return 1;
	}
}

wcscpy(TrayData.szInfo, L"Анализ расположения сети...");
Shell_NotifyIconW(NIM_MODIFY, &TrayData);
Set_VoIP_Host();
LaunchAvailable = true;
THREADS.launch = thread(Launch);