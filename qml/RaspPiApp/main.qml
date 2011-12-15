import QtQuick 1.1 // needed for Text.maximumLineCount

Rectangle {
    id: root
    // Figure out a way to get this to auto-expand and contract as the
    //     User Maximizes/Minimizes/Re-Sizes the Application
    //width:  530; height: 650;
    width:  600; height: 650;

    // Background Color, Border Color and Width
    anchors.fill:  parent
    color: "lightsteelblue"; border.width: 5; border.color: "black"
    // Raspberry Pi Logo!!!!!!!! Love the Raspberry Pi!!!!
    Image {
        id: raspPiLogoImg
        width: 45; height: 45; x: 0; y: 5;
        // Yey! For Transparent Background Icon Image!! Thank to Liam! =D
        source: "image/RaspPi_PNG45x40.png"
        fillMode: Image.PreserveAspectFit
    }
    // Title of the Application, Goes Next to the Raspberry Pi Logo
    Text {
        id: titleText
        font.family: "Courier"; font.pointSize: 16;
        x: 60; y: 20;
        text: "Raspberry Pi Application Launcher"
    }
    // Holds the TabWidget and the Tabs that are contained within it
    // Tab Widget, Holds the Tab Pages in the Application
    TabWidget {
        // Put this Under the Raspberry Pi Logo, but Expand to the Entire Window Width
        anchors.top: raspPiLogoImg.bottom;
        anchors.bottom: parent.bottom; anchors.bottomMargin: parent.border.width / 2
        anchors.left: parent.left; anchors.leftMargin: parent.border.width / 2
        anchors.right:  parent.right; anchors.rightMargin: parent.border.width / 2

        // Quick Application Tab Page
        QuickAppTab {
            id: quickAppTab
            property string title: "Quick Start Apps"
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            // This is all of the Applications to be Shown on the Quick App Tab Page
            ListModel {
                id: quickAppItemModel
                // Firefox - To Web Link: http://raspberrypi.org/
                ListElement {
                    // Background Color
                    colorName: "red"
                    // Title of the Application
                    appTitle: "RaspPi Quick Start"
                    // This is What Actually gets Launched!!!
                    appName: "firefox http://www.raspberrypi.org/"
                    // Blurb about the Program
                    blurb: "Raspberry Pi Quick Start Guide.\n Shows you the Basics of the OS, how to get around, how to launch programs, how to install extras, etc."
                    // Program Icon
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "green"
                    borderWidth: 1
                }
                // Firefox - To Web Link: Wiki Page @ eLinux.org
                ListElement {
                    colorName: "yellow"
                    appTitle: "RaspPi Wiki"
                    appName: "firefox http://elinux.org/RaspberryPiBoard"
                    blurb: "Raspberry Pi -- Wiki Page.\n All the Raspberry Pi Information you could need or want!"
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Firefox - To Web Link: Wiki Page @ eLinux.org
                ListElement {
                    colorName: "lightsteelblue"
                    appTitle: "RaspPi API Docs"
                    appName: "firefox http://elinux.org/RaspberryPiBoard"
                    blurb: "Raspberry Pi API -- Wiki Page.\n All the Raspberry Pi API Information you need!"
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Terminal
                ListElement {
                    colorName: "blue"
                    appTitle: "Gnome Terminal"
                    appName: "gnome-terminal"
                    blurb: "Simple GUI Shell.\n Great for command-line uses"
                    iconImg: "/usr/share/app-install/icons/terminal-tango.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Gedit - no args/default args
                ListElement {
                    colorName: "green"
                    appTitle: "GEdit"
                    appName: "gedit"
                    blurb: "Simple GUI Text Editor.\n Great for Quick Edits, Testing and All-Around Text Editor"
                    iconImg: "/usr/share/app-install/icons/accessories-text-editor.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Firefox - no args/default args
                ListElement {
                    colorName: "orange"
                    appTitle: "Firefox"
                    appName: "firefox"
                    blurb: "Firefox Web Browser.\n Helps you get the information you want, when you want it. From the Mozilla Firefox Team!"
                    iconImg: "/usr/share/app-install/icons/firefox.png"
                    borderColor: "blue"
                    borderWidth: 1
                }
            }// End of: quickAppItemModel
        }// End of: QuickAppTab

        // Programming Applications' Tab Page
        // We have to move out whatever needs to be changable to here
        ProgrammingTab {
            id: programmingTab
            property string title: "Programming"
            // This is the Items that we Want to Display
            //     on the Programming Tab Page
            ListModel {
                id: programmingItemModel
                // Firefox - To Web Link: RaspberryPi.org
                ListElement {
                    colorName: "blue"
                    appTitle: "RaspPi QuickStart"
                    // NOTE: Because this works right now and I haven't
                    //       currently "programmed" for arguments, this
                    //       may break, may not work, or generally suck.
                    // Either that or QProcess simply appends the arguments
                    //       into a String or StringList or something so
                    //       it doesn't matter
                    appName: "firefox http://www.raspberrypi.org"
                    blurb: "Raspberry Pi Quick Start Guide.\n Shows you the Basics of the OS, how to get around, how to launch programs, how to install extras, etc."
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Firefox - To Web Link: Wiki Page @ eLinux.org
                ListElement {
                    colorName: "red"
                    appTitle: "RaspPi Wiki"
                    appName: "firefox http://elinux.org/RaspberryPiBoard"
                    blurb: "Raspberry Pi -- Wiki Page.\n All the Raspberry Pi Information you could need or want!"
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Firefox - To Web Link: Wiki Page @ eLinux.org
                ListElement {
                    colorName: "lightsteelblue"
                    appTitle: "RaspPi API Docs"
                    appName: "firefox http://elinux.org/RaspberryPiBoard"
                    blurb: "Raspberry Pi API -- Wiki Page.\n Doesn't Exist Yet But Hopefully Soon It will! All the Raspberry Pi API Information you need!"
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Geany - Currently Errors Out on My System because it's not installed
                // Suggestion: Suppress Errors and Launch Package Manager for the Given App
                ListElement {
                    colorName: "orange"
                    appTitle: "Geany [Python]"
                    appName: "geany"
                    blurb: "Geany Python IDE.\n  Python Interpreter. Official Language of the Raspberry Pi"
                    // Somehow I have the icon but not the program, hah!
                    iconImg: "/usr/share/app-install/icons/geany.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Eclipse IDE
                ListElement {
                    colorName: "purple"
                    appTitle: "Eclipse [Java/C++]"
                    appName: "eclipse"
                    blurb: "Eclipse IDE.\n  Java and C++ Compiler."
                    iconImg: "/usr/share/app-install/icons/eclipse.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Qt Creator IDE
                ListElement {
                    colorName: "lightgreen"
                    appTitle: "Qt Creator"
                    appName: "qtcreator"
                    blurb: "Qt Creator.\n\nCreate an App Like this One! =D"
                    iconImg: "/usr/share/app-install/icons/qtcreator.png"
                    borderColor: "black"
                    borderWidth: 1
                }
            }// End of: programmingItemModel
        }// End of: ProgrammingTab

        // Work Applications' Tab Page
        // Work App Tab Page
        WorkAppTab {
            property string title: "Work Apps"
            ListModel {
                id: workAppItemModel
                // GEdit
                ListElement {
                    colorName: "lightsteelblue"
                    appTitle: "GEdit"
                    // This is what actually gets launched:
                    appName: "gedit"
                    blurb: "Simple GUI Text Editor\n\n GEdit is a lightweight Text Editor"
                    iconImg: "/usr/share/app-install/icons/accessories-text-editor.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // GNOME Terminal
                ListElement {
                    colorName: "green"
                    appTitle: "Gnome Terminal"
                    appName: "gnome-terminal"
                    blurb: "Simple GUI Shell\n\n Great for command-line uses"
                    iconImg: "/usr/share/app-install/icons/terminal-tango.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                // Firefox - No Args/Default Args
                ListElement {
                    colorName: "orange"
                    appTitle: "Firefox"
                    appName: "firefox"
                    blurb: "Mozilla Firefox\n\n Firefox!"
                    iconImg: "/usr/share/app-install/icons/firefox.png"
                    borderColor: "black"
                    borderWidth: 1
                }
            }// End of: workAppItemModel
        }// End of: WorkAppTab

    }// End of: TabWidget
}// End of: main.qml

