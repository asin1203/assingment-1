from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/yoga'
db = SQLAlchemy(app)

class Members(db.Model):

    eid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80),  nullable=False)
    age = db.Column(db.Integer, nullable=False)
    address = db.Column(db.String(80), nullable=False)
    batch = db.Column(db.String(80), nullable=False)

@app.route("/")
def home():
    return render_template('home.html')

@app.route("/addentry", methods = ['GET', 'POST'])
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

if __name__=='__main__':
    app.run(debug=False,host='0.0.0.0')
