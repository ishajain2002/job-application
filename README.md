# Job Application REST API

A Spring Boot application that manages job postings, companies, and reviews with PostgreSQL backend.

## Prerequisites

- Java 17 or higher
- Docker and Docker Compose
- Maven

## Getting Started

1. Clone the repository
```sh
git clone <repository-url>
cd job-application
```

2. Start PostgreSQL and pgAdmin using Docker Compose
```sh
docker compose up -d
```

This will start:
- PostgreSQL at `localhost:5432`
- pgAdmin at `localhost:5050`

3. Configure pgAdmin

- Access pgAdmin at http://localhost:5050
- Login credentials:
  - Email: `pgadmin4@pgadmin.org`
  - Password: `admin`

4. Add PostgreSQL Server in pgAdmin:
   
- Right click on 'Servers' > 'Register' > 'Server'
- In General tab:
  - Name: `Local PostgreSQL`
- In Connection tab:
  - Host: `postgres` (container name)
  - Port: `5432`
  - Maintenance database: `postgres`
  - Username: `ishhh`
  - Password: `ishhh`

5. Create Database:

- Right click on 'Databases' > 'Create' > 'Database'
- Database name: `jobapp`
- Owner: `ishhh`

6. Run the Application
```sh
./mvnw spring-boot:run
```

## Running on GitHub Codespaces

If you're using GitHub Codespaces, follow these additional steps:

1. Port Forwarding
   - The ports will be automatically forwarded
   - Look for the "PORTS" tab in the bottom panel
   - You should see:
     - Port 5432 (PostgreSQL)
     - Port 5050 (pgAdmin)
     - Port 8080 (Spring Boot app)

2. Access URLs
   - Click on the globe icon next to each port to open in browser
   - Or use the automatically generated Codespace URLs:
     - pgAdmin: `https://YOUR-CODESPACE-NAME-5050.preview.app.github.dev`
     - Spring Boot app: `https://YOUR-CODESPACE-NAME-8080.preview.app.github.dev`

3. Environment Variables
   - Add these to your Codespace secrets if needed:
     - `POSTGRES_USER`
     - `POSTGRES_PASSWORD`
     - `PGADMIN_DEFAULT_EMAIL`
     - `PGADMIN_DEFAULT_PASSWORD`

4. Connect to PostgreSQL in Codespace
   ```bash
   docker exec -it postgres_container psql -U ishhh -d postgres
   ```
5. Container Logs
   - View PostgreSQL logs: 
    ```bash
    docker logs postgres_container
    ```
   - View pgAdmin logs:
    ```bash
    docker logs pgadmin_container
    ```

The application will start at `http://localhost:8080`

## API Endpoints

### Companies
- GET `/companies` - List all companies
- GET `/companies/{id}` - Get company by ID
- POST `/companies` - Create new company
- PUT `/companies/{id}` - Update company
- DELETE `/companies/{id}` - Delete company

### Jobs
- GET `/jobs` - List all jobs
- GET `/jobs/{id}` - Get job by ID
- POST `/jobs` - Create new job
- PUT `/jobs/{id}` - Update job
- DELETE `/jobs/{id}` - Delete job

### Reviews
- GET `/companies/{companyId}/reviews` - List all reviews for a company
- GET `/companies/{companyId}/reviews/{reviewId}` - Get specific review
- POST `/companies/{companyId}/reviews` - Add review to company
- PUT `/companies/{companyId}/reviews/{reviewId}` - Update review
- DELETE `/companies/{companyId}/reviews/{reviewId}` - Delete review

## Database Configuration

The application uses PostgreSQL with the following configuration (from [application.properties](src/main/resources/application.properties)):

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/jobapp
spring.datasource.username=ishhh
spring.datasource.password=ishhh
spring.jpa.database=POSTGRESQL
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=create-drop
```

## Actuator Endpoints

Spring Boot Actuator is enabled with all endpoints exposed at `/actuator/*`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.