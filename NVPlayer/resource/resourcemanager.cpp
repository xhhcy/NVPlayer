#include "resource/resourcemanager.h"
#include<QPushButton>
#include<QVBoxLayout>
#include<QQuickWidget>
#include<QFont>
#include<QLabel>
#include<QPalette>
#pragma execution_character_set("utf-8")

ResourceManager::ResourceManager(QDockWidget *parent) : QDockWidget(parent)
{

    QPalette pa;
    pa.setColor(QPalette::WindowText,Qt::white);
    this->setPalette(pa);
    this->setWindowTitle("资源管理");

    //this->setBackgroundRole(QPalette::ColorRole);
    this->setStyleSheet("background:"+color+";border-radius:10px;font-size:13px;font:bold;font-family:Microsoft YaHei");


    //放弃qml*****************************
    //获取qml 窗体（QQuickWidget）
    m_quickWidget=new QQuickWidget();
    QUrl source("qrc:/main.qml");
    m_quickWidget->setResizeMode(QQuickWidget::SizeRootObjectToView );
    m_quickWidget->setSource(source);
    //将qml窗体导入到DockWidget中
    this->setWidget(m_quickWidget);
    //设置焦点策略（click and tab）
    m_quickWidget->setFocusPolicy(Qt::StrongFocus);
    this->setFocusPolicy(Qt::StrongFocus);
    //安装过滤器
    this->installEventFilter(this);
    m_quickWidget->installEventFilter(this);

}

void ResourceManager::setCustomSizeHint(const QSize &size)
{
    if (szHint != size) {
        szHint = size;
        updateGeometry();
    }
}

bool ResourceManager::eventFilter(QObject *watched, QEvent *event)
{
    if (watched == this || watched == this->m_quickWidget)         //首先判断控件
         {
              if (event->type()==QEvent::FocusIn)     //然后再判断控件的具体事件 (这里指获得焦点事件)
              {
                  this->setStyleSheet("background:#3A96D7;border-radius:10px;font-size:13px;font:bold;font-family:Microsoft YaHei");

              }
              else if (event->type()==QEvent::FocusOut)    // 这里指控件的失去焦点事件
              {
                     this->setStyleSheet("background:"+color+";border-radius:10px;font-size:13px;font:bold;font-family:Microsoft YaHei");
               }
         }
    return QWidget::eventFilter(watched,event);
}
