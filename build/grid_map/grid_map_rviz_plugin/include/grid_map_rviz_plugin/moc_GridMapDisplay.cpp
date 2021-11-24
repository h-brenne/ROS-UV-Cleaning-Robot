/****************************************************************************
** Meta object code from reading C++ file 'GridMapDisplay.hpp'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../src/grid_map/grid_map_rviz_plugin/include/grid_map_rviz_plugin/GridMapDisplay.hpp"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'GridMapDisplay.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_grid_map_rviz_plugin__GridMapDisplay_t {
    QByteArrayData data[13];
    char stringdata0[239];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_grid_map_rviz_plugin__GridMapDisplay_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_grid_map_rviz_plugin__GridMapDisplay_t qt_meta_stringdata_grid_map_rviz_plugin__GridMapDisplay = {
    {
QT_MOC_LITERAL(0, 0, 36), // "grid_map_rviz_plugin::GridMap..."
QT_MOC_LITERAL(1, 37, 7), // "process"
QT_MOC_LITERAL(2, 45, 0), // ""
QT_MOC_LITERAL(3, 46, 32), // "grid_map_msgs::GridMap::ConstPtr"
QT_MOC_LITERAL(4, 79, 3), // "msg"
QT_MOC_LITERAL(5, 83, 19), // "updateHistoryLength"
QT_MOC_LITERAL(6, 103, 16), // "updateHeightMode"
QT_MOC_LITERAL(7, 120, 15), // "updateColorMode"
QT_MOC_LITERAL(8, 136, 16), // "updateUseRainbow"
QT_MOC_LITERAL(9, 153, 32), // "updateAutocomputeIntensityBounds"
QT_MOC_LITERAL(10, 186, 19), // "updateVisualization"
QT_MOC_LITERAL(11, 206, 15), // "updateGridLines"
QT_MOC_LITERAL(12, 222, 16) // "onProcessMessage"

    },
    "grid_map_rviz_plugin::GridMapDisplay\0"
    "process\0\0grid_map_msgs::GridMap::ConstPtr\0"
    "msg\0updateHistoryLength\0updateHeightMode\0"
    "updateColorMode\0updateUseRainbow\0"
    "updateAutocomputeIntensityBounds\0"
    "updateVisualization\0updateGridLines\0"
    "onProcessMessage"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_grid_map_rviz_plugin__GridMapDisplay[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   59,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    0,   62,    2, 0x08 /* Private */,
       6,    0,   63,    2, 0x08 /* Private */,
       7,    0,   64,    2, 0x08 /* Private */,
       8,    0,   65,    2, 0x08 /* Private */,
       9,    0,   66,    2, 0x08 /* Private */,
      10,    0,   67,    2, 0x08 /* Private */,
      11,    0,   68,    2, 0x08 /* Private */,
      12,    1,   69,    2, 0x08 /* Private */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 3,    4,

       0        // eod
};

void grid_map_rviz_plugin::GridMapDisplay::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GridMapDisplay *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->process((*reinterpret_cast< const grid_map_msgs::GridMap::ConstPtr(*)>(_a[1]))); break;
        case 1: _t->updateHistoryLength(); break;
        case 2: _t->updateHeightMode(); break;
        case 3: _t->updateColorMode(); break;
        case 4: _t->updateUseRainbow(); break;
        case 5: _t->updateAutocomputeIntensityBounds(); break;
        case 6: _t->updateVisualization(); break;
        case 7: _t->updateGridLines(); break;
        case 8: _t->onProcessMessage((*reinterpret_cast< const grid_map_msgs::GridMap::ConstPtr(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (GridMapDisplay::*)(const grid_map_msgs::GridMap::ConstPtr & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GridMapDisplay::process)) {
                *result = 0;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject grid_map_rviz_plugin::GridMapDisplay::staticMetaObject = { {
    &MessageFilterDisplay<grid_map_msgs::GridMap>::staticMetaObject,
    qt_meta_stringdata_grid_map_rviz_plugin__GridMapDisplay.data,
    qt_meta_data_grid_map_rviz_plugin__GridMapDisplay,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *grid_map_rviz_plugin::GridMapDisplay::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *grid_map_rviz_plugin::GridMapDisplay::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_grid_map_rviz_plugin__GridMapDisplay.stringdata0))
        return static_cast<void*>(this);
    return MessageFilterDisplay<grid_map_msgs::GridMap>::qt_metacast(_clname);
}

int grid_map_rviz_plugin::GridMapDisplay::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = MessageFilterDisplay<grid_map_msgs::GridMap>::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void grid_map_rviz_plugin::GridMapDisplay::process(const grid_map_msgs::GridMap::ConstPtr & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
