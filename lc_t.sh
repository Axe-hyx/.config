file=$1
var=$2
leetcode=/home/switch/.vscode-insiders/extensions/leetcode.vscode-leetcode-0.17.0/node_modules/vsc-leetcode-cli/bin/leetcode
sed '/int main/,$d' $1  > /tmp/tmp.cpp && proxychains -q $leetcode test /tmp/tmp.cpp -t $var
