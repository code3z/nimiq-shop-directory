<template>
  <v-row justify="center" align="center">
    <v-col v-for="shop in data" :key="shop.id">
      <v-card>
        <v-img
          src="https://images.unsplash.com/photo-1473187983305-f615310e7daa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80"
        />
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
            :href="'https://arcanemaps.com#place--' + shop.location.latitude + ',' + shop.location.longitude"
            target="_blank"
          >View on Map</v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script setup lang="ts">
import supabase from '@/lib/supabase'
import { ref } from '@nuxt/bridge/dist/runtime'
/*async function asyncData() {
  let { data, error, status } = await supabase.from("shops").select()
  console.log(data)
  return reactive(data)
}*/

let data = ref<any[] | null>()
supabase.from("shops").select().then((response) => {
  console.log(response.body)
  data.value = response.body
})
</script>

<style>
@media all and (min-width: 900px) {
  .col {
    max-width: 50%;
  }
}
</style>
