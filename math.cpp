#include "math.hpp"

#include <iostream>

void Math::operators() {
    while(true) {
        std::cout << "choose an operator:\n[+] Addition\n[-] Subtraction\n[*] Multiplication\n[/] Division\n";
        
        system("stty -icanon -echo");
        pick = std::cin.get();

        if (pick == '+') {
            oprtr = 1;
            break;
        } else if (pick == '-') {
            oprtr = 2;
            break;
        } else if (pick == '*') {
            oprtr = 3;
            break;
        } else if (pick == '/') {
            oprtr = 4;
            break;
        }

        std::cin.clear();
        system("clear");
    }
    system("clear");
    system("stty icanon echo");
}

void Math::doMath(double& num1, double& num2) {
    if (oprtr == 1) {std::cout << "ADDITION '+'\n\n";}
    if (oprtr == 2) {std::cout << "SUBTRACTION '-'\n\n";}
    if (oprtr == 3) {std::cout << "MULTIPLICATION '*'\n\n";}
    if (oprtr == 4) {std::cout << "DIVISION '/'\n\n";}


    std::cout << "Enter 1st No.: ";
    std::cin >> num1;

    std::cout << "Enter 2nd No.: ";
    std::cin >> num2;
}

double Math::sum(double& num1, double& num2) {
    return num1 + num2;
}
double Math::difference(double& num1, double& num2) {
    return num1 - num2;
}
double Math::product(double& num1, double& num2) {
    return num1 * num2;
}
double Math::quotient(double& num1, double& num2) {
    return num1 / num2;
}

