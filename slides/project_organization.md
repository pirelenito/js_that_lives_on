# How is the project organized?

--
# By file type?
* models
* views
* controllers
* templates
* helpers
* presenters
* builders
...

--
# Deck:
* views/deck_view.js
* controllers/deck_controller.js
* helpers/deck_scheduller_js
* templates/deck_form.jst

--
# Off course Not!

--
# Why spread similar things across the project?

--
# Forces we to categorize stuff

--
# Terrible to track dependencies

--
# Deck stuff was everywhere

--
# Popularized by Rails

--
# It got to be a better way

--
# Why not put similar things togheter?

--
# Into "Packages"

--
# The deck package
* deck/deck_controller.js
* deck/_deck_view.js
* deck/_deck_view.jst
* deck/_deck_view.scss
* deck/img/_deck_icon.png
* deck/_deck_scheduller.js
* domain/deck.js

--
# Code, style and templates in the same place

--
# What about that underline?
* deck/_deck_view.js

--
# Private modules
* deck/_deck_view.js

--
# Better to track dependencies

--
# Great for new developers!
