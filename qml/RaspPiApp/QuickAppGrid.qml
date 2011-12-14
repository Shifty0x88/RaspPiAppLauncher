import QtQuick 1.1

GridView {
    anchors.fill:  parent;
    // Figure out a way to get the width and height of the item without hardcoding it
    cellWidth: 175; cellHeight: 225; // width+25, height+25

    model: quickAppItemModel
    delegate: quickAppDelegate
    // handle clicks on empty area within the grid.
    // this adds an element below the grid items but on the grid's flickable surface
    //     (so it won't have mouse events stolen by the grid)
    flickableChildren: MouseArea {
        anchors.fill: parent
        onClicked: quickAppGrid.currentIndex = -1
    }
    // sets the initial index to -1, so no item is selected
    //        currentIndex: -1 // not enough, need to check later
    Component.onCompleted: currentIndex = -1
}
