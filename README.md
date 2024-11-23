

## About:

CrazyCrypto is a simple project designed to demonstrate the practical implementation of the MVVM (Model-View-ViewModel)
architecture. The application fetches cryptocurrency data from a static JSON URL:

[https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/refs/heads/master/crypto.json](https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/refs/heads/master/crypto.json) which contains data fields structured as follows:
```json
{
  "currency": "String",
  "price": "String"
}
```

The data is presented in a straightforward manner using a table view, making this project an accessible and
beginner-friendly example of working with MVVM and JSON data in iOS development.



## Structure: 

[[MVVM swift.png|MVVM swift]]



## Future Goals:

1.	Improved UI Design:
	Add custom table view cells to make the currency and price display more visually appealing.

2.	Search Functionality:
	Implement a search bar to let users quickly find specific cryptocurrencies.

3.	Detailed View:
	Create a detailed screen that shows more information about a selected cryptocurrency.

4.	Dynamic Data Updates:
	Add a pull-to-refresh feature to update the data from the JSON URL dynamically.

5.	Favorites Feature:
	Allow users to mark their favorite cryptocurrencies for quick access.
