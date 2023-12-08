using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;
using World.API.Data;
using World.API.Models;

namespace World.API.Controllers
{


    [Route("api/[controller]")]
    [ApiController]


    public class CountryController : ControllerBase
    {
        private  readonly ApplicationDbContext _dbcontext;

        public CountryController(ApplicationDbContext dbContext)
        {
            _dbcontext = dbContext;
        }



        [HttpGet]

        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status200OK)]

        public ActionResult<IEnumerable<Country>> GetAll()
        {
            var countries = _dbcontext.Countries.ToList();

            if (countries == null)
            {
                return NoContent();
            }

            return Ok(countries);
        }


        [HttpGet("{id:int}")]

        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status200OK)]

        public ActionResult<Country> GetById(int id)
        {
            var country = _dbcontext.Countries.Find(id);

            if (country == null)
            {
                return NoContent();
            }

            return Ok(country);
        }



        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status409Conflict)]

        public ActionResult<Country> Create([FromBody]Country country)
        {
            var result = _dbcontext.Countries.AsQueryable().Where(x => x.Name.ToLower().Trim() == country.Name.ToLower()).Any();

            if (result)
            {
                return Conflict("Country Already Exists in Database");
            }


            _dbcontext.Countries.Add(country);
            _dbcontext.SaveChanges();
            return CreatedAtAction("GetById",new {id = country.Id},country);


        }



        [HttpPut("{id:int}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]

        public ActionResult<Country> Update(int id,[FromBody] Country country)
        {
            if(country == null || id != country.Id)
            {
                return BadRequest();
            }

            var countryFromDb = _dbcontext.Countries.Find(id);

            if(countryFromDb == null)
            {
                return NotFound();
            }

            countryFromDb.Name = country.Name;
            countryFromDb.ShortName = country.ShortName;
            countryFromDb.CountryCode = country.CountryCode;




            _dbcontext.Countries.Update(countryFromDb);
            _dbcontext.SaveChanges();
            return NoContent();
        }


        [HttpDelete("{id:int}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]

        public ActionResult DeleteById(int id)
        {
            if(id == 0)
            {
                return BadRequest();
            }
            var country = _dbcontext.Countries.Find(id);

            if (country == null)
            {
                return NotFound();
            }
            

            _dbcontext.Countries.Remove(country);
            _dbcontext.SaveChanges();
            return Ok();
        }
        
    }
}
