cmake_minimum_required(VERSION 4.0)
project(Calculator)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)
qt_add_executable(cal src/main.cpp)

qt_add_qml_module(cal
  URI Calculator
  VERSION 1.0
  QML_FILES src/main.qml
)

target_link_libraries(cal PRIVATE
  Qt6::Core
  Qt6::Gui
  Qt6::Qml
  Qt6::Quick
  Qt6::QuickControls2
)
