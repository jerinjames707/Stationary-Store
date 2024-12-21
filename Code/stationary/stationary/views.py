from django.http import HttpResponse,HttpResponseRedirect,HttpResponseNotAllowed
from django.shortcuts import render
from django.shortcuts import redirect,get_object_or_404
from django.urls import reverse
from  django.core.files.storage import FileSystemStorage
from urllib.parse import urlencode
from .models import *
from django.db.models import Q
from django.db.models import Sum
from decimal import Decimal
def first(request):
    return render(request,'index.html')

def index(request):
    return render(request,'index.html')


def cus_register(request):
    if request.method=="POST":
        fname=request.POST.get('fname')
        lname=request.POST.get('lname')
        district=request.POST.get('district')
        street=request.POST.get('street')
        phone=request.POST.get('phone')
        gender=request.POST.get('gender')
        dob=request.POST.get('dob')
        email=request.POST.get('email')
        password=request.POST.get('password')
        if customer_reg.objects.filter(email=email).exists() or staff_reg.objects.filter(email=email).exists() or tbl_courier.objects.filter(email=email).exists():
            # Email already exists, display an alert message
            return render(request, 'cus_register.html', {'msg': 'Email already exists. Please use a different email.'})
       
        cus=customer_reg(fname=fname,lname=lname,district=district,street=street,phone=phone,gender=gender,dob=dob,email=email,password=password)
        cus.save()
        cus1= tbl_login(email=email,password=password,user_type='customer')
        cus1.save()
        return render(request,"index.html", {'message':'Succesfully Registered'})
    else:
        return render(request,"cus_register.html")
    
def login(request):
    return render(request,'login.html')

def addlogin(request):
    email = request.POST.get('email')
    password = request.POST.get('password')
    if email == 'admin@gmail.com' and password =='admin':
        request.session['logintdetail'] = email
        request.session['admin'] = 'admin'
        return redirect(dash)
    elif customer_reg.objects.filter(email=email, password=password).exists():
        userdetails = customer_reg.objects.get(email=request.POST['email'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['cuid'] = userdetails.id
            request.session['cuname'] = userdetails.fname
            request.session['cuemail'] = email
            customer_id = request.session.get('cuid')
            cart_master_obj = cart_master.objects.filter(customert_id=customer_id,cart_status='Active').first()  # Use filter and first to handle non-existence
            if cart_master_obj:
                master_id = cart_master_obj.id
                cart_child_items = cart_child.objects.filter(cart_master_id=master_id)
                total_products = cart_child_items.count()
            else:
                total_products = 0  # No cart items for this user
            request.session['carttotalitem'] = total_products
            return redirect(index)
        
    elif staff_reg.objects.filter(email=email,password=password).exists():
        userdetails=staff_reg.objects.get(email=request.POST['email'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['sid'] = userdetails.id
            request.session['sname'] = userdetails.fname
            request.session['semail'] = email

            return redirect(dash)
        
    elif tbl_courier.objects.filter(email=email,password=password).exists():
        userdetails=tbl_courier.objects.get(email=request.POST['email'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['coid'] = userdetails.id
            request.session['coname'] = userdetails.co_name
            request.session['coemail'] = email

            return redirect(dash)
   
    else:
        return render(request, 'login.html', {'message':'Invalid Email or Password'})
    
def logout(request):
    session_keys = list(request.session.keys())
    for key in session_keys:
        del request.session[key]
    return redirect(first)

#Admin
def dash(request):
    return render(request,'admin/index.html')

def staff_register(request):
    if request.method=="POST":
        fname=request.POST.get('fname')
        lname=request.POST.get('lname')
        district=request.POST.get('district')
        street=request.POST.get('street')
        phone=request.POST.get('phone')
        gender=request.POST.get('gender')
        dob=request.POST.get('dob')
        email=request.POST.get('email')
        password=request.POST.get('password')
        if customer_reg.objects.filter(email=email).exists() or staff_reg.objects.filter(email=email).exists() or tbl_courier.objects.filter(email=email).exists():
                 # Email already exists, display an alert message
            return render(request, 'admin/addstaff.html', {'msg': 'Email already exists. Please use a different email.'})

       
        cus=staff_reg(fname=fname,lname=lname,district=district,street=street,phone=phone,gender=gender,dob=dob,email=email,password=password)
        cus.save()
        cus1= tbl_login(email=email,password=password,user_type='staff')
        cus1.save()
        return render(request,"admin/index.html", {'message':'Succesfully Registered'})
    else:
        return render(request,"admin/addstaff.html")
    
def view_staff(request):
    staff=staff_reg.objects.all()
    return render(request,'admin/viewstaff.html',{'result':staff})

def removestaff(request,id):
    staff=staff_reg.objects.get(id=id)
    staff.delete()
    return redirect(view_staff)


def view_cus(request):
    staff=customer_reg.objects.all()
    return render(request,'admin/viewcustomer.html',{'result':staff})


def removecustomer(request,id):
    staff=customer_reg.objects.get(id=id)
    staff.delete()
    return redirect(view_cus)

def add_category(request):
    if request.method=="POST":
        category_name=request.POST.get('category_name')
        
        cus=category(category_name=category_name)
        cus.save()
        cat=category.objects.all()
        return render(request,"admin/addcategory.html", {'msg':'Succesfully Added','result':cat})
    else:
        cat=category.objects.all()
        return render(request,"admin/addcategory.html",{'result':cat})
    
def add_subcategory(request):   
    if request.method=="POST":
        subcat_name=request.POST.get('subcat_name')
        cat_id=request.POST.get('cat_id')
        
        cus=subcategory(subcat_name=subcat_name,category_id=cat_id)
        cus.save()
        cat=category.objects.all()
    return render(request,"admin/index.html", {'message':'Succesfully Added','result':cat})

def view_category(request):
    categories=category.objects.all()
    return render(request,'admin/view_category.html',{'categories':categories})

def remove_category(request, category_id):
    categoryy = get_object_or_404(category, pk=category_id) 
    # Delete associated subcategories
    subcategory.objects.filter(category=categoryy).delete()
    # Delete the category
    categoryy.delete()
    return redirect(view_category) 

def add_items(request):
    sub_categories=subcategory.objects.all()
    categories=category.objects.all()
    return render(request,"admin/item_add.html",{'sub_categories':sub_categories,'categories':categories})

def add_items_insert(request):
    if request.method=="POST":
        item_name=request.POST.get('item_name')
        cat_id=request.POST.get('cat_id')
        subcat_id=request.POST.get('subcat_id')
        item_desc=request.POST.get('item_desc')
        item_price=request.POST.get('item_price')
        item_status=request.POST.get('item_status')
        item_brand=request.POST.get('item_brand')
        myfile=request.FILES['image']
        fs= FileSystemStorage()
        filename=fs.save(myfile.name,myfile)
       
        cus=items_tbl(cat_id=cat_id,subcat_id =subcat_id,item_name=item_name,item_desc=item_desc,item_price=item_price,item_status=item_status,item_brand=item_brand,item_image=filename,item_stock='0')
        cus.save()
        return render(request,"admin/index.html", {'message':'Succesfully Added'})
    
def view_items_admin(request):
    items=items_tbl.objects.all()
    categories=category.objects.all()
    for i in items:
        for j in categories:
            if i.cat_id == str(j.id):
                i.cat_id=j.category_name
    return render(request,'admin/view_items.html',{'items':items})

def removeitem(request,id):
    staff=items_tbl.objects.get(id=id)
    staff.delete()
    return redirect(view_items_admin)

def edititem(request,id):
    items=items_tbl.objects.get(id=id)
    return render(request,'admin/edititem.html',{'result':items})

def addedititem(request,id):
    if request.method=="POST":
        item_name=request.POST.get('item_name')
        cat_id=request.POST.get('cat_id')
        subcat_id=request.POST.get('subcat_id')
        item_desc=request.POST.get('item_desc')
        item_price=request.POST.get('item_price')
        item_status=request.POST.get('item_status')
        item_brand=request.POST.get('item_brand')
        filename=request.POST.get('image')
        item_stock=request.POST.get('item_stock')

       
        cus=items_tbl(cat_id=cat_id,subcat_id =subcat_id,item_name=item_name,item_desc=item_desc,item_price=item_price,item_status=item_status,item_brand=item_brand,item_image=filename,item_stock=item_stock,id=id)
        cus.save()
        return redirect(view_items_admin)
    
def courier_manage(request):
    if request.method=="POST":
        co_name=request.POST.get('co_name')
        co_city=request.POST.get('co_city')
        co_dist=request.POST.get('co_dist')
        co_pin=request.POST.get('co_pin')
        co_street=request.POST.get('co_street')
        co_phone=request.POST.get('co_phone')
        email=request.POST.get('email')
        password=request.POST.get('password')
        staff_id = request.session.get('sid', 'admin')
        if customer_reg.objects.filter(email=email).exists() or staff_reg.objects.filter(email=email).exists() or tbl_courier.objects.filter(email=email).exists():
            # Email already exists, display an alert message
            return render(request, 'admin/add_courier.html', {'msg': 'Email already exists. Please use a different email.'})

        cus=tbl_courier(staff_id=staff_id,co_name=co_name,co_city=co_city,co_dist=co_dist,co_pin=co_pin,co_street=co_street,co_phone=co_phone,email=email,password=password,co_status='Active')
        cus.save()
        cus1= tbl_login(email=email,password=password,user_type='courier')
        cus1.save()
        cat=tbl_courier.objects.all()
        return render(request,"admin/courier.html", {'msg':'Succesfully Added','result':cat})
    else:
        cat=tbl_courier.objects.all()
        return render(request,"admin/courier.html",{'result':cat})
    
def add_courier(request):
    return render(request,'admin/add_courier.html')

def edit_courier(request,id):
    if request.method=="POST":
        co_name=request.POST.get('co_name')
        co_city=request.POST.get('co_city')
        co_dist=request.POST.get('co_dist')
        co_pin=request.POST.get('co_pin')
        co_street=request.POST.get('co_street')
        co_phone=request.POST.get('co_phone')
        email=request.POST.get('email')
        password=request.POST.get('password')
        co_status=request.POST.get('co_status')
        staff_id = request.session.get('sid', 'admin')
        if customer_reg.objects.filter(email=email).exists() or staff_reg.objects.filter(email=email).exists():
            # Email already exists, display an alert message
            return render(request, 'admin/add_courier.html', {'msg': 'Email already exists. Please use a different email.'})

        cus=tbl_courier(staff_id=staff_id,co_name=co_name,co_city=co_city,co_dist=co_dist,co_pin=co_pin,co_street=co_street,co_phone=co_phone,email=email,password=password,co_status=co_status,id=id)
        cus.save()
        return redirect(courier_manage)
    else:
        cou=tbl_courier.objects.get(id=id)
        return render(request,'admin/edit_courier.html',{'result':cou})
    
def remove_courier(request,id):
    co_detail = get_object_or_404(tbl_courier, id=id)
    co_detail.delete()
    return redirect(courier_manage)


def admin_sales_view(request):
    # Fetch all payment details
    payment_details = tbl_payment.objects.all()

    # Initialize a dictionary to store the results grouped by cart_master_id
    result_dict = defaultdict(list)

    # Iterate through each payment detail
    for payment in payment_details:
        # Retrieve cart master for the payment
        cart_master_obj = cart_master.objects.filter(id=payment.cart_master_id).first()

        if cart_master_obj:
            # Extract user_id and item_ids
            user_id = cart_master_obj.customert_id
            cart_child_items = cart_child.objects.filter(cart_master_id=payment.cart_master_id)
            item_ids = [item.item_id for item in cart_child_items]

            # Fetch user details from customer_reg table
            user_details = customer_reg.objects.filter(id=user_id).first()

            # Calculate number of items and amount paid
            number_of_items = cart_child_items.count()
            amount_paid = cart_master_obj.cart_tot_amt
            pay_status = payment.status
            pay_date = payment.pay_date
            # Append user and item details along with number of items and amount paid to the result dictionary
            result_dict[cart_master_obj.id].append({'user_details': user_details,
                                                     'number_of_items': number_of_items,
                                                     'amount_paid': amount_paid,
                                                     'pay_status':pay_status,
                                                     'pay_date':pay_date})

    # Convert the dictionary to a list of grouped results
    result = [{'cart_master_id': cart_master_id, 'details': details}
              for cart_master_id, details in result_dict.items()]

    return render(request, 'admin/admin_sales_view.html', {'result': result})

def delivery_detail_admin(request, id):
    # Fetch delivery details
    delivery_details = tbl_delivery.objects.filter(cart_master_id=id)

    # Initialize an empty list to store the result
    result = []

    # Iterate through each delivery detail
    for delivery in delivery_details:
        # Retrieve the courier assign details based on cassign_id
        cassign_details = tbl_cassign.objects.filter(id=delivery.cassign_id).first()

        # Retrieve the courier company details based on courier_id
        courier_details = tbl_courier.objects.filter(id=cassign_details.courier_id).first()

        # Append the company name, phone, email, assign date, delivery date, and status to the result list
        result.append({
            'company_name': courier_details.co_name,
            'company_phone': courier_details.co_phone,
            'company_email': courier_details.email,
            'courier_assign_date': cassign_details.cassign_date,
            'delivery_date': delivery.del_date,
            'delivery_status': cassign_details.status
        })

    return render(request, 'admin/delivery_detail_admin.html', {'result': result})

#staff
def staff_profile(request):
    staff=staff_reg.objects.get(id=request.session['sid'] )
    return render(request,'admin/staff_profile.html',{'result':staff})

def vendor_register(request):
    if request.method=="POST":
        name=request.POST.get('name')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        street=request.POST.get('street')
        district=request.POST.get('district')
        state=request.POST.get('state')
        staff_id = request.session.get('sid', 'admin')
        if vendor.objects.filter(email=email).exists() or staff_reg.objects.filter(email=email).exists() or customer_reg.objects.filter(email=email).exists():
            # Email already exists, display an alert message
            return render(request, 'admin/vendor_register.html', {'msg': 'Email already exists. Please use a different email.'})
       
        cus=vendor(name=name,email=email,phone=phone,street=street,district=district,state=state,staff_id=staff_id)
        cus.save()
        return render(request,"admin/index.html",{'message':'Succesfully Registered'})
    else:
        return render(request,"admin/vendor_register.html")

   
def view_ven(request):
    staff=vendor.objects.all()
    return render(request,'admin/viewvendor.html',{'result':staff})

def removeven(request,id):
    staff=vendor.objects.get(id=id)
    staff.delete()
    return redirect(view_ven)

def purchase_item(request):
    if request.method=="POST":
        staff_id=request.session['sid']
        vendor_id=request.POST.get('vendor_id')
        pur_date=request.POST.get('pur_date')
        pur_tot_amt=request.POST.get('pur_tot_amt')
        ins=purchase_master(staff_id=staff_id,vendor_id=vendor_id,pur_date=pur_date,pur_tot_amt=pur_tot_amt)
        ins.save()
        return redirect(purchase_list)
    else:
        staff=vendor.objects.all() 
        return render(request,'admin/purchase_item.html',{'result':staff})

def purchase_list(request):
    purch=purchase_master.objects.all()
    ven=vendor.objects.all() 
    for i in purch:
        for j in ven:
            if str(i.vendor_id)==str(j.id):
                i.vendor_id=j.name            
    return render(request,'admin/purchase_list.html',{'result':purch})

def view_pur_details(request,id):
    purch=purchase_child.objects.filter(pur_master_id=id)
    itm=items_tbl.objects.all()
    for i in purch:
        for j in itm:
            if str(i.item_id)==str(j.id):
                i.item_id=j.item_name
    return render(request,'admin/view_pur_details.html',{'result':purch})

def purchase_add(request,id):
    purch=purchase_master.objects.get(id=id)
    items=items_tbl.objects.all()
    return render(request,'admin/purchase_item_child.html',{'result':purch,'result1':items})


def add_purchase_item(request):
    if request.method == "POST":
        pur_master_id = request.POST.get('pur_master_id')
        item_id = request.POST.get('item_id')
        pur_qty = float(request.POST.get('pur_qty'))
        unit_price = float(request.POST.get('unit_price'))
        stock = request.POST.get('stock')
        sell_price = request.POST.get('sell_price')
        tot_price = pur_qty * unit_price

        # Calculate the total amount of all child items
        purchase_child_total = purchase_child.objects.filter(pur_master_id=pur_master_id).aggregate(Sum('tot_price'))
        total_amount = purchase_child_total['tot_price__sum'] or 0

        # Retrieve the initial pur_tot_amt from purchase_master
        purchase_master_instance = purchase_master.objects.get(pk=pur_master_id)
        initial_pur_tot_amt = float(purchase_master_instance.pur_tot_amt)

        # Check if the total amount plus the new tot_price is less than or equal to the initial pur_tot_amt
        if total_amount + tot_price <= initial_pur_tot_amt:
            ins = purchase_child(pur_master_id=pur_master_id, item_id=item_id, pur_qty=pur_qty,
                                 unit_price=unit_price, stock=stock, sell_price=sell_price, tot_price=tot_price)
            ins.save()

            # Update item_price and item_stock in items_tbl
            item = items_tbl.objects.get(pk=item_id)
            item.item_price = sell_price  
            item.item_status = 'Available'  
            item.item_stock = float(item.item_stock) + pur_qty
            item.save()

            return redirect(purchase_list)
        else:
            # Handle the case where the total amount plus the new tot_price exceeds initial pur_tot_amt
            return render(request, 'admin/index.html', {'message': 'Total amount exceeds Total amount in corresponding purchase Master'})
        
from collections import defaultdict

def courier_assign(request):
    # Fetch all payment details
    payment_details = tbl_payment.objects.filter(status='paid')

    # Initialize a dictionary to store the results grouped by cart_master_id
    result_dict = defaultdict(list)

    # Iterate through each payment detail
    for payment in payment_details:
        # Retrieve cart master for the payment
        cart_master_obj = cart_master.objects.filter(id=payment.cart_master_id).first()

        if cart_master_obj:
            # Extract user_id and item_ids
            user_id = cart_master_obj.customert_id
            cart_child_items = cart_child.objects.filter(cart_master_id=payment.cart_master_id)
            item_ids = [item.item_id for item in cart_child_items]

            # Fetch user details from customer_reg table
            user_details = customer_reg.objects.filter(id=user_id).first()

            # Calculate number of items and amount paid
            number_of_items = cart_child_items.count()
            amount_paid = cart_master_obj.cart_tot_amt

            # Append user and item details along with number of items and amount paid to the result dictionary
            result_dict[cart_master_obj.id].append({'user_details': user_details,
                                                     'number_of_items': number_of_items,
                                                     'amount_paid': amount_paid})

    # Convert the dictionary to a list of grouped results
    result = [{'cart_master_id': cart_master_id, 'details': details}
              for cart_master_id, details in result_dict.items()]

    return render(request, 'admin/view_cassign.html', {'result': result})

def assign_courier(request,id):
    if request.method=="POST":
        courier_id=request.POST.get('courier_id')
        cassign_date=request.POST.get('cassign_date')
        ins=tbl_cassign(courier_id=courier_id,cassign_date=cassign_date,cart_master_id=id,status='pending')
        ins.save()
        cart_detail = get_object_or_404(tbl_payment, cart_master_id=id)
        cart_detail.status = 'Assigned'
        cart_detail.save()
        return render(request, 'admin/index.html', {'message': 'Assigned Successfully'})
    else:
        c_company=tbl_courier.objects.all()
        cart=cart_master.objects.get(id=id)
        return render(request,'admin/assign_courier.html',{'result':c_company,'cart':cart})






#Customer
def cus_profile(request):
    staff=customer_reg.objects.get(id=request.session['cuid'] )
    return render(request,'cus_profile.html',{'result':staff})

def view_products(request):
    items=items_tbl.objects.filter(item_status='Available')
    for item in items:
        item.item_stock = float(item.item_stock)
    return render(request,'products.html',{'result':items})

def search(request):
    if request.method == "POST":
        title = request.POST.get('title')
        crp = items_tbl.objects.filter(Q(item_name__icontains=title) | Q(item_brand__icontains=title),item_status='Available')
        return render(request,'products.html', {'result': crp})
    else:
        crp = items_tbl.objects.filter(item_status='Available')
        return render(request,'products.html', {'result': crp})

    
def add_to_cart(request, id):
    if request.method == "POST" or request.method == "GET":
        customer_id = request.session.get('cuid')
        if not customer_id:
            return HttpResponse("Invalid customer ID")

        item_id = id
        item_details = items_tbl.objects.get(id=item_id)
        item_price = float(item_details.item_price)

        # Check if there is an existing cart_master for the customer
        existing_cart_master = cart_master.objects.filter(customert_id=customer_id,cart_status='Active').first()

        if existing_cart_master:
            # If a cart_master exists, get the current cart_tot_amt
            current_cart_tot_amt = float(existing_cart_master.cart_tot_amt)

            # Update the total amount in the cart_master
            existing_cart_master.cart_tot_amt = str(current_cart_tot_amt + item_price)
            existing_cart_master.save()

            # Reduce item_stock in items_tbl
            # item_details.item_stock = item_stock - 1
            # item_details.save()

            # Add the item to the cart_child table with the existing master id
            cart_child_item = cart_child(cart_master_id=existing_cart_master.id, item_id=item_id,
                                         cart_qty=1, cart_price=item_price)
            cart_child_item.save()
        else:
            # If no cart_master exists, create a new cart_master and add the item to cart_child
            new_cart_master = cart_master(customert_id=customer_id, cart_tot_amt=str(item_price),cart_status='Active')
            new_cart_master.save()


            cart_child_item = cart_child(cart_master_id=new_cart_master.id, item_id=item_id,
                                         cart_qty=1, cart_price=item_price)
            cart_child_item.save()

        return redirect(viewcart)

    return HttpResponse("Invalid request method")

    
def viewcart(request):
    customer_id = request.session.get('cuid')
    try:
        cart_master_obj = cart_master.objects.get(customert_id=customer_id,cart_status='Active')
    except cart_master.DoesNotExist:
        # If cart_master object doesn't exist, the cart is empty
        return render(request, 'empty_cart.html')

    master_id = cart_master_obj.id
    cart_child_items = cart_child.objects.filter(cart_master_id=master_id)
    total_products = cart_child_items.count()
    request.session['carttotalitem'] = total_products
    
    # Fetch corresponding item details for each cart item
    cart_items_with_details = []
    for cart_item in cart_child_items:
        item_details = items_tbl.objects.get(id=cart_item.item_id)

        try:
            # Convert quantities and prices to floats
            qty = float(cart_item.cart_qty)
            price = float(item_details.item_price)

            # Calculate total price and round to two decimal places
            total_price = round(qty * price, 2)
        except ValueError:
            total_price = 0  # Set a default value in case of conversion errors

        cart_items_with_details.append({
            'cart_item': cart_item,
            'item_details': item_details,
            'total_price': total_price,
        })

    return render(request, 'cart.html', {'cart_items_with_details': cart_items_with_details, 'cart_master_obj': cart_master_obj})


def update_qnty(request, id):
    if request.method == "POST":
        updt_qnty = int(request.POST.get('updt_qnty'))
        cart_detail = cart_child.objects.get(id=id)

        # Get item details from items_tbl
               # Get item details from items_tbl
        item_detail = items_tbl.objects.get(id=cart_detail.item_id)



        # Update quantity in cart_child
        cart_detail.cart_qty = updt_qnty
        cart_detail.cart_price = updt_qnty * item_detail.item_price
        cart_detail.save()



        # Recalculate total price in cart_master
        cart_master_id = cart_detail.cart_master_id
        cart_child_instances = cart_child.objects.filter(cart_master_id=cart_master_id)
        total_amount = sum(child.cart_price for child in cart_child_instances)

        # Update cart_tot_amt in cart_master
        cart_master_detail = cart_master.objects.get(id=cart_master_id)
        cart_master_detail.cart_tot_amt = total_amount
        cart_master_detail.save()

        return redirect(viewcart)  # Assuming 'viewcart' is the correct URL name

    return render(request, 'index.html')


def remove_cart_item(request, id):
    # Get cart item details
    cart_detail = get_object_or_404(cart_child, id=id)
    cart_master_obj = cart_master.objects.get(id=cart_detail.cart_master_id)
    item_details = items_tbl.objects.get(id=cart_detail.item_id)

    # Remove item from cart_child
    cart_detail.delete()


    # Reduce cart_price from total_price in cart_master
    cart_master_obj.cart_tot_amt -= cart_detail.cart_price
    cart_master_obj.save()

    # Check if there are any remaining items for the same master ID
    remaining_items = cart_child.objects.filter(cart_master_id=cart_master_obj.id).exists()
    if not remaining_items:
        # If no remaining items, delete corresponding entry in cart_master table
        cart_master_obj.delete()

    # Redirect to viewcart page
    return redirect(viewcart)

def add_cards(request):
    if request.method == "POST":
        customer_id = request.session['cuid']
        customer_instance = customer_reg.objects.get(id=customer_id)
        card_holder = request.POST.get('card_holder')
        card_no = request.POST.get('card_no')
        exp_date = request.POST.get('exp_date')
        cvv = request.POST.get('cvv')
        
        ins = card(customer=customer_instance, card_holder=card_holder, card_no=card_no, exp_date=exp_date, cvv=cvv)
        ins.save()
        return render(request, 'index.html', {'message': 'Successfully Added'})
    else:
        return render(request, 'add_cards.html')


def view_cards(request):
    card_dtl=card.objects.filter(customer=request.session['cuid'])
    return render(request,'view_cards.html',{'result':card_dtl})


def checkout(request,id):
    crd_mstr=cart_master.objects.get(id=id)
    user_details=customer_reg.objects.get(id=crd_mstr.customert_id)
    card_dtl=card.objects.filter(customer=request.session['cuid'])
    return render(request,'checkout.html',{'result':crd_mstr,'result1':user_details,'card_dtl':card_dtl})



def my_purchases(request):
    try:
        # Fetch cart details for the current user where cart_status = Deactive
        cart_dtls = cart_master.objects.filter(customert_id=request.session['cuid'], cart_status='Deactive')

        # Initialize lists to store purchase details
        purchase_details = []

        # Iterate through each cart detail
        for cart_dtl in cart_dtls:
            # Fetch payment details based on the cart master
            pay_tbl = tbl_payment.objects.filter(cart_master_id=cart_dtl.id).first()

            # Fetch delivery details based on the cart master
            delivery_details = tbl_delivery.objects.filter(cart_master_id=cart_dtl.id).first()

            # Fetch items purchased based on the cart master
            cart_items = cart_child.objects.filter(cart_master_id=cart_dtl.id)

            # Calculate total items and total amount
            total_items = cart_items.count()
            total_amount = cart_dtl.cart_tot_amt

            # Prepare a list to store item names
            item_names = []

            # Retrieve item names based on item IDs
            for cart_item in cart_items:
                item = items_tbl.objects.get(id=cart_item.item_id)
                item_names.append(item.item_name)

            # Prepare a dictionary with purchase details for this cart
            purchase_detail = {
                'cart_dtl': cart_dtl.id,
                'item_names': item_names,
                'total_items': total_items,
                'total_amount': total_amount,
                'purchase_date': pay_tbl.pay_date if pay_tbl else None,
                'delivery_date': delivery_details.del_date if delivery_details else None
            }

            # Append the purchase detail to the list
            purchase_details.append(purchase_detail)

        # Prepare context data to pass to the template
        context = {
            'purchase_details': purchase_details
        }

        return render(request, 'my_purchases.html', context)
    except Exception as e:
        # Handle exceptions, such as if the user's cart or payment details are not found
        print(e)  # Print the error for debugging purposes
        return render(request, '404.html')

def view_bill(request, cart_master_id):
    try:
        # Fetch cart details based on the cart master ID
        cart_dtl = cart_master.objects.get(id=cart_master_id)

        # Fetch payment details based on the cart master
        pay_tbl = tbl_payment.objects.filter(cart_master_id=cart_dtl.id).first()

        # Fetch delivery details based on the cart master
        delivery_details = tbl_delivery.objects.filter(cart_master_id=cart_dtl.id).first()

        # Fetch items purchased based on the cart master
        cart_items = cart_child.objects.filter(cart_master_id=cart_dtl.id)

        # Prepare a list to store item details
        item_details = []

        # Retrieve item details based on item IDs
        for cart_item in cart_items:
            item = items_tbl.objects.get(id=cart_item.item_id)
            item_detail = {
                'p_id': item.id,
                'p_name': item.item_name
            }
            item_details.append(item_detail)

        # Calculate total items and total amount
        total_items = cart_items.count()
        total_amount = cart_dtl.cart_tot_amt

        # Fetch user/customer details based on the information stored in the cart_master
        user_details = customer_reg.objects.get(id=cart_dtl.customert_id)

        # Prepare context data to pass to the template
        context = {
            'result': {
                'date': pay_tbl.pay_date if pay_tbl else None,
                'item_details': item_details,
                'p_amount': total_amount
            },
            'user': {
                'name': f"{user_details.fname} {user_details.lname}",
                'phone': user_details.phone,
                'place': f"{user_details.district}, {user_details.street}"
            }
        }

        return render(request, 'invoice.html', context)
    except cart_master.DoesNotExist:
        return render(request, '404.html')
    except Exception as e:
        # Handle other exceptions
        print(e)  # Print the error for debugging purposes
        return render(request, '404.html')


from django.db import transaction

def add_payment(request, id):
    if request.method == 'POST':
        card_id = request.POST.get('card_id')
        pay_date = request.POST.get('pay_date')
        cvv = request.POST.get('cvv')
        cart_master_id = id
        card_dtl=card.objects.get(id=card_id) 
        if cvv == card_dtl.cvv:
            try:
                with transaction.atomic():
                    # Save payment details
                    ins = tbl_payment.objects.create(cart_master_id=cart_master_id, card_id=card_id, pay_date=pay_date,status='paid')

                    # Mark cart as 'Deactive'
                    cart_detail = get_object_or_404(cart_master, id=id)
                    cart_detail.cart_status = 'Deactive'
                    cart_detail.save()

                    # Reduce item stock quantities
                    cart_items = cart_child.objects.filter(cart_master_id=cart_master_id)
                    for cart_item in cart_items:
                        # Get item details
                        item = items_tbl.objects.get(id=cart_item.item_id)

                        # Deduct purchased quantity from item stock
                        item.item_stock -= cart_item.cart_qty
                        item.save()

            except Exception as e:
                # Handle any exceptions and rollback the transaction
                print("Error occurred:", str(e))
                return HttpResponse("An error occurred during payment processing.")

            # Refresh the cart total in session
            customer_id = request.session.get('cuid')
            cart_master_obj = cart_master.objects.filter(customert_id=customer_id, cart_status='Active').first()
            total_products = cart_master_obj.cart_child_set.count() if cart_master_obj else 0
            request.session['carttotalitem'] = total_products

            return render(request, 'index.html', {'message': 'Your Payment was Successful'})
        else:
            return render(request, 'index.html', {'message': 'Your Payment was not Successful.You Entered a wrong cvv'})


#Courier 
    
def courier_view_company(request):
    # Fetch all assignments for the courier
    assignments = tbl_cassign.objects.filter(courier_id=request.session['coid'])

    # Initialize an empty list to store the result
    result = []

    # Iterate through each assignment
    for assign in assignments:
        # Retrieve the payment details for the current assignment
        payment_details = tbl_payment.objects.filter(cart_master_id=assign.cart_master_id)

        # Initialize a list to store the details for each payment
        payment_details_list = []

        # Iterate through each payment detail
        for payment in payment_details:
            # Retrieve cart master for the payment
            cart_master_obj = cart_master.objects.filter(id=payment.cart_master_id).first()

            if cart_master_obj:
                # Extract user_id and item_ids
                user_id = cart_master_obj.customert_id
                cart_child_items = cart_child.objects.filter(cart_master_id=payment.cart_master_id)
                item_ids = [item.item_id for item in cart_child_items]

                # Fetch user details from customer_reg table
                user_details = customer_reg.objects.filter(id=user_id).first()

                # Calculate number of items and amount paid
                number_of_items = cart_child_items.count()
                amount_paid = cart_master_obj.cart_tot_amt

                # Append user and item details along with number of items and amount paid to the payment_details_list
                payment_details_list.append({'user_details': user_details,
                                              'number_of_items': number_of_items,
                                              'amount_paid': amount_paid})

        # Append the payment details list along with the assign details to the result list
        result.append({'assignment_details': assign, 'payment_details': payment_details_list})

    return render(request, 'admin/courier_assign.html', {'result': result})

def accept_courier(request,id):
    cart_detail = get_object_or_404(tbl_cassign, id=id)
    cart_detail.status = 'Accepted'
    cart_detail.save()
    return redirect(courier_view_company)

def reject_courier(request,id):
    cart_detail = get_object_or_404(tbl_cassign, id=id)
    cart_detail.status = 'rejected'
    cart_detail.save()
    cart_master_id=cart_detail.cart_master_id
    paymt_detail=get_object_or_404(tbl_payment,cart_master_id=cart_master_id)
    paymt_detail.status = 'paid'
    paymt_detail.save()
    return redirect(courier_view_company)

def delivery_update_company(request,id):
    assign_table=tbl_cassign.objects.get(id=id)
    return render(request,'admin/delivery_update_company.html',{'result':assign_table})

def add_delivery_update_company(request):
    del_date = request.POST.get('del_date')
    cart_master_id = request.POST.get('cart_master_id')
    cassign_id = request.POST.get('cassign_id')
         
    ins = tbl_delivery(cassign_id=cassign_id, cart_master_id=cart_master_id, del_date=del_date)
    ins.save()
    cart_detail = get_object_or_404(tbl_cassign, cart_master_id=cart_master_id,status='Accepted')
    cart_detail.status = 'delivered'
    cart_detail.save()
    return render(request, 'admin/index.html', {'msg': 'Updated Successfully'})

def view_delivery_details(request):
    # Fetch all assignments with status 'delivered' for the courier
    assignments = tbl_cassign.objects.filter(courier_id=request.session['coid'], status='delivered')

    # Initialize an empty list to store the result
    result = []

    # Iterate through each delivery assignment
    for assign in assignments:
        # Retrieve the delivery details for the current assignment
        delivery_details = tbl_delivery.objects.filter(cassign_id=assign.id)

        # Initialize a list to store the details for each delivery
        delivery_details_list = []

        # Iterate through each delivery detail
        for delivery in delivery_details:
            # Retrieve cart master for the delivery
            cart_master_obj = cart_master.objects.filter(id=delivery.cart_master_id).first()

            if cart_master_obj:
                # Extract user_id and item_ids
                user_id = cart_master_obj.customert_id
                cart_child_items = cart_child.objects.filter(cart_master_id=delivery.cart_master_id)
                item_ids = [item.item_id for item in cart_child_items]

                # Fetch user details from customer_reg table
                user_details = customer_reg.objects.filter(id=user_id).first()

                # Calculate number of items and amount paid
                number_of_items = cart_child_items.count()
                amount_paid = cart_master_obj.cart_tot_amt
                cassign_date = assign.cassign_date
                # Append user and item details along with number of items and amount paid to the delivery_details_list
                delivery_details_list.append({'user_details': user_details,
                                               'number_of_items': number_of_items,
                                               'amount_paid': amount_paid,
                                               'del_date': delivery.del_date,
                                               'cassign_date': cassign_date})

        # Append the delivery details list along with the assign details to the result list
        result.append({'assignment_details': assign, 'delivery_details': delivery_details_list})

    return render(request, 'admin/view_delivery_details.html', {'result': result})
