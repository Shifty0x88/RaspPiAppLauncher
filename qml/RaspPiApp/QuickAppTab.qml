import QtQuick 1.1

Item {
    id: quickAppContainer
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
        onClicked: quickAppGrid.currentIndex = -1
    }
    QuickAppDelegate {
        id: quickAppDelegate
    }

    QuickAppGrid {
        id: quickAppGrid
    }
}
