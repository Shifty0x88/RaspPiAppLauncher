import QtQuick 1.1

Item {
    // Debug: Currently Expanded(Selected but Not Launched) Application
    property string appToRun:  "NoApp"
    // Debug String for What Application the User Has Selected to Expand,
    //     and View More Information About.  Useful for Usage Statistics
    //onAppToRunChanged: console.debug("Program Selected: appToRun = " + appToRun);
    anchors.fill: parent;
    // Handle Clicks on the Area that is Not Part of the Item
    //     Currently Selected
    MouseArea {
        anchors.fill: parent
        onClicked: programmingGrid.currentIndex = -1
    }

    ProgrammingDelegate {
        id: programmingDelegate
    }

    ProgrammingGrid {
        id: programmingGrid;

    }

}
