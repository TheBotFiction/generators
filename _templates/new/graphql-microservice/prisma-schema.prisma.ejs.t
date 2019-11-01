---
to: generated/prisma/schema.prisma
---
<%
  Model = h.changeCase.pascal(h.inflection.singularize(model))
%>
datasource db {
  provider = "sqlite"
  url      = "file:./dev.db"
}

generator photon {
  provider = "photonjs"
}


model User {
  uid       String    @default(cuid()) @id @unique
  createdAt DateTime  @default(now())
  updatedAt DateTime  @updatedAt
}