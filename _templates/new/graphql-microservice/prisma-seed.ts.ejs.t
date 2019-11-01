---
to: generated/prisma/seed.ts
---
<%
  Model = h.changeCase.pascal(h.inflection.singularize(model))
  models = h.changeCase.camel(h.inflection.pluralize(Model))
  object = h.changeCase.camel(Model)
%>
import { Photon, <%= Model %>} from '@generated/photon'

const photon = new Photon()

const UID: string = '<%= object %>-uid-1'

const main = async () => {
  let <%= object %>: <%= Model %>
  try {
    <%= object %> = await photon.<%= models %>.findOne({ where: { uid: UID } })
  } catch (error) {
    console.log(error)
  }
  if (!<%= object %>) {
    <%= object %> = await photon.<%= models %>.create({
      data: {
        uid: UID,
      },
    })
  }

  console.log({ <%= object %> })
}

main()
  .catch(console.error)
  .finally(async () => {
    await photon.disconnect()
  })
