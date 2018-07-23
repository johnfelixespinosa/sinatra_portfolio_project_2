# Assessment

Hi John,

Nice job on your portfolio project review! I'm excited to meet again and discuss your app further. To recap, before the next time we meet:

## 1.  Comb over your routes to make sure you are using RESTful conventions where appropriate. A good reference for this lives here: https://learn.co/tracks/full-stack-web-development-v5/sinatra/activerecord/sinatra-restful-routes

What I did to change my routes to be more RESTFUL, is when a user is logged in form now on, and whether they are a student or instructor, anytime the wish to view a course, whether it be to display the course info as a student, or edit the course info as an instructor. The course slug is used in the route. As an instructor who wishes to edit their course the route will be displayed as 
http://127.0.0.1:9393/courses/danielkehoe/programming-and-problem-solving/edit

As a student who wishes to receive more info about a course the url will be displayed as
http://127.0.0.1:9393/courses/programming-and-problem-solving/info

Previously the route to show all courses was courses/courses
This proved to be confusing for both user models
I changed this route to be 'courses/search' for students and this route is not available for instructors as they don't have the need to view all courses, rather only their courses. 

## 2. Review has_secure_password. Focus on the methods it provides and what they do for us and our apps.

has_secure_password requires the password_digest attribute for the user. Which entail adds the following validations
  -Password must be present on creation
  -Password length should be less than or equal to 72 bytes
  -Confirmation of password (using a password_confirmation attribute)

class User < ActiveRecord::Base
  has_secure_password validations: false
end

user = User.new
user.password = nil
user.password_digest # => nil
user.password = 'mUc3m00RsqyRe'
user.password_digest # => "$2a$10$4LEA7r4YmNHtvlAvHhsYAeZmk/xeUVtMTYqwIvYY76EW5GUqDiP4."

Upon user creation has_secure_password sets the password attribute to read only, and creates a confirms a password_digest attribute. When the password is set by a new user it must be confirmed (entered twice?, this could be disabled, btw confirmation = false I think). password= then encrypts and saves the password to the password_digest attribute.

This makes it so passwords will be saved in the database as the encrypted password. Hackers will have to use brute force to gain access. 

## 3. Review sessions. Why do we set session[:user_id]?
To save data over multiple requests. A session keeps track of everything a user does prior to closing the browser.

This is so that a user while browsing the site is in an active session. Upon a user logging in, the login post route does the following

      session[:user_id] = @user.id 

We then do a validation throughout the application defined in the current_user method

  ```ruby
  def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  ```

Anytime a user wishes to do anything that alters the database such as create a course when as an instructor, it is referenced to that user using the session_id. A student logging in under one session, couldnt navigate to the edit page of a course for example, and then edit that courses info, for the check of whether the current user is the owner of that course would fail, prompting that session user(the student) to be redirected to the login page. 

  ```ruby
    def not_course_instructor
      current_user.full_name != @course.instructor
    end 
  ```


## 4. Look into using Enrollments as a join table. Remember that you can specify the class you'll be referencing: http://edgeguides.rubyonrails.org/association_basics.html#options-for-belongs-to-class-name

With this iteration, I used the instructor relationship and the student enrollment relationship both as separate join tables

## 5. If you're having trouble, don't hesitate to schedule a 1:1 with Howard! https://theflatironschool.typeform.com/to/Xva2Br

When you've finished, you can use this link to schedule another appointment: https://meetme.so/SinatraLearnAssessment
Please reach out if you have any questions or concerns.

Regards,

Luisa Scavo 
luisa@flatironschool.com

User can be either Instructor or student

Instructors can have courses

Students can have enrollments 

Enrollments can have on student and one course

Courses belong to instructors and enrollments
