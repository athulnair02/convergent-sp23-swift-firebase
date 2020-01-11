# ios-firebase
'Notes' app that uses the Firebase real time database to post and retrieve persistent data storage

---

## Basic application composition (ide, dependencies and configuration etc)

- Xcode 10.1 (10B61)
- Firebase Realtime Database | [Firebase Official Site](https://firebase.google.com)
- Cocoa Pods (Package Manager) | [Cocoa Pods Official Site](https://cocoapods.org)

## Steps to create and setup project
1. Log into Firebase and create a new project. 
   - Once your project has been created click the 'iOS' option (to add firebase to your iOS application).
   ![select platform to add firebase](https://user-images.githubusercontent.com/33831343/72203593-55205d80-34b9-11ea-8d81-1dcb2493cd46.png)

   - (Step 1) - Register app by adding an iOS Bundle ID *for example* - *au.com.domain.myApp*
   ![creating firebase bundle](https://user-images.githubusercontent.com/33831343/72203565-e7743180-34b8-11ea-8a85-c96cc58eb542.png)
   
   - (Step 2) - Download the config file (.plist)
   
2. Create a new Xcode project and select 'Swift' as your language.
3. Drag the **GoogleService-Info.plist** into your project and copy the file when prompted. 
    - ![google plist file](https://user-images.githubusercontent.com/33831343/72203615-a4668e00-34b9-11ea-98d9-5422232e3aaf.png)




