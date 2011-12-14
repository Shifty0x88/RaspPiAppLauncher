import QtQuick 1.1

Item {
    id: workAppContainer
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
        onClicked: workAppGrid.currentIndex = -1
    }

    WorkAppDelegate {
        id: workAppDelegate
    }

    WorkAppGrid {
        id: workAppGrid
        anchors.fill:  parent;
        // Figure out a way to get the width and height of the item without hardcoding it
        cellWidth: 175; cellHeight: 225; // width+25, height+25
        model: workAppItemModel
        delegate: workAppDelegate


    }
}

