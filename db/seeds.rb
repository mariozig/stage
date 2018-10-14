User.create!(email: 'admin@example.com', password: 'Password123!', name: 'The Admin', admin: true)
Category.create!(name: 'Uncategorized', description: 'Stuff that still needs a proper home.')
ReportReason.create!(content: 'Other', position: 0)
