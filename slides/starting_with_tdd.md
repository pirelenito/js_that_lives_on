# How did we start?

--
# Thinking in TDD

--
# Or better saying, BDD

--
# User Stories

--
# Deck
> **Given** a deck, it **should** have a collection of cards

--
## Create new Spec

    <script type="text/javascript" src="spec/deck.spec.js"></script>

--
## Translate acceptance criteria
> **Given** a deck, it **should** have a collection of cards

    describe("Deck", function() {
      it("should have a collection of cards", function() {

      });
    });

<p class="fragment pass-spec">Pass!</p>

--
# Why?

--
## It needs an assertion!

--
## Write it down
> **Given** a deck, it **should** have a collection of cards

    describe("Deck", function() {
      it("should have a collection of cards", function() {
        expect(deck.cards).toBe(cards);
      });
    });

<p class="fragment fail-spec">ReferenceError: deck is not defined.</p>

--
## Declare variable
> **Given** a deck, it **should** have a collection of cards

    describe("Deck", function() {
      it("should have a collection of cards", function() {
        var deck = new Deck();
        expect(deck.cards).toBe(cards);
      });
    });

<p class="fragment fail-spec">ReferenceError: Deck is not defined.</p>

--
## New source file

    <script type="text/javascript" src="src/deck.js"></script>

--
## Code the Deck

    function Deck () {

    }

## The same spec

    describe("Deck", function() {
      it("should have a collection of cards", function() {
        var deck = new Deck();
        expect(deck.cards).toBe(cards);
      });
    });

<p class="fragment fail-spec">ReferenceError: stock is not defined.</p>

--
## Add the cards variable
> **Given** a deck, it **should** have a collection of cards

    describe("Deck", function() {
      it("should have a collection of cards", function() {
        var cards = [new Card()],
            deck = new Deck();

        expect(deck.cards).toBe(cards);
      });
    });

<p class="fragment fail-spec">ReferenceError: Stock is not defined.</p>

--
## New source file

    <script type="text/javascript" src="src/card.js"></script>

--
## Code the Card

    function Card () {

    }

## The same spec

    describe("Deck", function() {
      it("should have a collection of cards", function() {
        var cards = [new Card()],
            deck = new Deck();

        expect(deck.cards).toBe(cards);
      });
    });

<p class="fragment fail-spec">Expected undefined to equal [ { } ].</p>

--
## Pass parameter on spec

    describe("Deck", function() {
      it("should have a collection of cards", function() {
        var cards = [new Card()],
            deck = new Deck(cards);

        expect(deck.cards).toBe(cards);
      });
    });

## Add parameter on source

    function Deck (cards) {
      this.cards = cards;
    }

<p class="fragment pass-spec">Pass!</p>

--

![Happy](slides/img/happy.png)

--
# Feed our specs
write only what we need to move to the next step

--
# That is easy!
