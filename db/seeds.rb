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