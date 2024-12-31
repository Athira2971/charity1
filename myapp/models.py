from django.db import models

# Create your models here.
class Login(models.Model):
    Username = models.CharField(max_length=25)
    Password = models.CharField(max_length=20)
    Type = models.CharField(max_length=20)



class User(models.Model):
    Name=models.CharField(max_length=25)
    Dob=models.DateField()
    Place=models.CharField(max_length=30)
    District=models.CharField(max_length=30)
    Post=models.CharField(max_length=25)
    Pin=models.IntegerField()
    PhoneNumber=models.IntegerField()
    Image=models.CharField(max_length=300)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)

class Organizer(models.Model):
    Image=models.CharField(max_length=300)
    Name=models.CharField(max_length=25)
    Place=models.CharField(max_length=25)
    District=models.CharField(max_length=25)
    Post=models.CharField(max_length=25)
    Pin=models.IntegerField()
    PhoneNumber=models.IntegerField()
    Status=models.CharField(max_length=25)
    LOGIN = models.ForeignKey(Login, on_delete=models.CASCADE)

class Complaint(models.Model):
    Complaint=models.CharField(max_length=30)
    Reply=models.CharField(max_length=30)
    Date=models.DateField()
    Status=models.CharField(max_length=30)
    USER=models.ForeignKey(User,on_delete=models.CASCADE)

class Review(models.Model):
    Review=models.CharField(max_length=25)
    Rating=models.CharField(max_length=25)
    Date=models.DateField()
    USER = models.ForeignKey(User, on_delete=models.CASCADE)


class Feedback(models.Model):
    Feedback=models.CharField(max_length=30)
    Date=models.DateField()
    USER = models.ForeignKey(User, on_delete=models.CASCADE)

class Category(models.Model):
    Name=models.CharField(max_length=30)
    ORGANIZER = models.ForeignKey(Organizer, on_delete=models.CASCADE)


class Donation(models.Model):
    Date=models.DateField()
    Amount=models.BigIntegerField()
    Status=models.CharField(max_length=30)
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    CATEGORY=models.ForeignKey(Category,on_delete=models.CASCADE)

class OtherDonation(models.Model):
    Date=models.DateField()
    Other=models.CharField(max_length=30)
    Status=models.CharField(max_length=30)
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    CATEGORY=models.ForeignKey(Category,on_delete=models.CASCADE)

class Request(models.Model):
    Date=models.DateField()
    Purpose=models.CharField(max_length=30)
    Description=models.CharField(max_length=30)
    FileName=models.CharField(max_length=300)
    Donations=models.CharField(max_length=50)
    NeedDate=models.DateField()
    Status=models.CharField(max_length=25)
    ORGANIZER=models.ForeignKey(Organizer,on_delete=models.CASCADE)











