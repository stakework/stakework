#!/bin/bash

#重命名:文本、文件名、目录 （区分大小写）

#用法: bash rename.sh oldName newName

if [ $# != 2 ] ; then
    echo "${0}: The number of parameters must be equal to 2"
    exit 1;
fi

oldName=$1
newName=$2

#替换内容[-w:全匹配]（排除.git目录）
echo "全匹配-替换内容: $oldName -> $newName"
grep --exclude-dir=.git -rwl $oldName ./ | xargs sed -i "s/$oldName/$newName/g"

#替换内容（排除.git目录）
echo "替换内容: $oldName -> $newName"
grep --exclude-dir=.git -rl $oldName ./ | xargs sed -i "s/$oldName/$newName/g"


#文件批量重命名 (包含子目录， 排除.git目录)
echo "文件名重命名: $oldName -> $newName"
#find ./ -path '.git' -prune -o -name "$oldName.*" -print |xargs -i echo {} {} |sed "s/\<$oldName\>/$newName/2" |xargs -l mv

for name in `find ./ -path ".git" -prune -o  -name "$oldName.*" -print|sort -nr`; do left=${name%/*};  lastWord=${name##*/}; mv $name $left/`echo $lastWord|sed "s/\<$oldName\>/$newName/g"`;done

#目录批量重命名 (包含子目录， 排除.git目录)
echo "目录重命名: $oldName -> $newName"
#find ./ -path '.git' -prune -o -name "*$oldName*" -print |xargs -i echo {} {} |sed "s/$oldName/$newName/2" |xargs -l mv

for name in `find ./ -path ".git" -prune -o  -name "*$oldName*" -print|sort -nr`; do left=${name%/*};  lastWord=${name##*/}; mv $name $left/`echo $lastWord|sed "s/$oldName/$newName/g"`;done

echo "Done!"

