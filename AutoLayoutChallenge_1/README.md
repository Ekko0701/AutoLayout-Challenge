## Preview
<img src= "https://user-images.githubusercontent.com/108163842/193484428-78bd3fb2-3502-43f0-8787-3420c4aff26a.png" width="200">
<img src= "https://user-images.githubusercontent.com/108163842/193490513-af290636-8073-4fd3-8adf-3f765d7a01a2.gif" width="200">

## Feature

* UITextField를 선택하면 올라오는 Keyboard가 밑의 다른 컴포넌트를 가리지 않도록 `UIScrollView`를 사용했다.
* `UIScrollView`의 Inset이 `FirstResponder`에 따라 조절되도록 만들었다.


    ```swift

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset.bottom = keyboardFrame.size.height
        
        let firstResponder = view.currentFirstResponder()
        
        if let textView = firstResponder as? UITextView {
            scrollView.scrollRectToVisible(textView.frame, animated: true)
        }
    }

    ```
    
    ```swift
    extension UIView {
        /// FirstResponder를 반환
        /// - Returns: FirstResponder
        func currentFirstResponder() -> UIResponder? {
            if self.isFirstResponder {
                return self
            }
            
            for view in self.subviews {
                if let responder = view.currentFirstResponder() {
                    return responder
                }
            }
            return nil
        }
    }

    ```

* UI관련 함수들은 재사용이 용이하도록 Extension으로 구현하였다.
