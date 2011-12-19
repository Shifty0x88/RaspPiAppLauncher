import QtQuick 1.1

Rectangle  {
    anchors.fill: parent
    color: "#e3e3e3" // Make the Background Blend into the Tab Image
    //anchors.centerIn: parent;

    Item {
        // Debug: Currently Expanded(Selected but Not Launched) Application
        property string appToRun:  "NoApp"
        // Debug String for What Application the User Has Selected to Expand,
        //     and View More Information About.  Useful for Usage Statistics
        //onAppToRunChanged: console.debug("Program Selected: appToRun = " + appToRun);
        anchors.left: parent.left; anchors.right: parent.right;
        // Yes yes I'm cheating, but I can't figure it out
        anchors.leftMargin: 35;
        anchors.top: parent.top; anchors.bottom: parent.bottom;

        // Handle Clicks on the Area that is Not Part of the Item
        //     Currently Selected
        MouseArea {
            anchors.fill: parent
            onClicked: programmingGrid.currentIndex = -1
        }
        // Programming Grid View
        GridView {
            id: programmingGrid
            anchors.fill: parent;
            // item will be: (cellWidth-25)x(cellHeight-25)
            cellWidth: 175; cellHeight: 225;
            //x: 25

            model: programmingItemModel
            // Programming Delegate to the Grid View
            delegate: ProgrammingDelegate {
                          id: programmingDelegate
                      }
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
            //focus: true
        }// End of: GridView
    }// End of: Item
}// End of: ProgrammingTab
