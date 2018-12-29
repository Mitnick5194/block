# !/bin/bash

#  �ύ��github��������
# 
#  ��������������������ʹ�ÿո�ֿ���ÿ�����������пո񣨿ո�ǰ��������������
#  ��һ���������ύ���ɣ�����Ϊ��
#  �ڶ����������й�github�ֿ��ַ�����Ϊ�գ�������ͨ���ύ�����ǵ�һ�Σ��Ѿ��󶨹�Զ��github��ַ�ˣ�
#
#  author: niezhenjie
#
#

funNativeCommit(){
	git add . 
	git commit -m $note
}

note=$1
address=$2
if test -z $note;
then
	echo 'fail log is empty'
	echo '[usage]: ./bindGithub log [github repository address]'
	exit 2
fi

#��һ��������Ϊ�գ��ڶ�������Ϊ�գ�����ͨ�ύ����
if test -z $address
then
	funNativeCommit
	echo 'commiting...'
	git push
	echo 'done'
	exit 0
fi
#�״��ύ����
git init
funNativeCommit
git remote add origin $address
echo 'commiting...'
git push -u origin master
echo 'done'

