import QtQuick 2.7
import QtQuick.Controls 2.0
import Felgo 3.0

ApplicationWindow {
    GameWindowItem {
    // licenseKey: "<your-license-key>"
    }

    title: qsTr("Felgo App")
    width: 640
    height: 480
    visible: true

    Storage {
      id: storage
      property int counter: storage.getValue("counter") || 0
      function increaseCounter() {
        counter++
        storage.setValue("counter", counter)
      }
    }

    Button {
      text: "Count: "+storage.counter
      onClicked: storage.increaseCounter()
      anchors.centerIn: parent
    }

    AdMobBanner {
      adUnitId: "ca-app-pub-3940256099942544/6300978111"
      banner: AdMobBanner.Smart
      anchors.top: parent.top
    }

    AdMobInterstitial {
      id: interstitial
      adUnitId: "ca-app-pub-3940256099942544/1033173712"
      onInterstitialReceived: interstitial.showInterstitialIfLoaded()
    }

    Button {
      text: "Show Interstitial"
      onClicked: interstitial.loadInterstitial()
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: parent.bottom
    }
}
