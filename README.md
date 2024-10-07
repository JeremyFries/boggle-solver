# boggle-solver
This automation allows the user to automatically solve online Boggle games hosted by [Wordshake]([url](https://wordshake.com/boggle)).

To use, the program requires download of [MySQL API for AutoHotKey]([url](https://www.autohotkey.com/boards/viewtopic.php?style=7&t=429)), which can be installed to the same directory as the AutoHotKey script. This was not included in the repository as I am not the owner. Also, the [Scraper]([url](https://chromewebstore.google.com/detail/scraper/mbigbapnjcgaffohmbkdlecaccepngjd)) Chrome extension is required as this is what is used to quickly read the Boggle board. Since the location of the Scraper tool in your toolbar upon right-clicking may vary depending on ownership of other Chrome extensions, it may be necessary to modify the AutoHotKey code specifying mouse position.

MySQL is also required in order to extract the SQL dictionary database. (Using SQL greatly optimizes search time in determining the validity of words when compared to checking text or .csv files). To do this, simply open MySQL and download the dictionary. Then modify the AutoHotKey files with the name and login information to your SQL account.

In order to run this code, navigate to the [Wordshake Boggle website]([url](https://wordshake.com/boggle)) and scroll to the top of the page as to align the mouse position. Then, run the AutoHotKey script. It should automatically read the Boggle board using the Scraper web tool and begin typing words.
