# FROM golang:1.22.4-alpine

# # Instalar libs
# WORKDIR /journey

# COPY go.mod go.sum ./

# RUN go mod download && go mod verify

# COPY . .

# # Faz a build
# WORKDIR /journey/cmd/journey

# RUN go build -o /journey/bin/journey .

# #Exportação da Porta
# EXPOSE 8080

# # Ponto de entrada, executa o binário
# ENTRYPOINT [ "/journey/bin/journey" ]

# Pega a versão da linguagem
FROM golang:1.22.4-alpine

# Instalar libs
WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download && go mod verify

#Copia da interface pro container
COPY . .

# Faz a build
RUN go build -o /bin/journey ./cmd/journey/journey.go

#Exportação da Porta
EXPOSE 8080

# Ponto de entrada, executa o binário
ENTRYPOINT [ "/journey/bin/journey" ]

