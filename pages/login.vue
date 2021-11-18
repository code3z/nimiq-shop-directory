<template>
  <v-row justify="center" align="center">
    <v-card>
      <h1>Login</h1>
      <p>Please enter your buisness email. This will be the email you log in with AND the contact email displayed on your shop's profile.</p>
      <v-text-field type="email" label="Email" v-model="email"></v-text-field>
      <button class="nq-button" @click="signIn">Log In</button>
    </v-card>
  </v-row>
</template>

<script setup lang="ts">
import supabase from '@/lib/supabase'
import { ref } from '@nuxt/bridge/dist/runtime'

const email = ref()
async function signIn() {
  await supabase.auth.signIn({
    email: email.value,
  })
}
</script>
