# rosのセットアップスクリプトを環境変数に取り込む

ROS_SETUP_PATH="/opt/ros/melodic/"
WS_SETUP_PATH="$HOME/ros_catkin_ws/devel/"

# ネットワーク設定
# export ROS_MASTER_URI=http://devel-XPS-8700.local:11311
# export ROS_IP=`hostname -I`


#echo "===ROS workspace setup==="
# 環境変数に取り込むsetupファイルをシェルの種類に応じて切り替える
if [ `readlink /proc/$$/exe | grep 'zsh'` ]; then
    SETUP_FILE="setup.zsh"
else # bash以外にもシェルはあるけどとりあえず
    SETUP_FILE="setup.bash"
fi 


if [ -e ${ROS_SETUP_PATH}${SETUP_FILE} ]; then
    source ${ROS_SETUP_PATH}${SETUP_FILE}
    # echo "ROS Environment: "${ROS_SETUP_PATH}${SETUP_FILE}  
fi 

if [ -e ${WS_SETUP_PATH}${SETUP_FILE} ]; then
    source ${WS_SETUP_PATH}${SETUP_FILE}
    # echo "Current Workspace: "${WS_SETUP_PATH}${SETUP_FILE}
fi 



