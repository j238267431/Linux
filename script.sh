#!/bin/bash
mkdir -p tmp/lesson3/permissions
cd tmp/lesson3/permissions
touch file1.txt
ln file1.txt file_hard_link.txt
ln -s file1.txt file_soft_link.txt
cat > file1.txt <<EOF
text content
EOF
ln -s permissions/file_soft_link.txt ../file_soft_link_in_folder_lesson3.txt
cd ../
ls -laRi
cat file_soft_link_in_folder_lesson3.txt
cd permissions
cat file1.txt
cat file_soft_link.txt
cat file_hard_link.txt
mv file_soft_link.txt ../../
mv file_hard_link.txt ../../
cd ../../
ls -lai

