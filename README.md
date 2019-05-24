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

