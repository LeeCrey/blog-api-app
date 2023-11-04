# frozen_string_literal: true

require "pagy/extras/overflow"
require "pagy/extras/metadata"

Pagy::DEFAULT[:items] = 10
Pagy::DEFAULT[:overflow] = :empty_page
