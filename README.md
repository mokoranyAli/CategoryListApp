# CategoryListApp
## Contents

* [Overview]
* [Networking]
* [Architecture]
* [UI]
* [Testing]


## Overview

App to show category list and every item in list has name, image and icon, then you can go to category details screen to see list of items inside this category, name of item, price of item, image of item and button to add item.


Note: This task is implemented in less than 24 hours

## Networking

Netwroking is implemented in APIService file using just URLSession with async await approach.


## Architecture

Task is implemented using MVVM with clean architecture. Each entity has ViewModel, Usecase, repository and service.
The binding implemented using asnyc await approach and using combine publishers between view and viewModel

***All layers have unit tests***

## UI

Task is implementd using SwiftUI

***All Views have UI tests***

## Testing 

The project has Unit testing and UITesting with total coverage 95%.
<img width="981" alt="Screenshot 2023-12-02 at 8 07 40 PM" src="https://github.com/mokoranyAli/CategoryListApp/assets/45698820/6b00fe63-306c-4ae6-aca9-0705063453bf">



<!--- In file -->
[Overview]: #overview
[Networking]: #networking
[Architecture]: #architecture
[UI]: #ui
[Testing]: #testing
