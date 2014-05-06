using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC4_Cultuurhuis.Models
{
    public class NieuweKlantForm
    {
        private string voornaam;
        private string familienaam;
        private string straat;
        private string huisnr;
        private string postcode;
        private string gemeente;
        private string gebruikersnaam;
        private string paswoord;
        private string herhaalpaswoord;

        [Required(ErrorMessage = "Voornaam verplicht !")]
        public string Voornaam
        {
            get { return this.voornaam; }
            set { this.voornaam = value; }
        }

        [Required(ErrorMessage = "Familienaam verplicht !")]
        public string Familienaam
        {
            get { return this.familienaam; }
            set { this.familienaam = value; }
        }

        [Required(ErrorMessage = "Straat verplicht !")]
        public string Straat
        {
            get { return this.straat; }
            set { this.straat = value; }
        }

        [Required(ErrorMessage = "Huisnr verplicht !")]
        public string Huisnr
        {
            get { return this.huisnr; }
            set { this.huisnr = value; }
        }

        [Required(ErrorMessage = "Postcode verplicht !")]
        public string Postcode
        {
            get { return this.postcode; }
            set { this.postcode = value; }
        }

        [Required(ErrorMessage = "Gemeente verplicht !")]
        public string Gemeente
        {
            get { return this.gemeente; }
            set { this.gemeente = value; }
        }

        [Required(ErrorMessage = "Gebruikersnaam verplicht !")]
        [BestaatNogNiet(ErrorMessage = "Een klant met deze gebruikersnaam komt al voor in de database")]
        public string Gebruikersnaam
        {
            get { return this.gebruikersnaam; }
            set { this.gebruikersnaam = value; }
        }

        [Required(ErrorMessage = "Paswoord verplicht !")]
        [DataType(DataType.Password)]
        public string Paswoord
        {
            get { return this.paswoord; }
            set { this.paswoord = value; }
        }

        [Required(ErrorMessage = "Herhaling paswoord verplicht !")]
        [DataType(DataType.Password)]
        [Compare("Paswoord", ErrorMessage = "{0} verschilt van {1}")]
        public string HerhaalPaswoord
        {
            get { return this.herhaalpaswoord; }
            set { this.herhaalpaswoord = value; }
        }
    }
}