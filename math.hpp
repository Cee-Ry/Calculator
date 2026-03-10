#ifndef MATH_HPP
#define MATH_HPP


struct Math {
    int oprtr;
    char pick;

    void operators();
    void doMath(double& num1, double& num2);

    double sum(double& num1, double& num2);
    double difference(double& num1, double& num2);
    double product(double& num1, double& num2);
    double quotient(double& num1, double& num2);
};



#endif