let courses = document.getElementById("courses-list");
let quiz_ui = document.getElementById("quiz-ui");

let i = 0;
let theEvent;
let score = 0;

const displayQuestions = (input, event) => {
  quiz_ui.innerHTML = `<h1>${event.toUpperCase()}</h1>
    <h5>Question ${i + 1}</h5>
    <h3>${input[i].question}</h3>
    <ul class="list-group" id="answers">
    <li class="list-group-item py-1 pointer">${
      input[i].incorrect_answers[0]
    }</li>
    <li class="list-group-item py-1 pointer">${
      input[i].incorrect_answers[1]
    }</li>
    <li class="list-group-item py-1 pointer">${
      input[i].incorrect_answers[2]
    }</li>
    <li class="list-group-item py-1 pointer">${
      input[i].incorrect_answers[3]
    }</li>
    </ul>`;
};

// This function fetches the chose subject's api url
const fetchApiUrl = (id) => {
  let url;
  switch (id) {
    case "mathematics":
      url = "https://opentdb.com/api.php?amount=20&category=19&type=multiple";
      break;
    case "computer":
      url = "https://opentdb.com/api.php?amount=20&category=18&type=multiple";
      break;
    case "history":
      url = "https://opentdb.com/api.php?amount=20&category=23&type=multiple";
      break;
    case "politics":
      url = "https://opentdb.com/api.php?amount=20&category=24&type=multiple";
      break;
    case "geography":
      url = "https://opentdb.com/api.php?amount=20&category=22&type=multiple";
      break;
  }
  return url;
};

// this function fetches the questions with respect to the api given by fetchApiUrl()
const fetchQuetions = async (id) => {
  const questions = [];
  await fetch(fetchApiUrl(id))
    .then((response) => response.json())
    .then((questionsArray) => questionsArray.results)
    .then((arr) =>
      arr.forEach(({ question, correct_answer, incorrect_answers }) => {
        questions.push({ question, correct_answer, incorrect_answers });
      })
    );
  return questions;
};

// this function adds the correct answer to the array of incoorect answers to be displayed on the web browser
const updateIncorrectAnswers = (incorrect, correct) => {
  let startIndex = Math.floor(Math.random() * 4);
  let deleteCount = 0;
  let arr = incorrect;
  let newE = correct;
  arr.splice(startIndex, deleteCount, newE);
  return arr;
};

courses.addEventListener("click", async (event) => {
  if (event.target.classList.contains("list-group-item")) {
    theEvent = event.target.id;
    questions = await fetchQuetions(theEvent).then((questions) => questions);
    questions.forEach((obj) => {
      updateIncorrectAnswers(obj.incorrect_answers, obj.correct_answer);
    });
    // console.log(questions);
  } else {
    theEvent = event.target.parentElement.id;
    questions = await fetchQuetions(theEvent).then((questions) => questions);
    questions.forEach((obj) => {
      updateIncorrectAnswers(obj.incorrect_answers, obj.correct_answer);
    });
  }
  displayQuestions(questions, theEvent);
});

quiz_ui.addEventListener("click", (event) => {
  if (event.target.parentElement.id === "answers") {
    if (event.target.innerText === String(questions[i].correct_answer)) {
      score++;
      i++;
      nextQuestion(i);
    } else {
      i++;
      nextQuestion(i);
    }
  }
});

const nextQuestion = (i) => {
  if (i < questions.length) {
    displayQuestions(questions, theEvent);
  } else {
    displayResult(score);
  }
};

const displayResult = (result) => {
  quiz_ui.innerHTML = `<h1>Quiz Over! Welldone! You scored ${result} out of ${questions.length}</h1>
  <a href="./quiz.htm"><button class="btn btn-success px-3 py-2 mx-auto">Restart Quiz</button></a>`;
};
