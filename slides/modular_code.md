# The module pattern

--
# IIFE
## Imediately invoked function expressions

--
## IIFE
    (function ($, Investment, Stock) {

      function NewInvestmentView () {
        // body...
      }

      this.NewInvestmentView = NewInvestmentView;

    })(jQuery, Investment, Stock);

--
## Creating a new function
    var iife = function ($, Investment, Stock) {

      function NewInvestmentView () {
        // body...
      }

      this.NewInvestmentView = NewInvestmentView;

    }

## And executing it immediately

    iife(jQuery, Investment, Stock);

--
## Why IIFE
* Everything is local to the Module;
* Less chance to polute the global namespace.
# Life goes on
## application starts to grow

--
## Bigger Applications

    ./src/Application.js
    ./src/Boot.js
    ./src/models/Investment.js
    ./src/models/Stock.js
    ./src/models/StockCollection.js
    ./src/plugins/jquery-disable-input.js
    ./src/routers/InvestmentsRouter.js
    ./src/views/ApplicationView.js
    ./src/views/InvestmentListView.js
    ./src/views/InvestmentView.js
    ./src/views/NewInvestmentView.js
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
      'jQuery',
      'Investment',
      'Stock'
    ],
    function ($, Investment, Stock) {

      function NewInvestmentView () {
        // body...
      }

      return NewInvestmentView;
    });

--
# Nothing is global

--
# It looks like a IIFE!

--
## Why you
# no CommonsJS?

--
## CommonsJS

    var $ = require('jQuery');
    var Investment = require('Investment');
    var Stock = require('Stock');

    function NewInvestmentView () {
      // body...
    }

    exports.NewInvestmentView = NewInvestmentView;

--
# Yay, No callbacks!

--
# Browser is async

--
## CommonsJS
# needs compilation

--
# But RequireJS is hard!

--
## Bitch please!
![Bitch please](src/img/bitch_please.jpg)

--
# RequireJS
Singe JavaScript library

Works with file://

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
--
# Pack and minify
[Optimizer tool](http://requirejs.org/docs/optimization.html)

--
# Non AMD depencecies
[Setup Config Shim](http://requirejs.org/docs/api.html#config-shim)

--
# What about testing ?

--
## InvestmentSpec.js
    define([
      'spec/SpecHelper',
      'Investment',
      'Stock'
    ],
    function (jasmine, Investment, Stock) {
      describe("Investment", function() {
        ...
      });
    });

--
## SpecHelper.js

    define([
      'jasmine',
      'jasmine-jquery'
    ],
    function (jasmine) {
      jasmine.getFixtures().fixturesPath = 'spec/fixtures';

      beforeEach(function() {
        this.addMatchers({
          toBeAGoodInvestment: function() {
            return investment.isGood();
          }
        });
      });

      return jasmine;
    });

--
## Boot.js

    require([
      'jquery',
      'jasmine',
      'jasmine-html',

      'spec/InvestmentSpec'
    ],
    function($, jasmine) {
      var jasmineEnv = jasmine.getEnv();

      ...

      $(function () { jasmine.getEnv().execute(); });
    });

--
# See?
[jasmine-standalone-requirejs](https://github.com/pirelenito/jasmine-standalone-requirejs)
