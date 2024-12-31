"""Charity1 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from myapp import views

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('login/',views.login),
    path('Login_post/',views.Login_post),
    path('admin_home/',views.admin_home),
    path('Change_password/',views.Change_password),
    path('Change_password_post/',views.Change_password_post),
    path('View_registerd_charity/',views.View_registerd_charity),
    path('view_reg_charity_post/',views.view_reg_charity_post),
    path('View_registerd_user/',views.View_registerd_user),
    path('view_reg_user_post/',views.view_reg_user_post),
    path('Approve_Charity/<id>',views.Approve_Charity),
    path('Reject_Charity/<id>',views.Reject_Charity),
    path('View_Approved_reg_charity/', views.View_Approved_reg_charity),
    path('view_appr_reg_charity_post/',views.view_appr_reg_charity_post),
    path('View_Rejected_reg_charity/', views.View_Rejected_reg_charity),
    path('view_reje_reg_charity_post/', views.view_reje_reg_charity_post),
    path('View_complaint/',views.View_complaint),
    path('Send_reply/<id>',views.Send_reply),
    path('Send_Reply_post/',views.Send_Reply_post),
    path('Search_com/',views.Search_com),
    path('View_Review_Rating/',views.View_Review_Rating),
    path('Search_review/',views.Search_review),
    path('View_feedback_charity/',views.View_feedback_charity),
    path('Search_feedback/',views.Search_feedback),
    path('View_Donation_Amount/',views.View_Donation_Amount),
    path('Search_donation_amount/',views.Search_donation_amount),
    path('View_Other_Donation/',views.View_Other_Donation),
    path('Search_other_donation/',views.Search_other_donation),
    path('Organization_Home/',views.Organization_Home),
    path('Org_Registration/',views.Org_Registration),
    path('Org_registration_post/',views.Org_registration_post),
    path('Cpassword/',views.Cpassword),
    path('Cpassword_post/',views.Cpassword_post),
    path('edit_profile/<id>',views.edit_profile),
    path('Edit_profile_post/',views.Edit_profile_post),
    path('view_reg_profile/',views.view_reg_profile),
    path('Add_donation_request/',views.Add_donation_request),
    path('Add_donation_request_post/',views.Add_donation_request_post),
    path('View_donation_request/',views.View_donation_request),
    path('Search_donation_req/',views.Search_donation_req),
    # path('Approve_Donation_req/<id>',views.Approve_Donation_req),
    # path('Reject_Donation_req/<id>',views.Reject_Donation_req),
    path('View_approved_don_req/',views.View_approved_don_req),
    path('Search_appr_don_req/',views.Search_appr_don_req),
    path('View_Rejected_don_req/',views.View_Rejected_don_req),
    path('Search_rej_don_req/',views.Search_rej_don_req),
    path('Edit_donation_request/<id>',views.Edit_donation_request),
    path('Edit_donation_request_post/',views.Edit_donation_request_post),
    path('Delete_donation_request/<id>',views.Delete_donation_request),
    path('View_donation_from_user_amt/',views.View_donation_from_user_amt),
    path('Search_don_amt_user/',views.Search_don_amt_user),
    path('View_dona_frm_user_other/',views.View_dona_frm_user_other),
    path('Search_don_user_other/',views.Search_don_user_other),
    path('Add_category/',views.Add_category),
    path('Add_category_post/',views.Add_category_post),
    path('View_category/',views.View_category),
    path('view_cate_post/',views.view_cate_post),
    path('Edit_category/<id>',views.Edit_category),
    path('Edit_category_post/',views.Edit_category_post),
    path('Delete_category/<id>',views.Delete_category),
    path('User_home/',views.User_home),
    path('change_pw_user/',views.change_pw_user),
    path('cpasswrd_user_post/',views.cpasswrd_user_post),
    path('User_Registration/',views.User_Registration),
    path('User_registration_post/',views.User_registration_post),
    path('View_user_profile/',views.View_user_profile),
    path('Edit_user_profile/<id>',views.Edit_user_profile),
    path('Edit_user_profile_post/',views.Edit_user_profile_post),
    path('View_Approved_charity/',views.View_Approved_charity),
    path('Uview_donation_request/',views.Uview_donation_request),
    path('UV_Approve_Donation_req/<id>',views.UV_Approve_Donation_req),
    path('UV_Reject_Donation_req/<id>',views.UV_Reject_Donation_req),


    path('Search_donation_request/',views.Search_donation_request),
    path('Send_Amount/',views.Send_Amount),
    path('Send_Amount_post/',views.Send_Amount_post),
    path('Send_Other/',views.Send_Other),
    path('Send_other_post/',views.Send_other_post),
    path('Vview_Donation_amt/',views.Vview_Donation_amt),
    path('Search_donation_amount/',views.Search_donation_amount),
    path('Vview_Other_Donation/',views.Vview_Other_Donation),
    path('Search_other_donation/',views.Search_other_donation),
    path('Send_complaint/',views.Send_complaint),
    path('Send_complaint_post/',views.Send_complaint_post),
    path('View_reply/',views.View_reply),
    path('Search_reply/',views.Search_reply),
    path('Send_Review/',views.Send_Review),
    path('Send_review_post/',views.Send_review_post),
    path('Send_Feedback/',views.Send_Feedback),
    path('Send_feedback_post/',views.Send_feedback_post),
    
]
