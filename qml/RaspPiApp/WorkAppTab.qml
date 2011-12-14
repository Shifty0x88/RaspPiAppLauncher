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
    // Font for the Text Blurb for Each Application
    //     Number of Lines of Text Increases if the User Clicks on
    //     that individual Application.
    FontLoader{
        id: blurbFont
        name: "Courier"
    }
    // Font for the Title
    FontLoader{
        id: titleFont
        name: "Helvetica"
    }

    // Our Delegate to the Grid
    Component {
        id: workAppDelegate
        // This is Our Grid Item
        Rectangle {
            id: rect

            width: 150
            height: 200

            color: colorName

            border.color: borderColor
            border.width: borderWidth
            // We Use this to Force the One that the User has Selected to Draw
            //      On Top of the Other Ones in the Grid, So we can Expand
            //      the Description of the Program as Well
            // If you Change this Value, Change on State: "none", as well
            z: 1
            // Application Name (Top of our )
            Text {
                id: myAppText
                font.family:  "Courier"
                font.pixelSize: 13;
                anchors { top: parent.top; horizontalCenter: parent.horizontalCenter; margins: 10 }
                text: appTitle
            }
            Text{
                id: appNameText
                text: appName
                visible: false
            }

            // Application Icon Image
            //    Size must be Less then the Width of this Grid Element (parent.width)
            Image {
                id: myIcon
                width: 100; height: 100;
                // Put this Under the Application Title Text and Centered
                anchors { top: myAppText.bottom; horizontalCenter: parent.horizontalCenter; margins: 10 }
                // Make Sure it Fits But that We
                fillMode: Image.PreserveAspectFit
                // Location of the Image
                source: iconImg
            }
            // Application Description "Blurb"
            //     Summary of this Application. There will be a Text Size
            //         Limit depending on the Font
            Text{
                id: myBlurb
                // Set the Blurb's Font
                font.family: blurbFont.name;
                font.pixelSize: 15;
                // Put this Under the Icon, and Centered
                anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter; margins: 15 }
                // Set the Width to this Element's Width
                width: parent.width - anchors.margins.valueOf();
                // Justify the Text
                horizontalAlignment: Text.AlignJustify
                // Word Wrap it Up
                wrapMode: Text.WordWrap
                // Knock off the End of the Text if it cannot fit
                elide: Text.ElideRight
                // Only Show a Little Bit of the Description Until the User
                //     Clicks on the this Application's Element and Expands
                //     the Element so the User can see More of it
                maximumLineCount: 2
                // Set the Blurb's Text
                text: blurb
            }

            // Make this Element, and all Element's Respond to a Mouse Click
            MouseArea {
                // Fill this Entire Element with a Clickable Surface
                anchors.fill: parent
                // Change the Current Index Selected, so we can
                //     Expand the Description
                onClicked: quickAppGrid.currentIndex = index
                // On Double Click, Launch the Application that the User
                //     Wants to Run
                onDoubleClicked: {
                    console.debug("Application To Run = " + appName);
                    processExecute.RunSimpleProcess(appName);
                }
            }
            // States of this Item:
            //     Keeps Track if this Item has Been Selected By
            //     the User or Not
            states: [
                // Happens when the User Clicks off of this Item
                State {
                    name: "none"
                    when: (workAppGrid.currentIndex == -1)
                    // Change the Maximum Number of Lines
                    PropertyChanges {
                        target: myBlurb
                        maximumLineCount: 2
                    }
                    // Change it So that we Don't Draw on top of Everything Anymore
                    PropertyChanges {
                        target: rect;
                        height: 200
                        z: 1
                    }
                },
                // Selected State:
                //     Happens when the User Clicks on this Item
                State {
                    name: "selected"
                    when: rect.GridView.isCurrentItem
                    // Draw on Top of Everything and Make this Item Taller
                    PropertyChanges {
                        target: rect;
                        // Make this Item Grow Vertically
                        height: 300
                        // Draw this Item on TOP of Everything Else
                        z: 2
                    }
                    // Change the Maximum Number of Lines for the Program Blurb
                    //     So we can Show More Information about the Program,
                    //     and so we can Re-Elide(Is that correct?) the Text
                    PropertyChanges {
                        target: myBlurb
                        maximumLineCount: 8
                    }
                    // Debug: For if you Want to Know when an App is Expanded
                    //PropertyChanges {
                    //    target: app;
                    //    appToRun: appName;
                    //}
                }
            ]
            // Transitions to Re-Draw the Items That has it's Properties Changing
            transitions: Transition {
                // Animate the Height Growing and Shrinking
                PropertyAnimation {
                    target: rect
                    properties: "height"
                }
                // Animate the Text Expanding and Contracting
                PropertyAnimation {
                    target: myBlurb
                    properties: "maximumLineCount"
                }
            }
        }
    }

    GridView {
        id: workAppGrid
        anchors.fill:  parent;
        // Figure out a way to get the width and height of the item without hardcoding it
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


/*import QtQuick 1.1

Item {
    id: workAppContainer
    // Debug: Currently Expanded(Selected but Not Launched) Application
    property string appToRun:  "NoApp"
    // Debug String for What Application the User Has Selected to Expand,
    //     and View More Information About.  Useful for Usage Statistics
    //onAppToRunChanged: console.debug("Program Selected: appToRun = " + appToRun);
    // Handle Clicks on the Area that is Not Part of the Item
    //     Currently Selected
    MouseArea {
        anchors.fill: parent
        onClicked: workAppGrid.currentIndex = -1
    }
    // Font for the Text Blurb for Each Application
    //     Number of Lines of Text Increases if the User Clicks on
    //     that individual Application.
    FontLoader{
        id: blurbFont
        name: "Courier"
    }
    // Font for the Title
    FontLoader{
        id: titleFont
        name: "Helvetica"
    }

    // Our Delegate to the Grid
    Component {
        id: workAppDelegate
        // This is Our Grid Item
        Rectangle {
            id: rect
            width: 150
            height: 200
            color: colorName

            border.color: borderColor
            border.width: borderWidth
            // We Use this to Force the One that the User has Selected to Draw
            //      On Top of the Other Ones in the Grid, So we can Expand
            //      the Description of the Program as Well
            // If you Change this Value, Change on State: "none", as well
            z: 1
            // Application Name (Top of our )
            Text {
                id: myAppText
                font.family:  "Courier"
                font.pixelSize: 13;
                anchors { top: parent.top; horizontalCenter: parent.horizontalCenter; margins: 10 }
                text: appTitle
            }
            Text{
                id: appNameText
                text: appName
                visible: false
            }

            // Application Icon Image
            //    Size must be Less then the Width of this Grid Element (parent.width)
            Image {
                id: myIcon
                width: 100; height: 100;
                // Put this Under the Application Title Text and Centered
                anchors { top: myAppText.bottom; horizontalCenter: parent.horizontalCenter; margins: 10 }
                // Make Sure it Fits But that We
                fillMode: Image.PreserveAspectFit
                // Location of the Image
                source: iconImg
            }
            // Application Description "Blurb"
            //     Summary of this Application. There will be a Text Size
            //         Limit depending on the Font
            Text{
                id: myBlurb
                // Set the Blurb's Font
                font.family: blurbFont.name;
                font.pixelSize: 15;
                // Put this Under the Icon, and Centered
                anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter; margins: 15 }
                // Set the Width to this Element's Width
                width: parent.width - anchors.margins.valueOf();
                // Justify the Text
                horizontalAlignment: Text.AlignJustify
                // Word Wrap it Up
                wrapMode: Text.WordWrap
                // Knock off the End of the Text if it cannot fit
                elide: Text.ElideRight
                // Only Show a Little Bit of the Description Until the User
                //     Clicks on the this Application's Element and Expands
                //     the Element so the User can see More of it
                maximumLineCount: 2
                // Set the Blurb's Text
                text: blurb
            }

            // Make this Element, and all Element's Respond to a Mouse Click
            MouseArea {
                // Fill this Entire Element with a Clickable Surface
                anchors.fill: parent
                // Change the Current Index Selected, so we can
                //     Expand the Description
                onClicked: workAppGrid.currentIndex = index
                // On Double Click, Launch the Application that the User
                //     Wants to Run
                onDoubleClicked: {
                    console.debug("Application To Run = " + appName);
                    processExecute.RunSimpleProcess(appName);
                }
            }
            // States of this Item:
            //     Keeps Track if this Item has Been Selected By
            //     the User or Not
            states: [
                // Happens when the User Clicks off of this Item
                State {
                    name: "none"
                    when: (workAppGrid.currentIndex == -1)
                    // Change the Maximum Number of Lines
                    PropertyChanges {
                        target: myBlurb
                        maximumLineCount: 2
                    }
                    // Change it So that we Don't Draw on top of Everything Anymore
                    PropertyChanges {
                        target: rect;
                        height: 200
                        z: 1
                    }
                },
                // Selected State:
                //     Happens when the User Clicks on this Item
                State {
                    name: "selected"
                    when: rect.GridView.isCurrentItem
                    // Draw on Top of Everything and Make this Item Taller
                    PropertyChanges {
                        target: rect;
                        // Make this Item Grow Vertically
                        height: 300
                        // Draw this Item on TOP of Everything Else
                        z: 2
                    }
                    // Change the Maximum Number of Lines for the Program Blurb
                    //     So we can Show More Information about the Program,
                    //     and so we can Re-Elide(Is that correct?) the Text
                    PropertyChanges {
                        target: myBlurb
                        maximumLineCount: 8
                    }
                    // Debug: For if you Want to Know when an App is Expanded
                    //PropertyChanges {
                    //    target: app;
                    //    appToRun: appName;
                    //}
                }
            ]
            // Transitions to Re-Draw the Items That has it's Properties Changing
            transitions: Transition {
                // Animate the Height Growing and Shrinking
                PropertyAnimation {
                    target: rect
                    properties: "height"
                }
                // Animate the Text Expanding and Contracting
                PropertyAnimation {
                    target: myBlurb
                    properties: "maximumLineCount"
                }
            }
        }
    }

    GridView {
        id: workAppGrid;
        anchors.fill: parent

        // Figure out how to find the cell width and height programatically
        cellWidth: 175; cellHeight: 225

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
*/
