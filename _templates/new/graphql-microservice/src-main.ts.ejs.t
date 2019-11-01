---
to: generated/src/main.ts
---
<%
  Name = h.changeCase.pascal(name)
  Names = h.inflection.pluralize(Name)
  Model = h.changeCase.pascal(h.inflection.singularize(model))
  models = h.changeCase.camel(h.inflection.pluralize(Model))
  object = h.changeCase.camel(Model)
%>
import { ApolloServer, gql } from 'apollo-server'
import { buildFederatedSchema } from '@apollo/federation'
import { Photon, <%= Model %> } from '@generated/photon'

const photon = new Photon()

const SERVICE_NAME = '<%= Names %>'

const typeDefs = gql`
  extend type Query {
    <%= models %>: [<%= Model %>]
  }

  type <%= Model %> @key(fields: "uid") {
    uid: ID!
  }
`

const resolvers = {
  Query: {
    <%= models %>: async (): Promise<<%= Model %>[]> => {
      const <%= models %>: <%= Model %>[] = await photon.<%= models %>.findMany({
        where: { uid: { in: [] } },
      })
      return <%= models %>
    },
  },
  <%= Model %>: {
    __resolveReference: async (payload: {__typename: string, uid: string}): Promise<<%= Model %>> => {
      console.log(payload)
      const <%= object %>: <%= Model %> = await photon.<%= models %>.findOne({
        where: { uid: payload.uid  },
      })
      return <%= object %>
    },
  },
}

const server = new ApolloServer({
  schema: buildFederatedSchema([
    {
      typeDefs,
      resolvers,
    },
  ]),
  engine: {
    debugPrintReports: true,
  },
  plugins: [
    {
      requestDidStart(requestContext) {
        const time = new Date()
        const label = `[${time.toISOString()}][${SERVICE_NAME}]`
        console.time(label)
        console.timeLog(label, requestContext.request.http.headers.get('user-uid'))
        return {
          willSendResponse({response}) {
            response.http.headers.append('Server-Id', SERVICE_NAME)
            console.timeEnd(label)
          }
        }
      }
    }
  ]
})

server.listen({ host: '0.0.0.0', port: <%= port || 42000 %> }).then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`)
})