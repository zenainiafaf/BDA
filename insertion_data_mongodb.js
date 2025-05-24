// Fonction pour générer un nombre aléatoire entre min et max
function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Fonction pour générer une date aléatoire entre deux dates
function getRandomDate(start, end) {
  return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
}

// Fonction pour formater l'heure (HH:MM)
function formatTime(hours, minutes) {
  return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
}

// Fonction pour générer une durée aléatoire (entre 30min et 2h)
function getRandomDuration() {
  const hours = getRandomInt(0, 1);
  const minutes = getRandomInt(hours === 0 ? 30 : 0, 59);
  return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
}

// Fonction pour obtenir le prochain ID séquentiel
function getNextSequence(name) {
  var ret = db.counters.findAndModify({
    query: { _id: name },
    update: { $inc: { seq: 1 } },
    new: true,
    upsert: true
  });
  return ret.seq;
}

// Création de la collection compteurs
db.counters.drop();
db.createCollection("counters");
db.counters.insertMany([
  { _id: "voyageId", seq: 0 },
  { _id: "navetteId", seq: 0 },
  { _id: "ligneId", seq: 0 },
  { _id: "stationId", seq: 0 },
  { _id: "tronconsId", seq: 0 }
]);

// Configuration
const startDate = new Date("2024-01-01");
const endDate = new Date("2025-12-31");
const nbMoyensTransport = 4;
const nbLignes = 15;
const nbNavettes = 30;
const nbStations = 25;
const nbVoyages = 5000; // Nombre total de voyages à générer

// Création des moyens de transport
db.moyensTransport.drop();
db.createCollection("moyensTransport");
const moyensTransport = [
  {
    abreviation: "BUS",
    heureOuverture: "05:00",
    heureFermeture: "23:00",
    NbMoyenVoyageurs: 50
  },
  {
    abreviation: "TRAM",
    heureOuverture: "06:00",
    heureFermeture: "22:00",
    NbMoyenVoyageurs: 180
  },
  {
    abreviation: "METRO",
    heureOuverture: "05:30",
    heureFermeture: "23:30",
    NbMoyenVoyageurs: 300
  },
  {
    abreviation: "TRAIN",
    heureOuverture: "04:30",
    heureFermeture: "22:30",
    NbMoyenVoyageurs: 400
  }
];
db.moyensTransport.insertMany(moyensTransport);

// Création des stations
db.stations.drop();
db.createCollection("stations");
const stationsData = [
  { nom: "Alger Centre", latitude: 36.7539, longitude: 3.0589, type: "principale" },
  { nom: "Hussein Dey", latitude: 36.7400, longitude: 3.1078, type: "principale" },
  { nom: "El Harrach", latitude: 36.7167, longitude: 3.1500, type: "principale" },
  { nom: "Bab Ezzouar", latitude: 36.7130, longitude: 3.1781, type: "principale" },
  { nom: "Dar El Beida", latitude: 36.7174, longitude: 3.2131, type: "principale" },
  { nom: "Rouiba", latitude: 36.7383, longitude: 3.2806, type: "principale" },
  { nom: "Reghaia", latitude: 36.7500, longitude: 3.3333, type: "principale" },
  { nom: "Ain Benian", latitude: 36.8055, longitude: 2.9177, type: "secondaire" },
  { nom: "Zeralda", latitude: 36.7111, longitude: 2.8425, type: "secondaire" },
  { nom: "Staoueli", latitude: 36.7575, longitude: 2.8814, type: "secondaire" },
  { nom: "Bab El Oued", latitude: 36.7894, longitude: 3.0464, type: "secondaire" },
  { nom: "Kouba", latitude: 36.7167, longitude: 3.0833, type: "secondaire" },
  { nom: "Birkhadem", latitude: 36.7167, longitude: 3.0500, type: "secondaire" },
  { nom: "Hydra", latitude: 36.7500, longitude: 3.0333, type: "secondaire" },
  { nom: "El Biar", latitude: 36.7667, longitude: 3.0333, type: "secondaire" },
  { nom: "Bordj El Kiffan", latitude: 36.7500, longitude: 3.1833, type: "secondaire" },
  { nom: "Ain Taya", latitude: 36.7917, longitude: 3.3000, type: "secondaire" },
  { nom: "Baba Hassen", latitude: 36.7000, longitude: 2.9833, type: "tertiaire" },
  { nom: "Dely Ibrahim", latitude: 36.7583, longitude: 2.9833, type: "tertiaire" },
  { nom: "Douera", latitude: 36.6500, longitude: 2.9333, type: "tertiaire" },
  { nom: "Saoula", latitude: 36.6917, longitude: 3.0167, type: "tertiaire" },
  { nom: "Draria", latitude: 36.7028, longitude: 2.9811, type: "tertiaire" },
  { nom: "Cheraga", latitude: 36.7667, longitude: 2.9167, type: "tertiaire" },
  { nom: "Mohammadia", latitude: 36.7283, longitude: 3.1319, type: "tertiaire" },
  { nom: "Les Eucalyptus", latitude: 36.6881, longitude: 3.1100, type: "tertiaire" }
];

const stations = [];
for (let i = 0; i < stationsData.length; i++) {
  const station = {
    codeS: `S${(i + 1).toString().padStart(3, '0')}`,
    nom: stationsData[i].nom,
    latitude: stationsData[i].latitude,
    longitude: stationsData[i].longitude,
    type: stationsData[i].type
  };
  stations.push(station);
}
db.stations.insertMany(stations);

// Création des lignes
db.lignes.drop();
db.createCollection("lignes");
const lignes = [];
const prefixes = ["BUS", "TRA", "MET", "TRN"]; // Bus, Tram, Metro, Train

for (let i = 0; i < nbLignes; i++) {
  const moyenTransportIndex = i % nbMoyensTransport;
  const moyenTransport = db.moyensTransport.findOne({ abreviation: moyensTransport[moyenTransportIndex].abreviation });
  
  // Sélectionner des stations aléatoires pour le départ et l'arrivée
  const stationDepartIndex = getRandomInt(0, stations.length - 1);
  let stationArriveeIndex;
  do {
    stationArriveeIndex = getRandomInt(0, stations.length - 1);
  } while (stationArriveeIndex === stationDepartIndex);
  
  // Créer entre 2 et 5 tronçons pour cette ligne
  const nbTroncons = getRandomInt(2, 5);
  const troncons = [];
  
  // Créer une liste ordonnée de stations pour cette ligne
  const stationsOrdre = [stations[stationDepartIndex]];
  const stationsUtilisees = new Set([stationDepartIndex]);
  
  // Ajouter des stations intermédiaires
  for (let j = 0; j < nbTroncons - 1; j++) {
    let stationIndex;
    do {
      stationIndex = getRandomInt(0, stations.length - 1);
    } while (stationsUtilisees.has(stationIndex));
    
    stationsUtilisees.add(stationIndex);
    stationsOrdre.push(stations[stationIndex]);
  }
  
  // Ajouter la station d'arrivée si elle n'est pas déjà incluse
  if (!stationsUtilisees.has(stationArriveeIndex)) {
    stationsOrdre.push(stations[stationArriveeIndex]);
  } else {
    // Trouver une autre station non utilisée
    let stationIndex;
    do {
      stationIndex = getRandomInt(0, stations.length - 1);
    } while (stationsUtilisees.has(stationIndex));
    
    stationsOrdre.push(stations[stationIndex]);
  }
  
  // Créer les tronçons basés sur l'ordre des stations
  for (let j = 0; j < stationsOrdre.length - 1; j++) {
    const stationDebut = stationsOrdre[j];
    const stationFin = stationsOrdre[j + 1];
    
    // Calculer une longueur réaliste basée sur les coordonnées
    const dx = stationDebut.longitude - stationFin.longitude;
    const dy = stationDebut.latitude - stationFin.latitude;
    const distance = Math.sqrt(dx * dx + dy * dy) * 100; // Conversion approximative en km
    const longueur = parseFloat(distance.toFixed(1));
    
    troncons.push({
      numeroT: j + 1,
      stationDebut: stationDebut.nom,
      stationFin: stationFin.nom,
      longueur: longueur
    });
  }
  
  const prefixe = prefixes[moyenTransportIndex];
  const ligne = {
    codeL: `${prefixe}${(i + 1).toString().padStart(3, '0')}`,
    stationDepart: stationsOrdre[0].nom,
    stationArrivee: stationsOrdre[stationsOrdre.length - 1].nom,
    moyenTransport: moyenTransport,
    troncons: troncons
  };
  
  lignes.push(ligne);
}
db.lignes.insertMany(lignes);

// Création des navettes
db.navettes.drop();
db.createCollection("navettes");
const marques = [
  "Hyundai Algérie", "Mercedes-Benz", "MAN", "Iveco", "Renault", 
  "Alstom", "Siemens", "Bombardier", "CAF", "Stadler"
];
const navettes = [];

for (let i = 0; i < nbNavettes; i++) {
  const ligneIndex = getRandomInt(0, lignes.length - 1);
  const ligne = db.lignes.findOne({ codeL: lignes[ligneIndex].codeL });
  
  const marqueIndex = getRandomInt(0, marques.length - 1);
  const anneeMiseEnCirculation = getRandomInt(2015, 2025);
  
  const navette = {
    numeroN: i + 1,
    marque: marques[marqueIndex],
    anneeMiseEnCirculation: anneeMiseEnCirculation,
    ligne: ligne
  };
  
  navettes.push(navette);
}
db.navettes.insertMany(navettes);

// Création des voyages
db.voyages.drop();
db.createCollection("voyages");
const observations = ["RAS", "Retard", "Panne"];
const voyages = [];

for (let i = 0; i < nbVoyages; i++) {
  const navetteIndex = getRandomInt(0, navettes.length - 1);
  const navette = db.navettes.findOne({ numeroN: navettes[navetteIndex].numeroN });
  
  const dateVoyage = getRandomDate(startDate, endDate);
  
  // Générer une heure de début en fonction des heures d'ouverture/fermeture
  const ouverture = navette.ligne.moyenTransport.heureOuverture.split(':');
  const fermeture = navette.ligne.moyenTransport.heureFermeture.split(':');
  
  const minHour = parseInt(ouverture[0]);
  const maxHour = parseInt(fermeture[0]) - 1;
  
  const heureDebut = formatTime(getRandomInt(minHour, maxHour), getRandomInt(0, 59));
  
  const duree = getRandomDuration();
  const sens = Math.random() > 0.5 ? "Aller" : "Retour";
  const nombreVoyageurs = getRandomInt(1, navette.ligne.moyenTransport.NbMoyenVoyageurs);
  const observationIndex = getRandomInt(0, observations.length - 1);
  
  // Déterminer les stations en fonction du sens
  let stationsVoyage;
  if (sens === "Aller") {
    // De la première station à la dernière
    stationsVoyage = navette.ligne.troncons.map((troncon, index) => {
      if (index === 0) {
        return db.stations.findOne({ nom: troncon.stationDebut });
      }
      return db.stations.findOne({ nom: troncon.stationFin });
    });
  } else {
    // De la dernière station à la première (inverser l'ordre)
    const troncons = [...navette.ligne.troncons].reverse();
    stationsVoyage = troncons.map((troncon, index) => {
      if (index === 0) {
        return db.stations.findOne({ nom: troncon.stationFin });
      }
      return db.stations.findOne({ nom: troncon.stationDebut });
    });
  }
  
  // Eliminer les doublons potentiels
  stationsVoyage = stationsVoyage.filter((station, index, self) => 
    index === self.findIndex((s) => s.nom === station.nom)
  );
  
  const voyage = {
    numeroV: i + 1,
    dateVoyage: dateVoyage,
    heureDebut: heureDebut,
    duree: duree,
    sens: sens,
    nombreVoyageurs: nombreVoyageurs,
    observation: observations[observationIndex],
    navette: navette,
    stations: stationsVoyage
  };
  
  voyages.push(voyage);
}

// Insérer par lots de 500 pour éviter les problèmes de taille de document
const batchSize = 500;
for (let i = 0; i < voyages.length; i += batchSize) {
  const batch = voyages.slice(i, i + batchSize);
  db.voyages.insertMany(batch);
}

// Afficher un résumé des données générées
print(`Base de données générée avec succès:
- ${nbMoyensTransport} moyens de transport
- ${nbLignes} lignes
- ${nbNavettes} navettes
- ${nbStations} stations
- ${nbVoyages} voyages`);

// Créer des index pour améliorer les performances des requêtes
db.voyages.createIndex({ dateVoyage: 1 });
db.voyages.createIndex({ "navette.numeroN": 1 });
db.voyages.createIndex({ "navette.ligne.codeL": 1 });
db.stations.createIndex({ nom: 1 });