def seed_files_for_directory(dir)
  seed_submission_path = File.join(Rails.root, "/app/assets/images/seed/submissions/#{dir}/")
  attachments = []

  Dir.foreach(seed_submission_path) do |filename|
    next if ['.', '..', '.DS_Store'].include?(filename)

    attachments << { io: File.open(seed_submission_path + filename), filename: filename }
  end

  attachments
end

# DEFAULTS
User.create!(email: 'admin@example.com', password: 'Password123!', name: 'The Admin', admin: true)
Category.create!(name: 'Uncategorized', description: 'Stuff that still needs a proper home.')
ReportReason.create!(content: 'Other', position: 0)


# DEMO APP STUFF
Category.create!(name: 'Cityscapes', description: 'Far away views of retro/future cities.')
Category.create!(name: 'Real', description: 'Real world outrun in the wild. Anything from advertisments to snaps.')
Category.create!(name: 'Cars', description: '1.21 gigawatts of pure car porn.')
Category.create!(name: 'Landscapes', description: 'From gridded out mountains to pink sunsets.')

seed_submissions = [
  { email: 'example@example.com', description: 'Very cool pics taken from real magazine ads.', files: seed_files_for_directory('ads_in_a_magazine') },
  { email: 'example@example.com', description: 'Outrun the sun! A small collection of sunsets.', files: seed_files_for_directory('outrun_the_sun') },
  { email: 'example@example.com', description: 'Art from retric.dreams.  Work by retric.dreams has a phenomenal outrun vaporwave astetic.', files: seed_files_for_directory('retric.dreams') },
  { email: 'example@example.com', description: 'Ride into the sunset!', files: seed_files_for_directory('ride_into_the_sunset') },
  { email: 'example@example.com', description: 'Neon buildings', files: seed_files_for_directory('the_city') }
]

seed_submissions.each { |seed_submission| Submission.create!(seed_submission) }
