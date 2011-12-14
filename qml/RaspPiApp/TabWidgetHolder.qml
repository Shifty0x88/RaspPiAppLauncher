import QtQuick 1.1

// Tab Widget, Holds the Tab Pages in the Application
TabWidget {
    // Put this Under the Raspberry Pi Logo, but Expand to the Entire Window Width
    anchors.top: raspPiLogoImg.bottom;
    anchors.bottom: parent.bottom; anchors.bottomMargin: parent.border.width / 2
    anchors.left: parent.left; anchors.leftMargin: parent.border.width / 2
    anchors.right:  parent.right; anchors.rightMargin: parent.border.width / 2

    Rectangle  {
        property string title: "Quick Start Apps"
        anchors.fill: parent
        color: "#e3e3e3"

        // Quick Applications' Tab Page
        // We have to move out whatever needs to be changable to here
        QuickAppTab {
            id: quickAppTab

            ListModel {
                id: quickAppItemModel

                ListElement {
                    colorName: "red"
                    // Title of the Application
                    appTitle: "RaspPi Quick Start"

                    // This is What Cctually gets Launched!!!
                    appName: "firefox http://www.raspberrypi.org/"

                    // Blurb about the Program
                    blurb: "Raspberry Pi Quick Start Guide.\n Shows you the Basics of the OS, how to get around, how to launch programs, how to install extras, etc."
                    // Program Icon
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "green"
                    borderWidth: 1
                }
                ListElement {
                    colorName: "orange"
                    appTitle: "Firefox"
                    appName: "firefox"
                    blurb: "Firefox Web Browser.\n Helps you get the information you want, when you want it. From the Mozilla Firefox Team!"
                    iconImg: "image/qt-logo.png"
                    borderColor: "blue"
                    borderWidth: 1
                }
                ListElement {
                    colorName: "blue"
                    appTitle: "Gnome Terminal"
                    appName: "gnome-terminal"
                    blurb: "Simple GUI Shell.\n Great for command-line uses"
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                ListElement {
                    colorName: "lightsteelblue"
                    appTitle: "Chromium"
                    appName: "firefox"
                    blurb: "Chromium Web Browser.\n Brought to you by the Chromium Open Source Project"
                    iconImg: "image/qt-logo.png"
                    borderColor: "black"
                    borderWidth: 1
                }
            }// End of: quickAppItemModel

        }// End of: QuickAppTab
    } // End of: QuickAppTab Holder

    Rectangle  {
        property string title: "Programming"
        anchors.fill: parent
        color: "#e3e3e3"

        // Programming Applications' Tab Page
        // We have to move out whatever needs to be changable to here
        ProgrammingTab {
            id: programmingTab

            // This is the Items that we Want to Display
            //     on the Programming Tab Page
            ListModel {
                id: programmingItemModel

                ListElement {
                    colorName: "blue"
                    appTitle: "RaspPi QuickStart"
                    appName: "firefox http://www.raspberrypi.org"
                    blurb: "Raspberry Pi Quick Start Guide.\n Shows you the Basics of the OS, how to get around, how to launch programs, how to install extras, etc."
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                ListElement {
                    colorName: "red"
                    appTitle: "RaspPi Wiki"
                    appName: "firefox http://elinux.org/RaspberryPiBoard"
                    blurb: "Raspberry Pi -- Wiki Page.\n All the Raspberry Pi Information you could need or want!"
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                ListElement {
                    colorName: "lightsteelblue"
                    appTitle: "RaspPi API Docs"
                    appName: "firefox http://elinux.org/RaspberryPiBoard"
                    blurb: "Raspberry Pi API -- Wiki Page.\n All the Raspberry Pi API Information you need!"
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                ListElement {
                    colorName: "orange"
                    appTitle: "Geany [Python]"
                    appName: "geany"
                    blurb: "Geany Python IDE.\n  Python Interpreter. Official Language of the Raspberry Pi"
                    iconImg: "image/qt-logo.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                ListElement {
                    colorName: "purple"
                    appTitle: "Eclipse [Java/C++]"
                    appName: "eclipse"
                    blurb: "Eclipse IDE.\n  Java and C++ Compiler."
                    iconImg: "image/qt-logo.png"
                    borderColor: "black"
                    borderWidth: 1
                }
            }// End of: programmingItemModel

        }// End of: ProgrammingTab
    } // End of: ProgrammingTab Holder

    Rectangle  {
        property string title: "Work Apps"
        anchors.fill: parent
        color: "#e3e3e3"

        // Work Applications' Tab Page
        // Work App Tab Page
        WorkAppTab {
            ListModel {
                id: workAppItemModel
                ListElement {
                    colorName: "lightsteelblue"
                    appTitle: "Gnome Edit"

                    // This is what actually gets launched:
                    appName: "gedit"

                    blurb: "Simple GUI Text Editor.\n GEdit is a lightweight Text Editor"
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }
                ListElement {
                    colorName: "red"
                    appTitle: "Gnome Terminal"
                    appName: "gnome-terminal"
                    blurb: "Simple GUI Shell.\n Great for command-line uses"
                    iconImg: "image/RaspPi_PNG90x80.png"
                    borderColor: "black"
                    borderWidth: 1
                }

            }// End of: workAppItemModel

        }// End of: WorkAppTab
    }// End of: WorkAppTab Holder

}// End of: TabWidget
