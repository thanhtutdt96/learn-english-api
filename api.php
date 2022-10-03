<?php

//getting the dboperation class
require_once 'include/DB_Functions.php';

function isTheseParametersAvailable($params)
{
    $available = true;
    $missingparams = "";

    foreach ($params as $param) {
        if (!isset($_POST[$param]) || strlen($_POST[$param]) <= 0) {
            $available = false;
            $missingparams = $missingparams . ", " . $param;
        }
    }

    if (!$available) {
        $response = array();
        $response['error'] = true;
        $response['message'] = 'Parameters ' . substr($missingparams, 1, strlen($missingparams)) . ' missing';

        echo json_encode($response);

        die();
    }
}

$response = array();

if (isset($_GET['apicall'])) {

    switch ($_GET['apicall']) {

        case 'getcategories':
            $db = new DB_Functions();
            $response['error'] = false;
            $response['message'] = '';
            $response['categories'] = $db->getCategories();
            break;

        case 'getcoursesbycategoryid':
            isTheseParametersAvailable(array('category_id'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['courses'] = $db->getCoursesByCategoryId($_POST['category_id']);

            break;

        case 'createquestion':
            isTheseParametersAvailable(array('question_id', 'course_id', 'name', 'content'));

            $db = new DB_Functions();

            $result = $db->createQuestion(
                $_POST['question_id'],
                $_POST['course_id'],
                $_POST['lesson_number'],
                $_POST['name'],
                $_POST['title'],
                $_POST['content']
            );


            if ($result) {
                $response['error'] = false;

                $response['message'] = 'Question added successfully';

                $response['questions'] = $db->getQuestions();
            } else {

                $response['error'] = true;

                $response['message'] = 'Some error occurred please try again';
            }

            break;

        case 'getquestions':

            $db = new DB_Functions();
            $response['error'] = false;
            $response['message'] = '';
            $response['questions'] = $db->getQuestions();
            break;


        case 'createanswer':
            isTheseParametersAvailable(array('question_id', 'name', 'content'));

            $db = new DB_Functions();

            $result = $db->createAnswer(
                $_POST['question_id'],
                $_POST['name'],
                $_POST['content']
            );


            if ($result) {
                $response['error'] = false;

                $response['message'] = 'Answer added successfully';

                $response['questions'] = $db->getAnswersByQuestionId($_POST['question_id']);
            } else {

                $response['error'] = true;

                $response['message'] = 'Some error occurred please try again';
            }

            break;

        case 'getanswersbyquestionid':
            isTheseParametersAvailable(array('question_id'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['answers'] = $db->getAnswersByQuestionId($_POST['question_id']);

            break;

        case 'createusercourse':
            isTheseParametersAvailable(array('email', 'course_id'));

            $db = new DB_Functions();

            $result = $db->createUserCourse(
                $_POST['email'],
                $_POST['course_id']
            );

            if ($result) {
                $response['error'] = false;

                $response['message'] = 'Course added to your Mine';

                $response['questions'] = $db->getCoursesByEmail($_POST['email']);
            } else {

                $response['error'] = true;

                $response['message'] = 'Some error occurred please try again';
            }

            break;

        case 'getcoursesbyemail':
            isTheseParametersAvailable(array('email'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['courses'] = $db->getCoursesByEmail($_POST['email']);

            break;

        case 'createuserfavorite':
            isTheseParametersAvailable(array('email', 'course_id'));

            $db = new DB_Functions();

            $result = $db->createUserFavorite($_POST['email'], $_POST['course_id']);

            if ($result) {
                $response['error'] = false;

                $response['message'] = 'Course added to your Favorite';

                $response['questions'] = $db->getFavortiesByEmail($_POST['email']);
            } else {

                $response['error'] = true;

                $response['message'] = 'Some error occurred please try again';
            }

            break;

        case 'getfavoritesbyemail':
            isTheseParametersAvailable(array('email'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['courses'] = $db->getFavoritesByEmail($_POST['email']);

            break;

        case 'getusercourseidsbyemail':
            isTheseParametersAvailable(array('email'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['course_ids'] = $db->getUserCourseIdsByEmail($_POST['email']);

            break;

        case 'getfavoritecourseidsbyemail':
            isTheseParametersAvailable(array('email'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['course_ids'] = $db->getFavoriteCourseIdsByEmail($_POST['email']);

            break;

        case 'removecoursefromfavorite':
            isTheseParametersAvailable(array('email', 'course_id'));

            $db = new DB_Functions();

            $result = $db->removeCourseFromFavorite($_POST['email'], $_POST['course_id']);

            if ($result) {
                $response['error'] = false;

                $response['message'] = 'Course removed from your Favorite';

                $response['course_ids'] = $db->getFavoriteCourseIdsByEmail($_POST['email']);
            } else {

                $response['error'] = true;

                $response['message'] = 'Some error occurred please try again';
            }

            break;

        case 'getlessonsbycourseid':
            isTheseParametersAvailable(array('course_id'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['lessons'] = $db->getLessonsByCourseId($_POST['course_id']);

            break;

        case 'getsearchresults':
            isTheseParametersAvailable(array('search_query'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['results'] = $db->getSearchResults($_POST['search_query']);

            break;

        case 'getfeaturedcourses':
            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['courses'] = $db->getFeaturedCourses();
            break;

        case 'gettopcourses':
            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['courses'] = $db->getTopCourses();
            break;

        case 'getfirstquizquestions':
            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['questions'] = $db->getFirstQuizQuestions();
            break;

        case 'getlessonquizquestions':
            isTheseParametersAvailable(array('lesson_id'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['questions'] = $db->getLessonQuizQuestions($_POST['lesson_id']);

            break;

        case 'getlessonnumbersbycourseid':
            isTheseParametersAvailable(array('course_id'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['quizzes'] = $db->getLessonNumbersByCourseId($_POST['course_id']);

            break;

        case 'getlessonquizresults':
            isTheseParametersAvailable(array('email', 'lesson_id'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['results'] = $db->getLessonQuizResults($_POST['email'], $_POST['lesson_id']);

            break;

        case 'createlessonquizresult':
            isTheseParametersAvailable(array('email', 'lesson_id', 'score', 'rank'));

            $db = new DB_Functions();

            $result = $db->createLessonQuizResult($_POST['email'], $_POST['lesson_id'], $_POST['score'], $_POST['rank']);

            if ($result) {
                $response['error'] = false;
                $response['message'] = 'Quiz result has been saved';
                $response['results'] = $db->getLessonQuizResults($_POST['email'], $_POST['lesson_id']);
            } else {
                $response['error'] = true;
                $response['message'] = 'Some error occurred please try again';
            }

            break;

        case 'getfirstquizresults':
            isTheseParametersAvailable(array('email'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['results'] = $db->getFirstQuizResults($_POST['email']);

            break;

        case 'createfirstquizresult':
            isTheseParametersAvailable(array('email', 'score', 'rank'));

            $db = new DB_Functions();

            $result = $db->createFirstQuizResult($_POST['email'], $_POST['score'], $_POST['rank']);

            if ($result) {
                $response['error'] = false;
                $response['message'] = 'Quiz result has been saved';
                $response['results'] = $db->getFirstQuizResults($_POST['email']);
            } else {
                $response['error'] = true;
                $response['message'] = 'Some error occurred please try again';
            }

            break;

        case 'getcoursesuggestions':
            isTheseParametersAvailable(array('rank'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['suggestions'] = $db->getCourseSuggestions($_POST['rank']);

            break;

        case 'savewatchedlesson':
            isTheseParametersAvailable(array('email', 'lesson_id'));

            $db = new DB_Functions();

            $result = $db->saveWatchedLesson($_POST['email'], $_POST['lesson_id']);

            if ($result) {
                $response['error'] = false;
                $response['message'] = '';
                $response['lessons'] = $db->loadWatchedLessons($_POST['email']);
            } else {
                $response['error'] = true;
                $response['message'] = 'Some error occurred please try again';
            }

            break;

        case 'loadwatchedlessons':
            isTheseParametersAvailable(array('email'));

            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['lessons'] = $db->loadWatchedLessons($_POST['email']);

        case 'getsearchsuggestions':
            $db = new DB_Functions();

            $response['error'] = false;
            $response['message'] = '';
            $response['suggestions'] = $db->getSearchSuggestions();

            break;
    }

} else {

    $response['error'] = true;
    $response['message'] = 'Invalid API Call';
}

echo json_encode($response);

?>