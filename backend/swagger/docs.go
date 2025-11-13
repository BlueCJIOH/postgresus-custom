package swagger

import "github.com/swaggo/swag"

const docTemplate = `{
    "swagger": "2.0",
    "info": {
        "description": "Postgresus API documentation placeholder. Run 'make swagger' to regenerate full docs.",
        "title": "Postgresus Backend API",
        "version": "1.0"
    },
    "host": "localhost:4005",
    "basePath": "/api/v1",
    "schemes": [
        "http"
    ],
    "paths": {}
}`

type swaggerSpec struct{}

func (*swaggerSpec) ReadDoc() string {
    return docTemplate
}

func init() {
    swag.Register(swag.Name, &swaggerSpec{})
}

