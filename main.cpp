#include "math.hpp"

#include <iostream>

Math math;

int main() {
    double num1, num2;

    math.operators();
    math.doMath(num1, num2);

    switch (math.oprtr) {
        case 1: 
            std::cout << "= " << math.sum(num1, num2);
            break;
        case 2:
            std::cout << "= " << math.difference(num1, num2);
            break;
        case 3:
            std::cout << "= " << math.product(num1, num2);
            break;
        case 4:
            std::cout << "= " << math.quotient(num1, num2);
            break;
    }

    std::cout << '\n';

    return 0;
}