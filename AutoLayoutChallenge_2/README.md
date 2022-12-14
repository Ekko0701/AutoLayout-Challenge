## Preview
<img src = "https://user-images.githubusercontent.com/108163842/195870182-322e307b-e737-43b1-8e42-7895060566c6.gif" width ="32%">

## Feature

* UISheetPresentationController를 사용해서 버튼을 터치하면 올라오는 Sheet 구현
* Custom Detent를 사용해 높이를 조절 (iOS 16 + )

    ```swift

    let notiSheet = NotificationSheetViewController()

    if let sheet = notiSheet.sheetPresentationController {
        sheet.delegate = self
        sheet.detents = [.notifi]         // Detent 설정
        sheet.prefersGrabberVisible = false // Grabber 숨김
    }
    present(notiSheet, animated: true)

    }

    ```
    
    ```swift

    extension UISheetPresentationController.Detent.Identifier {
    static let notification = UISheetPresentationController.Detent.Identifier("notification")
    }

    extension UISheetPresentationController.Detent {
        static let notifi = UISheetPresentationController.Detent.custom(identifier: .notification) { context in
            return 0.4 * context.maximumDetentValue
        }
    }

    ```
