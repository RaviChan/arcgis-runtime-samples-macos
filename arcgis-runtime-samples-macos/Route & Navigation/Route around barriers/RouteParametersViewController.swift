//
// Copyright 2016 Esri.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Cocoa
import ArcGIS

class RouteParametersViewController: NSViewController {
    
    @IBOutlet var findBestSequenceButton:NSButton!
    @IBOutlet var preservceFirstStopButton:NSButton!
    @IBOutlet var preservceLastStopButton:NSButton!
    
    var routeParameters:AGSRouteParameters!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //preferred size for popup
        self.preferredContentSize = CGSize(width: 210, height: 100)
        
        self.setupUI()
    }
    
    func setupUI() {
        if self.routeParameters != nil {
            self.findBestSequenceButton.state = self.routeParameters.findBestSequence ? NSOnState : NSOffState
            self.preservceFirstStopButton.state = self.routeParameters.preserveFirstStop ? NSOnState : NSOffState
            self.preservceLastStopButton.state = self.routeParameters.preserveLastStop ? NSOnState : NSOffState
            self.enableSubSwitches(self.routeParameters.findBestSequence)
        }
    }
    
    func enableSubSwitches(enable:Bool) {
        self.preservceLastStopButton.enabled = enable
        self.preservceFirstStopButton.enabled = enable
    }
    
    //MARK: - Actions
    
    @IBAction func switchValueChanged(_ sender:NSButton) {
        if sender == self.findBestSequenceButton {
            self.routeParameters.findBestSequence = (sender.state == NSOnState)
            self.enableSubSwitches(sender.state == NSOnState)
        }
        else if sender == self.preservceFirstStopButton {
            self.routeParameters.preserveFirstStop = (self.preservceFirstStopButton.state == NSOnState)
        }
        else {
            self.routeParameters.preserveLastStop = (self.preservceLastStopButton.state == NSOnState)
        }
    }
}

