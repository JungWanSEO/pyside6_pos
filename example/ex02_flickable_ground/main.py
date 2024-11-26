import sys
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    engine.addImportPath(sys.path[0])
    engine.loadFromModule("QML_Main", "Main")
    ex = app.exec()
    del engine
    sys.exit(ex)