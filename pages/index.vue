<template>
  <v-row justify="center" align="center">
    <v-col v-for="shop in data" :key="shop.id">
      <v-card>
        <v-img :src="shop.image" />
        <v-card-title>{{ shop.name }}</v-card-title>
        <v-card-text>
          <p>{{ shop.description }}</p>
          <p>
            Call:
            <a :href="'tel:' + shop.phone">{{ shop.phone }}</a>
          </p>
          <p>
            Email:
            <a :href="'mailto:' + shop.email">{{ shop.email }}</a>
          </p>
        </v-card-text>
        <v-card-actions>
          <v-btn :href="shop.website" target="_blank">Shop Now</v-btn>
          <v-btn
            v-for="shopInstance in toArray(shop.location)"
            :key="shopInstance.latitude"
            :href="'https://arcanemaps.com#place--' + shopInstance.latitude + ',' + shopInstance.longitude"
            target="_blank"
          >View on Map</v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script setup lang="ts">
import supabase from '@/lib/supabase'
import { ref, useRoute } from '@nuxt/bridge/dist/runtime'
import { PostgrestResponse } from '@supabase/supabase-js'

/*async function asyncData() {
  let { data, error, status } = await supabase.from("shops").select()
  console.log(data)
  return reactive(data)
}*/
interface location {
  latitude: string,
  longitude: string
}
interface shop {
  id: string, // uuid v4
  name: string,
  type: number, // 1: online-only, 2: retail, 3: both
  phone: number,
  email: string,
  website: string,
  description: string,
  shippingCountries: string[],
  location: location | location[],
  // fts: full text search potgres
}

let data = ref<any[] | null>()
const callback = (response: PostgrestResponse<any>) => {
  console.log(response.body)
  data.value = response.body
}
const route = useRoute()

function toArray(data: any) {
  if (Array.isArray(data)) {
    return data
  } else {
    return [data]
  }
}
if (route.query.search) {
  supabase.from("shops").select().textSearch('fts', route.query.search as string, {
    type: 'websearch',
    config: 'english'
  }).then(callback)
} else {
  supabase.from("shops").select().then(callback)
}
</script>

<style>
@media all and (min-width: 900px) {
  .col {
    max-width: 50%;
  }
}
</style>
