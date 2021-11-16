import { createClient } from '@supabase/supabase-js'


const supabaseUrl = 'https://vvwxrsgpuljkefpxuyrr.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNzAxNzU2NSwiZXhwIjoxOTUyNTkzNTY1fQ.pbRmf3zv2tJ4HcT0lZ2Nd6S48CClj40EL8UmYinYo0o'


export default createClient(supabaseUrl, supabaseAnonKey)
