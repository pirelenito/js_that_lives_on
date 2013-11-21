# Project organization

--
# The familiar
* models
* views
* controllers
* helpers

--
# Example of a Deck
* views/deck_view.js
* controllers/deck_controller.js
* helpers/deck_scheduller_js

--
# Spread similar things accross the project

--
# Everything is a helper!

--
# Terrible to track dependencies

--
# Why de we categorize modules by pattern?

--
# Popularized by Rails

--
# A better way!

--
# Put similar things toghether

--
# The deck package
* deck/deck_controller.js
* deck/deck_view.js
* deck/deck_scheduller.js
* domain/deck.js

--
# Better to track dependencies

--
# What about the domain?
* depend on each other
* used througout the app

--
# Private modules!
## deck/_deck_scheduller.js

--
# Only used by the package
