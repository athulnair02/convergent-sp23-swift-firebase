# ios-firebase
'Notes' app that uses the Firebase real time database to post and retrieve persistent data storage

---

# Application Demonstration
![first-note](https://user-images.githubusercontent.com/33831343/72204722-c286bb00-34c6-11ea-9665-8618f3b3b40b.gif)
![second-note](https://user-images.githubusercontent.com/33831343/72204741-f8c43a80-34c6-11ea-859d-6b647be1745e.gif)

---

## Basic application composition (ide, dependencies and configuration etc)

- Xcode 10.1 (10B61)
- Deployment Target: 9.3
- Firebase Realtime Database | [Firebase Official Site](https://firebase.google.com)
- Cocoa Pods (Package Manager) | [Cocoa Pods Official Site](https://cocoapods.org)

## Steps to create and setup project
1. Log into Firebase and create a new project. 
   - Once your project has been created click the 'iOS' option (to add firebase to your iOS application).
   ![select platform to add firebase](https://user-images.githubusercontent.com/33831343/72203593-55205d80-34b9-11ea-8d81-1dcb2493cd46.png)

   - (Step 1) - Register app by adding an iOS Bundle ID *for example* - *au.com.domain.myApp*
   ![creating firebase bundle](https://user-images.githubusercontent.com/33831343/72203565-e7743180-34b8-11ea-8a85-c96cc58eb542.png)
   
   - (Step 2) - Download the config file (.plist)
   
2. Create a new Xcode project and select 'Swift' as your language. **MAKE SURE THE XCODE BUNDLE ID MATCHES THE FIREBASE BUNDLE ID**  

3. Drag the **GoogleService-Info.plist** into your project
    - copy the file when prompted. 
    ![google plist file](https://user-images.githubusercontent.com/33831343/72203615-a4668e00-34b9-11ea-98d9-5422232e3aaf.png)
    
4. Navigate to your Xcode project folder in the terminal and install cocoapods.
> sudo gem install cocoapods  
 - This will install the pods package manager and create a *Podfile* file in your Xcode project.
 
 - Initialise the pod manager
 >pod init  
 
 - Once the initialisation has completed, open the *Podfile* and add the Firebase dependencies.
 > pod 'Firebase'  
 > pod 'Firebase/Core'  
 > pod 'Firebase/Database'  
 
 - These dependencies can be found at the office firebase real-time database [docs](https://firebase.google.com/docs/database/ios/start?authuser=0)
 - install the dependencies (inside your Xcode project) from the terminal.
 > pod install 

5. Close your Xcode IDE and open the suggested project file *i.e* - **yourProjectName.xcworkspace**
  - overview of your project
  ![open xcode project](https://user-images.githubusercontent.com/33831343/72203813-91a18880-34bc-11ea-9bd8-8ba7860da9e1.png)
  
  ## XCode (Code Structure, Storyboard Configs)
  1. Import Firebase module into your app.
   - Open the AppDelegate.swift file and import the Firebase module.
             import Firebase
   - Initialise the Firebase object|instance in the AppDelegate application method
       
           func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
             FirebaseApp.configure()
             
             return true
           }

2. Add a Navigation controller and a second View controller UI components in the Main.storyboard file.
3. Create a prototype cell in your Table View 
   - Give your table cell view a reference id (this will be invoked in the tableView method in the ViewController class file)
   ![prototype cell](https://user-images.githubusercontent.com/33831343/72204031-52286b80-34bf-11ea-91d0-fff469b65338.png)
   
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
                cell?.textLabel?.text = postData[indexPath.row]
   
                return cell!
         }
         
4. Key files that reference the Firebase Database object.
- ViewController.swift
- ComposerViewController.swift

## Firebase Database (Public Authentication)

Create a Relatime Database and copy the database URL seen into a new key-value pair in GoogleService-info.plist with the key as DATABASE_URL.

By default the Firebase database required authentication.   
- Navigate to Database > Rules and change the read and write values to true
![realtime db config](https://user-images.githubusercontent.com/33831343/72204219-3de56e00-34c1-11ea-98bb-62592cdf0199.png)


---

Happy Coding! This app is a simple app. In future I will add some CRUD enhancements, push notification when a new note is created, launch screen and other bells and whistles.


