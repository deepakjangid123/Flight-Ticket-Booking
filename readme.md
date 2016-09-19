Welcome to the Flight-Ticket-Booking wiki!

FLIGHT BOOKING SYSTEM

Software Engineering Project

Report – Phase I

By Abhishek B Jangid (1301002)
Md Syed Ahamad (1301030)

Indian Institute of Information Technology Guwahati




REQUIREMENT PHASE:

INTRODUCTION Flight Booking System is an application software for booking flight ticket supporting direct contact with the customers. It is eventually evolved into Computer Reservation System (CRS).The document contains the list of requirements for the project. It will help in analyzing the whole structure of the project. It also aims for people to understand the details of the application visually. This is the phase – I report documentation.

REFERENCES:

• https://en.wikipedia.org/wiki/Airline_reservations_system • http://people.cis.ksu.edu/~kaavya/MSE%20PROJECTPAGE.htm • ArgoUML for use case diagram • makemytrip.com for design help

PRODUCT DESCRIPTION

Features:

    Client Site:
        -home page
        -sign in and Sign up
        -user Details
        -flight search
        -class
        -date
        -source/destination
        -domestic/international
        -one way/round trip
        -no. of tickets
        -flight booking
            -Select Flight
            -Make Payment
            -Credit/Debit Card
            -Ticket confirmation status
        -cancel ticket
        -booking instructions
        -complain/contact the company.


Home Page: Like all the other flight booking websites available online, the user can access the user home page of the Flight Booking System website, after he logs into the system. Here, he can search for flights (schedules, fare, source/destination etc.).

Login and Register: The Flight Booking System also comes with the customer registration details page, where the customer can enter his details and register. He can also create a 'username' and 'password'. Moreover, he will also be able to modify his details later on.

Search Flights: The customer can also search for the flights available and can find the best flight according to his schedule.

Ticket Booking: The customer can reserve his place on the flight by purchasing a ticket. To book a ticket he has to make payment via credit/debit card by providing his credentials.

Booking Instructions: The website also provides instructions to the customers on how to book flight tickets along with the different packages. This system provides some of the best offers at the present time.

Cancel Ticket: If user is no more interested, then this particular system also allows customer to cancel his ticket which was booked before.

    Administrator Site:
        -login/logout
        -add/modify customers’ info
        -add/modify flight info
        -cancel/modify reservation
        -email/SMS confirmation.


Login: It is same as customer login but at admin level. Admins are privileged to modify (add/delete/change) customer’s info, flight info etc. They are the actual stakeholders of the product.

Add/modify customers’ info: Admin controls the customers’ activity and they have sole right to modify database related to customer.

Add/modify flight info: Admin should update the changes flight schedules from time to time. Moreover, fare details for each schedule is also updated. He can update cancellation of flight schedule due to some reason.

Modify/Cancel Reservation: Admin can cancel reservation or modify when customer requested to do so or for another reason.

Confirmation SMS/email: This is generated to send the booking Id or ticket No. of which flight user booked. This may also tell user about the confirmation of the ticket (confirm/pending etc.)




User: It gets the username and password as the credentials of login and goes to customer class with the verifyLogin() for authentication. If it is the case of register function, it will get more information of the customer which is necessary to be there in the customer class and it will be stored in the database. This is associated with the customer site and admin site login.

Customers: This contains the details of customers and their privileged role whether it admin or customer. According to this role, users are provided the features that is intended. The basic variables of this class are name, username, password, address, contact no., age, card and their role. It can have login, search flight, view schedule, book flight, cancel booking, make payment,logout etc.

Admin: This contains the the privileged functions of the role admin i.e. add/delete/modify of customer's details or flight information etc.

Flight: It contains Flight Id, its source and destination, date and time of the schedule flight, and ticket price.

Ticket: It has booking Id as variable and payment of ticket, cancel ticket as its functions.

Payment: It has attribute amount. Here payment is done through credit card.

PSEUDO CODE:

class customer:

if(login with user credentials)
    display homepage() with username;
else
    display homepage() with login()/register() option;
if (search flight)
    if(login)
        go to searchflight() with user details,
        src, dest, timeDate, noofticket, triptype, class;
        flight schedules with price is returned;
            if(book ticket)
                go to bookTicket() with a particular flight id, payment() class;
                flight confirmation is returned;
                generateTicket() with user details, payment details, flight details etc.
                if(cancel ticket)
                    go to cancelTicket with booking confirmation id;
    else
        go to login()/register();
        go to if(login) condition;
if(ask for instruction)
    go to instruction();
if(ask for contact us)
    go to contactus() with username;
class admin:

if(login with admin credentials)
    display homepage() with adminname;
else
    display homepage() with adminlogin/register option;
if(modify userdetails)
    go to userdetail() with particular username in read/write mode;
if(modify flightinfo)
    go to filghtinfo() with a flight id in read/write mode;
if(ask for display userdetails)
    display userdetails();
if(ask for display flightinfo)
    display flightinfo();
if( cancel ticket)
    go to ticket() with username in read/write mode;
class login: (admin login is similar to this)

if(username is true && password is true)
    return success with username;
else
    return login failed;
class register: (admin register is similar to this)

enter username, name, password, address, contact;
store all in userDetails;
class searchFlight:

if(details are true && flightStatus() is vacant)
    get flight schedules which matches with parameters provided by user from flightinfo();
else 
    return false;
class bookTicket:

if(userdetails are true && flight schedule is true)
    go to payment();
    if(payment done)
        generate booking id and return it;
    else
        return payment failed;
class cancleTicket:

get booking id from tiket() and cancel it;
class ticket:

return the existing tickets;
class contactUs:

enter complaint texts and submit it along with username;

