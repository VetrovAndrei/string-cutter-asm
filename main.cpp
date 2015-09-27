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
	cout << "Введите исходную строку (не более 300 символов)" << endl;
	cin >> orig;
	cout << "Введите номер позиции, с которой необходимо выделять подстроку" << endl;
	cin >> begin;
	cout << "Введите длину подстроки" << endl;
	cin >> lenght;
	flag = cut(orig, cutted, begin, lenght);
	if (flag == 0)
		cout << "Введены некоректные данные невозможно вывести данную подстроку" << endl;
	else
	{
		cout << "Полученная подстрока: ";
		for (int i = 0; i < lenght; i++)
			cout << cutted[i];
	cout << endl;
	}
	system("pause");
}