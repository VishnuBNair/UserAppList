# SwiftUI MVVM Combine User List App

This is a SwiftUI project that demonstrates the MVVM (Model-View-ViewModel) architecture using the Combine framework. The app fetches a list of users from an API and displays them in a list. You can click on each user to view their details.

## Project Structure

- **Models:** Contains Swift files defining data models, such as `UsersView`.

- **Views:** Contains SwiftUI view files, such as `UserListView` and `UserDetailView`.

- **ViewModels:** Contains Swift files defining view models, such as `UserViewModels``.

- **network:** Contains Swift files for any external services or APIs, such as `URLSessionAPIClient`

## How to Run the App

1. Clone the repository to your local machine.

```bash
git clone https://github.com/your-username/your-repo.git

cd MyApp
open MyApp.xcodeproj


Creating a README file for your SwiftUI project using MVVM and Combine can help provide documentation and instructions for developers working on the project. Below is a simple template for a README file for a SwiftUI project with MVVM architecture and Combine framework, where the app shows a list of users and allows clicking on each user to display their details.

markdown
Copy code
# SwiftUI MVVM Combine User List App

This is a SwiftUI project that demonstrates the MVVM (Model-View-ViewModel) architecture using the Combine framework. The app fetches a list of users from an API and displays them in a list. You can click on each user to view their details.

## Project Structure

The project follows the MVVM architecture and is organized as follows:

UserList
├── UserList
│ ├── Models
│ │ ├── UserResponseModel.swift
│ ├── Views
│ │ ├── SplashView.swift
│ │ ├── UserView.swift
│ │ ├── UserDetailView.swift
│ │ └── UsersView.swift
│ ├── ViewModels
│ │ ├── UserViewModels.swift
│ ├── Network
│ │ ├── URLSessionAPIClient.swift
│ │ ├── URLRequestBuilder.swift
│ │ └── Endpoint.swift
│ ├── Enum
│ │ ├── Constants.swift
│ │ └── AppError.swift
│ ├── Extension
│ │ ├── DataExtension.swift
│ │ └── BottomLoaderView.swift
├── Resources
│ ├── Assets.xcassets
│ └── ...
├── Tests
│ ├── UserListTests
│ └── ...
└── UserList.swift

markdown
Copy code

- **Models:** Contains Swift files defining data models, such as `UsersView`.

- **Views:** Contains SwiftUI view files, such as `UserListView` and `UserDetailView`.

- **ViewModels:** Contains Swift files defining view models, such as `UserViewModels``.

- **network:** Contains Swift files for any external services or APIs, such as `URLSessionAPIClient`.

## How to Run the App

1. Clone the repository to your local machine.

```bash
git clone [https://github.com/your-username/your-repo.git](https://github.com/VishnuBNair/UserApp.git)
Open the project in Xcode.
bash
Copy code
cd MyApp
open MyApp.xcodeproj
Build and run the project in the Xcode simulator or on a physical device.
Usage
Upon launching the app, you will see a list of users.

Click on a user to view their details.

Dependencies
Swift 5.5
SwiftUI
Combine
Acknowledgments
The project structure and architecture are inspired by best practices in SwiftUI development and the MVVM design pattern.

License
This project is licensed under the MIT License - see the LICENSE file for details.
