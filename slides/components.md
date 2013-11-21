# Demo
--

![Component](slides/img/components_00.png)
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
# How do we come up with this?
## or even test it?

--
# Progress Bar View
## The non-interactive
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
# Knowledge Question View
## The interactive
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
## Observable pattern

### jQuery:

    function observer () {
      alert('clicked');
    }

    $('a').click(observer);

### View:

    function observer () {
      alert('clicked');
    }

    view.on('answer:yes', observer);

--
# Integration

![Component](slides/img/observable.png)

--
# Things to keep in mind

--
# A View should access only its DOM element

--
# Respect encapsulation

--
# Integrate with observers

    currentPlayerCardView.on('complete', this.showNextCard);
