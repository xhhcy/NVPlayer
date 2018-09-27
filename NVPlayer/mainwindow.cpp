#include "mainwindow.h"
#include "ui_mainwindow.h"
#include<QIcon>
#include<QGridLayout>
#include"resource/resourcemanager.h"
#include"property/propertymanager.h"
#include"program/programmanager.h"
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->setWindowTitle("Nova");
    this->setWindowIcon(QIcon(":/images/player.png"));
    //this->setWindowFlags(Qt::FramelessWindowHint);//去掉标题栏

    ui->mainToolBar->setStyleSheet("background-color:#A4A4A5;");

    QAction *actionNew = ui->action;
    QAction *actionOpenProject = ui->action_2;
    QAction *actionSave = ui->action_5;
    QAction *actionPack = ui->action_7;
//    QAction *actionOpenRecentProgram = ui->actionD_test_png;
//    QAction *actionSaveOther = ui->action_6;
//    QAction *actionClosePC = ui->action_9;
//    QAction *actionReStartPC = ui->action_10;
//    QAction *actionSaveDefaultLayout = ui->action_12;
//    QAction *actionSetting = ui->action_13;
//    QAction *actionQuit = ui->action_14;

    ui->mainToolBar->addAction(actionNew);
    ui->mainToolBar->addAction(actionOpenProject);
    ui->mainToolBar->addAction(actionSave);
    ui->mainToolBar->addAction(actionPack);
    //ui->mainToolBar->addAction(actionOpenRecentProgram);
    //ui->mainToolBar->addAction(actionSaveOther);
    //ui->mainToolBar->addAction(actionClosePC);
    //ui->mainToolBar->addAction(actionReStartPC);
    //ui->mainToolBar->addAction(actionSaveDefaultLayout);
    //ui->mainToolBar->addAction(actionQuit);

    //QGridLayout *layout = new QGridLayout(this);
    //资源管理
    ResourceManager *resource= new ResourceManager;
    //属性管理
    PropertyManager *property= new PropertyManager;
    //节目管理
    ProgramManager *program = new ProgramManager;
    //addDockWidget(Qt::LeftDockWidgetArea,resource);
    addDockWidget(Qt::RightDockWidgetArea,property);
    addDockWidget(Qt::BottomDockWidgetArea,program);






}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_action_30_triggered()
{
    ui->action_31->setChecked(false);
}

void MainWindow::on_action_31_triggered()
{
    ui->action_30->setChecked(false);
}
