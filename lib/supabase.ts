import { createClient } from '@supabase/supabase-js'


const supabaseUrl = 'https://fuzexexbjrlajnfabbtj.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0MDEzMTc3NiwiZXhwIjoxOTU1NzA3Nzc2fQ.U0x5kwhdS6ZUqdK-1pAaCSoSWQlmOJHAJd55ZxUbAr4'


export default createClient(supabaseUrl, supabaseAnonKey)
