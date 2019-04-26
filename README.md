# mkdock
Makedown 每行添加空格 
sed -i 's/$/ ABC/' file1 

追加 ABC到每行末尾 

$为末尾符号，s代表替换末尾为 ABC 
添加空格
sed -i 's/$/ /' file1 