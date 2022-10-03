<?php


class DB_Functions
{

    private $conn;

    // constructor
    function __construct()
    {
        require_once 'DB_Connect.php';
        // connecting to database
        $db = new Db_Connect();
        $this->conn = $db->connect();
    }

    // destructor
    function __destruct()
    {

    }

    /**
     * Storing new user
     * returns user details
     */
    public function storeUser($name, $email, $password)
    {
        $hash = $this->hashSSHA($password);
        $encrypted_password = $hash["encrypted"]; // encrypted password
        $salt = $hash["salt"]; // salt

        $statement = $this->conn->prepare("INSERT INTO users(email, name, encrypted_password, salt, created_at) VALUES(?, ?, ?, ?, NOW())");
        $statement->bind_param("ssss", $email, $name, $encrypted_password, $salt);
        $result = $statement->execute();
        $statement->close();

        // check for successful store
        if ($result) {
            $statement = $this->conn->prepare("SELECT * FROM users WHERE email = ?");
            $statement->bind_param("s", $email);
            $statement->execute();
            $user = $statement->get_result()->fetch_assoc();
            $statement->close();

            return $user;
        } else {
            return false;
        }
    }

    /**
     * Encrypting password
     * @param password
     * returns salt and encrypted password
     */
    public function hashSSHA($password)
    {

        $salt = sha1(rand());
        $salt = substr($salt, 0, 10);
        $encrypted = base64_encode(sha1($password . $salt, true) . $salt);
        $hash = array("salt" => $salt, "encrypted" => $encrypted);
        return $hash;
    }

    /**
     * Get user by email and password
     */
    public function getUserByEmailAndPassword($email, $password)
    {

        $statement = $this->conn->prepare("SELECT * FROM users WHERE email = ?");

        $statement->bind_param("s", $email);

        if ($statement->execute()) {
            $user = $statement->get_result()->fetch_assoc();
            $statement->close();

            // verifying user password
            $salt = $user['salt'];
            $encrypted_password = $user['encrypted_password'];
            $hash = $this->checkhashSSHA($salt, $password);
            // check for password equality
            if ($encrypted_password == $hash) {
                // user authentication details are correct
                return $user;
            }
        } else {
            return NULL;
        }
    }

    /**
     * Decrypting password
     * @param salt , password
     * returns hash string
     */
    public function checkhashSSHA($salt, $password)
    {

        $hash = base64_encode(sha1($password . $salt, true) . $salt);

        return $hash;
    }

    /**
     * Check user is existed or not
     */
    public function isUserExisted($email)
    {
        $statement = $this->conn->prepare("SELECT email from users WHERE email = ?");

        $statement->bind_param("s", $email);

        $statement->execute();

        $statement->store_result();

        if ($statement->num_rows > 0) {
            // user existed
            $statement->close();
            return true;
        } else {
            // user not existed
            $statement->close();
            return false;
        }
    }

    public function getCategories()
    {
        $stmt = $this->conn->prepare("SELECT category_id, category_name, icon FROM categories");
        $stmt->execute();
        $stmt->bind_result($category_id, $category_name, $icon);

        $categories = array();

        while ($stmt->fetch()) {
            $category = array();
            $category['category_id'] = $category_id;
            $category['category_name'] = $category_name;
            $category['icon'] = $icon;

            array_push($categories, $category);
        }

        return $categories;
    }

    public function getFeaturedCourses()
    {
        $stmt = $this->conn->prepare("SELECT icon, course_id, course_name, price, description, link FROM courses ORDER BY RAND() LIMIT 8");
        $stmt->execute();
        $stmt->bind_result($icon, $course_id, $course_name, $price, $description, $link);

        $courses = array();

        while ($stmt->fetch()) {
            $course = array();
            $course['icon'] = $icon;
            $course['course_id'] = $course_id;
            $course['course_name'] = $course_name;
            $course['price'] = $price;
            $course['description'] = $description;
            $course['link'] = $link;

            array_push($courses, $course);
        }

        return $courses;
    }

    public function getTopCourses()
    {
        $stmt = $this->conn->prepare("SELECT icon, course_id, course_name, price, description, link FROM courses WHERE category_id = 'CA1' OR category_id = 'CA8' ORDER BY RAND() LIMIT 8");
        $stmt->execute();
        $stmt->bind_result($icon, $course_id, $course_name, $price, $description, $link);

        $courses = array();

        while ($stmt->fetch()) {
            $course = array();
            $course['icon'] = $icon;
            $course['course_id'] = $course_id;
            $course['course_name'] = $course_name;
            $course['price'] = $price;
            $course['description'] = $description;
            $course['link'] = $link;

            array_push($courses, $course);
        }

        return $courses;
    }

    public function getCoursesByCategoryId($category_id)
    {
        $stmt = $this->conn->prepare("SELECT icon, course_id, course_name, price, description, link FROM courses WHERE category_id = ?");
        $stmt->bind_param("s", $category_id);
        $stmt->execute();
        $stmt->bind_result($icon, $course_id, $course_name, $price, $description, $link);

        $courses = array();

        while ($stmt->fetch()) {
            $course = array();
            $course['icon'] = $icon;
            $course['course_id'] = $course_id;
            $course['course_name'] = $course_name;
            $course['price'] = $price;
            $course['description'] = $description;
            $course['link'] = $link;

            array_push($courses, $course);
        }

        return $courses;
    }

    public function createQuestion($question_id, $course_id, $lesson_number, $name, $title, $content)
    {
        $stmt = $this->conn->prepare("INSERT INTO questions (question_id, course_id, lesson_number, name, date, title, content) VALUES (?, ?, ?, ?, NOW(), ?, ?)");
        $stmt->bind_param("ssssss", $question_id, $course_id, $lesson_number, $name, $title, $content);
        if ($stmt->execute())
            return true;
        return false;
    }

    public function getQuestions()
    {
        $stmt = $this->conn->prepare("SELECT question_id, course_id, lesson_number, name, date, title, content, (SELECT COUNT(*) FROM answers WHERE answers.question_id = questions.question_id) AS comment_count FROM questions");
        $stmt->execute();
        $stmt->bind_result($question_id, $course_id, $lesson_number, $name, $date, $title, $content, $comment_count);

        $questions = array();

        while ($stmt->fetch()) {
            $question = array();
            $question['question_id'] = $question_id;
            $question['course_id'] = $course_id;
            $question['lesson_number'] = $lesson_number;
            $question['name'] = $name;
            $question['date'] = $date;
            $question['title'] = $title;
            $question['content'] = $content;
            $question['comment_count'] = $comment_count;

            array_push($questions, $question);
        }

        return $questions;
    }

    public function createAnswer($question_id, $name, $content)
    {
        $stmt = $this->conn->prepare("INSERT INTO answers (question_id, name, date, content) VALUES (?, ?, NOW(), ?)");
        $stmt->bind_param("sss", $question_id, $name, $content);
        if ($stmt->execute())
            return true;
        return false;
    }

    public function getAnswersByQuestionId($question_id)
    {
        $stmt = $this->conn->prepare("SELECT name, date, content FROM answers WHERE question_id = ?");
        $stmt->bind_param("s", $question_id);
        $stmt->execute();
        $stmt->bind_result($name, $date, $content);

        $answers = array();

        while ($stmt->fetch()) {
            $answer = array();
            $answer['name'] = $name;
            $answer['date'] = $date;
            $answer['content'] = $content;

            array_push($answers, $answer);
        }

        return $answers;
    }

    public function createUserCourse($email, $course_id)
    {
        $stmt = $this->conn->prepare("INSERT INTO user_courses (email, course_id) VALUES (?, ?)");
        $stmt->bind_param("ss", $email, $course_id);
        if ($stmt->execute())
            return true;
        return false;
    }

    public function getCoursesByEmail($email)
    {
        $stmt = $this->conn->prepare("SELECT courses.icon, courses.course_id, courses.course_name, courses.price, courses.description, courses.link FROM user_courses, courses WHERE user_courses.course_id = courses.course_id and user_courses.email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($icon, $course_id, $course_name, $price, $description, $link);

        $courses = array();

        while ($stmt->fetch()) {
            $course = array();
            $course['icon'] = $icon;
            $course['course_id'] = $course_id;
            $course['course_name'] = $course_name;
            $course['price'] = $price;
            $course['description'] = $description;
            $course['link'] = $link;

            array_push($courses, $course);
        }

        return $courses;
    }

    public function createUserFavorite($email, $course_id)
    {
        $stmt = $this->conn->prepare("INSERT INTO user_favorites (email, course_id) VALUES (?, ?)");
        $stmt->bind_param("ss", $email, $course_id);
        if ($stmt->execute())
            return true;
        return false;
    }

    public function getFavoritesByEmail($email)
    {
        $stmt = $this->conn->prepare("SELECT courses.icon, courses.course_id, courses.course_name, courses.price, courses.description, courses.link FROM user_favorites, courses WHERE user_favorites.course_id = courses.course_id and user_favorites.email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($icon, $course_id, $course_name, $price, $description, $link);

        $courses = array();

        while ($stmt->fetch()) {
            $course = array();
            $course['icon'] = $icon;
            $course['course_id'] = $course_id;
            $course['course_name'] = $course_name;
            $course['price'] = $price;
            $course['description'] = $description;
            $course['link'] = $link;

            array_push($courses, $course);
        }

        return $courses;
    }

    public function getUserCourseIdsByEmail($email)
    {
        $stmt = $this->conn->prepare("SELECT course_id FROM user_courses WHERE email=?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($course_id);

        $course_ids = array();

        while ($stmt->fetch()) {
            $id = array();
            $id['course_id'] = $course_id;

            array_push($course_ids, $id);
        }

        return $course_ids;
    }

    public function getFavoriteCourseIdsByEmail($email)
    {
        $stmt = $this->conn->prepare("SELECT course_id FROM user_favorites WHERE email=?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($course_id);

        $course_ids = array();

        while ($stmt->fetch()) {
            $id = array();
            $id['course_id'] = $course_id;

            array_push($course_ids, $id);
        }

        return $course_ids;
    }

    public function removeCourseFromFavorite($email, $course_id)
    {
        $stmt = $this->conn->prepare("DELETE FROM user_favorites WHERE email = ? AND course_id = ?");
        $stmt->bind_param("ss", $email, $course_id);
        if ($stmt->execute())
            return true;
        return false;
    }

    public function getLessonsByCourseId($course_id)
    {
        $stmt = $this->conn->prepare("SELECT lesson_id, lesson_name, lesson_number, duration, link FROM lessons WHERE course_id = ?");
        $stmt->bind_param("s", $course_id);
        $stmt->execute();
        $stmt->bind_result($lesson_id, $lesson_name, $lesson_number, $duration, $link);

        $lessons = array();

        while ($stmt->fetch()) {
            $lesson = array();
            $lesson["lesson_id"] = $lesson_id;
            $lesson["lesson_name"] = $lesson_name;
            $lesson["lesson_number"] = $lesson_number;
            $lesson["duration"] = $duration;
            $lesson["link"] = $link;

            array_push($lessons, $lesson);
        }

        return $lessons;
    }

    public function getSearchResults($search_query)
    {
        $stmt = $this->conn->prepare("SELECT icon, course_id, course_name, price, description, link FROM courses WHERE course_name LIKE ? OR description LIKE ? or price LIKE ? or tag LIKE ?");
        $param = '%'.$search_query.'%';
        $stmt->bind_param("ssss", $param, $param, $param, $param);
        $stmt->execute();
        $stmt->bind_result($icon, $course_id, $course_name, $price, $description, $link);

        $results = array();

        while ($stmt->fetch()) {
            $result = array();
            $result['icon'] = $icon;
            $result["course_id"] = $course_id;
            $result["course_name"] = $course_name;
            $result["price"] = $price;
            $result['description'] = $description;
            $result['link'] = $link;

            array_push($results, $result);
        }

        return $results;
    }

    public function getFirstQuizQuestions()
    {
        $stmt = $this->conn->prepare("SELECT quiz_id, content, optionA, optionB, optionC, answer FROM first_quiz_questions ORDER BY RAND() LIMIT 10");
        $stmt->execute();
        $stmt->bind_result($quiz_id, $content, $optionA, $optionB, $optionC, $answer);

        $questions = array();

        while ($stmt->fetch()) {
            $question = array();
            $question['quiz_id'] = $quiz_id;
            $question['content'] = $content;
            $question['optionA'] = $optionA;
            $question['optionB'] = $optionB;
            $question['optionC'] = $optionC;
            $question['answer'] = $answer;
            array_push($questions, $question);
        }

        return $questions;
    }

    public function getLessonQuizQuestions($lesson_id)
    {
        $stmt = $this->conn->prepare("SELECT quiz_id, content, optionA, optionB, optionC, answer FROM lesson_quiz_questions WHERE lesson_id = ? ORDER BY RAND()");
        $stmt->bind_param("s", $lesson_id);
        $stmt->execute();
        $stmt->bind_result($quiz_id, $content, $optionA, $optionB, $optionC, $answer);

        $questions = array();

        while ($stmt->fetch()) {
            $question = array();
            $question['quiz_id'] = $quiz_id;
            $question['content'] = $content;
            $question['optionA'] = $optionA;
            $question['optionB'] = $optionB;
            $question['optionC'] = $optionC;
            $question['answer'] = $answer;
            array_push($questions, $question);
        }

        return $questions;
    }

    public function getLessonNumbersByCourseId($course_id)
    {
        $stmt = $this->conn->prepare("SELECT lesson_id, lesson_number FROM lessons WHERE course_id = ?");
        $stmt->bind_param("s", $course_id);
        $stmt->execute();
        $stmt->bind_result($lesson_id, $lesson_number);

        $quizzes = array();

        while ($stmt->fetch()) {
            $quiz = array();
            $quiz["lesson_id"] = $lesson_id;
            $quiz["lesson_number"] = $lesson_number;

            array_push($quizzes, $quiz);
        }

        return $quizzes;
    }

    public function createLessonQuizResult($email, $lesson_id, $score, $rank)
    {
        $stmt = $this->conn->prepare("INSERT INTO lesson_quiz_results VALUES (?, ?, ?, ?, NOW())");
        $stmt->bind_param("ssss", $email, $lesson_id, $score, $rank);
        if ($stmt->execute())
            return true;
        return false;
    }

    public function getLessonQuizResults($email, $lesson_id)
    {
        $stmt = $this->conn->prepare("SELECT date, score, rank FROM lesson_quiz_results WHERE email = ? AND lesson_id = ?");
        $stmt->bind_param("ss", $email, $lesson_id);
        $stmt->execute();
        $stmt->bind_result($date, $score, $rank);

        $results = array();

        while ($stmt->fetch()) {
            $result = array();
            $result["date"] = $date;
            $result["score"] = $score;
            $result["rank"] = $rank;

            array_push($results, $result);
        }

        return $results;
    }

    public function createFirstQuizResult($email, $score, $rank)
    {
        $stmt = $this->conn->prepare("INSERT INTO first_quiz_results VALUES (?, ?, ?, NOW())");
        $stmt->bind_param("sss", $email, $score, $rank);
        if ($stmt->execute())
            return true;
        return false;
    }

    public function getFirstQuizResults($email)
    {
        $stmt = $this->conn->prepare("SELECT date, score, rank FROM first_quiz_results WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($date, $score, $rank);

        $results = array();

        while ($stmt->fetch()) {
            $result = array();
            $result["date"] = $date;
            $result["score"] = $score;
            $result["rank"] = $rank;

            array_push($results, $result);
        }

        return $results;
    }

    public function getCourseSuggestions($rank)
    {
        $stmt = $this->conn->prepare("SELECT icon, course_id, course_name, price, description, link FROM courses WHERE tag LIKE ? ORDER BY RAND() LIMIT 3");
        $param = '%'.$rank.'%';
        $stmt->bind_param("s", $param);
        $stmt->execute();
        $stmt->bind_result($icon, $course_id, $course_name, $price, $description, $link);

        $suggestions = array();

        while ($stmt->fetch()) {
            $suggestion = array();
            $suggestion['icon'] = $icon;
            $suggestion["course_id"] = $course_id;
            $suggestion["course_name"] = $course_name;
            $suggestion["price"] = $price;
            $suggestion['description'] = $description;
            $suggestion['link'] = $link;

            array_push($suggestions, $suggestion);
        }

        return $suggestions;
    }

    public function saveWatchedLesson($email, $lesson_id)
    {
        $stmt = $this->conn->prepare("INSERT INTO watched_lessons VALUES (?, ?)");
        $stmt->bind_param("ss", $email, $lesson_id);
        if ($stmt->execute())
            return true;
        return false;
    }

    public function loadWatchedLessons($email)
    {
        $stmt = $this->conn->prepare("SELECT lesson_id FROM watched_lessons WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($lesson_id);

        $lessons = array();

        while ($stmt->fetch()) {
            $lesson = array();
            $lesson["lesson_id"] = $lesson_id;

            array_push($lessons, $lesson);
        }

        return $lessons;
    }

    public function getSearchSuggestions()
    {
        $stmt = $this->conn->prepare("SELECT course_name, description, tag FROM courses");
        $stmt->execute();
        $stmt->bind_result($course_name, $description, $tag);

        $suggestions = array();

        while ($stmt->fetch()) {
            $suggestion = array();
            $suggestion["course_name"] = $course_name;
            $suggestion['description'] = $description;
            $suggestion['tag'] = $tag;

            array_push($suggestions, $suggestion);
        }

        return $suggestions;
    }
}

?>
