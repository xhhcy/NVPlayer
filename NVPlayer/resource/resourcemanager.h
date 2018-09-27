#ifndef RESOURCEMANAGER_H
#define RESOURCEMANAGER_H

#include <QWidget>
#include<QDockWidget>
#include<QSize>
#include<QMouseEvent>
#include<QFocusEvent>
#include<QQuickWidget>
class ResourceManager : public QDockWidget
{
    Q_OBJECT
public:
    explicit ResourceManager(QDockWidget *parent = nullptr);
    QSize sizeHint() const override { return szHint; }
    QSize minimumSizeHint() const override { return minSzHint; }

    void setCustomSizeHint(const QSize &size);

signals:

public slots: 
     bool eventFilter(QObject *,QEvent *);    //注意这里
private:
    QSize szHint;
    QSize minSzHint;
    QQuickWidget *m_quickWidget;
    QString color = "#B0B7BC";
};

#endif // RESOURCEMANAGER_H
