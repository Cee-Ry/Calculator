#include <iostream>
#include <iomanip>
using namespace std;

class Calculator {
public:
    void add(int num1, int num2) {
        cout << "Performing Addition" << endl;
        cout << "Enter first number: ";
        cin >> num1;
        cout << "Enter second number: ";
        cin >> num2;
        cout << "Result: " << num1 + num2 << endl;

        cout << "press any key to continue..." << endl;
        cin.ignore();
        cin.get();
    }
    void subtract(int num1, int num2) {
        cout << "Performing Subtraction" << endl;
        cout << "Enter first number: ";
        cin >> num1;
        cout << "Enter second number: ";
        cin >> num2;
        cout << "Result: " << num1 - num2 << endl;

        cout << "press any key to continue..." << endl;
        cin.ignore();
        cin.get();
    }
    void multiply(int num1, int num2) {
        cout << "Performing Multiplication" << endl;
        cout << "Enter first number: ";
        cin >> num1;
        cout << "Enter second number: ";
        cin >> num2;
        cout << "Result: " << num1 * num2 << endl;

        cout << "press any key to continue..." << endl;
        cin.ignore();
        cin.get();
    }
    void divide(double num1, double num2) {
        cout << fixed << setprecision(2);

        cout << "Performing Division" << endl;
        cout << "Enter numerator: ";
        cin >> num1;
        cout << "Enter denominator: ";
        cin >> num2;
        if (num2 != 0) {
            cout << "Result: " << num1 / num2 << endl;
        } else {
            cout << "Error: Division by zero!" << endl;
        } 

        cout << "press any key to continue..." << endl;
        cin.ignore();
        cin.get();
    }  
};

int main() {
    string calType[4] = {"Addition", "Subtraction", "Multiplication", "Division"};
    char choice;
    int num1, num2;
    double dnum1, dnum2;

    Calculator calcu;

    while (1) {
        cout << "Selected Calculation Types:" << endl;
        
        for (int i = 0; i < 4; i++) {
            cout << "[" << i + 1 << "]: " << calType[i] << endl;
        }

        cout << "Select Calculation Type (1-4) or any other key to exit: ";
        while ((cin >> choice) &&(choice >= '1' && choice <= '4')) {

            system("clear");
            if (choice == '1') {
                cout << "You selected Addition." << endl << endl;
                calcu.add(num1, num2);
                break;
            } else if (choice == '2') {
                cout << "You selected Subtraction." << endl << endl;
                calcu.subtract(num1, num2);
                break;
            } else if (choice == '3') {
                cout << "You selected Multiplication." << endl << endl;
                calcu.multiply(num1, num2);
                break;
            } else if (choice == '4') {
                cout << "You selected Division." << endl << endl;
                calcu.divide(dnum1, dnum2);
                break;
            }

        }

        system("clear");
        if ((choice >= '1' && choice <= '4')) {
            cin.clear();
        } else {
            cout << "Exiting the program." << endl;
            break;
        }
    }

    return 0;
}