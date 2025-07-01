cmake_minimum_required(VERSION 3.16)
project(HelloQml LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick)

# qt_standard_project_setup()
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)


qt_add_executable(hw_qmlbin
    main.cpp
)

qt_add_qml_module(hw_qmlbin
    URI HelloQml
    QML_FILES main.qml
    VERSION 1.0
)

target_link_libraries(hw_qmlbin
    PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick
)

qt_add_resources(hw_qmlbin "resources"
    PREFIX "/"
    FILES main.qml
)
