# Hotel-Reservation-System(a database project)
Providing a fully integrated system that allows administrators to manage services, handle special offers and track maintenance requests, while allowing customers to book rooms, manage reservations and leave reviews

  
# Project problems 
Integration between different components such as reservation management, payments and customer reviews was a significant challenge. Managing relationships between entities such as customers, rooms and special offers required careful database design to maintain data integrity and prevent data duplication. Additionally, triggers to send notifications based on events such as low-rating reviews or booking cancellations were complex to implement and required careful testing. Additionally, properly managing multi-step processes like payment was another challenge


# System features 

1-User Features
    
  
2-Admin Features  
   

# 1-User Features

Reservation Management: Customers can make reservations, select rooms and review reservation status.

Review System: Customers can leave reviews for rooms after their stay, which helps other customers make informed decisions

Promotions and Special Offers: View relevant promotions and special offers during the booking process

Payment Integration: Manage payments for reservations, including failed transactions and status updates

 
# 2-Admin features  

Notifications: Receive real-time notifications about new reservations, cancellations, low ratings and special requests.

Room and Service Management: managing maintenance requests and managing services such as housekeeping.

Analytics and Reporting: Creating reports for bookings and customer feedback.

# Important tables
Bookings
Customers
Rooms
Reviews
Payments
AdminNotifications


# Relationships

1:1 Relationships)Reservations and Payments: Each reservation has a payment and each payment corresponds to one reservation.

M:M Relationship:Reservations can have multiple associated services and services can be linked to multiple reservations. This many-to-many relationship is managed through the BookingServices connection table.

1:M Relationships)A customer can make multiple reservations

# Triggers ve views

In our project, triggers are used to automatically send notifications based on specific events (like service requests and reservation status updates), while views simplify data retrieval by presenting complex queries as virtual tables and make it easier to access and analyze information such as reservation summaries. and room details.  


 


