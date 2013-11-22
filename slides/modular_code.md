# Breaking the app into smaller files

--
# Module

    var KnowledgeQuestionView = Marionette.ItemView.extend({
      className: 'knowledge-question',
      template: template,

      events: {
        'click .yes-button': clickYes,
        'click .no-button': clickNo
      }
    });

    function clickYes () {
      this.trigger('answer:yes');
    }

    function clickNo () {
      this.trigger('answer:no');
    }

--
## Poluting the global namespace
clickYes, clickNo

--
# How do we fix this?

--
# Scopes!

--
# Functions!

--
# The module pattern

--
# IIFE
## Imediately invoked function expressions

--
## IIFE
    (function (template, Marionette) {
      var KnowledgeQuestionView = Marionette.ItemView.extend({
        className: 'knowledge-question',
        template: template,

        events: {
          'click .yes-button': clickYes,
          'click .no-button': clickNo
        }
      });

      function clickYes () {
        this.trigger('answer:yes');
      }

      function clickNo () {
        this.trigger('answer:no');
      }

      this.KnowledgeQuestionView = KnowledgeQuestionView;
    })(templates['knowledge_question'], Marionette);

--
## Creates a new function
    var iife = function (template, Marionette) {
      // code...
    }

## And executes it immediately

    iife(templates['knowledge_question'], Marionette);

--
## Now we can define variables worry free!

--
# Life goes on
## application starts to grow

--
## Bigger Applications

    ./src/flashcards/card_definition_popup_view.css.scss
    ./src/flashcards/card_definition_popup_view.js
    ./src/flashcards/card_definition_popup_view.jst
    ./src/flashcards/completion_message.js
    ./src/flashcards/confidence_question_view.css.scss
    ./src/flashcards/confidence_question_view.js
    ./src/flashcards/confidence_question_view.jst
    ./src/flashcards/flipping_region.css
    ./src/flashcards/flipping_region.js
    ./src/flashcards/img/icon-check.png
    ./src/flashcards/img/icon-close.png
    ./src/flashcards/img/icon-trophy-small.png
    ...

# Dependency hell!

--
# RequireJS
[http://requirejs.org/](http://requirejs.org/)

--
# AMD
Assynchronous Module Definition

--
## Declare a module

    define([
      'tpl!flashcards/knowledge_question_view.jst',
      'marionette'
    ],
    function (template, Marionette) {
      var KnowledgeQuestionView = Marionette.ItemView.extend({
      });

      function clickYes () {
        this.trigger('answer:yes');
      }

      function clickNo () {
        this.trigger('answer:no');
      }

      return KnowledgeQuestionView;
    });

--
# Nothing is global

--
# It looks like a IIFE!

--
# Why we no CommonsJS?

--
## CommonsJS

    var Marionette = require('marionette');
    var template = require('tpl!flashcards/knowledge_question_view.jst');

    function KnowledgeQuestionView () {
      // body...
    }

    exports.KnowledgeQuestionView = KnowledgeQuestionView;

--
# Yay, No callbacks!

--
# Browser is async

--
# CommonsJS needs compilation

--
# But RequireJS is hard!

--
## Bitch please!
![Bitch please](slides/img/bitch_please.jpg)

--
# RequireJS
Singe JavaScript library

--
## Works with file://

--
index.html:

    <script data-main='src/boot' src='src/require.js'/>


src/boot.js:

    require([
      'alerter'
    ],
    function (alerter) {
      alerter('booo');
    });

src/alerter.js:

    define(function () {
      function alert (text) {
        alert(text);
      }

      return alerter;
    });

--
# Pack and minify
[Optimizer tool](http://requirejs.org/docs/optimization.html)

--
# Non AMD dependencies
[Setup Config Shim](http://requirejs.org/docs/api.html#config-shim)

--
# grunt.js plugin
[grunt-requirejs](https://github.com/asciidisco/grunt-requirejs)

--
# What about testing ?

--
### knowledge_question_view_spec.js
    define([
      'spec/spec_helper',
      'sinon',
      'flashcards/knowledge_question_view'
    ],
    function (jasmine, sinon, KnowledgeQuestionView) {
      describe("KnowledgeQuestionView", function() {

      });
    });


--
### spec_helper.js

    define([
      'jasmine',
      'jasmine-jquery',
      'jasmine-sinon'
    ],
    function (jasmine) {
      beforeEach(function() {
        this.addMatchers({
        });
      });

      return jasmine;
    });

--
### spec_runner.js

    require([
      'jquery',
      'jasmine',
      'jasmine-html',

      'spec/knowledge_question_view_spec'
    ],
    function($, jasmine) {
      var jasmineEnv = jasmine.getEnv();

      ...

      $(function () { jasmine.getEnv().execute(); });
    });

--
# See?
[jasmine-standalone-requirejs](https://github.com/pirelenito/jasmine-standalone-requirejs)
