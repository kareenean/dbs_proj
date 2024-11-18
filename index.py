from flask import Flask, render_template, request, redirect
from sqlalchemy import create_engine, text

app = Flask(__name__)

# Database connection
engine = create_engine('postgresql+psycopg2://kareenean:12345@localhost:5432/health_system')

@app.route('/')
@app.route('/home')
def home():
    # Fetch all data from the "disease" table
    with engine.connect() as connection:
        result = connection.execute(text("SELECT * FROM disease"))
        data = [dict(zip(result.keys(), row)) for row in result]  # Convert rows to dictionaries for template rendering
    
    return render_template('index.html', message="Hello from Flask!", data=data)

@app.route('/info/<string:disease_code>', methods=['POST'])
def get_info(disease_code):
    with engine.connect() as connection:
        result = connection.execute(text("SELECT disease_code, cname, total_deaths, total_patients FROM record WHERE disease_code = :disease_code"), {"disease_code": disease_code})
        data = [dict(zip(result.keys(), row)) for row in result]
    
    return render_template('info.html', message="Hello from Flask!", data=data)

@app.route('/delete/<string:disease_code>', methods=['POST'])
def delete_disease(disease_code):
    with engine.connect() as connection:
        connection.execute(
            text("DELETE FROM disease WHERE disease_code = :disease_code"),
            {"disease_code": disease_code}
        )
        connection.commit() 
    return redirect('/')

@app.route('/update/<string:disease_code>', methods=['GET', 'POST'])
def update_disease(disease_code):
    if request.method == 'POST':
        # Process the form data for updating the record
        new_code = request.form['disease_code']
        new_pathogen = request.form['pathogen']
        new_description = request.form['description']
        new_id = int(request.form['id'])
        with engine.connect() as connection:
            connection.execute(
                text("""
                    UPDATE disease
                    SET disease_code = :disease_code,
                        pathogen = :pathogen,
                        description = :description,
                        id = :id
                    WHERE disease_code = :disease_code
                """),
                {"disease_code": new_code, "pathogen": new_pathogen, "description": new_description, "id": new_id}
            )
            connection.commit() 
        return redirect('/')
    else:
        # Fetch the current data for pre-filling the update form
        with engine.connect() as connection:
            result = connection.execute(text("SELECT * FROM disease WHERE disease_code = :disease_code"), {"disease_code": disease_code}).fetchone()
            if not result:
                return "Record not found", 404  # Handle case where no record is found

        # Use `row._mapping` to convert the Row object into a dictionary
        return render_template('update.html', row=result._mapping)

@app.route('/create', methods=['POST'])
def create_disease():
    try:
        disease_code = request.form['disease_code']
        pathogen = request.form['pathogen']
        description = request.form['description']
        id = request.form['id']

        with engine.connect() as connection:
            # Insert the new disease record
            connection.execute(
                text("""
                    INSERT INTO disease (disease_code, pathogen, description, id)
                    VALUES (:disease_code, :pathogen, :description, :id)
                """),
                {"disease_code": disease_code, "pathogen": pathogen, "description": description, "id": id}
            )
            connection.commit()  # Ensure the transaction is committed
            print("Successfully inserted into the database.")

        return redirect('/')  # Redirect back to the homepage to show updated table
    except Exception as e:
        print(f"Error while inserting: {str(e)}")
        return "An error occurred while creating the disease record.", 500



if __name__ == '__main__':
    app.run(debug=True)
