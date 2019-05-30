# [Start Developing iOS Apps](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/)

- A meal-tracking app *FoodTracker*
  - Add/remove/edit a meal



## Build a Basic UI

- Views: display content to the user
  
  - blocks to construct your user interface & present your content in a clear, elegant, and useful way
  - are of type `UIView` / subclass
  
- Constraint:

  - Spacing to the nearest leading, trailing, & top neighbors
  - Boundary of the closest user interface element, *superview*, another user interface element, or a margin

- Scene:

  - One screen of content

  - View controller

    - Implement your app's behavior
    - A single content view with its hierarchy of subview
    - Coordinate the flow of information between the app's data model & views that display the data
    - `UIViewController`



## Connect the UI to Code

- Outlets: refer to your interface elements in code
- Event-driven programming: the flow of the app is determined by events (system events & user actions)
- Action: code linked to an event that can occur in your app
- Target-action pattern: a design pattern where one object sends a message to another object when a specific event occurs

- Delegate: an object that acts on behalf of / in coordination with another object
  - keeps a reference to the other object
  - send a message to the delegate
- First responder: an object that is first on the line for receiving many kinds of app events
- Model-View-Controller: view controllers serve as the communication pipeline between your views and your data model
  - Model: keep track of the app's data
  - View: display the user interface & make up the content of an app
  - Controller: manage the views
  - Model — | Controller| — View



## Work with View Controllers

- Property list: a structured text file that contains essential configuration information about the app



## Implement a Custom Control

- Initializing a view:
  - Programmatically initialize the view: `init(frame:)`
    - A class automatically inherit all of their super class's designated initializer
    - ! inherit any superclass initializer if you implement any initializer
    - Must implement all `required` initializer & mark the initializers as `required` 
  - Load the view from storyboard: `init?(coder:)`

