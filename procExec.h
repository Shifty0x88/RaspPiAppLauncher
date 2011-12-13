#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
#include <QDebug>
#include <QProcess>


class ProcExec : public QObject
{
    Q_OBJECT
public:
    /* procName - QString - simple process name that you want to run.
     *     ie: firefox, ..... etc.
     *
     * TODO:
     *     does not solve naming conflicts
     *     only allows one process per object
     *     can I let QPRocess to die?!?
     *
     */
    Q_INVOKABLE  void RunSimpleProcess( const QString &procName ) {

        qDebug() << "Launching Program: " << procName;

        if( ! runSimpleProcess( procName ) ) {
            qDebug() << "ERROR: AAHH Trying to Launch Program: " << procName;
        }
        qDebug() << "Program: " << procName << " Started Successfully";
    }

    Q_INVOKABLE  void RunShellProcess( const QString &shellProcNameAndArgs )
    {
        QStringList args = shellProcNameAndArgs.split(" ", QString::SkipEmptyParts );

        QString procName = args.front();
        args.removeAt(0);

        /*
         QProcess gzip;
         gzip.start("gzip", QStringList() << "-c");
         if (!gzip.waitForStarted())
             return false;

         gzip.write("Qt rocks!");
         gzip.closeWriteChannel();

         if (!gzip.waitForFinished())
             return false;

         QByteArray result = gzip.readAll();
    */
        QProcess process;

        qDebug() << "Launching Program: " << procName << ".";
        process.start(procName, args, QIODevice::ReadWrite );
        if( ! process.waitForStarted() ) {
            qDebug() << "Program: " << shellProcNameAndArgs << " Failed to start";
            DebugProcess(process);
            return;
        }
        qDebug() << "Program: " << shellProcNameAndArgs << " Started Successfully.";
        if( ! process.waitForFinished() ) {
            qDebug() << "Program: " << shellProcNameAndArgs << " Failed to Complete";
            DebugProcess(process);
            return;
        }
        qDebug() << "Program: " << shellProcNameAndArgs << " Finished Successfully.";
    }





private:


    Q_INVOKABLE  bool runSimpleProcess( const QString &procName  )
    {
        // Either we does a best guess or search for the actual
        //     place on disk that matches this process name
        QProcess *process = new QProcess();
        qDebug() << "Launching Program: " << procName << ".";
        process->start(procName, QIODevice::ReadWrite );

        if( ! process->waitForStarted() ) {
            qDebug() << "Program: " << procName << " Failed to start";
            DebugProcess((*process));
            return false;
        }

        qDebug() << "Program: " << procName << " Started Successfully.";

        if( ! process->waitForFinished() ) {
            qDebug() << "Program: " << procName << " Failed to Complete";
            DebugProcess((*process));
            return false;
        }

        qDebug() << "Program: " << procName << " Finished Successfully.";
        return true;
    }

    void DebugProcess( const QProcess &process, bool fullDebug = false )
    {
        if( fullDebug ) {
            qDebug() << "Exit Code    = " << process.exitCode();
            qDebug() << "Exit Status  = " << process.exitStatus();
            qDebug() << "Error        = " << process.error();
        }
        qDebug() << "QProcess Error String = " << process.errorString();
    }

    // Process to hold the
    QProcess* proc;
};

#endif // MYCLASS_H
