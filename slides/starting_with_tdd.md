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

<div class="fragment">
  <img src="slides/img/978-1-78216-720-4_02_01.png" alt="">
</div>

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

<div class="fragment">
  <img src="slides/img/978-1-78216-720-4_02_02.png" alt="">
</div>

--
## Declare variable
> **Given** a deck, it **should** have a collection of cards

    describe("Deck", function() {
      it("should have a collection of cards", function() {
        var deck = new Deck();
        expect(deck.cards).toBe(cards);
      });
    });

<div class="fragment">
  <img src="slides/img/978-1-78216-720-4_02_03.png" alt="">
</div>

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

<div class="fragment">
  <img src="slides/img/978-1-78216-720-4_02_04.png" alt="">
</div>

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

<div class="fragment">
  <img src="slides/img/978-1-78216-720-4_02_05.png" alt="">
</div>

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

<div class="fragment">
  <img src="slides/img/978-1-78216-720-4_02_06.png" alt="">
</div>

--
# Missing assingment

--
## Pass parameter on Spec

    describe("Deck", function() {
      it("should have a collection of cards", function() {
        var cards = [new Card()],
            deck = new Deck(cards);

        expect(deck.cards).toBe(cards);
      });
    });

## Add parameter on Source

    function Deck (cards) {
      this.cards = cards;
    }

<div class="fragment">
  <img src="slides/img/978-1-78216-720-4_02_07.png" alt="">
</div>

--

![Happy](slides/img/happy.png)

It is green!

--
# Feed your specs
write only what you need to move to the next step

--
# That is easy!
