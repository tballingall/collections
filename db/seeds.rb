[
  { user_id: '1', name: 'closet 1' },
  { user_id: '1', name: 'closet 2' },
  { user_id: '1', name: 'closet 3' },
  { user_id: '1', name: 'closet 4' },
  { user_id: '1', name: 'closet 5' },
  { user_id: '2', name: 'thesimpsons' },
  { user_id: '2', name: 'that' },
  { user_id: '2', name: 'other' },
  { user_id: '2', name: 'another' },
  { user_id: '2', name: 'inthe' },
  { user_id: '2', name: 'outofthe'  }
].each do |closet_params|
  closet = Closet.create!(closet_params)
end
