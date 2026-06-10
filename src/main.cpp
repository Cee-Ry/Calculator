#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);
  QQmlApplicationEngine cal;

  cal.load(QUrl("qrc:/qt/qml/Calculator/src/main.qml"));
  return app.exec();
}