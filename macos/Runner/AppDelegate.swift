//
//  StatusBarController.swift
//  Runner
//
//  Created by sky on 17/05/23.
//

import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  // Instance of the status bar controller
  var statusBarController: StatusBarController?
  
  // Instance of the popover that will display the Flutter UI
  var flutterUIPopover = NSPopover.init()

  // Initializer for the AppDelegate class
  override init() {
    // Set the popover behavior to transient, meaning it will close when the user clicks outside of it
    flutterUIPopover.behavior = NSPopover.Behavior.transient
  }

  // Function to determine whether the application should terminate when the last window is closed
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    // Return false to keep the application running even if all windows are closed
    return false
  }

  // Function called when the application has finished launching
  override func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Get the FlutterViewController from the main Flutter window
    let flutterViewController: FlutterViewController =
      mainFlutterWindow?.contentViewController as! FlutterViewController
      
    // Set the size of the popover
    flutterUIPopover.contentSize = NSSize(width: 360, height: 360) // Change this to your desired size
    
    // Set the content view controller for the popover to the FlutterViewController
    flutterUIPopover.contentViewController = flutterViewController
    
    // Initialize the status bar controller with the popover
    statusBarController = StatusBarController.init(flutterUIPopover)
    
    // Close the default Flutter window as the Flutter UI will be displayed in the popover
    mainFlutterWindow.close()
    
    // Call the superclass's applicationDidFinishLaunching function to perform any additional setup
    super.applicationDidFinishLaunching(aNotification)
  }
}
