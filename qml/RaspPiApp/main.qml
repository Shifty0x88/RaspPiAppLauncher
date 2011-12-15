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
    // Holds the TabWidget and the Tabs that are contained within it
    TabWidgetHolder {
        id: tabWidget

    }

}// End of: main.qml

