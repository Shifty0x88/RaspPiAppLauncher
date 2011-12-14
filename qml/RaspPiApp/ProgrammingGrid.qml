import QtQuick 1.1

GridView {
    // Figure out how to find the cell width and height programatically
    cellWidth: 175; cellHeight: 225

    model: programmingItemModel
    delegate: programmingDelegate
    // handle clicks on empty area within the grid.
    // this adds an element below the grid items but on the grid's flickable surface
    //     (so it won't have mouse events stolen by the grid)
    flickableChildren: MouseArea {
        anchors.fill: parent
        onClicked: programmingGrid.currentIndex = -1
    }
    // sets the initial index to -1, so no item is selected
    //        currentIndex: -1 // not enough, need to check later
    Component.onCompleted: currentIndex = -1
}
