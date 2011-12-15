import QtQuick 1.1

Rectangle  {
    anchors.fill: parent
    color: "#e3e3e3"
    Item {
        id: quickAppContainer
        // Debug: Currently Expanded(Selected but Not Launched) Application
        property string appToRun:  "NoApp"
        // Debug String for What Application the User Has Selected to Expand,
        //     and View More Information About.  Useful for Usage Statistics
        //onAppToRunChanged: console.debug("Program Selected: appToRun = " + appToRun);
        anchors.horizontalCenter:  parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
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
        GridView {
            id: quickAppGrid
            anchors.fill:  parent;
            // item will be: (cellWidth-25)x(cellHeight-25)
            cellWidth: 175; cellHeight: 225;

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
        }// End of: GridView - quickAppGrid
    }// End of: Item - quickAppContainer
}// End of: QuickAppTab
