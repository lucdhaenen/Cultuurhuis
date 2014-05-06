using MVC4_Cultuurhuis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC4_Cultuurhuis.Services
{
    public class CultuurService
    {
        public List<Genre> GetAllGenres()
        {
            using (var db = new CultuurHuisEntities())
            {
                return db.Genres.OrderBy(m => m.GenreNaam).ToList();
            }
        }

        public Genre GetGenreById(int? id)
        {
            using (var db = new CultuurHuisEntities())
            {
                return (from genre in db.Genres
                        where genre.GenreNr == id
                        select genre).FirstOrDefault();
            }
        }

        public List<Voorstelling> GetAlleVoorstellingenVanGenre(int? id)
        {
            using (var db = new CultuurHuisEntities())
            {
                var query = from voorstelling in db.Voorstellingen.Include("Genre")
                            where voorstelling.Datum >= DateTime.Today && voorstelling.GenreNr == id
                            orderby voorstelling.Datum
                            select voorstelling;
                return query.ToList();
            }
        }

        public Voorstelling GetVoorstellingById(int? id)
        {
            using (var db = new CultuurHuisEntities())
            {
                return (from voorstelling in db.Voorstellingen
                        where voorstelling.VoorstellingsNr == id
                        select voorstelling).FirstOrDefault();
            }
        }

        public Klant GetKlant(string naam, string paswoord)
        {
            using (var db = new CultuurHuisEntities())
            {
                return (from klant in db.Klanten
                        where klant.GebruikersNaam == naam && klant.Paswoord == paswoord
                        select klant).FirstOrDefault();
            }
        }

        public bool BestaatKlant(string gebruikersnaam)
        {
            using (var db = new CultuurHuisEntities())
            {
                var bestaandeKlant = (from klant in db.Klanten
                                      where klant.GebruikersNaam == gebruikersnaam
                                      select klant).FirstOrDefault();
                return bestaandeKlant != null;
            }
        }

        public void VoegKlantToe(Klant nieuweKlant)
        {
            using (var db = new CultuurHuisEntities())
            {
                db.Klanten.Add(nieuweKlant);
                db.SaveChanges();
            }
        }

        public void BewaarReservatie(Reservatie gelukteReservatie)
        {
            using (var db = new CultuurHuisEntities())
            {
                var query = (from voorstelling in db.Voorstellingen
                             where voorstelling.VoorstellingsNr == gelukteReservatie.VoorstellingsNr
                             select voorstelling).FirstOrDefault();
                query.VrijePlaatsen -= gelukteReservatie.Plaatsen;
                db.Reservaties.Add(gelukteReservatie);
                db.SaveChanges();
            }
        }
    }
}