#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <fstream>
#include <locale>
#include <iostream>
using namespace std;

extern "C" 
{
	int cut(char* orig ,char* cutted, int, int);
}

void main()
{
	setlocale (LC_CTYPE, "Russian");
	char *orig, *cutted;
	orig = new char[300];
	cutted = new char[300];
	int begin = 0;
	int lenght = 0;
	int flag = 1;
	cout << "������� �������� ������ (�� ����� 300 ��������)" << endl;
	cin >> orig;
	cout << "������� ����� �������, � ������� ���������� �������� ���������" << endl;
	cin >> begin;
	cout << "������� ����� ���������" << endl;
	cin >> lenght;
	flag = cut(orig, cutted, begin, lenght);
	if (flag == 0)
		cout << "������� ����������� ������ ���������� ������� ������ ���������" << endl;
	else
	{
		cout << "���������� ���������: ";
		for (int i = 0; i < lenght; i++)
			cout << cutted[i];
	cout << endl;
	}
	system("pause");
}