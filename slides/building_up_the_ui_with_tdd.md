# But, How do we build the front end code?

--
# Starting from the top!

--
# Mockup
![Component](slides/img/app_mockup.png)

--
# Static HTML template

    <div class="player-session transitionable">
      <button class="back-button">Back</button><button class="show-tooltips">Help</button>
      <div class="card-back"></div>
      <div class="card">
        <div class="player-card">
          <span class="level">1</span><span class="view-count">0</span>
          <h1 class="keyword">Term</h1>
          <p class="definition">long definition</p>
          <div class="question">
            <div class="knowledge-question">
              <p>Did you get this one?</p>
              <nav>
                <button class="yes-button">Yes</button>
                <button class="no-button">No</button>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>

--
# And with CSS
![Component](slides/img/components_00.png)

--
# Pretty, but dumb.

--
# Break into smaller components

--
![Component](slides/img/components_01.png)
--
![Component](slides/img/components_02.png)
--
![Component](slides/img/components_03.png)
--
![Component](slides/img/components_04.png)
--
![Component](slides/img/components_05.png)

--
# Start to add behavior

--
# With TDD magic

--
# What is a component?

--
## A document element encapsulated by a JavaScript object

--
## Also called View

--
# Progress Bar
![Component](slides/img/progress_bar.png)

--
## Should render a label with the progress of seen cards.
![Component](slides/img/progress_bar.png)

    describe("ProgressBarView", function() {

      describe("given a player session", function() {

        it("should render label with the progress of seen cards", function() {
          expect(view.$el).toContainHtml('5/10 cards');
        });

      });
    });

--
## Should fill the progress bar indicator
![Component](slides/img/progress_bar.png)

    describe("ProgressBarView", function() {

      describe("given a player session", function() {

        it("should fill the progress bar indicator", function() {
          expect(view.$('.fill')).toHaveCss({ width: '50%' });
        });

      });
    });

--
## The ProgressBarView Spec
![Component](slides/img/progress_bar.png)

    describe("ProgressBarView", function() {

      describe("given a player session", function() {
        var view;

        beforeEach(function() {
          var playerSession = sinon.createStubInstance(PlayerSession);
          playerSession.currentCardNumber.returns(6);
          playerSession.cardsCount.returns(10);

          view = new ProgressBarView({ model: playerSession }).render();
        });

        it("should render label with the progress of seen cards", function() {
          expect(view.$el).toContainHtml('5/10 cards');
        });

        it("should fill the progress bar indicator", function() {
          expect(view.$('.fill')).toHaveCss({ width: '50%' });
        });
      });
    });

--
# Knowledge Question
![Component](slides/img/knowledge_question.png)

--
## Should have a yes button
![Component](slides/img/knowledge_question.png)

    describe("KnowledgeQuestionView", function() {
      var view;

      beforeEach(function() {
        view = new KnowledgeQuestionView().render();
      });

      it("should have a yes button", function() {
        expect(view.$('.yes-button')).toContainHtml('Yes');
      });
    });

--
## What should the yes button do?

--
## Is it the KnowledgeQuestionView's responability to know?

--
# NO!

--
## Observable pattern

### like jQuery:

    function observer () {
      alert('clicked');
    }

    $('a').click(observer);

### but on our component:

    function observer () {
      alert('clicked');
    }

    view.on('answer:yes', observer);

--
## Should notify on clicking yes
![Component](slides/img/knowledge_question.png)

    describe("KnowledgeQuestionView", function() {
      var view;

      beforeEach(function() {
        view = new KnowledgeQuestionView().render();
      });

      it("should have a yes button", function() {
        expect(view.$('.yes-button')).toContainHtml('Yes');
      });

      it("should trigger an answer:yes event on clicking the yes button", function() {
        var observer = sinon.spy();
        view.on('answer:yes', observer);
        view.$('.yes-button').click();
        expect(observer).toHaveBeenCalled();
      });
    });

--
# Integration

![Component](slides/img/observable.png)

--
# Wrapping up...

--
# A component should access only its DOM element

--
# Integrate with observers

    currentPlayerCardView.on('complete', this.showNextCard);

--
# Awesome!
