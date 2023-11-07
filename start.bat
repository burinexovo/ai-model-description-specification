@echo off
@chcp 65001

setlocal enabledelayedexpansion

echo 正在包裝 Docker 映像檔...
docker build -t panicle_extract_image . 
echo.

:data_input_loop
set /P is_default_data_path="是否使用預設資料集？(y/n): "
echo.

@REM 防呆判斷，看使用者要不要使用預設資料集
if /i "!is_default_data_path!"=="y" (
    echo 使用預設資料集
    echo.
    
    @REM 執行
    docker run -it panicle_extract_image

) else if /i "!is_default_data_path!"=="n" (
    set /P user_data_path="請輸入您的資料集路徑: "
    echo.
    if exist "!user_data_path!" (
        @REM echo 路徑存在
        echo 使用自訂資料集路徑 !user_data_path!
        echo.

        echo 程式開始進行推論...
        @REM 執行
        docker run -it -v !user_data_path!:/app/user_data panicle_extract_image

    ) else (
        echo 錯誤: 路徑不存在，請輸入有效路徑
        echo.
        goto data_input_loop
    )
) else (
    echo 請輸入有效的選項 'y' 或 'n'
    echo.
    goto data_input_loop
)

for /f "tokens=*" %%i in ('docker ps -l -q') do set container_id=%%i
echo.

:result_input_loop
set /P is_custom_path="是否需要自訂輸出結果存放的資料夾路徑？(y/n): "
echo.

@REM 防呆判斷，看使用者要不要自訂路徑
if /i "!is_custom_path!"=="y" (
    set /P local_path="請輸入想要存放的資料夾路徑: "
    echo.
    if exist "!local_path!" (
        @REM echo 路徑存在
        echo 使用自訂路徑 !local_path!
        echo.
        set local_path=!local_path!\result
        mkdir !local_path!
    ) else (
        echo 錯誤: 路徑不存在，請輸入有效路徑
        echo.
        goto result_input_loop
    )
) else if /i "!is_custom_path!"=="n" (
    mkdir result
    @REM 設定為目前目錄
    set local_path=!cd!\result
    echo 使用預設路徑 !local_path!
) else (
    echo 請輸入有效的選項 'y' 或 'n'
    echo.
    goto result_input_loop
)

@REM 複製輸出結果到本地端
echo 準備將結果複製到路徑 !local_path! 中...
echo.
echo data 資料夾為測試集，predictions 資料夾為推論結果
echo.
if /i "!is_default_data_path!"=="y" (
    @REM 使用預設資料集
    docker cp !container_id!:/app/predictions !local_path!
    docker cp !container_id!:/app/data !local_path!
) else ( 
    @REM 使用自訂資料集
    docker cp !container_id!:/app/predictions !local_path!
    docker cp !container_id!:/app/user_data !local_path!
)
echo.

@REM 停止容器
echo | set /p="停止容器 "
docker stop !container_id!

@REM 删除容器
echo | set /p="刪除容器 "
docker rm !container_id!

start "" !local_path!

endlocal
pause