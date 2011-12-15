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

    GridView {
        id: workAppGrid
        anchors.fill:  parent;
        cellWidth: 175; cellHeight: 225; // width+25, height+25
        model: workAppItemModel
        delegate: workAppDelegate
        // handle clicks on empty area within the grid.
        // this adds an element below the grid items but on the grid's flickable surface
        //     (so it won't have mouse events stolen by the grid)
        flickableChildren: MouseArea {
            anchors.fill: parent
            onClicked: workAppGrid.currentIndex = -1
        }
        // sets the initial index to -1, so no item is selected
        //        currentIndex: -1 // not enough, need to check later
        Component.onCompleted: currentIndex = -1
    }
}

