# rosのセットアップスクリプトを環境変数に取り込む

ROS_SETUP_PATH="/opt/ros/melodic/"
# WS_SETUP_PATH="$HOME/ros_catkin_ws/devel/"
WS_SETUP_PATH="$HOME/ros_catkin_ws/melodic/devel/"
# WS_SETUP_PATH="$HOME/ros_catkin_ws/test_ws/devel/"

# ネットワーク設定
# export ROS_MASTER_URI=http://devel-XPS-8700.local:11311
# export ROS_IP=`hostname -I`

# enable `catkin source` 
source `catkin locate --shell-verbs`


# ROS workspace setup
# 環境変数に取り込むsetupファイルをシェルの種類に応じて切り替える
if [ `readlink /proc/$$/exe | grep 'zsh'` ]; then
    SETUP_FILE="setup.zsh"
else 
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

# === useful commands ===
alias roste='rostopic echo  -c $(rostopic list | fzf)'
alias rte='rostopic echo  -c $(rostopic list | fzf)'
alias rosti='rostopic info $(rostopic list | fzf)'
alias rosni='rosnode info $(rosnode list | fzf)'
alias rosmi='rosmsg info $(rosmsg list | fzf)'
alias rossi='rosservice info $(rosservice list | fzf)'

function catkin-compile-commands-json() {
    local catkin_ws=$(echo $CMAKE_PREFIX_PATH | cut -d: -f1)/..
    # Verify catkin cmake args contains -DCMAKE_EXPORT_COMPILE_COMMANDS=ON.
    # If the arguments does not include the option, add to cmake args.
    (cd "${catkin_ws}" && catkin config | grep -- -DCMAKE_EXPORT_COMPILE_COMMANDS=ON >/dev/null)
    local catkin_config_contains_compile_commands=$?
    if [ $catkin_config_contains_compile_commands -ne 0 ]; then
        echo catkin config does not include -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
        (
            cd "${catkin_ws}" &&
                catkin config -a --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
        )
    fi
    # Run catkin build in order to run cmake and generate compile_commands.json
    (cd "${catkin_ws}" && catkin build)
    # Find compile_commands.json in build directory and create symlink to the top of the package
    # directories.
    local package_directories=$(find "${catkin_ws}/src" -name package.xml | xargs -n 1 dirname)
    for package_dir in $(echo $package_directories); do
        local package=$(echo $package_dir | xargs -n 1 basename)
        (
            cd "${catkin_ws}"
            if [ -e ${catkin_ws}/build/$package/compile_commands.json ]; then
                ln -sf ${catkin_ws}/build/$package/compile_commands.json \
                    $(rospack find $package)/compile_commands.json
            fi
        )
    done
}
