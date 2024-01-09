using KSDenemeDotnet8.Entity;
using KSDenemeDotnet8.Service;
using KSDenemeDotnet8.Service.impl;
using Microsoft.AspNetCore.Mvc;

namespace KSDenemeDotnet8.Controllers
{
    [Route("api/category")]
    [ApiController]
    public class CategoryController
    {
        private readonly CategoryServiceImpl categoryService;

        public CategoryController(CategoryServiceImpl _categoryService)
        {
            categoryService = _categoryService;

        }

        [HttpGet("{id}")]
        public
           Category getCategory(Guid id)
        {
            return (categoryService.getCategory(id));
        }

        [HttpPost]
        public void save(Category category)
        {
            categoryService.save(category);

        }

        [HttpGet("getAll")]
        public List<Category> getAll()
        {

            return (categoryService.getAllCategory());
        }
    }
}
