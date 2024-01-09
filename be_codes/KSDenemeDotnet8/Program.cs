using KSDenemeDotnet8.Repository;
using KSDenemeDotnet8.Service.impl;

var MyAllowSpecificOrigins = "http://localhost:3000";

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                      builder =>
                      {
                          builder.WithOrigins("http://localhost:3000");
                      });
});


// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddTransient<DBContext>();
builder.Services.AddTransient<BookRepository>();
builder.Services.AddTransient<CategoryRepository>();
builder.Services.AddTransient<BookServiceImpl>();
builder.Services.AddTransient<CategoryServiceImpl>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseStaticFiles();

app.UseRouting();

app.UseCors(MyAllowSpecificOrigins);



app.Run();
