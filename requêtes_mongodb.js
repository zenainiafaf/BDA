db.voyages.find({ 
    dateVoyage: { 
      $gte: ISODate("2025-01-01T00:00:00Z"), 
      $lt: ISODate("2025-01-02T00:00:00Z") 
    } 
  }).pretty();



db.voyages.aggregate([
  // Filtrer les voyages sans problème (observation "Normal")
  { $match: { observation: "RAS" } },
  
  // Projeter uniquement les champs nécessaires
  { $project: { 
    numeroV: 1,
    numLigne: "$navette.ligne.codeL",
    dateVoyage: 1,
    heureDebut: 1,
    sens: 1,
    moyenTransport: "$navette.ligne.moyenTransport.abreviation",
    numeroNavette: "$navette.numeroN",
    _id: 0
  }},
  
  // Insérer les résultats dans une nouvelle collection
  { $out: "bonVoyage" }
]);



db.voyages.aggregate([
  // Grouper par numéro de ligne
  { $group: { 
    _id: "$navette.ligne.codeL", 
    totalVoyages: { $sum: 1 }
  }},
  
  // Renommer le champ _id en numeroLigne
  { $project: {
    numeroLigne: "$_id",
    totalVoyages: 1,
    _id: 0
  }},
  
  // Trier par nombre de voyages décroissant
  { $sort: { totalVoyages: -1 } },
  
  // Insérer les résultats dans une nouvelle collection
  { $out: "ligneVoyages" }
]);


db.voyages.updateMany(
    { 
      "navette.ligne.moyenTransport.abreviation": "MET",
      "dateVoyage": { $lt: ISODate("2025-01-15T00:00:00Z") }
    },
    { 
      $inc: { "nombreVoyageurs": 100 }
    }
  );










  var mapFunction = function() {
    if (this.navette && this.navette.ligne && this.navette.ligne.codeL) {
      emit(this.navette.ligne.codeL, 1);
    }
  };
  
  var reduceFunction = function(codeLigne, compteurs) {
    return Array.sum(compteurs);
  };
  
  try {
    db.voyages.mapReduce(
      mapFunction,
      reduceFunction,
      {
        out: "ligneVoyagesMapReduce",
        verbose: true
      }
    );
    print("MapReduce réussi. Résultats dans la collection 'ligneVoyagesMapReduce'");
  } catch (e) {
    print("Erreur lors du MapReduce:", e);
  }
  db.ligneVoyagesMapReduce.aggregate([
    { $sort: { value: -1 } },  // Trie par "value" décroissant
    { $out: "ligneVoyagesMapReduce" }  // Réécrit la collection
  ]);
  db.ligneVoyagesMapReduce.find();



  
//a
db.voyages.aggregate([
  {
    $group: {
      _id: {
        navette: "$navette.numeroN", 
        moyenTransport: "$navette.ligne.moyenTransport.abreviation"
      },
      totalVoyages: { $sum: 1 }
    }
  },
  {
    $sort: { totalVoyages: -1 }
  },
  {
    $group: {
      _id: null,
      maxVoyages: { $first: "$totalVoyages" },
      navettes: {
        $push: {
          navette: "$_id.navette",
          moyenTransport: "$_id.moyenTransport",
          totalVoyages: "$totalVoyages"
        }
      }
    }
  },
  {
    $project: {
      navettes: {
        $filter: {
          input: "$navettes",
          as: "n",
          cond: { $eq: ["$$n.totalVoyages", "$maxVoyages"] }
        }
      }
    }
  },
  {
    $unwind: "$navettes"
  },
  {
    $replaceRoot: { newRoot: "$navettes" }
  }
])



// b
db.voyages.aggregate([
  // Étape 1: Regrouper par date + moyen de transport (ID + abréviation)
  {
    $group: {
      _id: {
        date: { $dateToString: { format: "%Y-%m-%d", date: "$dateVoyage" } },
        moyenId: "$navette.ligne.moyenTransport._id",
        moyenAbrev: "$navette.ligne.moyenTransport.abreviation"
      },
      totalVoyageurs: { $sum: "$nombreVoyageurs" }
    }
  },
  // Étape 2: Filtrer uniquement les jours où le seuil est dépassé (ex: 1000)
  { $match: { totalVoyageurs: { $gt: 1000 } } },
  // Étape 3: Trier par date (optionnel)
  { $sort: { "_id.date": 1 } },
  // Étape 4: Formater le résultat
  {
    $project: {
      _id: 0,
      date: "$_id.date",
      moyenId: "$_id.moyenId",
      moyen: "$_id.moyenAbrev",
      totalVoyageurs: 1
    }
  }
])