import QtQuick 1.1 // needed for Text.maximumLineCount

Rectangle {
    id: root
    // Figure out a way to get this to auto-expand and contract as the
    //     User Maximizes/Minimizes/Re-Sizes the Application
    width:  700; height: 700;
    // Background Color, Border Color and Width
    color: "lightsteelblue"; border.width: 5; border.color: "black"

    // Raspberry Pi Logo!!!!!!!! Love the Raspberry Pi!!!!
    Image {
        id: raspPiLogoImg
        width: 45; height: 45; x: 0; y: 5;
        // High Quality Raspberry Pi Only Thank You Very Much!!
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

    // Tab Widget, Holds the Tab Pages in the Application
    TabWidget {
        id: tabWidget

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
                ListModel {
                    id: quickAppItemModel

                    ListElement {
                        colorName: "red"
                        appTitle: "RaspPi Quick Start"
                        appName: "firefox http://www.raspberrypi.org/"
                        blurb: "blah blah "
                        iconImg: "image/RaspPi_PNG90x80.png"
                        borderColor: "green"
                        borderWidth: 1
                    }
                    ListElement {
                        colorName: "orange"
                        appTitle: "Firefox"
                        appName: "firefox"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                        iconImg: "image/qt-logo.png"
                        borderColor: "blue"
                        borderWidth: 1
                    }
                    ListElement {
                        colorName: "lightsteelblue"
                        appTitle: "Chromium"
                        appName: "firefox"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
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
                        appTitle: "Raspberry Pi QuickStart"
                        appName: "firefox http://www.raspberrypi.org"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                        iconImg: "image/RaspPi_PNG90x80.png"
                        borderColor: "black"
                        borderWidth: 1
                    }
                    ListElement {
                        colorName: "red"
                        appTitle: "Geany"
                        appName: "geany"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                        iconImg: "image/qt-logo.png"
                        borderColor: "black"
                        borderWidth: 1
                    }
                    ListElement {
                        colorName: "blue"
                        appTitle: "Eclipse"
                        appName: "eclipse"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                        iconImg: "image/RaspPi_PNG90x80.png"
                        borderColor: "black"
                        borderWidth: 1
                    }
                    ListElement {
                        colorName: "red"
                        appTitle: "Geany"
                        appName: "geany"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
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
                        colorName: "blue"
                        appTitle: "Eclipse"
                        appName: "eclipse"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                        iconImg: "image/RaspPi_PNG90x80.png"
                        borderColor: "black"
                        borderWidth: 1
                    }
                    ListElement {
                        colorName: "red"
                        appTitle: "Geany"
                        appName: "geany"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                        iconImg: "image/qt-logo.png"
                        borderColor: "black"
                        borderWidth: 1
                    }
                    ListElement {
                        colorName: "blue"
                        appTitle: "Eclipse"
                        appName: "eclipse"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                        iconImg: "image/RaspPi_PNG90x80.png"
                        borderColor: "black"
                        borderWidth: 1
                    }
                    ListElement {
                        colorName: "red"
                        appTitle: "Geany"
                        appName: "geany"
                        blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                        iconImg: "image/qt-logo.png"
                        borderColor: "black"
                        borderWidth: 1
                    }
                }// End of: workAppItemModel

            }// End of: WorkAppTab
        }// End of: WorkAppTab Holder

    }// End of: TabWidget
}// End of: main.qml

