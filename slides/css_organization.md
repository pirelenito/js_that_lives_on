# What about CSS?

--
# SCSS

--
# Compass CSS3 mixins

--
# Divided into two categories
* Component style
* Layout style

--
# Component style
* defines a component appearence
* not its position or margin
* preferable not size
* relative font sizes

--
### knowledge_question_view.css.scss

    .knowledge-question {
      padding: 1em;

      button {

      }
      // ...
    }

--
# Layout style
* defines how a component is positioned
* defined by the user

--
### player_session_view.css.scss

    .playes-session {
      .knowledge-question {
        position: absolute;
        bottom: 15px;
        right: 0px;
        left: 0px;
      }
    }

--
## Use same component...
## In different contexts.
