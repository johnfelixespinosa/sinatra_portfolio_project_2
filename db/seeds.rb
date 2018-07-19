instructortest = User.create(username: "instructortest",
  email: "instructortest@iocc.staff.edu",
  password: "password",
  usertype: "instructor",
  first_name: "instructor",
  last_name: "test")

studenttest = User.create(username: "studenttest",
  email: "studenttest@gmail.com",
  password: "password",
  usertype: "student",
  first_name: "student",
  last_name: "test")

markevans = User.create(username: "MarkEvans",
  email: "markevans@iocc.staff.edu",
  password: "password",
  usertype: "instructor",
  first_name: "Mark",
  last_name: "Evans")

wendywashington = User.create(username: "WendyWashington",
  email: "wendywashington@iocc.staff.edu",
  password: "password",
  usertype: "instructor",
  first_name: "Wendy",
  last_name: "Washington")

danielkehoe = User.create(username: "DanielKehoe",
  email: "danielkehoe@iocc.staff.edu",
  password: "password",
  usertype: "instructor",
  first_name: "Daniel",
  last_name: "Kehoe")

bryanmcnair = User.create(username: "BryanMcnair",
  email: "bryanmcnair@iocc.staff.edu",
  password: "password",
  usertype: "instructor",
  first_name: "Bryan",
  last_name: "McNair")

Course.create(name: "Intro to Computer Science",
    instructor: "Daniel Kehoe",
    description: "Computer uses in modern society. Emphasis on uses in non-scientific disciplines. Includes word processing, spreadsheets, web-page creation, elementary programming, basic computer organization, the Internet, the uses of computers and their influence on society. Course not intended for CS or CSE majors.",
    credits: "1")

    CourseInstructorRelationship.create(
      :course_id => 1,
      :user_id => 5)
    
Course.create(name: "Programming and Problem Solving",
    instructor: "Daniel Kehoe",
    description: "Introduction to computers and computer programming, algorithm design, and debugging. Elements of good programming style. Programming in the C language. Use of basic UNIX tools.",
    credits: "2")
    
    CourseInstructorRelationship.create(
      :course_id => 2,
      :user_id => 5)

Course.create(name: "Cryptography",
    instructor: "Mark Evans",
    description: "Introduction to the theory and practice of cryptographic techniques used in computer security. Encryption (secret-key and public-key), message authentication, digital signatures, entity authentication, key distribution, and other cryptographic protocols. The social context of cryptography.",
    credits: "2")

    CourseInstructorRelationship.create(
      :course_id => 3,
      :user_id => 3)

Course.create(name: "Artifical Intelligence",
    instructor: "Mark Evans",
    description: "Design and implementation of intelligent computer systems. Intelligent search, adversarial search in games, reasoning with graphical models, reinforcement learning and connectionist machines",
    credits: "5")

    CourseInstructorRelationship.create(
      :course_id => 4,
      :user_id => 3)

Course.create(name: "Applications of Sets, Logic, and Recursion",
    instructor: "Wendy Washington",
    description: "Introduction to functional programming and discrete mathematics. Sets, functions, and relations. Basic logic, including formal derivations in propositional and predicate logic. Recursion and mathematical induction. Programming material: Data types and structures, list-processing, functional and recursive programming. No prerequisite. Offered each spring.",
    credits: "4")

    CourseInstructorRelationship.create(
      :course_id => 5,
      :user_id => 4)

Course.create(name: "Operating Systems",
    instructor: "Wendy Washington",
    description: "Introduction to fundamental issues and techniques of operating system design. Topics: processes and threads, process scheduling, deadlock, memory management, I/O systems, file management. Optional topics: multimedia and distributed operating systems, security, and parallel operating systems. Prerequisites: 253 and 256. Offered in alternate years.",
    credits: "1")

    CourseInstructorRelationship.create(
      :course_id => 6,
      :user_id => 4)

Course.create(name: "Internet Law and Philosophy",
    instructor: "Bryan McNair",
    description: "This course examines examines the social norms, market factors, technology and law that influence Internet. Five content areas within this framework make up the scope of the course: Internet governance, communications, privacy, security, and intellectual property. Students will be expected to do graduate level reading and analysis, including primary case law (although there is no prerequisite to have taken a law course), contribute to a robust classroom discourse and write a substantial research paper focused on a topic within the scope",
    credits: "3")

    CourseInstructorRelationship.create(
      :course_id => 7,
      :user_id => 6)

Course.create(name: "Social Issues in Computing",
    instructor: "Bryan McNair",
    description: "Through a careful analysis and discussion of a range of computing issues, topics, and polices, we will explore various impacts of computers on modern society. This class satisfies the Junior Year Writing requirement by providing directed practice and specific instruction in a range of writing genres. Students will produce approximately 20-25 pages of polished written work over the course of the semester.",
    credits: "3")

    CourseInstructorRelationship.create(
      :course_id => 8,
      :user_id => 6)

