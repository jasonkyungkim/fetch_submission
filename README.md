### Summary: Include screen shots or a video of your app highlighting its features

![Output sample](https://github.com/jasonkyungkim/fetch_submission/blob/main/fetch_project/fetch_project/demo.gif)

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

I prioritized a straightforward MVVM architecture using Observable, modern SwiftUI navigation and animation, and efficient network/data handling. I also implemented a basic hero animation using .matchedTransitionSource() and .navigationTransition(). I wanted to display my understanding of fundamental SwiftUI and use modern Swift, providing a basic level of implementation of things that were requested.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

Spent 2 hours on the first night to code everything up; spent another hour the following day to comment and check for errors.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

I simulated the API with a local JSON file to stay focused on architecture, performance, and user interaction. I used SwiftUI-only components and avoided UIKit integration to keep the project clean and modern. I did skip fallback support for older iOS versions (e.g., iOS 16) due to time constraints and to showcase the latest NavigationStack and matched transitions.

In general, I wanted to demonstrate my basic understanding of the fundamentals and basic implementation while abiding to modern practices, and focused less on the design of the app.

### Weakest Part of the Project: What do you think is the weakest part of your project?

The weakest part is probably the lack of persistent storage. I focused on a read-only experience, but for a real app, I would expand with CoreData or another lightweight store to allow saving favorites or user preferences. I would also comment this more thoroughly as the app got heavier.

I also focused less on the design of the layout, cards, and buttons because those are usually decided upon desginers and PMs in a real-life setting.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

My motivation to include the hero animation was also to take advatnage of both the small amd large versions of the same photos.
