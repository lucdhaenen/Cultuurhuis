using MVC4_Cultuurhuis.Services;
using MVC4_Cultuurhuis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC4_Cultuurhuis.Controllers
{
    public class HomeController : Controller
    {
        private CultuurService db = new CultuurService();

        //
        // GET: /Home/

        public ActionResult Index(int? id)
        {
            var voorstellingenInfo = new VoorstellingenInfo();
            voorstellingenInfo.Genres = db.GetAllGenres();
            voorstellingenInfo.Genre = db.GetGenreById(id);
            voorstellingenInfo.Voorstellingen = db.GetAlleVoorstellingenVanGenre(id);
            if (Session.Keys.Count != 0)
            {
                ViewBag.mandjeTonen = true;
            }
            else ViewBag.mandjeTonen = false;
            return View(voorstellingenInfo);
        }

        public ActionResult Reserveren(int id)
        {
            Voorstelling gekozenVoorstelling = db.GetVoorstellingById(id);
            return View(gekozenVoorstelling);
        }

        [HttpPost]
        public ActionResult Reserveer(int id)
        {
            uint aantalPlaatsen = uint.Parse(Request["aantalPlaatsen"]);
            var voorstelling = db.GetVoorstellingById(id);
            if (aantalPlaatsen > voorstelling.VrijePlaatsen)
            {
                return RedirectToAction("Reserveer", "Home", new { id = id });
            }
            Session[id.ToString()] = aantalPlaatsen;
            return RedirectToAction("Mandje", "Home");
        }

        public ActionResult Mandje()
        {
            decimal teBetalen = 0;
            List<MandjeItem> mandjeItems = new List<MandjeItem>();
            foreach (string nummer in Session)
            {
                int voorstellingsNummer;
                if (int.TryParse(nummer, out voorstellingsNummer))
                {
                    Voorstelling voorstelling = db.GetVoorstellingById(voorstellingsNummer);
                    if (voorstelling != null)
                    {
                        MandjeItem mandjeItem = new MandjeItem(voorstellingsNummer, voorstelling.Titel,
                            voorstelling.Uitvoerders, voorstelling.Datum, voorstelling.Prijs, Convert.ToInt16(Session[nummer]));
                        teBetalen += (mandjeItem.Plaatsen * mandjeItem.Prijs);
                        mandjeItems.Add(mandjeItem);
                    }
                }
            }
            ViewBag.teBetalen = teBetalen;
            return View(mandjeItems);
        }

        public ActionResult Verwijderen()
        {
            foreach (var item in Request.Form.AllKeys)
            {
                if (Session[item] != null)
                {
                    Session.Remove(item);
                }                
            }
            return RedirectToAction("Mandje", "Home");
        }

        public ActionResult Bevestiging()
        {
            //gebruiker opzoeken
            if (Request["zoek"] != null)
            {
                var naam = Request["naam"];
                var paswoord = Request["paswoord"];
                var klant = db.GetKlant(naam, paswoord);
                if (klant != null)
                {
                    Session["klant"] = klant;
                }
                else ViewBag.errorMessage = "Verkeerde gebruikersnaam of paswoord";
                return View();
            }

            //nieuwe gebruiker
            if (Request["nieuw"] != null)
            {
                return RedirectToAction("Nieuw", "Home");
            }

            //bevestig
            if (Request["bevestig"] != null)
            {
                //verwerking klantgegevens via Session["klant"]
                var klant = (Klant)Session["klant"];
                Session.Remove("klant");

                List<MandjeItem> gelukteReservaties = new List<MandjeItem>();
                List<MandjeItem> mislukteReservaties = new List<MandjeItem>();

                //alle reservaties uit de Session halen
                foreach (string nummer in Session)
                {
                    Reservatie nieuweReservatie = new Reservatie();
                    nieuweReservatie.VoorstellingsNr = int.Parse(nummer);
                    nieuweReservatie.Plaatsen = Convert.ToInt16(Session[nummer]);
                    nieuweReservatie.KlantNr = klant.KlantNr;

                    Voorstelling voorstelling = db.GetVoorstellingById(nieuweReservatie.VoorstellingsNr);
                    if (voorstelling.VrijePlaatsen >= nieuweReservatie.Plaatsen)
                    {
                        db.BewaarReservatie(nieuweReservatie);
                        gelukteReservaties.Add(new MandjeItem(voorstelling.VoorstellingsNr, voorstelling.Titel,
                            voorstelling.Uitvoerders, voorstelling.Datum, voorstelling.Prijs, nieuweReservatie.Plaatsen));
                    }
                    else
                    {
                        mislukteReservaties.Add(new MandjeItem(voorstelling.VoorstellingsNr, voorstelling.Titel,
                            voorstelling.Uitvoerders, voorstelling.Datum, voorstelling.Prijs, nieuweReservatie.Plaatsen));
                    }
                }
                Session.RemoveAll();
                Session["gelukt"] = gelukteReservaties;
                Session["mislukt"] = mislukteReservaties;
                return RedirectToAction("Overzicht", "Home");
            }            
            return View();
        }

        [HttpGet]
        public ActionResult Nieuw()
        {
            var nieuwForm = new NieuweKlantForm();
            return View(nieuwForm);
        }

        [HttpPost]
        public ActionResult Nieuw(NieuweKlantForm form)
        {
            if (this.ModelState.IsValid)
            {
                Klant nieuweKlant = new Klant();
                nieuweKlant.Voornaam = form.Voornaam;
                nieuweKlant.Familienaam = form.Familienaam;
                nieuweKlant.Straat = form.Straat;
                nieuweKlant.HuisNr = form.Huisnr;
                nieuweKlant.Postcode = form.Postcode;
                nieuweKlant.Gemeente = form.Gemeente;
                nieuweKlant.GebruikersNaam = form.Gebruikersnaam;
                nieuweKlant.Paswoord = form.Paswoord;
                Session["klant"] = nieuweKlant;
                db.VoegKlantToe(nieuweKlant);
                return RedirectToAction("Bevestiging", "Home");
            }
            else
            {
                return View(form);
            }
        }

        public ActionResult Overzicht()
        {
            List<MandjeItem> gelukteReservaties = (List<MandjeItem>)Session["gelukt"];
            List<MandjeItem> mislkuteReservaties = (List<MandjeItem>)Session["mislukt"];
            ViewBag.gelukt = gelukteReservaties;
            ViewBag.mislukt = mislkuteReservaties;
            Session.Clear();
            return View();
        }
    }
}
