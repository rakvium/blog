# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Blog::Application.config.secret_key_base = '6d891baba3f24892066143858cf72d83ac5201b68a996cf73bb985d200519578' \
                                           '65119877fdb2fd2189dbf625e6af3d5fdf58f5a1e8140afd2155113834098516'
