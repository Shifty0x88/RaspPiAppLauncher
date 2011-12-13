import QtQuick 1.1

Rectangle {
    id: root
    width:  600; height: 600;
    color: "lightsteelblue"
    border.width: 5; border.color: "black"

    // Raspberry Pi Logo!!!!!!!! Love the Raspberry Pi!!!!
    Image {
        id: raspPiLogoImg
        width: 45; height: 45; x: 0; y: 5;
        // High Quality Raspberry Pi Only Thank You Very Much!!
        source: "image/90px-Raspberry_Pi_Logo.png"
        fillMode: Image.PreserveAspectFit
    }
    // Title of the Application
    Text {
        id: titleText
        font.family: "Courier"; font.pointSize: 16;
        x: 60; y: 20;
        text: "Raspberry Pi Application Launcher"
    }
    TabWidget {
        id: tabWidget

        height: parent.height - raspPiLogoImg.height - parent.border.width; width: parent.width
        anchors.bottom: parent.bottom;
       // width: implicitWidth; height: implicitHeight;

        Rectangle  {
                property string title: "Quick Start Apps"
                anchors.fill: parent
                color: "#e3e3e3"

                Item {

                    id: quickAppContainer
                    // Debug: Currently Expanded(Selected but Not Launched) Application
                    property string appToRun:  "NoApp"
                    // Debug String for What Application the User Has Selected to Expand,
                    //     and View More Information About.  Useful for Usage Statistics
                    //onAppToRunChanged: console.debug("Program Selected: appToRun = " + appToRun);
                    ListModel {
                        id: quickAppItemModel

                        ListElement {
                            colorName: "green"
                            appTitle: "RaspPi Quick Start"
                            appName: "firefox http://www.raspberrypi.org/"
                            blurb: "blah blah "
                            iconImg: "image/90px-Raspberry_Pi_Logo.png"
                            borderColor: "black"
                            borderWidth: 1
                        }
                        ListElement {
                            colorName: "lightsteelblue"
                            appTitle: "Chromium"
                            appName: "firefox"
                            blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                            iconImg: "image/qt-logo.png"
                            borderColor: "black"
                            borderWidth: 1
                        }

                    }
                    // Handle Clicks on the Area that is Not Part of the Item
                    //     Currently Selected
                    MouseArea {
                        anchors.fill: parent
                        onClicked: quickAppGrid.currentIndex = -1
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
                        id: rectDelegate

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
                                    when: (quickAppGrid.currentIndex == -1)
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
                        id: quickAppGrid
                        width: 600; height: 600
                        cellWidth: 175; cellHeight: 225
                        //x:  25; y:  25
                        model: quickAppItemModel
                        delegate: rectDelegate

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
                }
            }

            Rectangle  {
                property string title: "Programming"
                anchors.fill: parent
                color: "#e3e3e3"

                Item {

                    id: programmingContainer
                    // Debug: Currently Expanded(Selected but Not Launched) Application
                    property string appToRun:  "NoApp"
                    // Debug String for What Application the User Has Selected to Expand,
                    //     and View More Information About.  Useful for Usage Statistics
                    //onAppToRunChanged: console.debug("Program Selected: appToRun = " + appToRun);
                    ListModel {
                        id: programmingItemModel

                        ListElement {
                            colorName: "blue"
                            appTitle: "Eclipse"
                            appName: "eclipse"
                            blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                            iconImg: "image/90px-Raspberry_Pi_Logo.png"
                            borderColor: "black"
                            borderWidth: 1
                        }
                        ListElement {
                            colorName: "red"
                            appTitle: "Geany"
                            appName: "geany"
                            blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                            iconImg: "image/qt-logo.png"
                            borderColor: "black"
                            borderWidth: 1
                        }

                    }
                    // Handle Clicks on the Area that is Not Part of the Item
                    //     Currently Selected
                    MouseArea {
                        anchors.fill: parent
                        onClicked: programmingGrid.currentIndex = -1
                    }

                    // Font for the Text Blurb for Each Application
                    //     Number of Lines of Text Increases if the User Clicks on
                    //     that individual Application.


                    // Our Delegate to the Grid
                    Component {
                        id: programmingDelegate

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
                                onClicked: programmingGrid.currentIndex = index
                                // On Double Click, Launch the Application that the User
                                //     Wants to Run
                                onDoubleClicked: {
                                    console.debug("Application To Run = " + appName);
                                    procExec.RunSimpleProcess(appName);
                                }
                            }
                            // States of this Item:
                            //     Keeps Track if this Item has Been Selected By
                            //     the User or Not
                            states: [
                                // Happens when the User Clicks off of this Item
                                State {
                                    name: "none"
                                    when: (programmingGrid.currentIndex == -1)
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
                        id: programmingGrid
                        width: 600; height: 600
                        cellWidth: 175; cellHeight: 225
                        //x:  25; y:  25
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
                }

            }

            Rectangle  {
                property string title: "Work Apps"
                anchors.fill: parent; color: "#e3e3e3"

                Item {

                    id: workAppContainer
                    // Debug: Currently Expanded(Selected but Not Launched) Application
                    property string appToRun:  "NoApp"
                    // Debug String for What Application the User Has Selected to Expand,
                    //     and View More Information About.  Useful for Usage Statistics
                    //onAppToRunChanged: console.debug("Program Selected: appToRun = " + appToRun);
                    ListModel {
                        id: workAppItemModel

                        ListElement {
                            colorName: "blue"
                            appTitle: "RaspPi Quick Start"
                            appName: "firefox http://www.raspberrypi.org/"
                            blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                            iconImg: "image/90px-Raspberry_Pi_Logo.png"
                            borderColor: "black"
                            borderWidth: 1
                        }
                        ListElement {
                            colorName: "red"
                            appTitle: "Mozilla Firefox"
                            appName: "firefox"
                            blurb: "blah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blahblah blah blah"
                            iconImg: "image/qt-logo.png"
                            borderColor: "black"
                            borderWidth: 1
                        }

                    }
                    // Handle Clicks on the Area that is Not Part of the Item
                    //     Currently Selected
                    MouseArea {
                        anchors.fill: parent
                        onClicked: workAppGrid.currentIndex = -1
                    }

                    // Font for the Text Blurb for Each Application
                    //     Number of Lines of Text Increases if the User Clicks on
                    //     that individual Application.


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
                        id: workAppGrid
                        width: 600; height: 600
                        cellWidth: 175; cellHeight: 225
                        //x:  25; y:  25
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

            }



    }

//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            Qt.quit();
//        }
//    }
}
