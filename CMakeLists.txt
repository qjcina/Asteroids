cmake_minimum_required(VERSION 3.16)

project(Asteroids VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Felgo REQUIRED)

set(PRODUCT_IDENTIFIER "com.gikser.Asteroids")
set(PRODUCT_VERSION_NAME "1.0.0")
set(PRODUCT_VERSION_CODE 1)

set(PRODUCT_STAGE "test")
set(PRODUCT_LICENSE_KEY "")

file(GLOB_RECURSE QmlFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} qml/*.qml qml/*.js)

file(GLOB_RECURSE AssetsFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} assets/* qml/*)
list(REMOVE_ITEM AssetsFiles ${QmlFiles})

qt_add_executable(appAsteroids
    main.cpp
    ${QmlFiles}
    ${AssetsFiles}
)

felgo_configure_executable(appAsteroids)

deploy_resources("${QmlFiles};${AssetsFiles}")

qt_add_qml_module(appAsteroids
    URI Asteroids
    VERSION 1.0
    NO_RESOURCE_TARGET_PATH
)


target_compile_definitions(appAsteroids
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(appAsteroids PRIVATE Felgo)
