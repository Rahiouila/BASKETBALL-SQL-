from flask import Flask, render_template, request, redirect, session
from flask import abort
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import text



from dotenv import load_dotenv
import os
from datetime import timedelta



app = Flask(__name__)
app.secret_key = '1234' 
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(minutes=1)  


# Configuration de la base de données
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:Allahakbar1234.@127.0.0.1/databasebasketball'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# Configuration de la base de données avec les variables d'environnement
#app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+pymysql://{os.getenv('DB_USERNAME')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}/{os.getenv('DB_NAME')}"
#app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialisation de SQLAlchemy
db = SQLAlchemy(app)

class Player(db.Model):
    __tablename__ = 'Player'
    Player_ID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255), nullable=False)
    Birth_Date = db.Column(db.Date)
    Height = db.Column(db.Integer)
    Citizenship = db.Column(db.String(255))
    Club_ID = db.Column(db.Integer, db.ForeignKey('Club.Club_ID'))
    National_Team_ID = db.Column(db.Integer, db.ForeignKey('National_Team.National_Team_ID'))

class Club(db.Model):
    __tablename__ = 'Club'
    Club_ID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255), nullable=False)
    City = db.Column(db.String(255))
    League = db.Column(db.String(255))
    Sponsor_ID = db.Column(db.Integer, db.ForeignKey('Sponsor.Sponsor_ID'))

class Top10NationalPlayers(db.Model):
    __tablename__ = 'top10nationalplayers'  # Nom de la vue
    Player_ID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255))
    TotalPoints = db.Column(db.Integer)

class NationalTeam(db.Model):
    __tablename__ = 'National_Team'
    National_Team_ID = db.Column(db.Integer, primary_key=True)
    Country = db.Column(db.String(255), nullable=False)
    Competition = db.Column(db.String(255))
    players = db.relationship('Player', backref='national_team', lazy=True)

class BestEuropeanFinalPlayers(db.Model):
    __tablename__ = 'besteuropeanfinalplayers'  
    Player_ID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255))
    Competition_Type = db.Column(db.String(255))
    Season = db.Column(db.Integer)
    FreeThrows_Percentage = db.Column(db.Float)

class PlayerStatsCurrentSeason(db.Model):
    __tablename__ = 'playerstatscurrentseason'  
    Player_ID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255))
    Total3Points = db.Column(db.Integer)
    Total2Points = db.Column(db.Integer)
    TotalFreeThrows = db.Column(db.Integer)
    AvgFreeThrowPercentage = db.Column(db.Float)
    TotalAssists = db.Column(db.Integer)
    TotalRebounds = db.Column(db.Integer)
    TotalBlocks = db.Column(db.Integer)
    TotalFouls = db.Column(db.Integer)

class TopAssistsByPlayer(db.Model):
    __tablename__ = 'topassistsbyplayer'  
    Player_ID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255))
    Assists = db.Column(db.Integer)
    ClubName = db.Column(db.String(255))

class TopSponsorNationalTeams(db.Model):
    __tablename__ = 'topsponsornationalteams'
    Sponsor_ID = db.Column(db.Integer, primary_key=True)
    SponsorName = db.Column(db.String(255))
    NationalTeamsSponsored = db.Column(db.Integer)

class ClubsWithMoreThan3EuroleagueWins(db.Model):
    __tablename__ = 'clubswithmorethan3euroleaguewins'  
    Club_ID = db.Column(db.Integer, primary_key=True)
    ClubName = db.Column(db.String(255))
    EuroleagueWins = db.Column(db.Integer)

class BestEuropeanFinalPlayers1(db.Model):
    __tablename__ = 'BestEuropeanFinalPlayers1' 
    Player_ID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255))
    Competition_Type = db.Column(db.String(255))
    FreeThrows_Percentage = db.Column(db.Float)

class Statistic(db.Model):
    __tablename__ = 'Statistic'
    Stat_ID = db.Column(db.Integer, primary_key=True)
    Player_ID = db.Column(db.Integer, db.ForeignKey('Player.Player_ID'))
    Game_ID_Club = db.Column(db.Integer, db.ForeignKey('Game_Club.Game_ID'))
    Game_ID_International = db.Column(db.Integer, db.ForeignKey('Game_International.Game_ID'))
    Number_of_3_Points = db.Column(db.Integer)
    Number_of_2_Points = db.Column(db.Integer)
    FreeThrows = db.Column(db.Integer)
    FreeThrows_Percentage = db.Column(db.Float)
    Assists = db.Column(db.Integer)
    Rebounds = db.Column(db.Integer)
    Blocks = db.Column(db.Integer)
    Fouls = db.Column(db.Integer)

class Sponsor(db.Model):
    __tablename__ = 'Sponsor'
    Sponsor_ID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255))
    City = db.Column(db.String(255))
    Amount = db.Column(db.BigInteger)

 #class ClubCompetition(db.Model):
   #  __tablename__ = 'club_competition'
     #Competition_ID = db.Column(db.Integer, primary_key=True)
     #Name = db.Column(db.String(255))
     #Season = db.Column(db.Integer)
    # Winner = db.Column(db.Integer, db.ForeignKey('club.Club_ID'))

     #winning_club = db.relationship('Club', backref='competitions_won', foreign_keys=[Winner])












# Route d'accueil
@app.route('/')
def home():
    return render_template('index.html')

# Route de connexion
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        password = request.form.get('password')
        if password == '1234':  
            session['admin_logged_in'] = True
            session.permanent = True  
            return redirect('/admin')
        else:
            return "Mot de passe incorrect", 401
    return render_template('login.html')


# Liste des joueurs
@app.route('/players')
def list_players():
    players = Player.query.all()
    return render_template('players.html', players=players)

# Détails d'un joueur
@app.route('/player/<int:id>')
def get_player(id):
    player = Player.query.filter_by(Player_ID=id).first()
    return render_template('player.html', player=player)

# @app.route('/admin')
# def admin_dashboard():
#      return render_template('admin_dashboard.html')
@app.route('/admin')
def admin_dashboard():
    if not session.get('admin_logged_in'):
        return redirect('/login')  
    return render_template('admin_dashboard.html')

@app.route('/user')
def user_dashboard():
    return render_template('user_dashboard.html')
@app.route('/user/top_players_national', methods=['GET'])
def top_players_national():
    query = text("""
        SELECT p.Player_ID, p.Name, 
               SUM(s.Number_of_3_Points + s.Number_of_2_Points + s.FreeThrows) AS Total_Points
        FROM Player p
        JOIN Statistic s ON p.Player_ID = s.Player_ID
        WHERE p.National_Team_ID IS NOT NULL
        GROUP BY p.Player_ID, p.Name
        ORDER BY Total_Points DESC
        LIMIT 10;
    """)
    results = db.session.execute(query).mappings().fetchall()
    players = [
        {'Player_ID': row['Player_ID'], 'Name': row['Name'], 'Total_Points': row['Total_Points']}
        for row in results
    ]
    return render_template('top_players_national.html', players=players)


@app.route('/admin/add_player', methods=['GET', 'POST'])
def add_player():
    if not session.get('admin_logged_in'):
        return redirect('/login')
    if request.method == 'POST':
        new_player = Player(
            Player_ID=request.form['Player_ID'],
            Name=request.form['Name'],
            Birth_Date=request.form['Birth_Date'],
            Height=request.form['Height'],
            Citizenship=request.form['Citizenship'],
            Club_ID=request.form['Club_ID'],
            National_Team_ID=request.form['National_Team_ID']
        )
        db.session.add(new_player)
        db.session.commit()
        return redirect('/admin')
    return render_template('player_form.html')

@app.route('/admin/manage_clubs')
def manage_clubs():
    if not session.get('admin_logged_in'):
        return redirect('/login')
    clubs = Club.query.all()
    return render_template('manage_clubs.html', clubs=clubs)

@app.route('/admin/update_club/<int:id>', methods=['GET', 'POST'])
def update_club(id):
    if not session.get('admin_logged_in'):
        return redirect('/login')
    
    club = Club.query.get_or_404(id)

    if request.method == 'POST':
        club.Name = request.form['Name']
        club.City = request.form['City']
        club.League = request.form['League']
        club.Sponsor_ID = request.form.get('Sponsor_ID')

        db.session.commit()
        return redirect('/admin/manage_clubs')

    return render_template('update_club.html', club=club)

@app.route('/admin/delete_club/<int:id>', methods=['POST'])
def delete_club(id):
    if not session.get('admin_logged_in'):
        return redirect('/login')
    
    club = Club.query.get_or_404(id)
    db.session.delete(club)
    db.session.commit()
    return redirect('/admin/manage_clubs')


@app.route('/logout')
def logout():
    session.pop('admin_logged_in', None) 
    return redirect('/')


@app.route('/user/top10nationalplayers')
def top_national_players():
    players = Top10NationalPlayers.query.all()  
    return render_template('top10nationalplayers.html', players=players)

@app.route('/user/search_players', methods=['GET', 'POST'])
def search_players():
    if request.method == 'POST':
        # Récupérer les critères de recherche depuis le formulaire
        club_id = request.form.get('club_id')
        name = request.form.get('name')
        nationality = request.form.get('nationality')

        query = Player.query
        if club_id:
            query = query.filter_by(Club_ID=club_id)
        if name:
            query = query.filter(Player.Name.ilike(f'%{name}%'))
        if nationality:
            query = query.filter(Player.Citizenship.ilike(f'%{nationality}%'))
        
        # Exécuter la requête
        players = query.all()

        return render_template('search_results.html', players=players)

    return render_template('search_form.html')

@app.route('/user/top_final_players')
def top_final_players():
    players = BestEuropeanFinalPlayers.query.all()  # Interroger la vue
    return render_template('top_final_players.html', players=players)

@app.route('/user/player_stats_current_season')
def player_stats_current_season():
    players = PlayerStatsCurrentSeason.query.limit(100).all()  # Limite à 100 résultats
    return render_template('player_stats_current_season.html', players=players)

@app.route('/user/top_assists_by_player')
def top_assists_by_player():
    players = TopAssistsByPlayer.query.limit(100).all()  
    return render_template('top_assists_by_player.html', players=players)


@app.route('/user/top_sponsors_national_teams')
def top_sponsors_national_teams():
    sponsors = TopSponsorNationalTeams.query.limit(100).all()  # Limite à 100 résultats
    return render_template('top_sponsors_national_teams.html', sponsors=sponsors)

@app.route('/user/clubs_with_more_than_3_euroleague_wins')
def clubs_with_more_than_3_euroleague_wins():
    clubs = ClubsWithMoreThan3EuroleagueWins.query.limit(100).all()  # Limite à 100 résultats
    return render_template('clubs_with_more_than_3_euroleague_wins.html', clubs=clubs)

@app.route('/user/best_european_final_players1')
def best_european_final_players1():
    players = BestEuropeanFinalPlayers1.query.all()
    return render_template('best_european_final_players1.html', players=players)

@app.route('/user/statistics')
def list_statistics():
    statistics = Statistic.query.all()
    return render_template('statistics.html', statistics=statistics)

@app.route('/user/sponsors')
def list_sponsors():
    sponsors = Sponsor.query.all()
    return render_template('sponsors.html', sponsors=sponsors)

@app.route('/admin/delete_player/<int:id>', methods=['POST'])
def delete_player(id):
    if not session.get('admin_logged_in'):
        return redirect('/login')
    
    player = Player.query.get_or_404(id)
    db.session.delete(player)
    db.session.commit()
    return redirect('/players')
@app.route('/admin/update_player/<int:id>', methods=['GET', 'POST'])
def update_player(id):
    if not session.get('admin_logged_in'):
        return redirect('/login')

    player = Player.query.get_or_404(id)

    if request.method == 'POST':
        player.Name = request.form['Name']
        player.Birth_Date = request.form['Birth_Date']
        player.Height = request.form['Height']
        player.Citizenship = request.form['Citizenship']
        player.Club_ID = request.form['Club_ID']
        player.National_Team_ID = request.form['National_Team_ID']

        db.session.commit()
        return redirect('/players')

    return render_template('update_player.html', player=player)

@app.route('/admin/manage_players')
def manage_players():
    if not session.get('admin_logged_in'):
        return redirect('/login')
    players = Player.query.all()
    return render_template('manage_players.html', players=players)



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

