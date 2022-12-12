# Flexmoney Assignment: Yoga Membership Form

The form is created in Flask framework and is hosted on [pythonanywhere.com](http://aasthasingh73.pythonanywhere.com/).

## Problem Statement:
Assume that you are the CTO for the outsourcing firm which has been chosen to build an
admission form for the Yoga Classes which happen every month.
Requirements for the admission form are:
- Only people within the age limit of 18-65 can enroll for the monthly classes and they will
be paying the fees on a month on month basis. I.e. an individual will have to pay the fees
every month and he can pay it any time of the month.
- They can enroll any day but they will have to pay for the entire month. The monthly fee is
500/- Rs INR.
- There are a total of 4 batches a day namely 6-7AM, 7-8AM, 8-9AM and 5-6PM. The
participants can choose any batch in a month and can move to any other batch next
month. I.e. participants can shift from one batch to another in different months but in
same month they need to be in same batch

## Implementation Details
- Backend contains an api (/addentry) which when given post request accepts basic details of the user such as: Membership ID (ID), Full Name, Age which should be between 18 to 65, Full address and the batch.
- The above api stores the data in a sql database within the table named members. The Membership ID here is the primary key of the table. User has to manually enter the membership ID. No two members can have similar membership ID.
- Given is the ER diagram of the table members:
- ![alt text](https://github.com/asin1203/assingment-1/blob/main/images/Screenshot%202022-12-12%20190352.png)


Internal implementation of addmember():

- addmember function checks whether the given memebership id is already present in the database or not. If it is not present, the member is added to the databae.
- If the given member is already present, it checks if the user is trying to change its batch, if yes this functions internally checks the current date and time and checks if it is the begining of the month, if yes the batch is changed yes the error message is displayed.

  ```python
  def addentry():
      if (request.method=='POST'):
          fid = request.form.get('fid')
          name = request.form.get('name')
          age = request.form.get('age')
          address = request.form.get('address')
          batch = request.form.get('batch')
          exists = db.session.query(db.exists().where(Members.eid == fid)).scalar()
          print(exists)
          if not exists:
              print('add')
              entry = Members(eid=fid, name=name, age=age, address=address, batch=batch)
              db.session.add(entry)
              db.session.commit()
              return render_template('payment.html', batch=batch)
          else:
              print('exists')
              query = (db.session.query(Members.batch).filter(Members.eid == fid))
              all_batch = query.all()
              curr_batch=all_batch[0][0]
              ouput=""
              if curr_batch != batch:
                  a=datetime.now()
                  b=str(a)
                  date=b.split(' ')[0][-2:]
                  print(type(date))
                  if int(date) == 1:
                      print(date)
                      Members.batch=batch
                      db.session.commit()
                  else:
                      ouput=' *Batch Update is possible only in starting date of month*'
              curr_batch=curr_batch+ouput
              return render_template('payment.html', batch=curr_batch)
  
Later after clicking on submit, the payment due and batch is displayed.
![Image](https://github.com/asin1203/assingment-1/blob/main/images/o1.png)
![Image](https://github.com/asin1203/assingment-1/blob/main/images/o2.png)
