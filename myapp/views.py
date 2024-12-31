from datetime import datetime
import email

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from myapp.models import Login, Organizer, User, Complaint, Review, Feedback, Donation, OtherDonation, Request, Category


def login(request):
    return render(request,'login index.html')

def Login_post(request):
    username=request.POST['uname']
    password=request.POST['password']
    obj=Login.objects.filter(Username=username,Password=password)
    if obj.exists():
        obj0=Login.objects.get(Username=username,Password=password)
        request.session['lid']=obj0.id
        if obj0.Type=='admin':
            return HttpResponse("""<script>alert('login success');window.location='/myapp/admin_home/'</script>""")
        elif obj0.Type=='user':
            return HttpResponse("""<script>alert('login success');window.location='/myapp/User_home/'</script>""")

        elif obj0.Type=='organizer':
            return HttpResponse("""<script>alert('login success');window.location='/myapp/Organization_Home/'</script>""")
        else:
            return HttpResponse("""<script>alert('Invalid Login');window.location='/myapp/login/'</script>""")

    else:
        return HttpResponse("""<script>alert('Invalid Login');window.location='/myapp/login/'</script>""")

def admin_home(request):
    return render(request, 'Admin/admin index.html')

def Change_password(request):
    return render(request,'Admin/change password .html')


def Change_password_post(request):
    oldpassword=request.POST['opasswrd']
    newpassword=request.POST['npasswrd']
    confirmpassword=request.POST['cpasswrd']
    # id = request.session['lid']

    # l = Login.objects.get(id=id)
    if newpassword == confirmpassword:
        # if newpassword == confirmpassword:
        ov=Login.objects.get(id=request.session['lid'],Password=oldpassword)
        ov.Password=confirmpassword
        ov.save()
        return HttpResponse("""<script>alert('password changed');window.location='/myapp/login/'</script>""")
    else:
        return HttpResponse("""<script>alert('password faild');window.location='/myapp/Change_password/'</script>""")


def View_registerd_charity(request):
    obj=Organizer.objects.all()
    return render(request,'Admin/View registerd charity.html',{'hh':obj})

def view_reg_charity_post(request):
    search=request.POST['sname']
    obj = Organizer.objects.filter(Name__icontains=search)
    return render(request, 'Admin/View registerd charity.html', {'hh': obj})

def Approve_Charity(request,id):
    Login.objects.filter(id=id).update(Type='Organizer')
    s=Organizer.objects.filter(LOGIN_id=id).update(Status='Approved')
    return HttpResponse("""<script>alert('APPROVED');window.location='/myapp/View_registerd_charity/'</script>""")

def Reject_Charity(request,id):
    tt=Login.objects.filter(id=id).update(Type='Organizer')
    kk=Organizer.objects.filter(LOGIN_id=id).update(Status='Rejected')
    return HttpResponse("""<script>alert('REJECTED');window.location='/myapp/View_registerd_charity/'</script>""")

def View_Approved_reg_charity(request):
    ob1=Organizer.objects.filter(Status='Approved')
    return render(request,'Admin/View approved reg charity.html',{'va':ob1})

def view_appr_reg_charity_post(request):
    search=request.POST['sname']
    obj1 = Organizer.objects.filter(Name__icontains=search,Status='Approved')
    return render(request, 'Admin/View approved reg charity.html', {'va': obj1})


def View_Rejected_reg_charity(request):
    ob2=Organizer.objects.filter(Status='Rejected')
    return render(request,'Admin/View Rejected reg charity.html',{'vr':ob2})

def view_reje_reg_charity_post(request):
    search=request.POST['sname']
    obj2 = Organizer.objects.filter(Name__icontains=search,Status='Rejected')
    return render(request, 'Admin/View Rejected reg charity.html', {'vr': obj2})

def View_registerd_user(request):
    obj1=User.objects.all()
    return render(request,'Admin/View registerd user.html',{'vr':obj1})

def view_reg_user_post(request):
    search=request.POST['sname']
    obj1 = User.objects.filter(Name__icontains=search)
    return render(request, 'Admin/View registerd user.html',{'vr': obj1})


def View_complaint(request):
    obj2=Complaint.objects.all()
    return render(request,'Admin/View complaint.html',{'vc':obj2})

def Send_reply(request,id):
    obj3=Complaint.objects.get(id=id)
    return render(request,'Admin/Send Reply.html',{'sr':obj3})


def Send_Reply_post(request):
    id=request.POST['id']
    reply=request.POST['reply']

    obj3=Complaint.objects.get(id=id)
    obj3.Reply=reply
    obj3.Status='Replied'
    obj3.save()
    return HttpResponse("""<script>alert('Replied successfull');window.location='/myapp/View_complaint/'</script>""")

def Search_com(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj2=Complaint.objects.filter(Date__range=[from_date,to_date])
    return render(request,'Admin/View complaint.html',{'vc':obj2})


def View_Review_Rating(request):
    obj4=Review.objects.all()
    return render(request,'Admin/View Review and rating.html',{'rr':obj4})

def Search_review(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj4=Review.objects.filter(Date__range=[from_date,to_date])
    return render(request,'Admin/View Review and rating.html',{'rr':obj4})



def View_feedback_charity(request):
    obj5=Feedback.objects.all()
    return render(request,'Admin/View feedback charity.html',{'fb':obj5})

def Search_feedback(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj4=Feedback.objects.filter(Date__range=[from_date,to_date])
    return render(request,'Admin/View feedback charity.html',{'fb':obj4})




def Search_other_donation(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj6=OtherDonation.objects.filter(Date__range=[from_date,to_date])
    return render(request, 'Admin/View OtherDonation.html',{'od': obj6})

def View_Donation_Amount(request):
    obj7=Donation.objects.all()
    return render(request,'Admin/View Donation Amount.html',{'da':obj7})


def Search_donation_amount(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj5=Donation.objects.filter(Date__range=[from_date,to_date])
    return render(request, 'Admin/View Donation Amount.html', {'da':obj5})


def View_Other_Donation(request):
    obj6=OtherDonation.objects.all()
    return render(request,'Admin/View OtherDonation.html',{'od':obj6})





###############################################################################################

def Organization_Home(request):
    return render(request,'Organizer/org index.html')

def Cpassword(request):
    return render(request,'Organizer/change password org .html')

def Cpassword_post(request):
    oldpassword=request.POST['opasswrd']
    newpassword=request.POST['npasswrd']
    confirmpassword=request.POST['cpasswrd']
    # id = request.session['lid']

    # l = Login.objects.get(id=id)
    if newpassword == confirmpassword:
        # if newpassword == confirmpassword:
        ov=Login.objects.get(id=request.session['lid'],Password=oldpassword)
        ov.Password=confirmpassword
        ov.save()
        return HttpResponse("""<script>alert('password changed');window.location='/myapp/login/'</script>""")
    else:
        return HttpResponse("""<script>alert('password faild');window.location='/myapp/Cpassword/'</script>""")
    # elif:
        return HttpResponse("""<script>alert('You must login first');window.location='/myapp/login/'</script>""")


def Org_Registration(request):
    return render(request,'Organizer/signup index.html')

def Org_registration_post(request):
    Image=request.FILES['image']
    Name=request.POST['name']
    Place=request.POST['place']
    District=request.POST['district']
    Post=request.POST['post']
    Pin=request.POST['pin']
    PhoneNumber=request.POST['phnno']
    Password=request.POST['password']
    Confirmpassword=request.POST['cpassword']


    date = datetime.now().strftime('%y%m%d-%H%M%S') + '.jpg'
    fs = FileSystemStorage()
    fs.save(date, Image )
    path = fs.url(date)

    l = Login()
    l.Username = Name
    l.Password = Confirmpassword
    l.Type = 'organizer'
    l.save()

    ob=Organizer()
    ob.Image=path
    ob.Name=Name
    ob.Place=Place
    ob.District=District
    ob.Post=Post
    ob.Pin=Pin
    ob.PhoneNumber=PhoneNumber
    ob.LOGIN=l
    ob.save()
    return HttpResponse("<script>alert('successfully');window.location='/myapp/login/'</script>")


def view_reg_profile(request):
    objj=Organizer.objects.get(LOGIN_id=request.session['lid'])
    return render(request,'Organizer/View reg profile.html',{'i':objj})





def edit_profile(request,id):
    obje=Organizer.objects.get(id=id)
    return render(request,'Organizer/Edit reg profile.html',{'ep':obje})

def Edit_profile_post(request):
    # Image=request.FILES['image']
    Name=request.POST['name']
    Place=request.POST['place']
    District=request.POST['district']
    Post=request.POST['post']
    Pin=request.POST['pin']
    Phonenumber=request.POST['phnno']
    id=request.POST['id']

    obj11=Organizer.objects.get(id=id)
    if 'image' in request.FILES:
        image = request.FILES['image']
        var = FileSystemStorage()

        ww = datetime.now().strftime('%Y%m%d%H%M%S') + '.jpg'
        var.save(ww, image)
        path = var.url(ww)
        obj11.Image = path
        obj11.save()

    # obj11.Image=Image
    obj11.Name=Name
    obj11.Place=Place
    obj11.District=District
    obj11.Post=Post
    obj11.Pin=Pin
    obj11.PhoneNumber=Phonenumber
    obj11.save()
    return HttpResponse("""<script>alert('Edited');window.location='/myapp/view_reg_profile/'</script>""")

def Add_donation_request(request):
    return render(request,'Organizer/Add donation request.html')

def Add_donation_request_post(request):
    date=request.POST['date']
    purpose=request.POST['purpose']
    description=request.POST['description']
    filename=request.POST['filename']
    donations=request.POST['donations']
    needdate=request.POST['needdate']

    ad=Request()
    ad.Date=date
    ad.Purpose=purpose
    ad.Description=description
    ad.FileName=filename
    ad.Donations=donations
    ad.NeedDate=needdate
    ad.Status='pending'
    ad.ORGANIZER=Organizer.objects.get(LOGIN_id=request.session['lid'])
    ad.save()
    return HttpResponse("""<script>alert('Added');window.location='/myapp/Organization_Home/'</script>""")

def View_donation_request(request):
    vv=Request.objects.all()
    return render(request,'Organizer/View Donation request.html',{'ww':vv})

def Search_donation_req(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj6=Request.objects.filter(Date__range=[from_date,to_date])
    return render(request, 'Organizer/View Donation request.html',{'ww': obj6})

# def Approve_Donation_req(request,id):
#     Login.objects.filter(id=id).update(Type='Organizer')
#     Request.objects.filter(ORGANIZER_id=id).update(Status='Approved')
#     return HttpResponse("""<script>alert('APPROVED');window.location='/myapp/View_donation_request/'</script>""")
#
#
# def Reject_Donation_req(request,id):
#     Login.objects.filter(id=id).delete()
#     Request.objects.filter(ORGANIZER_id=id).update(Status='Rejected')
#     return HttpResponse("""<script>alert('REJECTED');window.location='/myapp/View_donation_request/'</script>""")

def View_approved_don_req(request):
    gg=Request.objects.filter(Status='Approved')
    return render(request,'Organizer/View Approved Donation request.html',{'vad':gg})

def Search_appr_don_req(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj6=Request.objects.filter(Date__range=[from_date,to_date])
    return render(request, 'Organizer/View Approved Donation request.html',{'vad': obj6})



def View_Rejected_don_req(request):
    hh=Request.objects.filter(Status='Rejected')
    return render(request,'Organizer/View Rejected Donation request.html',{'vrd':hh})

def Search_rej_don_req(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj6=Request.objects.filter(Date__range=[from_date,to_date])
    return render(request, 'Organizer/View Rejected Donation request.html',{'vrd': obj6})


def Edit_donation_request(request,id):
    ee=Request.objects.get(id=id)
    return render(request,'Organizer/Edit donation request.html',{'ed':ee})

def Edit_donation_request_post(request):
    date=request.POST['date']
    purpose=request.POST['purpose']
    description=request.POST['description']
    filename=request.POST['filename']
    donations=request.POST['donations']
    needdate=request.POST['needdate']
    id=request.POST['id']

    obe=Request.objects.get(id=id)
    obe.Date=date
    obe.Purpose=purpose
    obe.Description=description
    obe.FileName=filename
    obe.Donations=donations
    obe.NeedDate=needdate
    obe.save()
    return HttpResponse("""<script>alert('Edited');window.location='/myapp/View_donation_request/'</script>""")


def Delete_donation_request(request,id):
    dd=Request.objects.get(id=id).delete()
    return HttpResponse("""<script>alert('Deleted Successfull');window.location='/myapp/Organization_Home/'</script>""")


def View_donation_from_user_amt(request):
    obb=Donation.objects.all()
    return render(request,'Organizer/View donation amt user.html',{'dau':obb})

def Search_don_amt_user(request):
    from_date = request.POST['fdate']
    to_date = request.POST['tdate']
    oob = Donation.objects.filter(Date__range=[from_date, to_date])
    return render(request, 'Organizer/View donation amt user.html', {'dau':oob })


def View_dona_frm_user_other(request):
    ojj=OtherDonation.objects.all()
    return render(request,'Organizer/View donation other user.html',{'dao':ojj})

def Search_don_user_other(request):
    from_date = request.POST['fdate']
    to_date = request.POST['tdate']
    ojjb = OtherDonation.objects.filter(Date__range=[from_date, to_date])
    return render(request, 'Organizer/View donation other user.html', {'dao': ojjb})

def Add_category(request):
    return render(request,'Organizer/Add category.html')

def Add_category_post(request):
    name=request.POST['name']


    ac=Category()
    ac.Name=name
    ac.ORGANIZER=Organizer.objects.get(LOGIN_id=request.session['lid'])
    ac.save()
    return HttpResponse("""<script>alert('Successfully Added');window.location='/myapp/Organization_Home/'</script>""")

def View_category(request):
    vv=Category.objects.all()
    return render(request,'Organizer/View category.html',{'vc':vv})

def view_cate_post(request):
    search=request.POST['category']
    vv = Category.objects.filter(Name__icontains=search)
    return render(request, 'Organizer/View category.html', {'vc': vv})


def Edit_category(request,id):
    cc=Category.objects.get(id=id)
    return render(request,'Organizer/Edit category.html',{'ec':cc})

def Edit_category_post(request):
    name=request.POST['name']
    id = request.POST['id']

    ll=Category.objects.get(id=id)
    ll.Name=name
    ll.save()
    return HttpResponse("""<script>alert('Edited');window.location='/myapp/View_category/'</script>""")

def Delete_category(request,id):
    pp=Category.objects.get(id=id).delete()
    return HttpResponse("""<script>alert('Deleted Successfull');window.location='/myapp/Organization_Home/'</script>""")




##########################################################################


def User_home(request):
    return render(request,'User/user index.html')


def change_pw_user(request):
    return render(request,'User/change password User .html')

def cpasswrd_user_post(request):
    oldpassword = request.POST['opasswrd']
    newpassword = request.POST['npasswrd']
    confirmpassword = request.POST['cpasswrd']
    # id = request.session['lid']

    # l = Login.objects.get(id=id)
    if newpassword == confirmpassword:
        # if newpassword == confirmpassword:
        ov = Login.objects.get(id=request.session['lid'], Password=oldpassword)
        ov.Password = confirmpassword
        ov.save()
        return HttpResponse("""<script>alert('password changed');window.location='/myapp/login/'</script>""")
    else:
        return HttpResponse("""<script>alert('password faild');window.location='/myapp/change_pw_user/'</script>""")
        # elif:
        return HttpResponse("""<script>alert('You must login first');window.location='/myapp/login/'</script>""")



def User_Registration(request):
    return render(request,'User/u_signup index.html')

def User_registration_post(request):
    image=request.FILES['image']
    name=request.POST['name']
    dob=request.POST['dob']
    place=request.POST['place']
    district=request.POST['district']
    post=request.POST['post']
    pin=request.POST['pin']
    phnonenumber=request.POST['phnno']
    passwod=request.POST['password']
    conpwd=request.POST['cpassword']

    # from datetime import datetime
    date = datetime.now().strftime('%y%m%d-%H%M%S') + '.jpg'
    fs = FileSystemStorage()
    fs.save(date, image)
    path = fs.url(date)

    l = Login()
    l.Username = name
    l.Password = conpwd
    l.Type = 'user'
    l.save()

    obb=User()
    obb.Image=path
    obb.Name=name
    obb.Dob=dob
    obb.Place=place
    obb.District=district
    obb.Post=post
    obb.Pin=pin
    obb.PhoneNumber=phnonenumber
    obb.LOGIN = l
    obb.save()
    return HttpResponse("<script>alert('successfully');window.location='/myapp/login/'</script>")

def View_user_profile(request):
    us=User.objects.get(LOGIN_id=request.session['lid'])
    return render(request,'User/View user profile.html',{'i':us})

def Edit_user_profile(request,id):
    ep=User.objects.get(id=id)
    return render(request,'User/edit user profile.html',{'eup':ep})

def Edit_user_profile_post(request):
    name=request.POST['name']
    dob=request.POST['dob']
    place=request.POST['place']
    district=request.POST['district']
    post=request.POST['post']
    pin=request.POST['pin']
    phonenumber=request.POST['phnno']
    id = request.POST['id']

    obj12=User.objects.get(id=id)

    if 'image' in request.FILES:
        image = request.FILES['image']
        var = FileSystemStorage()
        # from datetime import datetime
        ww = datetime.now().strftime('%Y%m%d%H%M%S') + '.jpg'
        var.save(ww, image)
        path = var.url(ww)
        obj12.Image = path
        obj12.save()


    obj12.Name=name
    obj12.Dob=dob
    obj12.Place=place
    obj12.District=district
    obj12.Post=post
    obj12.Pin=pin
    obj12.PhoneNumber=phonenumber
    obj12.save()
    return HttpResponse("""<script>alert('Edited');window.location='/myapp/View_user_profile/'</script>""")

def View_Approved_charity(request):
    ob1=Organizer.objects.filter(Status='Approved')
    return render(request,'User/View approved charity.html',{'vac':ob1})

def Uview_donation_request(request):
    vv=Request.objects.all()
    return render(request,'User/User View Donation request.html',{'kk':vv})

def Search_donation_request(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj6=Request.objects.filter(Date__range=[from_date,to_date])
    return render(request, 'User/User View Donation request.html',{'kk': obj6})

def UV_Approve_Donation_req(request,id):
    Login.objects.filter(id=id).update(Type='Organizer')
    Request.objects.filter(id=id).update(Status='Approved')
    return HttpResponse("""<script>alert('APPROVED');window.location='/myapp/Uview_donation_request/'</script>""")


def UV_Reject_Donation_req(request,id):
    Login.objects.filter(id=id).delete()
    Request.objects.filter(id=id).update(Status='Rejected')
    return HttpResponse("""<script>alert('REJECTED');window.location='/myapp/Uview_donation_request/'</script>""")

# def Search_donation_request(request):
#     from_date=request.POST['fdate']
#     to_date=request.POST['tdate']
#     obj6=Request.objects.filter(Date__range=[from_date,to_date])
#     return render(request, 'User/User View Donation request.html',{'kk': obj6})

def Send_Amount(request):
    category=Category.objects.all()
    return render(request,'User/Send Amount.html',{'sa':category})


def Send_Amount_post(request):
    Amount=request.POST['amount']
    category=request.POST['category']

    obj01=Donation()
    obj01.Amount=Amount
    obj01.Status='Paid'
    obj01.Date=datetime.now().today()
    obj01.CATEGORY_id=category
    obj01.USER=User.objects.get(LOGIN_id=request.session['lid'])

    obj01.save()
    return HttpResponse("""<script>alert('Send successfull');window.location='/myapp/User_home/'</script>""")

def Send_Other(request):
    cate=Category.objects.all()
    return render(request,'User/Send Other donation.html',{'so':cate})

def Send_other_post(request):
    Other=request.POST['other']
    category=request.POST['category']

    so=OtherDonation()
    so.Other=Other
    so.Status='Paid'
    so.Date=datetime.now().today()
    so.CATEGORY_id=category
    so.USER=User.objects.get(LOGIN_id=request.session['lid'])
    so.save()
    return HttpResponse("""<script>alert('Send successfull');window.location='/myapp/User_home/'</script>""")


def Vview_Donation_amt(request):
    obj7=Donation.objects.all()
    return render(request,'User/View donation Amount.html',{'va':obj7})

def Search_donation_amount(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj5=Donation.objects.filter(Date__range=[from_date,to_date])
    return render(request, 'User/View donation Amount.html', {'va':obj5})


def Vview_Other_Donation(request):
    obj6=OtherDonation.objects.all()
    return render(request,'User/View other donation Amount.html',{'kk':obj6})


def Search_other_donation(request):
    from_date=request.POST['fdate']
    to_date=request.POST['tdate']
    obj6=OtherDonation.objects.filter(Date__range=[from_date,to_date])
    return render(request, 'User/View other donation Amount.html',{'kk': obj6})








def Send_complaint(request):
    return render(request,'User/Send Complaint.html')
def Send_complaint_post(request):
    complaint=request.POST['complaint']
    obt=Complaint()
    obt.Complaint=complaint
    obt.Reply='Pending'
    obt.Status='Pending'
    obt.Date=datetime.now().today()
    obt.USER=User.objects.get(LOGIN__id=request.session['lid'])
    obt.save()
    return HttpResponse("""<script>alert('Complaint send successfull');window.location='/myapp/User_home/'</script>""")

def View_reply(request):
    cc=Complaint.objects.all()
    return render(request,'User/View Reply.html',{'bb':cc})

def Search_reply(request):
    from_date=request.POST['fdate']
    to_date=request.POST['Tdate']
    sr=Complaint.objects.filter(Date__range=[from_date,to_date])
    return render(request,'User/View Reply.html',{'bb':sr})

def Send_Review(request):
    return render(request,'User/Send review.html')

def Send_review_post(request):
    review=request.POST['review']
    rating=request.POST['rating']

    print(rating)

    oo=Review()
    oo.Review=review
    oo.Rating=rating
    oo.Date=datetime.now().today()
    oo.USER=User.objects.get(LOGIN_id=request.session['lid'])
    oo.save()
    return HttpResponse("""<script>alert('Send successfull');window.location='/myapp/User_home/'</script>""")




def Send_Feedback(request):
    return render(request,'User/Send Feedback.html')

def Send_feedback_post(request):
    feedback=request.POST['feedback']

    ff=Feedback()
    ff.Feedback=feedback
    ff.Date=datetime.now().today()
    ff.USER=User.objects.get(LOGIN_id=request.session['lid'])
    ff.save()
    return HttpResponse("""<script>alert('Send successfull');window.location='/myapp/User_home/'</script>""")





